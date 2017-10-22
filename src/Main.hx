import types.Glyph;
import types.Colour;
import renderer.Renderer;

class Main {
    private static var x:Int = 0;
    private static var y:Int = 0;
    private static var renderer:Renderer;
    private static var fps:js.html.DivElement;
    private static var lastTime:Float;

    inline private static function coordsToIndex(x:Int, y:Int):Int {
        return (y*80)+x;
    }

    public static function main() {
        renderer = new Renderer();

        fps = js.Browser.document.createDivElement();
        fps.textContent = 'derp';
        js.Browser.document.body.appendChild(fps);

        lastTime = haxe.Timer.stamp();
        js.Browser.window.requestAnimationFrame(render);
    }

    inline static function randomChar():String {
        return ' .:!0#/%^*@$-+='.charAt(Math.floor(Math.random() * 15));
    }

    inline static function randomColour():Colour {
        var colours:Array<Colour> = macros.AbstractEnumTools.getValues(Colour);
        return colours[Math.floor(Math.random() * colours.length)];
    }

    static function render(dt:Float):Void {
        var now:Float = haxe.Timer.stamp();
        for(y in 0...25) for(x in 0...80) renderer.draw(x, 0, new Glyph({
            char: randomChar(),
            fg: randomColour(),
            bg: Colour.Black
        }));

        var d = now - lastTime;
        var f = d > 0 ? 1.0 / d : 0;
        lastTime = now;
        fps.childNodes[0].nodeValue = Std.string(f);

        renderer.render();
        //js.Browser.window.requestAnimationFrame(render);
    }
}