---
title: "Sideproject: Focusthingy"
layout: post
excerpt: A small Javascript App using IndexedDB
aliases: ["2014/01/12/focusthingy/"]
---

I wanted to build this for a while now and finally got around to do it.

<a href="http://focusthingy.herokuapp.com">
  <img src="/assets/images/posts/2014-01-12-sideproject-focusapp/focusapp.png" class="img-thumbnail" alt="project screenshot">
</a>

Check it out on [focusthingy.herokuapp.com](http://focusthingy.herokuapp.com/).  
The source is [available on GitHub](https://github.com/phansch/focus).

---
As the footer says, it is inspired by a Chrome extension. But I can't remember the name of it. If you happen to know the extension, let me know.

## Using IndexedDB

This project was my excuse to practice some Javascript as well as applying the principles of [OfflineFirst](http://offlinefirst.org/).
I decided to use IndexedDB, because it seems to be the simplest solution for persistent offline storage. There is also [localStorage](https://developer.mozilla.org/en-US/docs/Web/Guide/API/DOM/Storage#localStorage) which has limits on the maximum size of data. If you are looking to sync your data to a server, maybe give [hood.ie](http://hood.ie) or [PouchDB](http://pouchdb.com) a try.

### An IndexedDB primer
IndexedDB is an object storage for Javascript objects. Each IndexedDB database stores a collection of key-value pairs. Each value can be a Javascript object of any complexity. The key can be a property of such an object. You can also create indexes of any properties for quicker searching and sorting. Furthermore, instead of using SQL, in IndexedDB you use a cursor to iterate over a result set.

If you want to learn more about IndexedDB, I recommend starting with the [IndexedDB guide on the MDN](https://developer.mozilla.org/en-US/docs/Web/API/IndexedDB_API/Using_IndexedDB).
