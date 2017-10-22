package renderer;

import vellum.CanvasTerminal;
import types.Glyph;

class Renderer {
    private var term:CanvasTerminal;

    public function new() {
        term = new CanvasTerminal(80, 25, vellum.Font.Courier());
    }

    public function rerender(x:Int, y:Int, g:Glyph):Void {
        term.writeChar(x, y, g.char);
    }

    public function render():Void {
        term.render();
    }
}