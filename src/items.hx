import starling.display.Image;
import starling.textures.Texture;
import starling.utils.MathUtil;
import starling.events.KeyboardEvent;
import starling.events.EnterFrameEvent;
import flash.ui.Keyboard;
import starling.core.Starling;
import starling.display.Quad;
import starling.utils.AssetManager;

class Items extends Image{

	public function new(texture_item:String, x_cord:Int, y_cord:Int){
		super(Root.assets.getTexture(texture_item));
		x = x_cord;
		y = y_cord;
	}
}