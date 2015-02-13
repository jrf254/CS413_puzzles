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
	public var backButton:Image;
	public var credits:Image;

	public function new(rootSprite:Sprite) {
		this.rootSprite = rootSprite;
		super();
	}

	public function mainMenu(){
		menu = new Image(Root.assets.getTexture("menu3"));	
		menu.width = flash.Lib.current.stage.stageWidth;
        menu.height = flash.Lib.current.stage.stageHeight;
		rootSprite.addChild(menu);

		playButton = new Image(Root.assets.getTexture("pgbutton1"));
		playButton.x = 200;
        playButton.y = 400;
		rootSprite.addChild(playButton);

		iButton = new Image(Root.assets.getTexture("ibutton1"));
		iButton.x = 200;
		iButton.y = 480;
		rootSprite.addChild(iButton);

		cButton = new Image(Root.assets.getTexture("cbutton1"));
		cButton.x = 200;
		cButton.y = 560;
		rootSprite.addChild(cButton);

		backButton = new Image(Root.assets.getTexture("bbutton1"));
		backButton.x = 200;
		backButton.y = 560;

		credits = new Image(Root.assets.getTexture("credits1"));
		credits.x = 340;
		credits.y = 300;



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

        iButton.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent){
            var touch = e.getTouch(iButton, TouchPhase.BEGAN);
                if (touch != null){
                	rootSprite.removeChild(cButton);
                	rootSprite.removeChild(playButton);
                	rootSprite.addChild(backButton);
        			iButton.x = 380;
        			iButton.y = 100;
        }}); 

        cButton.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent){
            var touch = e.getTouch(cButton, TouchPhase.BEGAN);
                if (touch != null){
                	rootSprite.removeChild(iButton);
                	rootSprite.removeChild(playButton);
                	rootSprite.addChild(backButton);
                	rootSprite.addChild(credits);
        			cButton.x = 380;
        			cButton.y = 100;
        }});  

        backButton.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent){
            var touch = e.getTouch(backButton, TouchPhase.BEGAN);
               	if (touch != null){
               	rootSprite.removeChild(backButton);
               	rootSprite.removeChild(iButton);
                rootSprite.removeChild(playButton);
				rootSprite.removeChild(cButton);
				playButton.x = 200;
        		playButton.y = 400;
				rootSprite.addChild(playButton);
				iButton.x = 200;
				iButton.y = 480;
				rootSprite.addChild(iButton);
				cButton.x = 200;
				cButton.y = 560;
				rootSprite.addChild(cButton);
        }});           	

	}

}

