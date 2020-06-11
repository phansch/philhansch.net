---
layout: portfolio
title: UnaryBricks
source: "https://gitlab.com/phansch/unarybricks/tree/master"
subtitle: A plain and simple breakout clone.
exe: #
category: games
thumbnail: "/assets/images/portfolio/unarybricks/unarybricks-2.png"
screenshots: [/assets/images/portfolio/unarybricks/unarybricks-1.png, /assets/images/portfolio/unarybricks/unarybricks-2.png]
used: [Lua, Love2D]
order: 3
---

A very basic Breakout clone.

<a id="snippets" class="anchor"></a>

## Code snippets

```lua
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
```
<span class="glyphicon glyphicon-chevron-right"></span> Ball movement and collision detection.
