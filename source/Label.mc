import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class Label extends WatchUi.Drawable {

    private var _fieldType;
    private var _color;
    private var _font;
    private var _justification;

    typedef LabelParams as {
        :identifier as String,
        :locX as Float,
        :locY as Float,
        :font as FontResource,
        :color as ColorValue,
        :justification as Number,
        :fieldType as Number
    };

    function initialize(params as LabelParams) {
        Drawable.initialize(params);
        _color = params[:color];
        _font = params[:font];
        _justification = params[:justification];
        _fieldType = params[:fieldType];
    }

    function draw(dc as Dc) as Void {
        var fieldValue = Field.resolveFieldValue(_fieldType);
        var fieldFormat = Field.resolveFieldFormat(_fieldType);
        var text = Lang.format(fieldFormat, fieldValue);

        dc.setColor(_color, Graphics.COLOR_TRANSPARENT);
        dc.drawText(locX, locY, _font, text, _justification);
        dc.clear();
    }

}
