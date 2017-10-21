package renderer;

import renderer.components.Display;

import mithril.M;

class Renderer implements Mithril {
    public function new(){}

    public function view(vnode:Vnode<Renderer>):Vnodes {
        return m(Display, { buffer: Main.buffer });
    }
}