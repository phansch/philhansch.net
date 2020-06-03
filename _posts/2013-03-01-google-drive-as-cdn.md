---
layout: post
location: Rheda-Wiedenbrück
title: Google Drive as a CDN
excerpt: "This post describes how to use Google Drive for hosting static content like images or downloads."
---

When linking a publicly shared Google Drive folder or file, people are always forwarded to the Google Drive page, instead of the actual file.
This makes it difficult to use Google Drive to host downloads or static blog-content. However, Google's introduction of [Google Drive Site publishing](http://googleappsdeveloper.blogspot.de/2012/11/announcing-google-drive-site-publishing.html) made it possible to link directly to the resource, instead of the Google Drive page. 

## Google Drive setup

The first thing you want to do, is go to <http://drive.google.com> and setup a public folder somewhere. 
To make this folder public, change the visibility settings to `Public on the web` and make sure that you are the only one that can edit.

![Sharing settings](/assets/images/posts/2013-03-01-gdrive-static/sharing-1.png)

Now you will need to obtain the folder ID. Change to your public folder and you will see the ID in the address bar. The last part is the FolderID you are looking for:

![FolderID](/assets/images/posts/2013-03-01-gdrive-static/folderid.png)

The next step makes it a little bit more difficult than using Dropbox since this bit of information is quite hidden. According to the Google Drive SDK documentation, we can use an URL like `https://googledrive.com/host/[FolderID]/path/to/file.type` to link directly to publicly shared files.

Here's an example with the image from above:  

`https://googledrive.com/host/0Bwm7wu9QfuUFMDNFWGt3ZmFNV3M/2013-03-01-gdrive-static/folderid.png`

## Namecheap domain setup

If you prefer a shorter URL to your content, you can setup a redirect from a sub-domain to your public Google Drive folder. Since my domain is managed by [Namecheap](http://namecheap.com), I will illustrate the process with their service. It should be similar for other services.

Go to `Account` -> `Your Domains` and select the domain where you want to setup URL forwarding. Then go to `All Host Records`.

Here you setup the URL Redirect to the Google Drive URL from above: `https://googledrive.com/host/[FolderID]/`

![Namecheap setup](/assets/images/posts/2013-03-01-gdrive-static/namecheap.png)

Now you can use `http://static.yourdomain.net/path/to/image.png` to link to your static blog content. 
