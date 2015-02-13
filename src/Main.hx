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
	public var player:Player;
	var texture1:Items;
	var glue:Items;
	var melon:Items;
	var phone:Items;
	var funco:Items;
	var mag:Items;
	var inventory:Image;
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
		inventory.x = 1050;
		inventory.y = 280;
		rootSprite.addChild(inventory);
		
// Items DO NOT CHANGE PLACEMENT OF TEXT it shows up wrong if its not spaced like this.
		texture1 = new Items("pwrbutt1", 200, 235.5, false, "It's a shiny red button with the word power on it.
You are not sure if you should press it. But you are sure that it is only a matter or time before you do.");
		rootSprite.addChild(texture1);
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
		rootSprite.addChild(mag);
		
//Event Listeners
		Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		Starling.current.stage.addEventListener("print",addstuff);
		Starling.current.stage.addEventListener("wipe",eraseBoard);
		Starling.current.stage.addEventListener("power", power);
		//var bounds1:Wall = new Wall(22,13,8, 237, player);
		//rootSprite.addChild(bounds1);
		//var bounds2:Rectangle = new Rectangle(22,229,113,7);
		
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
		texture1.interacted = true;
		rootSprite.removeChild(map);
		map2.alpha = 1;
	}

}