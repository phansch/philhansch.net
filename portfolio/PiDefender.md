---
layout: portfolio-detail
title: PiDefender
source: "https://gitlab.com/phansch/pidefender/tree/master"
subtitle: My January entry for One Game A Month 2013.
exe: "/assets/dl/1GAM/Jan/PiDefender-Final.exe"
love: "/assets/dl/1GAM/Jan/PiDefender-Final.love"
scope: portfolio
category: games
thumbnail: "/assets/images/portfolio/pidefender/pidefender-3.png"
screenshots: [/assets/images/portfolio/pidefender/pidefender-1.png, /assets/images/portfolio/pidefender/pidefender-2.png,
/assets/images/portfolio/pidefender/pidefender-3.png, /assets/images/portfolio/pidefender/pidefender-4.png]
used: [Lua, Love2D]
---

>Your solar system is under attack!

>Your scout ship is directing your people's only defense:
>A giant defensive cannon that can obliberate dozens of ships at once.

>Try not to get hit by enemy fire while killing as many as possible.

<a id="snippets" class="anchor"></a>

## Code snippets

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
<span class="glyphicon glyphicon-chevron-right"></span> Cannon movement and <abbr title="Area of effect">Aoe</abbr> handling.
