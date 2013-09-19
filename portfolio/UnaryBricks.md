---
layout: portfolio-detail
title: UnaryBricks
github: UnaryBricks
subtitle: A plain and simple breakout clone.
zip: #
exe: #
scope: portfolio
category: games
thumbnail: "/assets/images/portfolio/unarybricks/unarybricks-2.png"
used: [Lua, Love2D]
---

A very basic Breakout clone. 

<h2 id="screenshots">Screenshots</h2>

<div class="row">
  <div class="col-md-6">
    <a href="/assets/images/portfolio/unarybricks/unarybricks-1.png" class="thumbnail">
      <img src="/assets/images/portfolio/unarybricks/unarybricks-1.png" alt="screenshot" width="300" />
    </a>
  </div>
  <div class="col-md-6">
    <a href="/assets/images/portfolio/unarybricks/unarybricks-2.png" class="thumbnail">
      <img src="/assets/images/portfolio/unarybricks/unarybricks-2.png" alt="screenshot" width="300" />
    </a>
  </div>
</div>

<h2 id="snippets">Code snippets</h2>

{% highlight lua %}
function Ball:update(paddle, level)
    self.x = self.x + self.xdir * Game.dt * speed
    self.y = self.y + self.ydir * Game.dt * speed

    -- ball collides with top, left or right
    if(self.y <= 0) then
        self.ydir = 1
    end
    if(self.x <= 0) then
        self.xdir = 1
    end
    if(self.x >= love.graphics.getWidth()) then
        self.xdir = -1
    end

    -- if y > height -> round over
    if(self.y >= love.graphics.getHeight()) then
        -- one life less
    end

    -- check if ball collides with paddle
    if(self:checkCollision(paddle)) then

        self.ydir = self.ydir * -1

        if(self.x + (self.size / 2 ) > paddle.x + paddle.width / 2) then
            self.xdir = math.abs(self.xdir);
        else
            self.xdir = math.abs(self.xdir) * -1;
        end
    end

    -- check if ball collides with brick
    for i,rows in ipairs(Bricks) do
        for j, brick in ipairs(rows) do
            if(self:checkCollision(brick) and brick.visible) then


                -- Detect the side that was hit and reflect the ball appropriately
                if(self.y >= (brick.y + brick.height)) then
                    self.ydir = 1 -- from below
                    print("from below")
                elseif((self.y+self.size) <= brick.y+5) then
                    self.ydir = -1 -- from above
                    print("from above")
                elseif((self.x + self.size) <= brick.x + 5) then
                    self.xdir = -1 -- from left (something not perfect here)
                    print("from left" .. self.x .. " " .. brick.x)
                elseif(self.x > brick.x) then
                    self.xdir = 1 -- from right
                    print("from right")
                end
                brick.visible = false
            end
        end
    end
end
{% endhighlight %}
<span class="glyphicon glyphicon-chevron-right"></span> Ball movement and collision detection.

<h2 id="download">Running the game</h2>
If you are on Windows, I recommend downloading the .exe and running it. This doesn't require any additional installations.
However, if you choose to download the .love file, please follow the instructions below.

1. If you don't have Love2D installed, download it [here](http://love2d.org) and install it first.
2. Download the provided .love (zip) file

To run the game:

 * On Linux, use `love /path/to/game.love` to run the game.
 * On Windows use `love C:\path\to\game.love` **or** drag the .love file onto love.exe
 * On Mac use `open -n -a love "/home/path/to/game"` **or** drag the .love file onto the Love.app application bundle

Once the month is over, there will also be a .exe file for Windows users. 
