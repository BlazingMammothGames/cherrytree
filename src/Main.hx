import renderer.Renderer;
import types.KeyCode;

class Main {
    private static var x:Int = 0;
    private static var y:Int = 0;

    inline private static function coordsToIndex(x:Int, y:Int):Int {
        return (y*80)+x;
    }

    public static function main() {
        var renderer:Renderer;
        haxe.Timer.measure(function() {
            renderer = new Renderer();
        });
        renderer.rerender(x, y, '#');

        js.Browser.window.addEventListener('keydown', function(e:js.html.KeyboardEvent) {
            haxe.Timer.measure(function() {
                var key:KeyCode = e.keyCode;
                renderer.rerender(x, y, '.');
                switch(key) {
                    case ArrowUp: y--;
                    case ArrowRight: x++;
                    case ArrowDown: y++;
                    case ArrowLeft: x--;
                }
                renderer.rerender(x, y, '#');
            });
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