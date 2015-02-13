import starling.display.Image;
import starling.textures.Texture;
import starling.utils.MathUtil;
import starling.events.KeyboardEvent;
import starling.events.EnterFrameEvent;
import flash.ui.Keyboard;
import starling.core.Starling;
import starling.display.Quad;
import flash.geom.Rectangle;
import starling.events.EventDispatcher;
import starling.events.Event;

class Player extends Image{

	var leftPress = false;
	var rightPress = false;
	var upPress = false;
	var downPress = false;
	var pc1:Texture = Root.assets.getTexture("PC3a");
	var pc2:Texture = Root.assets.getTexture("PC3b");
	var pc3:Texture = Root.assets.getTexture("PC3c");
	var pc4:Texture = Root.assets.getTexture("PC3d");
	var pc5:Texture = Root.assets.getTexture("PC3e");
	var distance:Int = 0;
	public static var xcor:Float;
	public static var ycor:Float;

	
	public function new(){
		super(pc1);
		x = 130;//Starling.current.stage.stageWidth / 3.5;
		y = Starling.current.stage.stageHeight / 3.5;
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
						Starling.current.stage.dispatchEvent(new Event("wipe"));
		}
		if (event.keyCode == Keyboard.RIGHT) {
			rightPress = true;
						Starling.current.stage.dispatchEvent(new Event("wipe"));
		}
		if (event.keyCode == Keyboard.UP){
			upPress = true;	
						Starling.current.stage.dispatchEvent(new Event("wipe"));							
		}
		if (event.keyCode == Keyboard.DOWN) {
			downPress = true;
						Starling.current.stage.dispatchEvent(new Event("wipe"));
		}

	}


	
	
	public function stopWalking(event:KeyboardEvent)
	{

		trace(KeyboardEvent.KEY_UP);
	}

	public function keyUp(event:KeyboardEvent) {
		

		if (event.keyCode == Keyboard.LEFT) {
			//trace(KeyboardEvent.KEY_UP);
			leftPress = false;
			distance = 0;

		}
		if (event.keyCode == Keyboard.RIGHT){
			rightPress = false;
			distance = 0;

		}
		if (event.keyCode == Keyboard.UP){
			upPress = false;
			distance = 0;

		}
		if (event.keyCode == Keyboard.DOWN) {
			downPress = false;
			distance = 0;

		}
		if (event.keyCode == Keyboard.A)
		{
			// this passes the players location and tells the game that he want to examin an item
			// if an item is in range it sends its description to main which prints it to the screen.trace
			// moveing will delete the desc from the screen
			xcor = x;
			ycor = y;
			if(Main.emptyT == true)Starling.current.stage.dispatchEvent(new Event("aPressed"));	

		}

	}
	
	public function enterFrame(event:EnterFrameEvent) {
		if (downPress && rightPress){
			rotation = 2.25;
			y = y + 1.5;
			x = x + 1.5;
			distance = distance + 1;
			walk();
			
		} else if (downPress && leftPress){
			rotation = .75;
			y = y + 1.5;
			x = x - 1.5;
			distance = distance + 1;
			walk();
			
		} else if (upPress && rightPress){
			rotation = .75;
			y = y - 1.5;
			x = x + 1.5;
			distance = distance + 1;
			walk();
			
		} else if (upPress && leftPress){
			rotation = 2.25;
			y = y - 1.5;
			x = x - 1.5;
			distance = distance + 1;
			walk();
			
		} else if(leftPress) {
			rotation = 1.5;
			x = x - 2;
			distance = distance + 1;
			walk();
			
		} else if (rightPress) {
			rotation = 1.5;
			x = x + 2;
			distance = distance + 1;
			walk();
			
		} else if (upPress) {
			rotation = 0;
			y = y - 2;
			distance = distance + 1;
			walk();	
			
		} else if (downPress){
			rotation = 0;
			y = y + 2;
			distance = distance + 1;
			walk();
		}
	}
	
	public function walk(){
		if (distance == 10){
			texture = pc2;
			
		} else if (distance == 20){
			texture = pc3;
			
		} else if (distance == 30){
			texture = pc4;
			
		} else if (distance == 40){
			texture = pc5;
			distance = 0;
		}
	}
	
	
}