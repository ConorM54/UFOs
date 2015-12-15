class UFOreport1{
  String date;
  String time;
  String city;
  String description;
  String duration;
 
  
  UFOreport1(String line)
  {
    //Seperate string into individual elements
    String[] elements = line.split(",");
   
    String[] parts =  elements[0].split(" ");
    date = parts[0];
    time = parts[1];
    city = elements[1];
    description = elements[2];
    duration = elements[3];
  }
  
}
