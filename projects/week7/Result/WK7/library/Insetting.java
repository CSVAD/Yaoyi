package WK7.library;

import processing.core.*;

/**
 * This is a template class and can be used to start a new processing Library.
 * Make sure you rename this class as well as the name of the example package 'template' 
 * to your own Library naming convention.
 * 
 * (the tag example followed by the name of an example included in folder 'examples' will
 * automatically include the example in the javadoc.)
 *
 * @example Hello 
 */

public class Insetting{
	
	// myParent is a reference to the parent sketch
	PApplet myParent;

	/**
	 * The image to be read in
	 */
	private PImage image;
	
	private float scale;
	
	private int width, height;
	
	private int baseX, baseY;
	
	static private int basicRes = 300;
	
	public final static String VERSION = "##library.ver01##";
	

	/**
	 * a Constructor, usually called in the setup() method in your sketch to
	 * initialize and start the Library.
	 * 
	 * @example Hello
	 * @param theParent the parent PApplet
	 */
	public Insetting(PApplet theParent) {
		myParent = theParent;
		welcome();
	}
	
	
	private void welcome() {
		System.out.println("##library.name## ##library.prettyVersion## by ##author##");
	}
	
	
	public String sayHello() {
		return "hello library.";
	}
	/**
	 * return the version of the Library.
	 * 
	 * @return String
	 */
	public static String version() {
		return VERSION;
	}

	/**
	 * 
	 * @param w: screen width
	 * @param h: screen height
	 */
	public void SettingUpScreenSize(int w, int h)
	{
		width = w;
		height = h;
		return;
	}
	
    /**
     * 
     * @param x: pos coord for x axis
     * @param y: pos coord for y axis
     */
	public void SettingUpBasePos(int x, int y)
	{
		baseX = x;
		baseY = y;
		return;
	}
	
	/**
	 * Setting up the scale
	 * @param sc
	 */
	public void SetUpScale(float sc)
	{
		scale = sc;
		return;
	}
	
	/**
	 * 
	 * @param path
	 * @return
	 */
	
	public boolean LoadImage(String path)
	{
		if(path != null)
		{
			image = loadImage(path);
			return true;		
		}
		else
		{
			System.out.println("Image cannot be found!");
			return false;
		}
	}
	
	/**
	 * Change image mode of Processing for better display patterns 
	 * @param mode: can be either CORNER, CORNERS, or CENTER
	 */
	public void ChangeImageMode(int mode)
	{
		imageMode(mode);
	}

	/**
	 * The function that performs insetting on a panel
	 * @param w: the width of insetting area
	 * @param h: the height of insetting area
	 * @param img: the image to display
	 * @param baseX: the base x axis point to display image 
	 * @param baseY: the base y axis point to display image
	 * @param scale： the scale of image
	 */
	public void RectPaint()
	{ 
		  int rowCount = floor(width / (basicRes * scale)); 
		  int subCount = floor(1 / scale);
		  
		  baseX = floor(baseX/scale);
		  baseY = floor(baseY/scale); 
		  
		  for(int i = 0 ; i < rowCount ; i++)
		  {
		    for(int k = 0 ; k < subCount; k ++)
		    {
		       pushMatrix();
		       scale(scale);
		       translate(i * basicRes + baseX, baseY + basicRes * k);
		       image(img,0, 0);
		       popMatrix();
		    
		       pushMatrix();
		       scale(scale);
		       translate(i * basicRes + baseX, h / scale - basicRes + baseY - basicRes * k);
		       image(img, 0, 0);
		       popMatrix();
		    }
		  }
		  
		  int colCount = floor(height / (basicRes * scale)) - 2 - (subCount - 1);
		  
		  for(int j = 1 ; j <= colCount ; j++)
		  {
		    for(int k = 0 ; k < subCount; k ++)
		    {
		       pushMatrix();
		       scale(scale);
		       translate(baseX + basicRes * k, j * basicRes  + baseY);
		       image(img, 0,0);
		       popMatrix();
		    
		       pushMatrix();
		       scale(scale);
		       translate(width / scale - basicRes + baseX  - basicRes * k, j * basicRes + baseY );
		       image(img, 0, 0);
		       popMatrix();
		    }
		  }
	}
}
