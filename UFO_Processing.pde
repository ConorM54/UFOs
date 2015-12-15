ArrayList<UFOreport1> reports = new ArrayList<UFOreport1>(); //Holds the UFO report data
float maxAmount;  
float minAmount;
float border;
ArrayList<Times> TimeinSec = new ArrayList<Times>(); //Holds the list of times less than 1 min
ArrayList<Times> TimeinMin = new ArrayList<Times>(); //Holds the list of times more than 1 min
ArrayList<Shape> Shapes = new ArrayList<Shape>(); //Hold the list of diffrent descriptions of UFO
ArrayList <Float> OrgTimes = new ArrayList <Float>();
color Green = color(50 ,255, 10); //Color to be used across sketch
color[] colors;
boolean BarGraphCheck = false; //Checks to see if Bar graph being displayed
boolean DoughnutCheck = false; //Checks to see if Doughnut graph being dispayed
float radius; //Radius for doughnut
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
//Reads in the data from csv file
void loadData()
{
  String[] lines = loadStrings("UFOs1.csv");
  
  for(String line:lines)
  {
    UFOreport1 report = new UFOreport1(line);
    reports.add(report);
  }  
}

//Sorts durations into times less than 1 min and times greater
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

//Counts number of unique decriptions given and adds them to an array list
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
//Creates a range of random colors to be used in graphs
void assignColors ()
{
 
  for(int i =0; i<reports.size(); i++)
  {
    colors[i] =color(random(0, 200), random(100, 255), random(0, 200));
    
  }
}
