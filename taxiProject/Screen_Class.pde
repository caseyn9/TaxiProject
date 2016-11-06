class Screen {
//
  ArrayList  widgetList; 

  final int widgetY = 500;
  int SCREENX = 1000;
  int SCREENY = 600;
  color screenColor;

  int moving =  0;

  Widget  widget1, widget2, widget3, widget4;

  BarrChart avgTimeChart;
  BarrChart distanceCompanyChart;
  BarrChart moneyMadeByCompanies;
  BarrChart passengerCountPopularity;
  BarrChart averageSpeedPerHourGraph;

  Screen()
  {

    //Bar charts Init -----------------------------------------------------------------------------------------------------------------------
    //Bar Charts:
    int chartXPos = 500;
    int chartYPos = 50;
    String[] people = {
      "1", "2", "3", "4"
    };
    float[] times = {
      0, 0, 0, 0
    };
    float[] tripCounts = new float[4];
    for (int i=0; i<averageTime.length; i++)
    {
      times[i] = (float) averageTime[i];
      tripCounts[i] = (float) tripCount[i];
    }
    /////////////////////////////////////////////////////////////
    float[] tempDistance = new float[2];
    for (int i=0; i<distTravByCompanies.length; i++)
    {
      tempDistance[i] = (float) distTravByCompanies[i];
    }
    avgTimeChart = new BarrChart(people, times, "People", "Average \n Time", chartXPos, chartYPos);
    distanceCompanyChart = new BarrChart(taxiCompanies, tempDistance, "companies", "distance\n(Km)", chartXPos, chartYPos);
    moneyMadeByCompanies = new BarrChart(taxiCompanies, moneyMade, "companies", "money\nmade ($)", chartXPos, chartYPos);
    passengerCountPopularity = new BarrChart(people, tripCounts, "People", "Amount\nof trips", chartXPos, chartYPos);
    
        String averageSpeed;
    float[] aveSpeedPerHour = new float[24];
    for (int i=0; i<averageSpeedPerHour.length; i++)
    {
      double aveSpeed = averageSpeedPerHour[i];
      int numberOfTaxis = numberOfTaxisPerHour[i];
      aveSpeed = aveSpeed / numberOfTaxis;
      aveSpeedPerHour[i] = (float) aveSpeed;
    }
    averageSpeedPerHourGraph = new BarrChart(timeLabel2, aveSpeedPerHour, "Hours", "Ave. Speed", chartXPos, chartYPos);
    //--------------------------------------------------------------------------------------------------------------------------------------
  }

  void  draw()
  {
    background(backgroundImage);

    if (currentScreen == 1)
    {
      fill(WHITE);  
      textSize(100);
      PFont font = loadFont("AmericanTypewriter-Bold-48.vlw");
      textFont(font);
      text("NYC Taxi", 250, 100);

      //Initialising widgets
      widget1 = new  Widget(50, 150, EVENT_BUTTON1, taxiImageBarChart);  
      widget2 = new  Widget(50, 400, EVENT_BUTTON2, taxiImageMap);
      widget3 = new  Widget(500, 225, EVENT_BUTTON3, taxiImagePieChart); 

      widgetList  =  new  ArrayList();
      widgetList.add(widget1);  
      widgetList.add(widget2);
      widgetList.add(widget3);
    } 
    else if (currentScreen == 2)
    {
      //Initialising widgets
      widget4 = new  Widget(30, 30, EVENT_BUTTON4, taxiImageMainMenu);
      distancePassWidget = new Widget(50, widgetY-200, 100, 60, "Avg Distance/\nPassenger", color(255, 0, 0), EVENT_BUTTON6);
      compDistWidget = new Widget(200, widgetY-200, 100, 60, "Distance/\nCompany", color(255, 0, 0), EVENT_BUTTON7);
      moneyMadeWidget = new Widget(50, widgetY-100, 100, 60, "Income/\nCompany", color(255, 0, 0), EVENT_BUTTON8);
      tempWidget3 = new Widget(200, widgetY-100, 100, 60, "tripCount/\nPeople", color(255, 0, 0), EVENT_BUTTON9 );
      tempWidget4 = new Widget(50, widgetY, 100, 60, "Ave. Speed/\nHour", color(255, 0, 0), EVENT_BUTTON10 );
      widgetList  =  new  ArrayList();
      widgetList.add(widget4);
      widgetList.add(compDistWidget);
      widgetList.add(distancePassWidget);
      widgetList.add(moneyMadeWidget);
      widgetList.add(tempWidget3);
      widgetList.add(tempWidget4);

      // Cycles between charts.
      if (currentChart == 1)
      {
        avgTimeChart.draw();
      } else if (currentChart == 2)
      {
        distanceCompanyChart.draw();
      } else if (currentChart == 3)
      {
        moneyMadeByCompanies.draw();
      } else if (currentChart == 4)
      {
        passengerCountPopularity.draw();
      } else if (currentChart == 5)
      {
        averageSpeedPerHourGraph.draw();
      }
      textSize(13);
    } 
    else if (currentScreen == 3)
    {
      widget4 = new  Widget(30, 30, EVENT_BUTTON4, taxiImageMainMenu);
      widgetList  =  new  ArrayList();  
      widgetList.add(widget4);
    } 
    else if (currentScreen == 4)
    {
      //initializes different pie charts
      // Judy & Eoin
      widget4 = new  Widget(30, 30, EVENT_BUTTON4, taxiImageMainMenu);
      pieWidget = new Widget(50, widgetY, 100, 60, "VolPerHour", color(255, 100, 100), EVENT_BUTTON11);
      pieWidget1 = new Widget(200, widgetY, 100, 60, "totalPass", color(255, 100, 100), EVENT_BUTTON12);
      pieWidget2 = new Widget(350, widgetY, 100, 60, "passPerHour", color(255, 100, 100), EVENT_BUTTON13);
      pieWidget3 = new Widget(500, widgetY, 100, 60, "distTrav", color(255, 100, 100), EVENT_BUTTON14);
      pieWidget4 = new Widget(650, widgetY, 100, 60, "distPass", color(255, 100, 100), EVENT_BUTTON15);
      widgetList  =  new  ArrayList(); 
      widgetList.add(widget4);
      widgetList.add(pieWidget);
      widgetList.add(pieWidget1);
      widgetList.add(pieWidget2);
      widgetList.add(pieWidget3);
      widgetList.add(pieWidget4);

      //creates pie charts
      pieChart volPerHour = new pieChart(amounts, timeLabel, "Volume of taxis per hour");
      pieChart totalPass = new pieChart(passPerComp, taxiCompanies, "Total passengers per company");
      pieChart passengersPerHour = new pieChart(hours, timeLabel, "Total amount of passengers per hour");
      pieChart distancePerHour = new pieChart(distanceHour, timeLabel, "Total distances travelled per hour");
      pieChart distPerPass = new pieChart(distancePassengers, passengers, "Distance that different amounts of passengers spent in taxis");

      //draws pie charts depending on number
      if (currentPie == 1) {
        volPerHour.draw();
      } else if (currentPie == 2) {
        totalPass.draw();
      } else if (currentPie == 3) {
        passengersPerHour.draw();
      } else if (currentPie == 4) {
        distancePerHour.draw();
      } else if (currentPie == 5) {
        distPerPass.draw();
      }
    }
///////////////////////////////////////////
    //Date Picker Screen
    else if (currentScreen == 5)
    {
      PFont font = loadFont("CenturyGothic-Italic-20.vlw");
      textFont(font);
      fill(WHITE);
      text("Choose the date you want to display", 415, 50);
      PFont widgetFont = loadFont("DialogInput.plain-20.vlw");
      textFont(widgetFont);
      widget4 = new Widget(30, 30, EVENT_BUTTON4, taxiImageMainMenu);
      goToMapWidget = new Widget(550, widgetY-70, 100, 60, "To Map", color(0, 155, 255), EVENT_BUTTON17);
      widgetList  =  new  ArrayList(); 
      widgetList.add(widget4);
      widgetList.add(goToMapWidget);
    }


    for (int i = 0; i<widgetList.size (); i++)
    {  
      Widget aWidget = (Widget) widgetList.get(i);  
      aWidget.draw();  
    }
  }


}
