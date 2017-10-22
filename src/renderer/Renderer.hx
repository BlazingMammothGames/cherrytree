package renderer;

import js.html.DivElement;
import js.html.SpanElement;
import types.Glyph;

class Renderer {
    private var canvas:DivElement;
    private var chars:Array<SpanElement>;

    public function new() {
        var canvas:DivElement = js.Browser.document.createDivElement();
        canvas.classList.add('display');
        chars = [
            for(i in 0...(80*25)) {
                var char:SpanElement = js.Browser.document.createSpanElement();
                char.className = 'fg-white bg-black';
                char.textContent = '\u00a0';
                canvas.appendChild(char);
                char;
            }
        ];
        js.Browser.document.body.appendChild(canvas);
    }

    public function rerender(x:Int, y:Int, g:Glyph):Void {
        var char:SpanElement = chars[y*80+x];
        char.childNodes[0].nodeValue = g.char;//g.char;
        //char.className = 'fg-${g.fg} bg-${g.bg}';
    }
}