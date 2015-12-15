ArrayList<UFOreport1> reports = new ArrayList<UFOreport1>();
float maxAmount;
float minAmount;
float border;
ArrayList<Times> TimeinSec = new ArrayList<Times>();
ArrayList<Times> TimeinMin = new ArrayList<Times>();
ArrayList<Shape> Shapes = new ArrayList<Shape>();
color Green = color(50 ,255, 10);
color[] colors;
boolean BarGraphCheck = false;
void setup()
{
  minim = new Minim(this);
  
  background(0);
  size(700, 700);
  
  radius = width / 2;
  
  loadData();
  Processing_Time();
  CountingShapes();
  organiseTime();
  colors = new color[reports.size()];
  assignColors();
  Menu();
  
 
}

void loadData()
{
  String[] lines = loadStrings("UFOs1.csv");
  
  for(String line:lines)
  {
    UFOreport1 report = new UFOreport1(line);
    reports.add(report);
  }  
}
void Processing_Time()
{
  
  
  for(int i=0; i<reports.size(); i++)
  {
    Times time = new Times();
    String[] durationElements = reports.get(i).duration.split(" ");
    if(durationElements[1].equals("seconds") || durationElements[1].equals("second"))
    {
      time.duration = Float.parseFloat(durationElements[0]);
      time.date = reports.get(i).date;
      
      TimeinSec.add(time);
    }
    
    if(durationElements[1].equals("minutes") || durationElements[1].equals("minute"))
    {
      time.duration = Float.parseFloat(durationElements[0]);
      time.date = reports.get(i).date;
      TimeinMin.add(time);
    }
    
    if(durationElements[1].equals("hour") || durationElements[1].equals("hours"))
    {
      time.duration = Float.parseFloat(durationElements[0]);
      time.duration = time.duration * 60.0f;
      time.date = reports.get(i).date;
      TimeinMin.add(time);
    }
  }
}


void CountingShapes()
{
  
  Shape FirstShape = new Shape();
  FirstShape.Description = reports.get(0).description;
  FirstShape.Count = 0;
  Shapes.add(FirstShape);
  
  for(int i = 1; i < reports.size(); i++)
  {
    int j=0;
    boolean ShapesMatch = false;
    while(j<Shapes.size())
    {
      if(reports.get(i).description.equals(Shapes.get(j).Description))
      {
        ShapesMatch = true;
        Shapes.get(j).Count++;
      }
      j++;
    }
    if(ShapesMatch == false)
    {
      Shape NewShape = new Shape();
      NewShape.Description = reports.get(i).description;
      NewShape.Count = 0;
      Shapes.add(NewShape);
    }
  }
}
void assignColors ()
{
 
  for(int i =0; i<reports.size(); i++)
  {
    colors[i] =color(random(0, 200), random(100, 255), random(0, 200));
    
  }
}
