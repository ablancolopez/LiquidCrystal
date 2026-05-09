import Toybox.Lang;
import Toybox.System;
import Toybox.Time;
import Toybox.WatchUi;

using Toybox.Time.Gregorian as Calendar;

module Field {
    const DATE = 0;
    const DAY_OF_WEEK = 1;
    const BATTERY = 2;

    function resolveFieldValue(type) {
        switch(type) {
            case DATE:
                var date = Calendar.info(Time.now(), Time.FORMAT_SHORT);
                return [date.day, date.month.format("%02d")];
            case DAY_OF_WEEK:
                var dayOfWeek = Calendar.info(Time.now(), Time.FORMAT_SHORT).day_of_week;
                var dayOfWeekString = WatchUi.loadResource(resolveDayOfWeek(dayOfWeek));
                return [dayOfWeekString];
            case BATTERY:
                var battery = System.getSystemStats().battery;
                return [battery.toNumber()];
            default:
                throw new Lang.InvalidValueException(type);
        }
    }

    function resolveFieldFormat(type) {
        switch(type) {
            case DATE: return "$1$/$2$";
            case DAY_OF_WEEK: return "$1$";
            case BATTERY: return "$1$%";
            default: throw new Lang.InvalidValueException(type);
        }
    }

    function resolveDayOfWeek(num) {
        switch(num) {
            case 1: return Rez.Strings.Sun;
            case 2: return Rez.Strings.Mon;
            case 3: return Rez.Strings.Tue;
            case 4: return Rez.Strings.Wed;
            case 5: return Rez.Strings.Thu;
            case 6: return Rez.Strings.Fri;
            case 7: return Rez.Strings.Sat;
            default: throw new Lang.InvalidValueException(num);
        }
    }

}