
void Doughnut_Chart()
{
  
  DoughnutCheck = true;
}

//Organises times into ranges to be used in doughnut chart
void organiseTime()
{
 
  float LessThan10Sec = 0;
  float LessThan30Sec =0;
  float LessThan1Min = 0;
  float LessThan5Min = 0;
  float LessThan30Min = 0;
  float MoreThan30Min = 0;
  
  for(int i = 0; i < TimeinSec.size(); i++)
  {
    if(TimeinSec.get(i).duration <= 10)
    {
      LessThan10Sec++;
    }
    if(TimeinSec.get(i).duration > 10 && TimeinSec.get(i).duration <= 30 )
    {
      LessThan30Sec++;
    }
    if(TimeinSec.get(i).duration <= 59)
    {
      LessThan1Min++;
    }
  }
  
  for(int i = 0; i < TimeinMin.size(); i++)
  {
    if(TimeinMin.get(i).duration <= 5)
    {
      LessThan5Min++;
    }
    if(TimeinMin.get(i).duration <= 30)
    {
      LessThan30Min++;
    }
    if(TimeinMin.get(i).duration > 30)
    {
     MoreThan30Min++;
    }
  }
  OrgTimes.add(LessThan10Sec);
  OrgTimes.add(LessThan30Sec);
  OrgTimes.add(LessThan1Min);
  OrgTimes.add(LessThan5Min);
  OrgTimes.add(LessThan30Min);
  OrgTimes.add(MoreThan30Min);
  
}

void drawDoughnut()
{
  
  background(0);
  
  // Calculate the sum
  float sum = 0.0f;
  for(int i = 0; i<OrgTimes.size(); i++)
  {
    sum += OrgTimes.get(i);
  }
  
  
  // Calculate the angle to the mouse
  float toMouseX = mouseX - radius;
  float toMouseY = mouseY - radius;  
  float angle = atan2(toMouseY, toMouseX);  
 
  if (angle < 0)
  {
    angle = map(angle, -PI, 0, PI, TWO_PI);
  }
  // The last angle
  float last = 0;
  // The cumulative sum of the arraylist 
  float cumulative = 0;
  for(int i = 0 ; i < OrgTimes.size() ; i ++)
  {
    cumulative += OrgTimes.get(i);
    // Calculate the current angle
    float current = map(cumulative, 0, sum, 0, TWO_PI);
    float r = radius;

    if (angle > last && angle < current)
    {
      r = radius * 1.5f;
      fill(Green);
      String s ="";
      //Displays relevant info for segement being expanded
      switch (i)
      {
         case 0:
         s = "Sightings lasting less than 10 seconds: ";
         break;
         
         case 1:
         s = "Sightings lasting less than 30 seconds: ";
         break;
         
         case 2:
         s = "Sightings lasting less than 1 minute: ";
         break;
         
         case 3:
         s = "Sightings lasting less than 5 minutes: ";
         break;
         
         case 4:
         s = "Sightings lasting less than 30 minutes: ";
         break;
         
         case 5:
         s = "Sightings lasting more than 30 minutes: ";
         break;
      }
      textAlign(LEFT);
      text(s + "" + OrgTimes.get(i), 50, 20);
      
    }
    stroke(0);
    fill(colors[i]);
    // Draw the arc
    arc(radius, radius, r ,r, last, current );
    
    fill(0);
    stroke(0);
    ellipse(radius, radius, radius *.7, radius *.7);
    arc(radius , radius , r *.7 , r *.7, last, current);
    last = current;       
  }
}

