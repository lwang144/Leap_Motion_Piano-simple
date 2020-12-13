import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import de.voidplus.leapmotion.*;


LeapMotion leap;
Minim minim;   //apply for the object

AudioPlayer player0;
AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;
AudioPlayer player6;

PVector hand_position=null, Thumb=null, Index=null, Middle=null, Ring=null, Pink=null;  
  
void setup()
{
  size(800,500);
  smooth();
  background(255);
  
  minim = new Minim(this);  //initialize the object
  player0 = minim.loadFile("1 do.mp3");
  player1 = minim.loadFile("2 re.mp3");
  player2 = minim.loadFile("3 mi.mp3");
  player3 = minim.loadFile("4 fa.mp3");
  player4 = minim.loadFile("5 sol.mp3");
  player5 = minim.loadFile("6 la.mp3");
  player6 = minim.loadFile("7 si.mp3");
  
  leap = new LeapMotion(this);
}

void draw()
{
  background(255);
  for(Hand hand:leap.getHands())
  {
    //hand.draw();
    if(hand.isRight())
    {
    hand_position = hand.getPosition();  
    Thumb = hand.getThumb().getPosition();
    Index  = hand.getIndexFinger().getPosition();
    Middle = hand.getMiddleFinger().getPosition();
    Ring  = hand.getRingFinger().getPosition();
    Pink  = hand.getPinkyFinger().getPosition();
    
    PVector Index_direction = hand.getIndexFinger().getDirection();
    PVector Thumb_direction = hand.getThumb().getDirection();
    PVector Middle_direction = hand.getMiddleFinger().getDirection();
    PVector Ring_direction = hand.getRingFinger().getDirection();
    PVector Pink_direction = hand.getPinkyFinger().getDirection();
    
    //println(Thumb.y+" "+Index.y+" "+Middle.y+" "+Ring.y+" "+Pink.y);
    //println(Middle_direction);
     if(Thumb_direction.y > 0.15)
      player0.rewind();   player0.play();  delay(90);
     if(Index_direction.y > 0.75)
      player1.rewind();   player1.play();  delay(90);
     if(Middle_direction.y > 0.75)
      player2.rewind();   player2.play();  delay(90);
     if(Ring_direction.y > 0.75)
      player3.rewind();   player3.play();  delay(90);  
     if(Pink_direction.y > 0.75)
      player4.rewind();   player4.play();  delay(90);
     /*if(Index.x>400&&Index.x<500&&Index.y>300)
      player5.rewind();   player5.play();  
     if(Index.x>500&&Index.x<600&&Index.y>300)
      player6.rewind();   player6.play();  
*/
    }
  }
}