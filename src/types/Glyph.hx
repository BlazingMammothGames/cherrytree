package types;

typedef GlyphObject = {
    var char:String;
    var bg:Colour;
    var fg:Colour;
}

@:forward abstract Glyph(GlyphObject) from GlyphObject to GlyphObject {
    public function new(g:GlyphObject) this = g;
    @:from public static function fromString(s:String):Glyph return new Glyph({ char: s, bg:Colour.Black, fg:Colour.Grey });
}