import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.Time;
import Toybox.WatchUi;

class TimeDisplay extends WatchUi.Drawable {

    private var _font as FontResource;
    private var _color as ColorValue;

    function initialize(params as Dictionary) {
        Drawable.initialize(params);
        _font = WatchUi.loadResource(Rez.Fonts.Time) as FontResource;
        _color = Graphics.COLOR_WHITE;
    }

    function draw(dc as Dc) as Void {
        var clockTime = System.getClockTime();
        var hour = clockTime.hour;
        var min = clockTime.min;

        var settings = System.getDeviceSettings();
        if (!settings.is24Hour) {
            if (hour > 12) {
                hour = hour - 12;
            } else if (hour == 0) {
                hour = 12;
            }
        }

        var hourStr = hour.format("%02d");
        var minStr = min.format("%02d");

        var h1 = hourStr.substring(0, 1);
        var h2 = hourStr.substring(1, 2);
        var m1 = minStr.substring(0, 1);
        var m2 = minStr.substring(1, 2);

        dc.setColor(_color, Graphics.COLOR_TRANSPARENT);

        var cx = dc.getWidth() / 2;
        var cy = dc.getHeight() / 2;
        var slotWidth = 49;
        var colonWidth = 22;
        var totalWidth = (slotWidth * 4) + colonWidth;

        var leftEdge = cx - (totalWidth / 2);

        var h1x = leftEdge + (slotWidth / 2);
        var h2x = h1x + slotWidth;
        var colonX = leftEdge + (slotWidth * 2) + (colonWidth / 2);
        var m1x = colonX + (colonWidth / 2) + (slotWidth / 2);
        var m2x = m1x + slotWidth;

        var justify = Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER;

        dc.drawText(h1x, cy, _font, h1, justify);
        dc.drawText(h2x, cy, _font, h2, justify);

        var now = Time.now().value();
        if (now % 2 == 0) {
            dc.drawText(colonX, cy, _font, ":", justify);
        }

        dc.drawText(m1x, cy, _font, m1, justify);
        dc.drawText(m2x, cy, _font, m2, justify);
    }
}
