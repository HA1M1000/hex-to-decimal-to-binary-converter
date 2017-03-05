import javax.swing.JOptionPane; // for user-input 
import ddf.minim.*; // for sounds
import controlP5.*; // for the button
ControlP5 gui;

Minim minim;
AudioSample d1;

AudioOutput out;
boolean button_struck;

int Type = 0;
int num1 = 0;
int num2 = 0;
int num3 = 0;
String num_word = new String();
String num_word2 = new String();

Button bt1;

void setup()
{
  background(66, 244, 238);
  size(800,600);
  noStroke();
  gui = new ControlP5(this);
  gui.addButton("DEC")
    .setPosition(10,50)
    .setSize(250,65)
    .setValue(0)
    .setColorActive(#00FF00)
    .activateBy(ControlP5.RELEASE);
    
  gui.addButton("BIN")
    .setPosition(275,50)
    .setSize(250,65)
    .setValue(0)
    .setColorActive(#00FF00)
    .activateBy(ControlP5.RELEASE);
   
  gui.addButton("HEX")
    .setPosition(540,50)
    .setSize(250,65)
    .setValue(0)
    .setColorActive(#00FF00)
    .activateBy(ControlP5.RELEASE);
    
    PFont pfont = createFont("Arial",20,true);
    ControlFont font = new ControlFont(pfont,241);
    
   gui.getController("DEC")
      .getCaptionLabel()
      .setFont(font)
      .toUpperCase(true)
      .setSize(24)
      ;
   gui.getController("BIN")
      .getCaptionLabel()
      .setFont(font)
      .toUpperCase(true)
      .setSize(24)
      ;
   gui.getController("HEX")
      .getCaptionLabel()
      .setFont(font)
      .toUpperCase(true)
      .setSize(24)
      ;
    
  minim = new Minim(this);
  out = minim.getLineOut();

  d1 = minim.loadSample("SD.wav");
  button_struck = false;
  textSize(60);
}

void DEC(int value) // when DEC Button is clicked, sound trigged, asks for no. and 2 buttons are clicked
{
  clear();
  background(66, 244, 238);
  try{                          // using an try/catch to perventing the user from crashing the program by putting letters 
  button_struck = true; 
  d1.trigger();
  String num = JOptionPane.showInputDialog(null,"Write in a decimal number", "Text input",
  JOptionPane.QUESTION_MESSAGE);
  num1 = Integer.parseInt(num);
  num_word = num;
  num2 = num1;
  Type = 1; // sets Tyoe to 1 (DEC)
  
  gui.addButton("DEC = HEX")
    .setPosition(10,500)
    .setSize(380,65)
    .setValue(0)
    .setColorActive(#00FF00)
    .activateBy(ControlP5.RELEASE);
  
  gui.addButton("DEC = BIN")
    .setPosition(410,500)
    .setSize(380,65)
    .setValue(0)
    .setColorActive(#00FF00)
    .activateBy(ControlP5.RELEASE);
    
    PFont pfont = createFont("Arial",20,true);
    ControlFont font = new ControlFont(pfont,241);
    
    gui.getController("DEC = HEX")
      .getCaptionLabel()
      .setFont(font)
      .toUpperCase(true)
      .setSize(24)
      ;
    gui.getController("DEC = BIN")
      .getCaptionLabel()
      .setFont(font)
      .toUpperCase(true)
      .setSize(24)
      ;
  }
  catch(NumberFormatException e)
  {
    textAlign(CENTER);
    text("Not a valid DEC" ,width/2,height/2);
  }
}
public void BIN(int value) // when BIN Button is clicked, sound trigged, asks for no. and 2 buttons are clicked
{
  clear();
  background(66, 244, 238);
  try{
  button_struck = true; 
  d1.trigger();
  String num = JOptionPane.showInputDialog(null,"Write in a binary number", "Text input",
  JOptionPane.QUESTION_MESSAGE);
  for(int i=0; i<=num.length()-1; i++) // The loop goes through the string and cheak if there is a 1 or a 0, if theres not then will print to sreen "Not a valid BIN"
  {
    if(num.charAt(i) == '1' || num.charAt(i) == '0')
    {
      num1 = Integer.parseInt(num);
    }
    else
    {
      textAlign(CENTER);
      text("Not a valid BIN",width/2,height/2);
    }
  }
  
  num_word = num;
  num2 = num1;
  Type = 2; // sets Tyoe to 2 (BIN)
  
  gui.addButton("BIN = HEX")
    .setPosition(10,500)
    .setSize(380,65)
    .setValue(0)
    .setColorActive(#00FF00)
    .activateBy(ControlP5.RELEASE);
  
  gui.addButton("BIN = DEC")
    .setPosition(410,500)
    .setSize(380,65)
    .setValue(0)
    .setColorActive(#00FF00)
    .activateBy(ControlP5.RELEASE);
    
    PFont pfont = createFont("Arial",20,true);
    ControlFont font = new ControlFont(pfont,241);
    
    gui.getController("BIN = HEX")
      .getCaptionLabel()
      .setFont(font)
      .toUpperCase(true)
      .setSize(24)
      ;
    gui.getController("BIN = DEC")
      .getCaptionLabel()
      .setFont(font)
      .toUpperCase(true)
      .setSize(24)
      ;
      }
  catch(NumberFormatException e)
  {
    textAlign(CENTER);
    text("Not a valid BIN" ,width/2,height/2);
  }

}
public void HEX(int value) // when HEX Button is clicked, sound trigged, asks for no. and 2 buttons are clicked 
{
  clear();
  background(66, 244, 238);
  button_struck = true; 
  d1.trigger();
  String num = JOptionPane.showInputDialog(null,"Write in a hexadecimal number", "Text input",
  JOptionPane.QUESTION_MESSAGE);
  for(int i=0; i<=num.length()-1; i++)
  {
    if(num.charAt(i) == '.')
    {
      textAlign(CENTER);
      text("Not a valid HEX",width/2,height/2);
    } 
    else
    {
      num_word = num;
      Type = 3; // sets Type to 3 (HEX)
  
      gui.addButton("HEX = DEC")
        .setPosition(10,500)
        .setSize(380,65)
        .setValue(0)
        .setColorActive(#00FF00)
        .activateBy(ControlP5.RELEASE);
      
      gui.addButton("HEX = BIN")
        .setPosition(410,500)
        .setSize(380,65)
        .setValue(0)
        .setColorActive(#00FF00)
        .activateBy(ControlP5.RELEASE);
        
        PFont pfont = createFont("Arial",20,true);  // makes a font
        ControlFont font = new ControlFont(pfont,241);
        
        gui.getController("HEX = DEC") 
          .getCaptionLabel()
          .setFont(font)
          .toUpperCase(true)
          .setSize(24)
          ;
        gui.getController("HEX = BIN")
          .getCaptionLabel()
          .setFont(font)
          .toUpperCase(true)
          .setSize(24)
           ;
    }
  }

}
void draw()
{
}
void mousePressed() 
{
  if(Type == 1) // Type 1 = DEC
  {
    try{
    if(mouseY>500 && mouseX<390)
     {
       button_struck = true; 
       d1.trigger();
       clear();
       background(66, 244, 238);
       num_word = Integer.toHexString(num2);
       textAlign(CENTER);
       text(num_word,width/2,height/2);
     }
    if(mouseX>420 && mouseY>500)
    {  
      button_struck = true; 
       d1.trigger();
       clear();
       background(66, 244, 238);
       num_word = Integer.toBinaryString(num2);
       textAlign(CENTER);
       text(num_word,width/2,height/2);
    }
    }
    catch(NumberFormatException e)
  {
    textAlign(CENTER);
    text("Not a valid DEC" ,width/2,height/2);
  }
    }
  if(Type == 2) // Type 2 = BIN
  {
    try{
    if(mouseY>500 && mouseX<390)
     {
       button_struck = true; 
       d1.trigger();
       clear();
       background(66, 244, 238);
       num3 = Integer.parseInt(num_word, 2);
       num_word2 = Integer.toHexString(num3);
       textAlign(CENTER);
       text(num_word2,width/2,height/2);
     }
    if(mouseX>420 && mouseY>500)
    {
       button_struck = true; 
       d1.trigger();
       clear();
       background(66, 244, 238);
       num2 =Integer.parseInt(num_word, 2);
       textAlign(CENTER);
       text(num2,width/2,height/2);
    }
  }
  catch(NumberFormatException e)
  {
    textAlign(CENTER);
    text("Not a valid BIN" ,width/2,height/2);
  }
  }
  
  if(Type == 3) // Type 3 = HEX
  {
    try{
    if(mouseY>500 && mouseX<390)
     {
       button_struck = true; 
       d1.trigger();
       clear();
       background(66, 244, 238);
       num2 = Integer.parseInt(num_word, 16);
       textAlign(CENTER);
       text(num2,width/2,height/2);
     }
    if(mouseX>420 && mouseY>500)
    {
       button_struck = true; 
       d1.trigger();
       clear();
       background(66, 244, 238);
       num3 = Integer.parseInt(num_word, 16);
       num_word2 = Integer.toBinaryString(num3);
       textAlign(CENTER);
       text(num_word2,width/2.5,height/2);
    }
    }
    catch(NumberFormatException e)
  {
    textAlign(CENTER);
    text("Not a valid HEX" ,width/2,height/2);
  }
  }
  
}