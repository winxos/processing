// Need G4P library
import g4p_controls.*;

stack_gui sg;
public void setup() {
  size(480, 520, JAVA2D);
  createGUI();
  customGUI();
  // Place your setup code here
  sg=new stack_gui();
}

public void draw() {
  background(230);
  sg.render();
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI() {
}
