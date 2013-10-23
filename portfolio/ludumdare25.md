---
layout: portfolio-detail
title: Ludum Dare 25
github: ludumdare25
subtitle: The entry for my first Ludum Dare game jam.
exe: #
scope: portfolio
category: games
thumbnail: "/assets/images/portfolio/ludumdare25/thumbnail.png"
screenshots: [/assets/images/portfolio/ludumdare25/ld25-1.png, /assets/images/portfolio/ludumdare25/ld25-2.png]
used: [Lua, Love2D]
---

This is the first game I made for the 25th Ludum Dare game jam. It is a very basic space shooter with a top-down view and a little story.

Additionally I recorded a timelapse during the weekend which is available [here](http://www.youtube.com/watch?v=eX7fsD3Hbmc). There is also a [post mortem post](/2012/12/26/ludum-dare-25-post-mortem/) available on my blog.



**What is Ludum Dare?**
> Ludum Dare is a regular accelerated game development Event.  Participants develop games from scratch in a weekend, based on a theme suggested by the community.

<a id="snippets" class="anchor"></a>
## Code snippets

{% highlight lua %}
{% raw %}
function Shot:update()
    local moveX = math.cos(self.rotation + initialShipRotation) * speed * dt
    local moveY = math.sin(self.rotation + initialShipRotation) * speed * dt
    if self:isInBounds() then
        self.x = self.x + moveX
        self.y = self.y + moveY
    end
end

function Shot:isInBounds()
    local moveX = math.cos(self.rotation + initialShipRotation) * speed * dt
    local moveY = math.sin(self.rotation + initialShipRotation) * speed * dt
    return (self.x + moveX > 0) and (self.y + moveY > 0) and (self.x + moveX < width) and (self.y + moveY < height)
end

function Shot:checkCollision(freighter)
    local shot_x2 = self.x + imgWidth
    local shot_y2 = self.y + imgHeight
    local f_x2 = freighter.x + freighter.imgWidth
    local f_y2 = freighter.y + freighter.imgHeight

    return self.x < f_x2 and shot_x2 > freighter.x and
        self.y < f_y2 and shot_y2 > freighter.y
end
{% endraw %}
{% endhighlight %}
<span class="glyphicon glyphicon-chevron-right"></span> Projectile movement, bounds checking and collision detection for projectiles <-> enemies.

----

{% highlight lua %}
{% raw %}
function Player:update(dt)
    --update rotation
    if love.keyboard.isDown('right', 'd') then
        rotation = rotation + math.pi * rotationSpeed
        rotation = self:lowRotation(rotation)
    end
    if love.keyboard.isDown('left', 'a') then
        rotation = rotation - math.pi * rotationSpeed
        rotation = self:lowRotation(rotation)
    end
    -- forward movement
    if love.keyboard.isDown('up', 'w') and self.slowdown then
        speed = 300
        --self:updateLocation(dt)
    end
    if love.keyboard.isDown('down', 's') then
        speed = -50

    end

    --update all shots
    for i,shot in ipairs(self.Shots) do
        shot:update()

        if not shot:isInBounds() then
            self:removeShot(i)
        end
    end

    shotTimer:update(dt)
    self:updateLocation(dt)
    self:slowdown(dt)
end
{% endraw %}
{% endhighlight %}
<span class="glyphicon glyphicon-chevron-right"></span> Player movement and projectile movement calls.