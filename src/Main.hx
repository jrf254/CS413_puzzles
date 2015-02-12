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

class Main extends Sprite {
	public var rootSprite:Sprite;
	var map:Image;
	public var player:Player;
	var texture1:Items;
	
	public function new(rootSprite:Sprite) {
		this.rootSprite = rootSprite;
		super();
	}
	
	public function start(){
		map = new Image(Root.assets.getTexture("discoclub2"));
		rootSprite.addChild(map);
		player = new Player();
		rootSprite.addChild(player);
		texture1 = new Items("pwrbutt1", 584.5, 423.5);
		rootSprite.addChild(texture1);
		Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
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
}