# phansch.net

This is the data for my blog. It uses Jekyll to generate a static website whenever I push new content to GitLab.
Posts are written in Markdown and are kept in the `drafts` branch until they are published.

The blog is currently hosted on [DigitalOcean](https://www.digitalocean.com) where it is being deployed with [dokku](http://progrium.viewdocs.io/dokku/).

## Setup

    git clone git@gitlab.com:phansch/phansch-net.git && cd phansch-net
    git remote add production dokku@46.101.220.14:phansch.net

## Deployment

    git push origin # To update this repo
    git push production # To trigger the dokku run and deploy a new container

## Development

### Tests

Execute the tests with

    rake test

You need Docker in order to run the website locally:

    sudo docker build -t phansch-net .
    sudo docker run -p 80:80 -i -t phansch-net

and open the website on [localhost](http://localhost).
