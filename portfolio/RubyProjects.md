---
layout: portfolio-detail
title: RubyProjects
github: Projects
subtitle: Trying to complete over 100 projects in various categories in Ruby.
scope: portfolio
category: ruby
thumbnail: "/assets/images/portfolio/projects/thumbnail.png"
used: [Ruby]
---

I'm learning Ruby by trying to complete over 100 different projects in various categories.

Check out the [README](https://github.com/phansch/Projects/blob/master/README.md) to see what projects are finished.

<a id="snippets" class="anchor"></a>

## Code snippets

{% highlight ruby linenos %}
{% raw %}
def encrypt(plain, offset)
  cipher = ""

  plain.each_byte do |char|
    cipher += ((char + offset) % 128).chr
  end
  cipher
end

def decrypt(cipher, offset)
  plain = ""

  cipher.each_byte do |char|
    plain += ((char - offset) % 128).chr
  end
  plain
end
{% endraw %}
{% endhighlight %}
<span class="glyphicon glyphicon-chevron-right"></span> Implementation of the caesar cipher.

----

{% highlight ruby %}
require 'geocoder'
require 'open-uri'
require 'socket'
require 'json'
require 'net/http'

#From https://coderrr.wordpress.com/2008/05/28/get-your-local-ip-address/
def get_ip
  # turn off reverse DNS resolution temporarily
  orig, Socket.do_not_reverse_lookup = Socket.do_not_reverse_lookup, true
 
  UDPSocket.open do |s|
    s.connect '64.233.187.99', 1
    s.addr.last
  end
  ensure
    Socket.do_not_reverse_lookup = orig
end

def get_location(ip_address)
  results = Geocoder.search(ip_address)
  location = { lat: results[0].latitude, lon: results[0].longitude }
end

# Retrieve weatherdata by geo coordinates
def get_weatherdata(location)
  uri = URI("http://api.openweathermap.org/data/2.5/weather?lat=#{location[:lat]}&lon=#{location[:lon]}&units=metric")
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end

def main
  ip_address = get_ip
  location = get_location(ip_address)
  weatherdata = get_weatherdata(location)

  puts "This weather status is obviously not very accurate since it uses your IP address to determine your location."
  puts "Anyway here's the weather for #{ip_address}."
  puts "----"
  puts "description: #{weatherdata["weather"][0]["description"]}"
  puts "temp: #{weatherdata["main"]["temp"]}"
  puts "humidity: #{weatherdata["main"]["humidity"]}%"
end

main
{% endhighlight %}
<span class="glyphicon glyphicon-chevron-right"></span> Automatically locates the user based on his IP address and fetches the current weather based on the determined location. 

Check out the [GitHub repository](https://github.com/phansch/Projects) for more projects.
