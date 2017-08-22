/**
 * This is an example sketch class.
 *
 * You have to include the constructor with the super() call.
 *
 * Notice the use of graphics object to do the drawing. graphics is
 * defined in AbstractSketch which is provided by the library.
 * Be sure to use beginDraw() and endDraw() around the drawing commands.
 *
 * Similarly, notice the usage of the parent object. This also resides
 * in AbstractSketch and is the parent PApplet that's creating this Sketch.
 * Use the parent variable when you need processing functions like random()
 *
 * Use keyEvent and mouseEvent if you need the sketch to react to key and mouse events.
 * If you do not need them, you must still include them but you can leave them blank.
 *
 * The setup() method will be called once when the SketchMapper is initialized.
 * Use it like you would use the setup() in a normal processing sketch.
 *
 */
public class MovieMapper extends AbstractSketch {

    public MovieMapper(final PApplet parent, final int width, final int height) {
        super(parent, width, height);
    }
    
    Movie movie;
    @Override
    public void draw() {
        graphics.image(movie, 0, 0, graphics.width, graphics.height);
    }

    @Override
    public void keyEvent(KeyEvent event) {

    }

    @Override
    public void mouseEvent(MouseEvent event) {

    }

    public void movieEvent(Movie m) {
      m.read();
    }
    @Override
    public void setup() {
        // Load and play the video in a loop
        movie = new Movie(parent, "transit.mov");
        movie.loop();
      

    }
}