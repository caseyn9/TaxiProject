//Judy & Nicky//
class DataExtraction
{
  long[]counts;
  String[] variables;
  BufferedReader reader;
  int dateDay;
  int dateMonth;
  
  DataExtraction()
  {
    dateDay = 12;
    dateMonth = 1;
  }
  //reads data line by line and returns the average time per passenger
  void getData()
  {
    initDataArrays();
    //BufferedReader reader;
    averageTime = new long[4]; 
    counts = new long[4];
    long count = 0;
    boolean smallFile = true;  //Set to true if testing with trip_data_small. Tests with a file 100,000 rows long.
    for (int i=0; i<2; i++)
    {
      count = 0;
      String line="0";
      if (smallFile == false)
      {
        if (i==0)
        {
          println("test1");
          reader = createReader("trip_data_1.csv");
        } else
        {
          reader = createReader("trip_data_2.csv");
        }
      } 
      else if (smallFile && i == 0)
      {
        println("test2");
        println(smallFile + " " + i);
        reader = createReader("trip_data_small.csv");
      }
      println("Begin!"); 

      while (line != null) {
        try {
          line = reader.readLine();
          if (line != null && count != 0)
          {
            variables = line.split(",");
            addTotalsOfTime();
            addTotalDistance();
            volPerHour();
            totalPass();
            totalPassengersPerHour();
            distancePerHour();
            totalPassengerDistance();
            totalMoneyMade();
            tripPassengerAmounts();
            averageSpeedPerHour();
           //runs out of memory. To fix this it now gets the longitudes and latitudes of every 1000 trips.
            if(smallFile == true)
              getLong_LatOnDay(dateDay, dateMonth);
            else if(count%1000 == 0)
              getLong_LatOnDay(dateDay, dateMonth);
          }
          count ++;
          if (count%100000 == 0)
          {
            //println("Loading: current file " + i);
            //tests
            //////////////////////
            //println(count);
            //println(line);
            //println(averageTime);
            // println(" ");
            //println(counts);
            //println("i: " + i);
            //println(distTravByCompanies);
            //println(hours);
            //println(distanceHour);
            //println(passPerComp);
            //println(amounts);
            //////////////////////
          }
        }
        catch (IOException e) 
        {
          e.printStackTrace();
          line = null;
        }
      }
    }
    println("finished");
    averageTime[0] = averageTime[0]/counts[0];
    averageTime[1] = averageTime[1]/counts[1];
    averageTime[2] = averageTime[2]/counts[2];
    averageTime[3] = averageTime[3]/counts[3];
  }

  void addTotalsOfTime()
  {
    int currentPassenger = Integer.parseInt(variables[7]);
    switch(currentPassenger)
    {
    case 1: 
      averageTime[0] = averageTime[0] + Integer.parseInt(variables[8]);
      counts[0] = counts[0] + 1;
      break;
    case 2: 
      averageTime[1] = averageTime[1] + Integer.parseInt(variables[8]);
      counts[1] = counts[1] + 1;
      break;
    case 3: 
      averageTime[2] = averageTime[2] + Integer.parseInt(variables[8]);
      counts[2] = counts[2] + 1;
      break;
    case 4: 
      averageTime[3] = averageTime[3] + Integer.parseInt(variables[8]);
      counts[3] = counts[3] + 1;
      break;
    default: 
      break;
    }
  }
  void addTotalDistance()
  {
    String currentCompany = variables[2];
    if (currentCompany.equals("CMT"))
    {
      distTravByCompanies[0] = distTravByCompanies[0] + Double.parseDouble(variables[9]);
    } else if (currentCompany.equals("VTS"))
    {
      distTravByCompanies[1] = distTravByCompanies[1] + Double.parseDouble(variables[9]);
    }
  }
  void volPerHour() {
    //calculats the volume of taxis per hour
    String [] pickup = split(variables[5], " ");
    String [] time = split(pickup[1], ":");
    int hour = Integer.parseInt(time[0]);

    for (int i = 0; i<amounts.length; i++) {
      if (i==hour) {
        amounts[i]++;
      }
    }
  }

  void totalPass() {
    // calculates total passengers in both companies
    String currentComp = variables[2];
    if (currentComp.equals("CMT")) {
      passPerComp[0] = passPerComp[0] + Float.parseFloat(variables[7]);
    } else if (currentComp.equals("VTS")) {
      passPerComp[1] = passPerComp[1] + Float.parseFloat(variables[7]);
    }
  }

  void totalPassengersPerHour() 
  {
    //calculates how many passengers were in taxis per hour
    String[] dateTime = split(variables[5], " ");
    String[] time = split(dateTime[1], ":");
    int hour = Integer.parseInt(time[0]);
    for (int i = 0; i<hours.length; i++)
    {
      if (i == hour)
      {
        hours[i] = hours[i] +  Float.parseFloat(variables[7]);
      }
    }
  }

  void distancePerHour() 
  {
    //calculates the distance travelled in different hours
    float distance = Float.parseFloat(variables[9]);
    String[] dateTime = split(variables[5], " ");
    String[] time = split(dateTime[1], ":");
    int hour = Integer.parseInt(time[0]);
    for (int i=0; i<distanceHour.length; i++) {
      if (i == hour)
      {
        distanceHour[i] = distanceHour[i] + distance;
      }
    }
  }
  
  void getLong_LatOnDay(int day, int month)
  {
    String time = variables[5];
    String[] date =time.split("-");
    String[] tempDayAndTime = date[2].split(" ");
    int currentDay = Integer.parseInt(tempDayAndTime[0]);
    int currentMonth = Integer.parseInt(date[1]);
    if (currentDay == day && currentMonth == month)
    {
      pickLongitudes.add(Double.parseDouble(variables[10]));
      pickLatitudes.add(Double.parseDouble(variables[11]));
      dropLongitudes.add(Double.parseDouble(variables[12]));
      dropLatitudes.add(Double.parseDouble(variables[13]));
    }
  }
  
  void averageSpeedPerHour()
  {
    float timeOfTaxi = Float.parseFloat(variables[8]);
    float distance = Float.parseFloat(variables[9]);
    
    timeOfTaxi = timeOfTaxi/3600; //To get time in hours instead of seconds
    float aveSpeed = distance/timeOfTaxi;
    
    String[] dateTime = split(variables[5], " ");
    String[] time = split(dateTime[1], ":");
    int hour = Integer.parseInt(time[0]);
    
    for (int i = 0; i<hours.length; i++)
    {
      if (i == hour)
      {
        averageSpeedPerHour[i] = averageSpeedPerHour[i] + aveSpeed;
        numberOfTaxisPerHour[i] = numberOfTaxisPerHour[i] + 1;
      }
    }
    
  }
  
  void totalPassengerDistance(){
    int passengers = Integer.parseInt(variables[7]);
    switch(passengers)
    {
      case 1: 
      distancePassengers[0] = distancePassengers[0] + Float.parseFloat(variables[9]);
      break;
      case 2: 
      distancePassengers[1] = distancePassengers[1] + Float.parseFloat(variables[9]);
      break;
      case 3: 
      distancePassengers[2] = distancePassengers[2] + Float.parseFloat(variables[9]);
      break;
      case 4: 
      distancePassengers[3] = distancePassengers[3] + Float.parseFloat(variables[9]);
      break;
      default: 
      break;
    }
    
  }
  
  void totalMoneyMade()
  {
    //adds to a total amount each company made by using rates with distance travelled.
    //source of info: http://www.nyc.gov/html/tlc/html/passenger/taxicab_rate.shtml
    float distance = Float.parseFloat(variables[9]);
    float initCharge = 2.5; 
    float milesToKilometeres = 0.621371;
    distance = distance * milesToKilometeres;
    float totalCharge = distance * 2.5;
    
    String[] dateTime = split(variables[5], " ");
    String[] time = split(dateTime[1], ":");
    int hour = Integer.parseInt(time[0]);
    if(hour > 20 || hour < 6)
    {
       totalCharge += 0.5; 
    }
    String currentComp = variables[2];
    if (currentComp.equals("CMT")) {
      moneyMade[0] = moneyMade[0] + totalCharge;
    }
    else if(currentComp.equals("VTS")){
       moneyMade[1] = moneyMade[1] + totalCharge; 
    }
  }
  
  void tripPassengerAmounts()
  {
    //calculates how long different amounts of passengers spent in taxis
    int currentPassenger = Integer.parseInt(variables[7]);
    switch(currentPassenger)
    {
    case 1: 
            tripCount[0] = tripCount[0] + 1;
            break;
    case 2: 
            tripCount[1] = tripCount[1] + 1;
            break;
    case 3: 
            tripCount[2] = tripCount[2] + 1;
            break;
    case 4: 
            tripCount[3] = tripCount[3] + 1;
            break;
    default: 
      break;
    }
  }
  
  void initDataArrays()
  {
    pickLongitudes.clear();
    dropLongitudes.clear();
    pickLatitudes.clear();
    dropLatitudes.clear();
    
     for(int i=0; i<moneyMade.length; i++)
     {
        moneyMade[i] = 0; 
     }
     for(int i=0; i<tripCount.length; i++)
     {
        tripCount[i] = 0; 
     }
     for(int i=0; i<averageTime.length; i++)
     {
        averageTime[i] = 0;
     }
     for(int i=0; i<distTravByCompanies.length; i++)
     {
        distTravByCompanies[i] = 0;
     }
     for(int i=0; i<hours.length; i++)
     {
        hours[i] = 0;
     }
     for(int i=0; i<distanceHour.length; i++)
     {
        distanceHour[i] = 0;
     }
     for(int i=0; i<amounts.length; i++)
     {
        amounts[i] = 0;
     }
     for(int i=0; i<passPerComp.length; i++)
     {
        passPerComp[i] = 0;
     }
     for(int i=0; i<averageSpeedPerHour.length; i++)
     {
        averageSpeedPerHour[i] = 0;
     }
     for(int i=0; i<numberOfTaxisPerHour.length; i++)
     {
        numberOfTaxisPerHour[i] = 0;
     }
     for(int i=0; i<distancePassengers.length; i++)
     {
        distancePassengers[i] = 0;
     }

  }
  
  
}
