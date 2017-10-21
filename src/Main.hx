import mithril.M;
import renderer.Renderer;
import types.DrawBuffer;
import types.KeyCode;

class Main {
    public static var buffer:DrawBuffer = [for(i in 0...(80 * 25)) '.'];
    private static var x:Int = 0;
    private static var y:Int = 0;

    inline private static function coordsToIndex(x:Int, y:Int):Int {
        return (y*80)+x;
    }

    public static function main() {
        /*haxe.Timer.measure(function() {
            M.mount(js.Browser.window.document.body, new Renderer());
        });*/
        M.mount(js.Browser.window.document.body, new Renderer());

        js.Browser.window.addEventListener('keydown', function(e:js.html.KeyboardEvent) {
            var key:KeyCode = e.keyCode;
            buffer[coordsToIndex(x, y)] = '.';
            switch(key) {
                case ArrowUp: y--;
                case ArrowRight: x++;
                case ArrowDown: y++;
                case ArrowLeft: x--;
            }
            buffer[coordsToIndex(x, y)] = '#';
            M.redraw();
        });

        /*var t:haxe.Timer = new haxe.Timer(1000);
        t.run = function() {
            haxe.Timer.measure(function() {
                buffer[2] = buffer[2].char == '.' ? '+' : '.';
                Log.info(buffer);
                M.redraw();
            });
        }*/
    }
}