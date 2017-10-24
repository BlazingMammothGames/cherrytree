package types;

import types.Colour;

typedef GlyphObject = {
    var char:String;
    var bg:BGColour;
    var fg:FGColour;
}

@:forward abstract Glyph(GlyphObject) from GlyphObject to GlyphObject {
    public function new(g:GlyphObject) {
        this = g;
        if(this.char == ' ') this.char = '\u00a0';
    }

    @:from public static function fromString(s:String):Glyph
        return new Glyph({
            char: s,
            bg: BGColour.Black,
            fg: FGColour.BrightBlack
        });
}