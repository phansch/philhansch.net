---
layout: post
title: Setting up SSL Certificates for HAProxy with certbot
excerpt: Let's Encrypt gives you SSL certificates for free and it's easily automated with certbot.
---
Here's how to automatically setup SSL Certificates for HAProxy using certbot and Let's Encrypt, without having to restart HAProxy.

This article assumes that you have certbot already installed and HAProxy already running.


## Certbot command

As we are using HAProxy, we can't just run `sudo certbot --haproxy` like for nginx because certbot doesn't officially support HAProxy, yet. Instead we have to use the `certonly` command and the `--standalone` option to run a standalone webserver.

We also want to include the certbot command in a script later on, so we need to supply all further options via the command line. The basic certbot command we will use looks like this:

{% highlight shell %}
certbot certonly --standalone --agree-tos --non-interactive \
-m yourmail@host.org -d domain
{% endhighlight %}

If you try to run the command on the machine where HAProxy is running, it will tell you that port 80 is already in use, because that's the port HAProxy is listening on.
To circumvent that, we will have to tell the standalone server to use another port


{% highlight shell %}
certbot certonly --standalone --agree-tos --non-interactive \
-m yourmail@host.org -d domain --preferred-challenges http \
--http-01-port 9785
{% endhighlight %}

With that out of the way, we can continue with the HAProxy configuration:

## HAProxy configuration

For HAProxy, we begin with setting up a minimal SSL configuration for our example frontend:
{% highlight config %}
frontend www-https
  bind *:443 ssl crt /etc/haproxy/ssl-certs/cert.pem
  reqadd X-Forwarded-Proto:\ https
{% endhighlight %}


We will also tell HAProxy to direct all requests to the standalone webserver to the correct port of the standalone webserver.

Our frontend is now done and looks like this:

{% highlight config %}

frontend www-https
  bind *:443 ssl crt /etc/haproxy/ssl-certs/cert.pem
  reqadd X-Forwarded-Proto:\ https

  # Let the letsencrypt backend handle requests to the
  # acme-challenge url
  acl letsencrypt-req path_beg /.well-known/acme-challenge/
  use_backend letsencrypt if letsencrypt-req

  # ... etc.

{% endhighlight %}

The letsencrypt backend sets the server to the local certbot standalone server:

{% highlight shell %}
backend letsencrypt
   server letsencrypt 127.0.0.1:9785
{% endhighlight %}

Now you can reload the HAProxy config and try to run the certbot command from above again. It should work, but we aren't done yet.

## Putting it all together

The next step is to create a script that will execute the certbot command and copy the generated certificate to the directory where HAProxy is looking for it.

{% highlight shell %}
#!/bin/sh

certbot certonly --standalone --agree-tos --non-interactive \
-m yourmail@host.org -d domain --preferred-challenges http \
--http-01-port 9785 --cert-name $1 --renew-with-new-domains \
--keep-until-expiring

mkdir -p /etc/haproxy/ssl-certs

# Combine the certificate chain and private key and put it into the correct HAProxy directory
cat /etc/letsencrypt/live/$1/{fullchain.pem,privkey.pem} > /etc/haproxy/ssl-certs/cert.pem

sudo systemctl reload haproxy
{% endhighlight %}
