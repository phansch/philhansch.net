# phansch.net

This is the data for my blog. It uses Jekyll to generate a static website whenever I push new content to GitLab.
Posts are written in Markdown and are kept in the `drafts` branch until they are published.

The blog is currently hosted on [Uberspace](https://uberspace.de) where I have set up a bare git repository to do push-deployments.

## Setup

    git clone git@gitlab.com:phansch/phansch-net.git && cd phansch-net
    git remote add deploy ssh://phansch@bootes.uberspace.de/home/phansch/website.git/

## Deployment

    git push origin # To update this repo
    git push deploy # To trigger the post-receive hook on Uberspace

## Docker

test
You need Docker and docker-compose in order to use the docker-compose.yml.

Then just run

    docker-compose up

and open the website on [localhost:4000](http://localhost:4000)
