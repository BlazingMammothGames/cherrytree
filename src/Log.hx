import js.Browser;
import haxe.extern.Rest;

class Log {
    public static var trace(get, never):Rest<Dynamic>->Void;
    inline private static function get_trace():Rest<Dynamic>->Void return Browser.window.console.log;

    public static var info(get, never):Rest<Dynamic>->Void;
    inline private static function get_info():Rest<Dynamic>->Void return Browser.window.console.info;
    
    public static var warn(get, never):Rest<Dynamic>->Void;
    inline private static function get_warn():Rest<Dynamic>->Void return Browser.window.console.warn;
    
    public static var error(get, never):Rest<Dynamic>->Void;
    inline private static function get_error():Rest<Dynamic>->Void return Browser.window.console.error;
}