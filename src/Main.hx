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
	public var player:Player;
	var texture1:Items;
	var glue:Items;
	var melon:Items;
	var phone:Items;
	public static var tf:TextField;
	public static var emptyT:Bool = true;
	

	public function new(rootSprite:Sprite) {
		this.rootSprite = rootSprite;
		super();
	}
	
	public function start(){
		map = new Image(Root.assets.getTexture("discoclub2"));
		rootSprite.addChild(map);
		player = new Player();
		rootSprite.addChild(player);
		texture1 = new Items("pwrbutt1", 200, 235.5, "It's a shiny red button with the word power on it.
You are not sure if you should press it. But you are sure that it is only a matter or time before you do.");
		rootSprite.addChild(texture1);
		glue = new Items("canOfGlue", 300, 240.5, "It's a can of glue.
Many good horses died to bring you this adhesive... probably.");
		rootSprite.addChild(glue);
		melon = new Items("melon", 270, 640.5, "It's a round watermelon.
You would have a slice but you don't like watermelons. You are much more a Cantelope, kind of guy.");
		rootSprite.addChild(melon);
		phone = new Items("phone", 170, 50.5, "It's a phone.
Ring, ring, ring, ring, ring, ring, ring, bannan phone.");
		rootSprite.addChild(phone);
		Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		Starling.current.stage.addEventListener("print",addstuff);
		Starling.current.stage.addEventListener("wipe",eraseBoard);
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
			var tff:TextField = new TextField(500,100, i, "Arial", 14, 0x0);
			tff.hAlign = HAlign.LEFT;  // horizontal alignment
			tff.vAlign = VAlign.TOP; // vertical alignment
			tff.border = true;
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

}