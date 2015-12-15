 float barWidth;
void BarGraph()
{
  BarGraphCheck = true;
}
void drawBarGraph(ArrayList<Shape> shapes)
{
  float border;
  border = width * 0.05f;
  barWidth=(width- (2*border))/ (float) shapes.size();
  
  //Draw Axis
  background(0);
  stroke(Green);
  line(border, height- border, width -border, height - border);
  line(border, height- border, border, border);
  //Calculates highest count
  float maxAmount = 0;
  for(int i =0; i<shapes.size(); i++)
  {
    if(maxAmount < shapes.get(i).Count)
    {
      maxAmount = shapes.get(i).Count;
    }
  }
  
  stroke(0,255, 0);
  rectMode(CORNERS);
  //Draw bars
  for(int i=0; i<shapes.size(); i++)
  {
    fill(colors[i]);
    
    
    float x1 = (barWidth * i) + border;
    float x2 = (barWidth * (i+1)) + border;
    float y1 = height - border;
    float y2 =map(shapes.get(i).Count, 0, maxAmount, height-border, border);
    rect(x1, y1, x2, y2);
    
    //Displays details if bar hovered over by mouse
    if(mouseX >x1 && mouseX <x2)
    {
        
        stroke(255, 0 , 0);
        line(x2, y2, border, y2);
        fill(Green);
        stroke(Green);
        textAlign(LEFT);
        text("Description: " +shapes.get(i).Description, width/2 +70, height/2 - 40);
        text("Count: " +shapes.get(i).Count, width/2 +70, height/2 -20);
        
    
    }
    
  }
  fill(Green);
  stroke(Green);
  text("Hover mouse over bar for description and number of similarly shaped UFOs seen", border, border - 5);
}



