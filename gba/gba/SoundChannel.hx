package gba;

class SoundChannel {

	public var bufferSamples(default, null) : Int;
	var device : Int;

	public function new( bufferSamples : Int ) {
	    this.bufferSamples = bufferSamples;
	}

	public function stop() {
	    if( device != 0 ) {
		device = 0;
	    }
	}

}
