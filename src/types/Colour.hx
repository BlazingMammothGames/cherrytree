package types;

@:enum abstract FGColour(String) {
    var Black = "30";
    var Red = "31";
    var Green = "32";
    var Yellow = "33";
    var Blue = "34";
    var Magenta = "35";
    var Cyan = "36";
    var White = "37";
    var BrightBlack = "30;1";
    var BrightRed = "31;1";
    var BrightGreen = "32;1";
    var BrightYellow = "33;1";
    var BrightBlue = "34;1";
    var BrightMagenta = "35;1";
    var BrightCyan = "36;1";
    var BrightWhite= "37;1";
}

@:enum abstract BGColour(String) {
    var Black = "40";
    var Red = "41";
    var Green = "42";
    var Yellow = "43";
    var Blue = "44";
    var Magenta = "45";
    var Cyan = "46";
    var White = "47";
    var BrightBlack = "100";
    var BrightRed = "101";
    var BrightGreen = "102";
    var BrightYellow = "103";
    var BrightBlue = "104";
    var BrightMagenta = "105";
    var BrightCyan = "106";
    var BrightWhite= "107";
}