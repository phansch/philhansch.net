---
layout: portfolio
title: Screenshot Streamer
source: "https://gitlab.com/phansch/screenshot-streamer/tree/master"
subtitle: "Post screeshots via API and have them neatly appear in all clients without reloading"
category: web
thumbnail: "/assets/images/portfolio/streamer/thumbnail.png"
screenshots: [/assets/images/portfolio/streamer/thumbnail.png]
used: [Sinatra, JavaScript, Jasmine]
---

This is a streaming app that pushes uploaded images to all connected clients.
The server is built with Sinatra and sends push notifications to all connected clients once it receives a proper POST request.

To test the front-end code Jasmine and Grunt are used and the testsuite runs headless, started via `grunt jasmine`.

While the app works, it could use some more work: There are no tests for the Sinatra app and the jQuery plugin could use some refactoring as well.

<a id="snippets" class="anchor"></a>

## Code snippets

{% highlight ruby %}
{% raw %}
get '/' do
  @images = images
  erb :index
end

post '/screenshot/:filename' do
  protected!
  write_file(params[:filename])

  notification = params.merge( {'timestamp' => timestamp}).to_json

  connections.each { |out| out << "data: #{notification}\n\n"}
  "wrote to #{params[:filename]}\n"
end

get '/connect', provides: 'text/event-stream' do
  stream :keep_open do |out|
    connections << out
    out.callback { connections.delete(out) }
  end
end
{% endraw %}
{% endhighlight %}
<span class="glyphicon glyphicon-chevron-right"></span> The routes of the Sinatra app.

---

{% highlight javascript %}
{% raw %}
(function ( $ ) {
  $.fn.moveImages = function(options) {
    var settings = $.extend({
      filename: "#",
      limitThumbnails: 6
    }, options );

    img_copy = $('#newest_image').clone();
    img_copy.removeAttr("id");

    // only add thumbnail if newest image has a source
    if($("#thumbnails ul li").size() == 0 && $('#newest_image').attr("href")) {
      $("#thumbnails ul").prepend("<li></li>");
      $("#thumbnails li").first().html(img_copy);
    }
    else if($("#thumbnails ul li").size() == 1) {
      oldFirstLi = $("#thumbnails li").first();
      newFirstLi = oldFirstLi.clone().prependTo(oldFirstLi.parent());
      newFirstLi.attr("class", "first");
      oldFirstLi.attr("class", "last");
      newFirstLi.html(img_copy);
    }
    else {
      oldFirstLi = $("#thumbnails ul li").first();
      //Remove the class attr of the first element
      oldFirstLi.removeAttr("class");

      // Remove the last list element if the limit is reached
      if($('#thumbnails ul li').size() >= settings.limitThumbnails) {
        $("#thumbnails ul li").last().remove();
        // Set the class of the new last element to "last"
        $("#thumbnails li").last().attr("class", "last");
      }

      //Copy the big image to the thumbnails
      newFirstLi = oldFirstLi.clone().prependTo(oldFirstLi.parent());
      newFirstLi.attr("class", "first");
      newFirstLi.html(img_copy);
    }

    $('#newest_image').attr("href", "/screenshots/" + settings.filename);
    $('#newest_image img').attr("src", "/screenshots/" + settings.filename);
  };
}( jQuery ));
{% endraw %}
{% endhighlight %}
<span class="glyphicon glyphicon-chevron-right"></span> The jQuery plugin to move around the images.

---

{% highlight javascript %}
{% raw %}
describe("adding the first image", function() {
  var fixture;

  beforeEach(function() {
    loadFixtures('noImage.html');
    fixture = $('#test');
    fixture.moveImages({filename: "whatever.png"});
  });

  afterEach(function() {
    fixture.remove();
  });

  it('should add the correct link to the empty a href', function() {
    expect('a#newest_image').toHaveAttr('href', '/screenshots/whatever.png');
  });

  it('should add the correct link to the empty img src', function() {
    expect('a#newest_image img').toHaveAttr('src', '/screenshots/whatever.png');
  });

  it('should add nothing to the thumbnail list', function() {
    expect($('#thumbnails ul')).not.toContainElement('li');
  });
});
{% endraw %}
{% endhighlight %}
<span class="glyphicon glyphicon-chevron-right"></span> Jasmine tests for the jQuery plugin.
