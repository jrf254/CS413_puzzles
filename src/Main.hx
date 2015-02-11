import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.display.Image;
import starling.core.Starling;
import starling.animation.Transitions;
import starling.display.Stage;
import starling.events.EnterFrameEvent;

class Main extends Sprite {
	public var rootSprite:Sprite;
	var map:Image;
	var player:Player;
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
		texture1 = new Items("pwrbutt1", 50, 50);
		rootSprite.addChild(texture1);
	}
}