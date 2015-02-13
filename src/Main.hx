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
	public static var tf:TextField;
	

	public function new(rootSprite:Sprite) {
		this.rootSprite = rootSprite;
		super();
	}
	
	public function start(){
		map = new Image(Root.assets.getTexture("discoclub2"));
		rootSprite.addChild(map);
		player = new Player();
		rootSprite.addChild(player);
		texture1 = new Items("pwrbutt1", 584.5, 423.5, "This is a Button.");
		rootSprite.addChild(texture1);
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


	public function addstuff()
	{
		rootSprite.addChild(tf);
	}

	public function eraseBoard()
	{
		rootSprite.removeChild(tf);
	}

}