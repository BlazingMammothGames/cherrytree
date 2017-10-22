package renderer;

import js.Browser;
import js.html.DivElement;
import js.html.SpanElement;
import types.Glyph;

typedef PositionedGlyph = {
    var x:Int;
    var y:Int;
    var g:Glyph;
}

class Renderer {
    private var canvas:DivElement;
    private var chars:Array<SpanElement> = [];
    private var draws:Array<PositionedGlyph> = [];

    public function new() {
        var canvas:DivElement = Browser.document.createDivElement();
        canvas.classList.add('display');
        for(y in 0...25) {
            var line:SpanElement = Browser.document.createSpanElement();
            line.className = 'line';
            for(x in 0...80) {
                var char:SpanElement = js.Browser.document.createSpanElement();
                char.className = 'fg-white bg-black';
                char.textContent = '\u00a0';
                chars.push(char);
                line.appendChild(char);
            }
            canvas.appendChild(line);
        }
        js.Browser.document.body.appendChild(canvas);
    }

    public function draw(x:Int, y:Int, g:Glyph):Void {
        var found:Bool = false;
        for(draw in draws) {
            if(draw.x == x && draw.y == y) {
                draw.g = g;
                found = true;
                break;
            }
        }
        if(!found) draws.push({x: x, y: y, g: g});
    }

    public function render():Void {
        Browser.console.log('Drawing ${draws.length}...');
        for(draw in draws) {
            var char:SpanElement = chars[draw.y*80+draw.x];
            char.childNodes[0].nodeValue = draw.g.char;
            char.className = 'fg-${draw.g.fg} bg-${draw.g.bg}';
        }
        draws = [];
    }
}