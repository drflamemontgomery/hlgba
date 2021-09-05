package gba;

@:hlNative("gba")
class Gba {

	static var initDone = false;
	static var isWin32 = false;

	public static function init() {
		if( initDone ) return;
		initDone = true;
		if( !initOnce() ) throw "Failed to init GBA";
		isWin32 = detectWin32();
	}

	static function initOnce() return false;
	static function eventLoop( e : Dynamic ) return false;
	static function hintValue( name : hl.Bytes, value : hl.Bytes ) return false;

	static var event = new Event();
	public static function processEvents( onEvent : Event -> Bool ) {
		while( true ) {
			if( !eventLoop(event) )
				break;
			var ret = onEvent(event);
			if( event.type == Quit && ret )
				return false;
		}
		return true;
	}

	public static function quit() {
	}

	public static function delay(time:Int) {
	}


	public static function getScreenWidth() : Int {
		return 0;
	}

	public static function getScreenHeight() : Int {
		return 0;
	}

	public static function message( title : String, text : String, error = false ) {
	}

	static function messageBox( title : hl.Bytes, text : hl.Bytes, error : Bool ) {
	}

	static function detectWin32() {
		return false;
	}

	static function get_devices() : hl.NativeArray<hl.Bytes> {
		return null;
	}

	public static function getDevices() {
	    return null;
	}

	public static function setRelativeMouseMode( enable : Bool ) : Int {
	    return null;
	}

	static function detect_keyboard_layout() : hl.Bytes {
	    return null;
	}

	public static function detectKeyboardLayout(){
	    return null
	}

	private static function _setClipboardText( text : hl.Bytes ) : Bool {
	    return false;
	}

	public static function setClipboardText( text : String ) : Bool {
		return false;
	}

	private static function _getClipboardText() : hl.Bytes {
	    return null;
	}

	public static function getClipboardText() : String {
	    return null;
	}
}
