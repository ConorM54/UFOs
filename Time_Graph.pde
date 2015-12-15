void Time_Graph(ArrayList<Times> times)
{
  
  
  float sum = 0;
  border = width * 0.05f;
  maxAmount = times.get(0).duration;
  minAmount = times.get(0).duration;
  //Finds the maximum duration amount and calculates total time
  for(int i =0; i<times.size(); i++)
  {
    if(maxAmount < times.get(i).duration)
    {
      maxAmount = times.get(i).duration;
    } 
    sum += times.get(i).duration;
  }
  //Calculate average time
  float average = sum / (float)times.size();
  
  //Finds the minimum time
  for(int i =0; i<times.size(); i++)
  {
    if(minAmount > times.get(i).duration)
    {
      minAmount = times.get(i).duration;
    }
  }

  //Draw Axis
  background(0);
  stroke(Green);
  line(border, height- border, width -border, height - border);
  line(border, height- border, border, border);
  
  line(border, height - border, border, height - border +10);
  textAlign(LEFT);
  text(times.get(0).date, border, height - 10);
  line(width - border, height - border, width - border, height - border +10);
  textAlign(RIGHT);
  text(times.get(times.size()-1).date, width -border, height - 10);
  
  float numberOfDates = CountingDates(times);
  //Draw Graph
  stroke(0, 200, 255);
  int i =0;
  int j = 0;
  float pointSize = 5;
  while( i<numberOfDates)
  {
    float x1 = map(i, 0, numberOfDates, border + pointSize, width - border -pointSize);
    float y1 = map(times.get(j).duration, 0, maxAmount, height-border  -pointSize, border +pointSize);
    if(times.get(j).date.equals(times.get(i).date))
    {
    }
    else
    {
      i++;
    }
    j++;
    fill(255);
    
    ellipse(x1, y1, 5, 5);
  }
  //Draws line on average time
  stroke(255, 0, 0);
  float averageY = map(average, minAmount, maxAmount, height - border, border);
  textAlign(RIGHT);
  text("Average UFO sighting: " +round(average), width - border, 100);
  line(border, averageY, width-border, averageY);
  
  // Draw the vertical axis
  stroke(Green);
  line(border, border , border, height - border);
  float verticalIntervals = 10;
  for (int k = 0 ; k <= verticalIntervals ; k ++)
  {
    float y = map(k, 0, verticalIntervals, height - border,  border);
    line(border - 5, y, border, y);
    float hAxisLabel = map(k, 0, verticalIntervals, 0, maxAmount);
        
    textAlign(RIGHT, CENTER);  
    text((int)hAxisLabel, border - (10), y);
  }    
}

float CountingDates(ArrayList<Times> times)
{
  float uniqueDateCount = 1;
  ArrayList<Times> uniqueDates = new ArrayList<Times>();
  uniqueDates.add(times.get(0));
  for(int i = 1; i < times.size(); i++)
  {
    int j=0;
    boolean DatesMatch = false;
    while(j<uniqueDates.size())
    {
      if(times.get(i).date.equals(uniqueDates.get(j).date))
      {
        DatesMatch = true;
      }
      j++;
    }
    if(DatesMatch == false)
    {
      uniqueDates.add(times.get(i));
      uniqueDateCount++;
    }
  }
  return uniqueDateCount;
}

