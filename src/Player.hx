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
	var pc1:Texture = Root.assets.getTexture("PC3a");
	var pc2:Texture = Root.assets.getTexture("PC3b");
	var pc3:Texture = Root.assets.getTexture("PC3c");
	var pc4:Texture = Root.assets.getTexture("PC3d");
	var pc5:Texture = Root.assets.getTexture("PC3e");
	var swap:Int = 1;

	
	public function new(){
		super(pc1);
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
		
		if (downPress && rightPress){
			rotation = 2.25;
			y = y + 1.5;
			x = x + 1.5;
		} else if (downPress && leftPress){
			rotation = .75;
			y = y + 1.5;
			x = x - 1.5;
		} else if (upPress && rightPress){
			rotation = .75;
			y = y - 1.5;
			x = x + 1.5;
		} else if (upPress && leftPress){
			rotation = 2.25;
			y = y - 1.5;
			x = x - 1.5;
		} else if(leftPress) {
			rotation = 1.5;
			x = x - 2;
			
		} else if (rightPress) {
			rotation = 1.5;
			x = x + 2;
			
		} else if (upPress) {
			if(swap == 1){
			swap = 0;
			//haxe.Timer.delay(function(){trace();},1000);
			rotation = 0;
			y = y - 2;
		//	haxe.Timer.delay(function(){texture = pc2;},500);
		//	haxe.Timer.delay(function(){texture = pc3;},500);
		//	haxe.Timer.delay(function(){texture = pc2;},500);
		//	haxe.Timer.delay(function(){texture = pc1;},500);
		
			texture = pc2;
			haxe.Timer.delay(function()
				{
					y=y-2; 
					texture = pc2; 
					haxe.Timer.delay(function()
					{
						y=y-2; 
						texture = pc3;
						haxe.Timer.delay(function()
						{
							y=y-2; 
							texture = pc2;
							haxe.Timer.delay(function()
							{
								y=y-2; 
								texture = pc1;
								haxe.Timer.delay(function()
								{
									y=y-2; 
									texture = pc4;
									haxe.Timer.delay(function()
									{
										y=y-2; 
										texture = pc5;
										haxe.Timer.delay(function()
										{
											y=y-2; 
											texture = pc4;
											haxe.Timer.delay(function()
											{
												y=y-2; 
												texture = pc1;
								
											},10);
								
									},50);
								
									},50);
								
								},50);

							},50);
						},50);
					},50);
				},50);
			
			haxe.Timer.delay(function(){swap=1;},450);
			//trace("swap");
			//swap = 1;
			}
			
		} else if (downPress){
			rotation = 0;
			y = y + 2;
		} 
	}
}