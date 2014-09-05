---
layout: portfolio
title: FocusThingy
source: "https://github.com/phansch/focus"
subtitle: A small JavaScript application using IndexedDB.
category: misc
thumbnail: "/assets/images/portfolio/focusthingy/thumbnail.png"
screenshots: "/assets/images/portfolio/focusthingy/thumbnail.png"
used: [HTML5, CSS, JS, IndexedDB]
order: 6
---

This JavaScript application allows the user to enter a specific task he or she  wants to work on. The entered task is persisted across multiple browser sessions, using IndexedDB.

The project was my excuse to practice some Javascript as well as applying the principles of [OfflineFirst](http://offlinefirst.org/). I decided to use IndexedDB, because it seems to be the simplest solution for persistent offline storage. There is also [localStorage](https://developer.mozilla.org/en-US/docs/Web/Guide/API/DOM/Storage#localStorage) which has limits on the maximum size of data. Other frameworks, such as [hood.ie](http://hood.ie/) or [PouchDB](http://pouchdb.com/) also allow syncing with a server.

## Things left to improve

 * Remove task if it's older than 24 hours so that the user would no longer have to remove yesterday's task by hand.

<a id="snippets" class="anchor"></a>

## Code snippets

{% highlight javascript %}
{% raw %}
focusApp.indexedDB.updateTask = function(taskText) {
  var db = focusApp.indexedDB.db;

  var trans = db.transaction(["task"], "readwrite");
  var store = trans.objectStore("task");
  var request = store.put({
    "text": taskText,
    "timeStamp": new Date().getTime()
  }, 1);

  request.onerror = function(e) {
    console.log(e.value);
  };
};
{% endraw %}
{% endhighlight %}
<span class="glyphicon glyphicon-chevron-right"></span> This function is responsible for saving a modified task text.

