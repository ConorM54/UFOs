import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

import ddf.minim.*;
Minim minim;
void Menu()
{
  PFont font; //X files font to be used in program
  AudioPlayer music;
  music = minim.loadFile("xfiles.wav"); //Music that plays when Menu is called
  float border = width * 0.05f;
    //Plays music
   music.rewind();
   music.play();
   
  //Draws menu
  background(0);
  
  //Co-ordinates for title in menu
  float HeadlineY = border +50;
  float ListPosX = border + 50;
  font = createFont("x-files.ttf", 20);
  textFont(font, 22);
  stroke(Green);
  fill(Green);
  textAlign(CENTER);
  text("Unidentified Flying Objects: California Reports", width/2, HeadlineY);
  
  textSize(14);
  text("Press the following keys to display the indicated reports:", width/2, HeadlineY +50);
  
  textAlign(LEFT);
  text("1. Scatter plot of duration of sightings (seconds only)", ListPosX, HeadlineY + 100);
  text("2. Scatter plot of duration of sightings ", ListPosX, HeadlineY + 140);
  text("3. Bar chart of various UFO descriptions given", ListPosX, HeadlineY + 180);
  text("4. Doughnut chart of ranges of sighting durations", ListPosX, HeadlineY + 220);
  text("0. Return to Menu", ListPosX, HeadlineY + 260);
}

//Calls various functions depending on key released
void keyReleased()
  {
    if(key == '1')
    {
      BarGraphCheck = false;
      DoughnutCheck = false;
      Time_Graph(TimeinSec);
    }
    if(key == '2')
    {
      BarGraphCheck = false;
      DoughnutCheck = false;
      Time_Graph(TimeinMin);
    }
    if(key == '3')
    {
       DoughnutCheck = false;
       BarGraph();
    }
    if( key == '4')
    {
     BarGraphCheck = false;
     Doughnut_Chart();
    }
    
    if(key == '0')
    {
      BarGraphCheck = false;
      DoughnutCheck = false;
      Menu();
    }  
    
  }
  void draw()
{
  if(DoughnutCheck ==true)
    {
      drawDoughnut();
    }
   if(BarGraphCheck == true)
   {
     drawBarGraph(Shapes);
   }
}
  
