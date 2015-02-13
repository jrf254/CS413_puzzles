import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.utils.RectangleUtil;
import flash.geom.Rectangle;
import starling.display.Image;
import starling.core.Starling;
import starling.animation.Transitions;
import starling.display.Stage;
import starling.events.EnterFrameEvent;
import starling.events.KeyboardEvent;
import flash.ui.Keyboard;
import starling.events.EventDispatcher;
import starling.events.Event;
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;


class Main extends Sprite {
	public var rootSprite:Sprite;
	var map:Image;
	var map2:Image;
	var win:Image;
	public var player:Player;
	var butt:Items;
	var glue:Items;
	var melon:Items;
	var phone:Items;
	var funco:Items;
	var mag:Items;
	var inventory:Image;
	var polka:Items;
	var mirror:Items;
	var glueMelon:Items;
	var discoBall:Items;
	var powerOn:Bool;
	var ballPlaced:Bool;
	var soundOn:Bool;
	public static var tf:TextField;
	public static var emptyT:Bool = true;
	

	public function new(rootSprite:Sprite) {
		this.rootSprite = rootSprite;
		super();
	}
	
	public function start(){
		map = new Image(Root.assets.getTexture("DiscoV6"));
		rootSprite.addChild(map);
		map2 = new Image(Root.assets.getTexture("Discomap5"));
		map2.alpha = 0;
		rootSprite.addChild(map2);
		player = new Player();
		rootSprite.addChild(player);
		inventory = new Image(Root.assets.getTexture("inventory"));
		inventory.x = 770;
		inventory.y = 600;
		rootSprite.addChild(inventory);
		Root.assets.playSound("disco_1");
		
		// Items DO NOT CHANGE PLACEMENT OF TEXT it shows up wrong if its not spaced like this.
		/*butt = new Items("pwrbutt1", 90, 230, false, "It's a shiny red button with the word power on it.
			You are not sure if you should press it. But you are sure that it is only a matter or time before you do.");
		rootSprite.addChild(butt);
		glue = new Items("canOfGlue", 300, 230.5, false, "It's a can of glue.
			Many good horses died to bring you this adhesive... probably.");
		rootSprite.addChild(glue);
		melon = new Items("melon", 270, 640.5, true, "It's a round watermelon.
			You would have a slice but you don't like watermelons. You are much more a Cantelope, kind of guy.");
		rootSprite.addChild(melon);
		phone = new Items("phone", 170, 30.5, false, "It's a phone.
			Ring, ring, ring, ring, ring, ring, ring, bannan phone.");
		rootSprite.addChild(phone);
		funco = new Items("funco", 270, 30.5, false, "It's a Funk O Matic.
			Puts the FUNK back in anything that is larger than a bread box, but smaller than a car wheel.");
		rootSprite.addChild(funco);
		mag = new Items("magazines", 670, 30.5, false, "It's a stack of Magazines.
			'Elvis LIVES!' reads one cover. Did he ever really die?.");
		// Items DO NOT CHANGE PLACEMENT OF TEXT it shows up wrong if its not spaced like this.*/
		butt = new Items("pwrbutt1", 90, 230.5, false, "It's a Shiny Red Button with the word Power on it.
You are not sure if you should press it. But you are sure that it is only a matter or time before you do.");
		rootSprite.addChild(butt);
		
		glue = new Items("canOfGlue", 200, 230.5, false, "It's a Can of Glue.
Many good horses died to bring you this adhesive... probably.");
		rootSprite.addChild(glue);
		
		melon = new Items("melon", 170, 640.5, true, "It's a Round Watermelon.
You would have a slice but you don't like watermelons. You are much more a Cantelope, kind of guy.");
		rootSprite.addChild(melon);
		
		phone = new Items("phone", 150, 100, false, "It's a Phone.
Ring, ring, ring, ring, ring, ring, ring, bannan phone.");
		rootSprite.addChild(phone);
		
		funco = new Items("funco", 50, 20.5, false, "It's a Funk O Matic.
Puts the FUNK back in anything that is larger than a bread box, but smaller than a car wheel.");
		rootSprite.addChild(funco);
		
		mag = new Items("magazines", 100, 500.5, false, "It's a stack of Magazines.
One of the covers reads 'Elvis LIVES!' Did he ever really die?.");
		rootSprite.addChild(mag);

		polka = new Items("polka", 815, 280, false, "It's a Polka Record.
They say this is the sound track of Hell itself.");
		rootSprite.addChild(polka);

		mirror = new Items("mirror", 420, 15, false, "It's a Broken Mirror.
'There is mirror shards everywhere. Lucky you don't have to worry about stepping on them. They are so reflective its easy to spot them.");
		rootSprite.addChild(mirror);

		discoBall = new Items("discoball", 803, 638, false, "The ball that creates the funky vibes that 
				drives Agent Gary straight to funky town.");

		glueMelon = new Items("melon2", 803, 638, false, "");

		powerOn = false;
		ballPlaced = false;
		soundOn = false;
		
		//Event Listeners
		Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		Starling.current.stage.addEventListener("print",addstuff);
		Starling.current.stage.addEventListener("wipe",eraseBoard);
		Starling.current.stage.addEventListener("power", power);	
		Starling.current.stage.addEventListener("glue", glueMel);
		Starling.current.stage.addEventListener("glass", addGlass);
		Starling.current.stage.addEventListener("dPressed", placeBall);
		Starling.current.stage.addEventListener("win", winCheck);
	}
	
	public function keyDown(event:KeyboardEvent) {
		
		if (event.keyCode == Keyboard.SPACE) {
			map.alpha = 0;
		} else if(event.keyCode == Keyboard.C){
			map.alpha = 1;
		}
	}
	
	// these creates the text window
	public static function textWindow(i:String)
	{
		// currently this spawns a text box in the top left of the screen.
		var tff:TextField = new TextField(500,100, i, "Arial", 16, 0x0);
		tff.hAlign = HAlign.LEFT;  // horizontal alignment
		tff.vAlign = VAlign.TOP; // vertical alignment
		tff.border = false;
		tff.x = 520;
		tff.y = 730;
		tf = tff;
		var tff:TextField = new TextField(170,198, i, "Arial", 14, 0x0);
		tff.hAlign = HAlign.LEFT;  // horizontal alignment
		tff.vAlign = VAlign.TOP; // vertical alignment
		tff.border = false;
		tff.x = 680;
		tff.y = 60;
		tf = tff;
	}

	// this prints the text
	public function addstuff()
	{
		if(emptyT == true) 
		{
			//trace(emptyT);
			rootSprite.addChild(tf);
			emptyT = false;
		}
	}
	// this removes the text
	public function eraseBoard()
	{
		if(emptyT == false)
		{
		//trace("2");
		//trace(emptyT);
		rootSprite.removeChild(tf);
		emptyT = true;
		}
	}

	public function power(){
		butt.interacted = true;
		rootSprite.removeChild(map);
		map2.alpha = 1;
		powerOn = true;
	}

	public function glueMel(){
		if(melon.inPossession == false){
			return;
		}
		else {
			glueMelon.inPossession = true;
			rootSprite.addChild(glueMelon);
			rootSprite.removeChild(glue);
			rootSprite.removeChild(melon);
		}
	}

	public function addGlass(){
		if(glueMelon.inPossession == false){
		    return;  
		}
		else {
			discoBall.inPossession = true;
			rootSprite.addChild(discoBall);
			rootSprite.removeChild(glueMelon);
		}
	}

	public function placeBall(){
		if(((((player.x - 496) > -30) && ((player.x - 496) < 30)) && (((player.y - 448) > -30) && 
			((player.y - 448) < 30))) && discoBall.inPossession == true){
			discoBall.x = 496;
			discoBall.y = 448;
			rootSprite.removeChild(glueMelon);   
			ballPlaced = true;   
		}
		else {
			return;
		}
	}

	public function winCheck() {
		if((powerOn == true) && (ballPlaced == true) && (soundOn == true)){
			win = new Image(Root.assets.getTexture("win"));
			rootSprite.addChild(win);     
		}
	}
}