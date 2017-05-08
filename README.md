# phansch.net

[![Build Status](https://travis-ci.org/phansch/phansch.github.com.svg?branch=master)](https://travis-ci.org/phansch/phansch.github.com)

This is the data for my blog. It uses Jekyll to generate a static website whenever I push new content to GitHub.

## Development

### Tests

Execute the tests with

    rake test

You need Docker in order to run the website locally:

    sudo docker build -t phansch-net .
    sudo docker run -p 80:80 -i -t phansch-net

and open the website on [localhost](http://localhost).
