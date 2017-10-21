package renderer.components;

import mithril.M;
import types.DrawBuffer;

class Display implements Mithril {
    public static function view(vnode:Vnode<Display>):Vnodes {
        var buffer:DrawBuffer = vnode.attrs.get('buffer');

        return
        m('.display', [
            for(glyph in buffer) m(Cell, { glyph: glyph })
        ]);
    }
}