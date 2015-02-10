import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.display.Image;
import starling.core.Starling;
import starling.animation.Transitions;
import starling.display.Stage;
import starling.events.EnterFrameEvent;


class Root extends Sprite {

    public static var assets:AssetManager;
    public var rootSprite:Sprite;
	
    public function new() {
        rootSprite = this;
        super();
    }
	


    public function start(startup:Startup) {

        assets = new AssetManager();
		
        assets.enqueue("assets/walls.png");
        assets.enqueue("assets/discoclub.png");
        assets.enqueue("assets/PC3a.png");
		assets.enqueue("assets/PC3b.png");
		assets.enqueue("assets/PC3c.png");
		assets.enqueue("assets/PC3d.png");
		assets.enqueue("assets/PC3e.png");
		assets.enqueue("assets/menu.png");
		
        assets.loadQueue(function onProgress(ratio:Float) {
            haxe.Log.clear();
            trace(ratio);
            if (ratio == 1) {
                haxe.Log.clear();
				startup.removeChild(startup.loadingBitmap);
                var menu = new Main(rootSprite);
                menu.start();                

            }

        });
		
    }
}
