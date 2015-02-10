import starling.display.Image;
import starling.textures.Texture;
import starling.utils.MathUtil;
import flash.geom.Rectangle;
import starling.core.Starling;

class Player extends Image{
	public function new(){
		super(Root.assets.getTexture("PC3a"));
		x = Starling.current.stage.stageWidth / 2;
		y = Starling.current.stage.stageHeight / 2;
	}
}