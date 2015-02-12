import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.display.Image;
import starling.core.Starling;
import starling.animation.Transitions;
import starling.display.Stage;
import starling.events.EnterFrameEvent;
import flash.geom.Rectangle;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.events.KeyboardEvent;
import flash.ui.Keyboard;
import starling.events.Event;
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;


class Menu extends Sprite{
	public var rootSprite:Sprite;
	
	public var menu:Image;
	public var playButton:Image;
	public var iButton:Image;
	public var cButton:Image;

	public function new(rootSprite:Sprite) {
		this.rootSprite = rootSprite;
		super();
	}

	public function mainMenu(){
		menu = new Image(Root.assets.getTexture("menu"));	
		menu.width = flash.Lib.current.stage.stageWidth;
        menu.height = flash.Lib.current.stage.stageHeight;
		rootSprite.addChild(menu);

		playButton = new Image(Root.assets.getTexture("pgbutton"));
		playButton.x = 400;
        playButton.y = 500;
		rootSprite.addChild(playButton);

		iButton = new Image(Root.assets.getTexture("ibutton"));
		iButton.x = 400;
		iButton.y = 580;
		rootSprite.addChild(iButton);

		cButton = new Image(Root.assets.getTexture("cbutton"));
		cButton.x = 400;
		cButton.y = 660;
		rootSprite.addChild(cButton);


		flash.Lib.current.stage.addEventListener(flash.events.Event.RESIZE,
            function(e:flash.events.Event) {
                Starling.current.viewPort = new Rectangle(0, 0,
                flash.Lib.current.stage.stageWidth,
                flash.Lib.current.stage.stageHeight);
                if (menu != null) {
                    menu.width = flash.Lib.current.stage.stageWidth;
                    menu.height = flash.Lib.current.stage.stageHeight;
        }});

        playButton.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent){
            var touch = e.getTouch(playButton, TouchPhase.BEGAN);
                if (touch != null){
                   	var game = new Main(rootSprite);
                   	game.start();
        }});           	

	}

}

