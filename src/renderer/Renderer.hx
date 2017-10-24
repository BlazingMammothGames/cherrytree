package renderer;

import js.Browser;
import js.html.DivElement;
import js.xterm.Terminal;
import types.Glyph;
import types.Colour;

class Renderer {
    var term:Terminal;
    var display:Array<Glyph> = [for(i in 0...(80*25)) ' '];

    public function new() {
        term = new Terminal({
            cursorBlink: true,
            cols: 80,
            rows: 25,
            scrollBack: 0
        });

        var container:DivElement = Browser.document.createDivElement();
        Browser.document.body.appendChild(container);

        term.open(container, true);
    }

    public function draw(x:Int, y:Int, g:Glyph):Void {
        display[y*80+x] = g;
    }

    public function render():Void {
        term.clear();
        for(y in 0...25) {
            var line:String = '';

            var lastFG:FGColour = null;
            var lastBG:BGColour = null;

            for(x in 0...80) {
                var g:Glyph = display[y*80+x];
                if(g.bg != lastBG) {
                    line += '\033[${g.bg}m';
                    lastBG = g.bg;
                }
                if(g.fg != lastFG) {
                    line += '\033[${g.fg}m';
                    lastFG = g.fg;
                }
                line += g.char;
            }
            y == 24 ? term.write(line) : term.writeln(line);
        }
        term.scrollToTop();
    }
}