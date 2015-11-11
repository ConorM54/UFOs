ArrayList<UFOreport1> reports = new ArrayList<UFOreport1>();

void setup()
{
  size(500, 500);
  loadData();
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
