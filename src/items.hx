import starling.display.Image;
import starling.textures.Texture;
import starling.utils.MathUtil;
import starling.events.KeyboardEvent;
import starling.events.EnterFrameEvent;
import flash.ui.Keyboard;
import starling.core.Starling;
import starling.display.Quad;
import starling.utils.AssetManager;
import starling.events.EventDispatcher;
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;
import starling.events.Event;

class Items extends Image{

	public var description:String;

	public function new(texture_item:String, x_cord:Float, y_cord:Float, D:String){
		description = D;
		//trace(description);
		super(Root.assets.getTexture(texture_item));
		x = x_cord;
		y = y_cord;
		Starling.current.stage.addEventListener("aPressed",desc);
		Starling.current.stage.addEventListener("sPressed", take);
		//this.addEventListener(EnterFrameEvent.ENTER_FRAME, enterFrame);
	}

	public function take(){
		if(((((Player.xcor - x) > -30) && ((Player.xcor - x) < 30)) && (((Player.ycor - y) > -30) && ((Player.ycor - y) < 30)))){
			x = 1100;
			y = 300;
		}
	}

	public function desc()
	{
		//trace(Player.xcor-x);
		//trace(( ((Player.xcor - x) > -30) && ((Player.xcor - x) < 30) ));
		
		// This gets the players X cordinates to check if the player is nearby.
		if( 
			((((Player.xcor - x) > -30) && ((Player.xcor - x) < 30)) && (((Player.ycor - y) > -30) && ((Player.ycor - y) < 30))) 

			)
			{
				//This places the items description on  the screen.
				Main.textWindow(description);
				if(Main.emptyT == true) Starling.current.stage.dispatchEvent(new Event("print"));
			}
	}
	
	
}