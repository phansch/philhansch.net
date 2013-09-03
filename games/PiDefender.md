---
layout: game
title: PiDefender
subtitle: My January entry for One Game A Month 2013
zip: "http://dl.dropbox.com/u/128670221/1GAM/Jan/PiDefender-Final.love"
exe: "http://dl.dropbox.com/u/128670221/1GAM/Jan/PiDefender-Final.exe"
scope: portfolio
titleScreenshot: #
used: "Lua, Love2D"
---

## The game ##

### Description  ###
>Your solar system is under attack!

>Your scout ship is directing your people's only defense:
>A giant defensive cannon that can obliberate dozens of ships at once.

>Try not to get hit by enemy fire while killing as many as possible.

### Created using ###
{{page.used}}

<h2 id="screenshots">Screenshots</h2>
<a href="/assets/images/portfolio/pidefender/pidefender-1.png"><img src="/assets/images/portfolio/pidefender/pidefender-1.png" alt="screenshot" width="300" /></a>
<a href="/assets/images/portfolio/pidefender/pidefender-2.png"><img src="/assets/images/portfolio/pidefender/pidefender-2.png" alt="screenshot" width="300" /></a>
<a href="/assets/images/portfolio/pidefender/pidefender-3.png"><img src="/assets/images/portfolio/pidefender/pidefender-3.png" alt="screenshot" width="300" /></a>
<a href="/assets/images/portfolio/pidefender/pidefender-4.png"><img src="/assets/images/portfolio/pidefender/pidefender-4.png" alt="screenshot" width="300" /></a>


<h2 id="snippets">Code snippets</h2>

{% highlight lua %}
function Cannon:update(dt, circleradius)
    self.circleRadius = circleradius

    -- Only update cannon direction when mouse is outside of circle and player is enabled
    if(mousePos:dist(winCenter) > self.circleRadius + Cannon.radius) and Player.enabled then
        self.angle = math.atan2(winCenter.y-mousePos.y, winCenter.x-mousePos.x) + math.pi - Cannon.circ/2
        --Also only allow shooting when mouse is outside of Circle
        Cannon.allowFire = true
    else
        Cannon.allowFire = false
    end

    for i,shot in ipairs(Cannon.cannonShots) do
        shot:update(dt)

        -- remove shot when out of bounds
        if not shot:isInBounds() then
            table.remove(Cannon.cannonShots, i)
        end
    end

    if Cannon.aoe ~= nil and Cannon.aoe.emitted then
        Cannon.aoe:update(dt)
        if not Cannon.aoe:isInBounds() then
            Cannon.aoe = nil
        end
    end

    if Cannon.aoeTimer == 0 then
        Cannon.aoeAllowed = true
        Cannon.aoeTimer = 30
    end

end
{% endhighlight %}

<h2 id="download">Running the game</h2>

1. If you don't have Love2D installed, download it [here](http://love2d.org) and install it first.
2. Download the provided .love (zip) file

To run the game:

 * On Linux, use `love /path/to/game.love` to run the game.
 * On Windows use `love C:\path\to\game.love` **or** drag the .love file onto love.exe
 * On Mac use `open -n -a love "/home/path/to/game"` **or** drag the .love file onto the Love.app application bundle

Once the month is over, there will also be a .exe file for Windows users. 
