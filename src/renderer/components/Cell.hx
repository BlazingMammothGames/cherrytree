package renderer.components;

import mithril.M;
import types.Glyph;

class Cell implements Mithril {
    public static function view(vnode:Vnode<Cell>):Vnodes {
        var glyph:Glyph = vnode.attrs.get('glyph');
        return m('span.fg-${glyph.fg}.bg-${glyph.bg}', glyph.char);
    }
}