package admira {
	
	public class xString {
		
		public static function get version():Number { return 0.75; }
				
		// length range: min - max
		// upperCase , mixedCase , allowSame
		// numbers, letters, punctuations, hex, oct, bin
		// custom, include, exclude, 
		// startWith, endWith
		// default SET , ASCII SET , EXTENDED ASCII SET
		
		public static const NUMBERS:String = "num";
		public static const LETTERS:String = "let";
		public static const PUNCTUATIONS:String = "pun";		
		public static const BIN:String = "bin";
		public static const OCT:String = "oct";
		public static const HEX:String = "hex";		
		public static const CUSTOM:String = "cus";
		
		public static const DEFAULT_SET:String = "def";		
		public static const ASCII_SET:String = "asc";		
		public static const EXT_ASCII_SET:String = "ext";		
		
		public static const UPPER_CASE:String = "upp";
		public static const MIXED_CASE:String = "mix";
		public static const ALLOW_SAME:String = "all";
		
			private static var _generateSet:Vector.<String> = new Vector.<String>();
			private static var _generateSetInit:Boolean = false;
			private static var _generateLength:uint = 16;
			private static var _generateMinLength:uint = 16;
			private static var _generateMaxLength:uint = 16;
			private static var _generateNumbers:Boolean = true;
			private static var _generateLetters:Boolean = true;
			private static var _generatePunctuations:Boolean = false;
			private static var _generateHex:Boolean = false;
			private static var _generateCustom:Boolean = false;
			private static var _generateUpperCase:Boolean = false;
			private static var _generateMixedCase:Boolean = false;
			private static var _generateAllowSame:Boolean = true;
		
			public static function get defaultGenerateSettings():Object {
				return {
					length : _generateLength ,
					min : _generateMinLength ,
					max : _generateMaxLength ,
					numbers : _generateNumbers ,
					letters : _generateLetters ,
					punctuations : _generatePunctuations ,
					hex : _generateHex ,
					custom : _generateCustom ,
					upperCase : _generateUpperCase ,
					mixedCase : _generateMixedCase ,
					allowSame : _generateAllowSame
				};
			}
			public static function set defaultGenerateSettings( value:Object ):void {
				if( value.length && value.length is Number ) {
					
				}
			}
			
			public static function get defaultGenerateSettings_Numbers():Boolean { return _generateNumbers; }
			public static function set defaultGenerateSettings_Numbers( value:Boolean ):void { _generateNumbers = value; }
		
		public static function generateRangeArray():Array { return null; }
		public static function generateRange():String { return null; }
		public static function generate( length:uint = 16 , params:Object = null , ...rest ):String {
			
			//trace( "test" );
			
			_generateSet.push(
				/* numbers AND letters AND punctuations WITHOUT mixedCase */
/*  0 - 9  */	"0","1","2","3","4","5","6","7","8","9",				
/* 10 - 35 */	"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
/* 36 - 68 */	" ","!","\"","#","$","%","&","'","(",")","*","+",",","-",".","/",":",";","<","=",">","?","@","[","\\","]","^","_","`","{","|","}","~",
				
				/* numbers AND letters AND punctuations WITH upperCase */
/* 69 - 78  */	"0","1","2","3","4","5","6","7","8","9",				
/* 79 - 104 */	"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",				
/*105 - 137 */	" ","!","\"","#","$","%","&","'","(",")","*","+",",","-",".","/",":",";","<","=",">","?","@","[","\\","]","^","_","`","{","|","}","~",
				
				/* numbers AND letters AND punctuations WITH mixedCase */
/*138 - 147 */	"0","1","2","3","4","5","6","7","8","9",				
/*148 - 173 */	"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
/*174 - 199 */	"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",				
/*200 - 232 */	" ","!","\"","#","$","%","&","'","(",")","*","+",",","-",".","/",":",";","<","=",">","?","@","[","\\","]","^","_","`","{","|","}","~",
								
				/* numbers AND punctuations */
/*233 - 242 */	"0","1","2","3","4","5","6","7","8","9",
/*243 - 275 */	" ","!","\"","#","$","%","&","'","(",")","*","+",",","-",".","/",":",";","<","=",">","?","@","[","\\","]","^","_","`","{","|","}","~"
			);
			
			//trace( _generateSet );
			//trace( _generateSet.length );
			
			var R:Function = Math.random;
			var V:Vector.<String> = _generateSet;
			
			//var r:Vector.<int> = new Vector.<int>();
			var j:int = 0;
			
			var i:int = 32;
			
			var numbers:Boolean = true;
			var letters:Boolean = false;
			var punctuations:Boolean = false;
			//var hex:Boolean = false;
			
			var upperCase:Boolean = false;
			var mixedCase:Boolean = false;
			var allowSame:Boolean = false;
			
			if( upperCase ) { mixedCase = false; }
			
			var min:int = 0;
			var max:int = 0;
							
			var OPT:uint = 0;
				if( numbers ) { OPT++; }
				if( letters ) { OPT+=2; }
				if( punctuations ) { OPT+=4; }
				if( mixedCase ) { OPT+=8; }
				if( upperCase ) { OPT+=16; }
			
			switch( OPT ) {
				case 1: // numbers ONLY WITHOUT mixedCase OR upperCase
				case 9: // numbers ONLY WITH mixedCase
				case 17: // numbers ONLY WITH upperCase
					min = 0; max = 9; break;				
								
				case 2: // letters ONLY WITHOUT mixedCase OR upperCase
					min = 10; max = 35; break;
				case 3: // numbers AND letters WITHOUT mixedCase OR upperCase
					min = 0; max = 35; break;
				case 4: // punctuations ONLY WITHOUT mixedCase OR upperCase
					min = 36; max = 68; break;
				case 5: // numbers AND punctuations WITHOUT mixedCase OR upperCase
					min = 233; max = 275; break;
				case 6: // letters AND punctuations WITHOUT mixedCase OR upperCase
					min = 10; max = 68; break;
				case 7: // numbers AND letters AND punctuations WITHOUT mixedCase OR upperCase
					min = 0; max = 68; break;
				case 10: // letters ONLY WITH mixedCase
					min = 148; max = 199; break;
				case 11: // numbers AND letters WITH mixedCase
					min = 138; max = 199; break;
				case 12: // punctuations ONLY WITH mixedCase
					min = 36; max = 68; break;
				case 13: // numbers AND punctuations WITH mixedCase
					min = 233; max = 275; break;
				case 14: // letters AND punctuations WITH mixedCase
					min = 148; max = 232; break;
				case 15: // numbers AND letters AND punctuations WITH mixedCase
					min = 138; max = 232; break;
				case 18: // letters ONLY WITH upperCase
					min = 79; max = 104; break;
				case 19: // numbers AND letters WITH upperCase
					min = 69; max = 104; break;
				case 20: // punctuations ONLY WITH upperCase
					min = 36; max = 68; break;
				case 21: // numbers AND punctuations WITH upperCase
					min = 233; max = 275; break;
				case 22: // letters AND punctuations WITH upperCase
					min = 79; max = 137; break;
				case 23: // numbers AND letters AND punctuations WITH upperCase
					min = 69; max = 137; break;
								
				case 0: // nothing
				case 8: // nothing WITH mixedCase
				case 16: // nothing WITH upperCase
					min = 0; max = 0; break;			
			}
			
			var maxLength:uint = max - min + 1;
			
			//trace( "OPT:" , OPT );
			//trace( "min:" , min , " max:" , max );
			
			
				max = max - min + 1;
			
			var r:String = "";
			var c:String = "";
			
			if( allowSame ) {
				while( i-- ) {
					r += V[ ~~( R() * max + min ) ];
				}
			} else {
				if( length > maxLength ) { length = maxLength; }
				i = length;
				while( i-- ) {
					do {
						c = V[ ~~( R() * max + min ) ];
					} while( r.indexOf( c ) > -1 )				
					r += c;
				}
			}
			
			trace( r );
			trace( "length:" , r.length );
						
			return r;
		}
		
		public static function removeAccents( string:String ):String {
			return null;
		}
		
		public static function format( string:String ):String {
			return null;
		}
		
		public static function contains( subject:String , value:String ):Boolean {
			return ( subject.indexOf( value ) > -1 ) ? true : false ;
		}
		
		public static function reverse( string:String ):String {
			return string.split("").reverse().join("");
		}
		
		public function xString() {
			
		}
	}
}