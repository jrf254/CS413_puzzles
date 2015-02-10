import starling.display.Image;
import starling.textures.Texture;
import starling.utils.MathUtil;
import starling.events.KeyboardEvent;
import starling.events.EnterFrameEvent;
import flash.ui.Keyboard;
import starling.core.Starling;
import starling.display.Quad;

class Player extends Image{

	var leftPress = false;
	var rightPress = false;
	var upPress = false;
	var downPress = false;

	
	public function new(){
		super(Root.assets.getTexture("PC3a"));
		x = Starling.current.stage.stageWidth / 2;
		y = Starling.current.stage.stageHeight / 2;
		pivotX = this.texture.width / 2;
		pivotY = this.texture.height / 2;
		start();
	}

	public function start() {
		Starling.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		Starling.current.stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		this.addEventListener(EnterFrameEvent.ENTER_FRAME, enterFrame);
	}
	
	public function keyDown(event:KeyboardEvent) {
		
		if (event.keyCode == Keyboard.LEFT) {
			leftPress = true;
		}
		if (event.keyCode == Keyboard.RIGHT) {
			rightPress = true;
		}
		if (event.keyCode == Keyboard.UP){
			upPress = true;								
		}
		if (event.keyCode == Keyboard.DOWN) {
			downPress = true;
		}
	}
	
	public function keyUp(event:KeyboardEvent) {
		
		if (event.keyCode == Keyboard.LEFT) {
			leftPress = false;
		}
		if (event.keyCode == Keyboard.RIGHT){
			rightPress = false;
		}
		if (event.keyCode == Keyboard.UP){
			upPress = false;								
		}
		if (event.keyCode == Keyboard.DOWN) {
			downPress = false;
		}
	}
	
	public function enterFrame(event:EnterFrameEvent) {
		
		if (leftPress) {
			rotation = 1.5;
			x = x - 2;
			
		} else if (rightPress) {
			rotation = 1.5;
			x = x + 2;
			
		} else if (upPress) {
			rotation = 0;
			y = y - 2;
			
		} else if (downPress){
			rotation = 0;
			y = y + 2;
		}
	}
}