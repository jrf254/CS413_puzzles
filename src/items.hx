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
	public var takeable:Bool;
	public var interacted:Bool;
	public var item:String;
	public var inPossession:Bool;

	public function new(texture_item:String, x_cord:Float, y_cord:Float, T:Bool, D:String){
		description = D;
		takeable = T;
		interacted = false;
		inPossession = false;
		item = texture_item;
		//trace(description);
		super(Root.assets.getTexture(texture_item));
		x = x_cord;
		y = y_cord;
		Starling.current.stage.addEventListener("aPressed",desc);
		Starling.current.stage.addEventListener("sPressed", take);
		Starling.current.stage.addEventListener("dPressed", interact);
		//this.addEventListener(EnterFrameEvent.ENTER_FRAME, enterFrame);
	}

	public function interact(){
		// alredy interacted
		if(interacted == true){
			return;
		}
		else {
			if(((((Player.xcor - x) > -30) && ((Player.xcor - x) < 30)) && (((Player.ycor - y) > -30) && ((Player.ycor - y) < 30)))){
				if(item == "pwrbutt1"){
					texture = Root.assets.getTexture("pwrbutt2");
					if(Main.emptyT == true) Starling.current.stage.dispatchEvent(new Event("power"));
				}
				if(item == "canOfGlue"){
					if(Main.emptyT == true) Starling.current.stage.dispatchEvent(new Event("glue"));
				}
				if(item == "mirror"){
				    if(Main.emptyT == true) Starling.current.stage.dispatchEvent(new Event("glass"));
				}
			}
		}
	}

	public function take(){
		if(takeable == true)
		{

			if(((((Player.xcor - x) > -30) && ((Player.xcor - x) < 30)) && (((Player.ycor - y) > -30) && ((Player.ycor - y) < 30)))){
				if(item == "melon"){
					inPossession = true;	
					x = 803;
					y = 638;
				}
			}
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