class UFOreport1{
  String dateTime;
  String city;
  String duration;
  String description;
  
  UFOreport1(String line)
  {
    String[] elements = line.split(",");
   
    dateTime =  elements[0];
    city = elements[1];
    duration = elements[2];
    description = elements[3];
  }
  
}
