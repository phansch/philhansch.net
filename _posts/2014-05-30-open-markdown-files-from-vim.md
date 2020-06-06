---
title: "Open Markdown files from vim"
layout: "post"
excerpt: "A quick guide on how to open Markdown or HTML files from vim in a non-disruptive way."
aliases: ["2014/05/30/open-markdown-files-from-vim/"]
---

Here's my most recent addition to my vimrc. I was looking for a way to open Markdown or HTML files in the browser, with a single keystroke from vim.

In vim you can execute shell commands with `:!command`. This will put vim in the background and execute the given command. You have to hit enter in order to go back to vim.

So, to open the current file in Firefox you can use `:!firefox %`. Where `%` is expanded to the current active file in vim.

To make this a bit more flexible, on Debian based systems you can use `:!sensible-browser %` to open the file in your default browser. On a Mac it should be `:!open %`, although you will have to try that one for yourself.

Now, there's one thing that is getting in the way: You still have to press enter to get back to vim. So, the next step is to prepend a `:silent execute` to our command:

{% highlight vim %}
  :silent execute "!sensible-browser %"
{% endhighlight %}

This should work on most systems. However if your vim turns blank when executing your command, you will have to force a redraw afterwards with `:redraw!`. You could also hit CTRL+L to achieve the same thing, however we can use `:redraw!` in combination with the other command:

{% highlight vim %}
function! OpenCurrentFileInBrowser()
  " Open current file in browser
  :silent execute "!sensible-browser %"

  " Fix empty vim window by forcing a redraw
  :redraw!
endfu
{% endhighlight %}

Now we can conveniently bind it to a shortcut:

{% highlight vim %}
augroup filetype_markdown
  au!
  au BufNewFile,BufRead *.md set filetype=markdown

  au FileType markdown nnoremap <leader>f :call OpenCurrentFileInBrowser()<cr>
augroup END
{% endhighlight %}

------
  

##### Actually opening Markdown files in your browser

By now, the browser should open a download dialogue when executing our command. To fix this, we have to install an addon that provides a markdown parser.

For Google Chrome, install [Markdown Reader](https://chrome.google.com/webstore/detail/markdown-reader/gpoigdifkoadgajcincpilkjmejcaanc?hl=en), [MarkView](https://chrome.google.com/webstore/detail/markview/iaddkimmopgchbbnmfmdcophmlnghkim?hl=en) or [Markdown Viewer](https://chrome.google.com/webstore/detail/markdown-viewer/ehnambpmkdhopilaccgfmojilolcglhn?hl=en). Be sure to give the plugin access to file URLs after installing it.

For Firefox there's pretty much only [Markdown Viewer](https://addons.mozilla.org/en-US/firefox/addon/markdown-viewer-webext/) available. And chances are it doesn't work out of the box on Linux. If it doesn't, you are probably missing an entry in `~/.mozilla/firefox/*default/mimeTypes.rdf`.

Add the following to `mimeTypes.rdf` to make it recognize .md files as text/plain:

{% highlight xml %}
<RDF:Description RDF:about="urn:mimetype:text/plain"
        NC:value="text/plain"
        NC:fileExtensions="md"
        NC:description="Text Document">
    <NC:handlerProp RDF:resource="urn:mimetype:handler:text/plain"/>
</RDF:Description>
{% endhighlight %}

<small>[Source: Getting Markdown Viewer To Display HTML Formatted Markdown Content in Firefox Under Linux](http://www.ryanchapin.com/fv-b-4-737/Getting-Markdown-Viewer-To-Display-HTML-Formatted-Markdown-Content-in-Firefox-Under-Linux.html)</small>

Now restart your browser and give it a try.
