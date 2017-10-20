---
layout: post
title: Setting up SSL Certificates for HAProxy with certbot
excerpt: Let's Encrypt gives you SSL certificates for free and it's easily automated with certbot.
---

Here's how to automatically setup SSL Certificates for [HAProxy](http://www.haproxy.org/) using [certbot](https://certbot.eff.org/) and [Let's Encrypt](https://letsencrypt.org/), without having to restart HAProxy.

This article assumes that you have certbot already installed and HAProxy already running.

## Certbot command

As we are using HAProxy, we can't just run `sudo certbot --haproxy` like for nginx because certbot doesn't officially support HAProxy, yet. Instead we have to use the `certonly` command and the `--standalone` option to run a standalone webserver.

We also want to include the certbot command in a script later on, so we need to supply all further options via the command line. The basic certbot command we will use, looks like this:

{% highlight shell %}
certbot certonly --standalone --agree-tos --non-interactive \
-m yourmail@host.org -d domain
{% endhighlight %}

If you try to run the command on the machine where HAProxy is running, it will tell you that port 80 is already in use, because that's the port HAProxy is listening on.
To circumvent that, we will have to tell the standalone server to use another port:

{% highlight shell %}
certbot certonly --standalone --agree-tos --non-interactive \
-m yourmail@host.org -d domain --preferred-challenges http \
--http-01-port 9785
{% endhighlight %}

We will also have to tell certbot to keep the certificate until it expires and that it should be renewed when we add new domains to it:

{% highlight shell %}
certbot certonly --standalone --agree-tos --non-interactive \
-m yourmail@host.org -d domain --preferred-challenges http \
--http-01-port 9785 --renew-with-new-domains \
--keep-until-expiring
{% endhighlight %}

With the certbot part out of the way, we can continue with the HAProxy configuration.

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

Be sure to validate the config with `haproxy -c -f /path/to/your/haproxy.cfg` to check for mistakes.

Now we can reload the HAProxy config and try to run the certbot command from above again. It should work, but we aren't done yet.

## Putting it all together

The next step is to create a script that will execute the certbot command and copy the generated certificate to the directory where HAProxy is looking for it.

The script will be called `cert_renew` and it will take a list of domains as an argument.

{% highlight shell %}
#!/bin/bash

# This script takes a list of domains as arguments
# and will setup a single certificate for all of them.

cert_name="generic_cert"
haproxy_cert_dir="/etc/haproxy/ssl-certs"
email="you@host.org"

domains=""
for domain in "$@"
do
  domains+="-d $domain "
done

certbot certonly --standalone --agree-tos --non-interactive \
-m $email --preferred-challenges http \
--http-01-port 9785 --cert-name $cert_name \
--renew-with-new-domains --keep-until-expiring $domains

mkdir -p $haproxy_cert_dir

# Combine the certificate chain and private key and put it
# into the correct HAProxy directory
cd /etc/letsencrypt/live/$cert_name
cat fullchain.pem privkey.pem > "$haproxy_cert_dir/cert.pem"

echo "Reloading haproxy"
sudo systemctl reload haproxy
{% endhighlight %}

Using it like `cert_renew domain1.org domain2.net` will setup one certificate for both domains at `/etc/haproxy/ssl-certs/cert.pem` and reload HAProxy.

## Setting up the Cronjob

Next, we will save the script at `/usr/local/bin/cert_renew` and setup the cronjob, so that it runs twice per day:

{% highlight cronjob %}
5 7,17 * * * root /bin/bash -c '/usr/local/bin/cert_renew domain1.io 2>&1 | /usr/bin/logger -t certbot'
{% endhighlight %}

With that done, we only have to change the cronjob entry when we add new domains and never have to worry about expiring certificates again.

## Sources

This post builds on a few other blog posts which have been really helpful. These are:

* [This great post](https://blog.bigdinosaur.org/finally-moving-to-letsencrypt-with-haproxy-varnish-and-nginx/) by Lee Hutchinson
* [Scott Helme's post](https://scotthelme.co.uk/lets-encrypt-smart-renew/) and the comments below
* [This post](https://skarlso.github.io/2017/02/15/how-to-https-with-hugo-letsencrypt-haproxy/) by Skarlso, too
