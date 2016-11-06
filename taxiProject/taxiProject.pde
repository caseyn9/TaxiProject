import de.fhpotsdam.unfolding.mapdisplay.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.tiles.*;
import de.fhpotsdam.unfolding.interactions.*;
import de.fhpotsdam.unfolding.ui.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.core.*;
import de.fhpotsdam.unfolding.mapdisplay.shaders.*;
import de.fhpotsdam.unfolding.data.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.texture.*;
import de.fhpotsdam.unfolding.events.*;
import de.fhpotsdam.utils.*;
import de.fhpotsdam.unfolding.providers.*;

import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.utils.*; 
import de.fhpotsdam.unfolding.providers.Microsoft;
import de.fhpotsdam.unfolding.providers.Google;
import de.fhpotsdam.unfolding.providers.OpenMapSurferProvider;
import de.fhpotsdam.unfolding.providers.OpenStreetMap;
import de.fhpotsdam.unfolding.ui.BarScaleUI; 
import de.fhpotsdam.unfolding.ui.CompassUI;
import de.fhpotsdam.unfolding.marker.SimplePointMarker;
import de.fhpotsdam.unfolding.marker.SimpleLinesMarker;
import java.util.List;
import de.fhpotsdam.unfolding.marker.MarkerManager;

import ddf.minim.*;  //mouse clicking sound
Minim minim; 
AudioPlayer Player;

DatePicker d1;

public int DAY = 0;
public int YEAR = 2015;
public int MONTH = 1;

color RED = color(255, 0, 0);
color GREEN = color(0, 255, 0);
color BLUE = color(0, 0, 255);
color BLACK = color(0, 0, 0);
color WHITE = color(255, 255, 255);
color YELLOW = color(255, 255, 51);

final  int  EVENT_BUTTON1  =  1;  
final  int  EVENT_BUTTON2  =  2;  
final  int  EVENT_BUTTON3  =  3;  
final  int  EVENT_BUTTON4  =  4;  
final  int  EVENT_BUTTON5  =  5;  
final  int  EVENT_BUTTON6 = 6;
final  int  EVENT_BUTTON7 = 7;
final  int  EVENT_BUTTON8 = 8;
final  int  EVENT_BUTTON9 = 9;
final  int  EVENT_BUTTON10 = 10;
final  int  EVENT_BUTTON11 = 11;
final  int  EVENT_BUTTON12 = 12;
final  int  EVENT_BUTTON13 = 13;
final  int  EVENT_BUTTON14 = 14;
final  int  EVENT_BUTTON15 = 15;
final  int  EVENT_BUTTON16 = 16;
final  int  EVENT_BUTTON17 = 17;
final  int  EVENT_NULL  =  0; 


PImage taxiImageBarChart;
PImage taxiImageMap;
PImage taxiImagePieChart;
PImage taxiImageMainMenu;
PImage backgroundImage;


float[] moneyMade = new float[2];
long[] tripCount = new long[4];
long[] averageTime = new long[4];
String[] taxiCompanies = {
  "CMT", "VTS"
};
double[] distTravByCompanies = new double[2]; 
float[] hours = new float[24];
String[] timeLabel = {
  "00:00", "01:00", "02:00", "03:00", "04:00", "05:00", "06:00", "07:00", "08:00", "09:00", 
  "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00"
};
//To fit on bar Chart
String[] timeLabel2 = {
  "00", "01", "02", "03", "04", "05", "06", "07", "08", "09", 
  "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"
};

String[] passengers = {
  "1 passenger", "2 passengers", "3 passengers", "4 passengers"
};

float [] distanceHour = new float[24];
float [] amounts = new float[24];
float [] passPerComp = new float[2];
double[] averageSpeedPerHour = new double[24];
int[] numberOfTaxisPerHour = new int[24];

float[] distancePassengers = new float[4];
String title = "null";

ArrayList<Double> pickLongitudes = new ArrayList<Double>();
ArrayList<Double> pickLatitudes = new ArrayList<Double>();
ArrayList<Double> dropLongitudes = new ArrayList<Double>();
ArrayList<Double> dropLatitudes = new ArrayList<Double>();

UnfoldingMap map, map2,map3, currentMap;
MarkerManager markerM;

List<Marker> listOfMarkers = new ArrayList<Marker>();

DataExtraction dataExtractor;
Screen screen1, screen2, screen3, screen4, screen5;
Widget widget1, widget2, widget3, widget4, compDistWidget, tempWidget1, tempWidget2, tempWidget3, tempWidget4, goToMapWidget, distancePassWidget, moneyMadeWidget;
Widget  pieWidget, pieWidget1, pieWidget2, pieWidget3, pieWidget4, pieWidget5;
int currentChart=1;
int currentPie = 1;
int currentScreen = 1;

void  setup()
{
  size(1000, 600);
  dataExtractor = new DataExtraction();
  backgroundImage = loadImage("nycBack.png");
  dataExtractor.getData();
  //println(averageTime);
  screen1 = new Screen();
  screen2 = new Screen();
  screen3 = new Screen();
  screen4 = new Screen();
  screen5 = new Screen();

  taxiImageBarChart = loadImage("NYCTaxiPicBarChart.png");
  taxiImageMap = loadImage("NYCTaxiPicMap.png");
  taxiImagePieChart = loadImage("NYCTaxiPieChart.png"); 
  taxiImageMainMenu = loadImage("NYCTaxiMainMenu.png");

  map = new UnfoldingMap(this, new Google.GoogleMapProvider());
  map2 = new UnfoldingMap(this, new Microsoft.AerialProvider());
  map3 = new UnfoldingMap(this, new Google.GoogleMapProvider());

  MapUtils.createDefaultEventDispatcher(this, map);
  MapUtils.createDefaultEventDispatcher(this, map2);
  MapUtils.createDefaultEventDispatcher(this, map3);

  //map.zoomAndPanTo(new Location(52.5f, 13.4f), 10);
  map.zoomAndPanTo(new Location(40.714352800000000000f, -74.005973100000000000f), 10);
  map2.zoomAndPanTo(new Location(40.714352800000000000f, -74.005973100000000000f), 10);
  map3.zoomAndPanTo(new Location(40.714352800000000000f, -74.005973100000000000f), 10);
  //map.outerRotate(360.0);
  
  currentMap = map;
  
  d1 = new DatePicker();

  for (int i=0; i<pickLongitudes.size (); i++) {
    Location currentLocationPickUp = new Location(pickLatitudes.get(i), pickLongitudes.get(i));
    Location currentLocationDropOff = new Location(dropLatitudes.get(i), dropLongitudes.get(i));
    color c1 = color(0, 0, 255);
    color c2 = color (0,255,0);
    
    SimplePointMarker pinPointPickUp = new SimplePointMarker(currentLocationPickUp);
    pinPointPickUp.setColor(c2);
    SimplePointMarker pinPointDropOff = new SimplePointMarker(currentLocationDropOff);
    pinPointDropOff.setColor(c1);
    map.addMarkers(pinPointPickUp);
    map.addMarkers(pinPointDropOff);
    map2.addMarkers(pinPointPickUp);
    map2.addMarkers(pinPointDropOff);
    map3.addMarkers(pinPointPickUp);
    map3.addMarkers(pinPointDropOff);
    SimpleLinesMarker line1 = new SimpleLinesMarker(currentLocationPickUp, currentLocationDropOff);
    map.addMarkers(line1);
    map2.addMarkers(line1);
    map3.addMarkers(line1);
    //markerM.addMarker(pinPointPickUp);
    //markerM.addMarker(pinPointDropOff);

    minim = new Minim(this);
    Player = minim.loadFile("switch-19.wav");
  }
}

void  draw()
{
  if (currentScreen == 1)
  {
    screen1.draw();
  } else if (currentScreen == 2)
  {
    screen2.draw();
  } else if (currentScreen == 3)
  {
   screen3.draw();
    currentMap.draw();
   if(key == '2'){
      currentMap = map2;
   }
   if(key == '1'){
     currentMap = map;
   }
  
    cursor(MOVE);
    map.setTweening(true);
    map.updateMap(); 
    int gridWidth = 35;
    int gridHeight = 35;
    float circ = 2*(sqrt(   (gridWidth/2)*(gridWidth/2) + (gridWidth/2)*(gridWidth/2)  ));
    if(currentMap == map){
    for (int x = 0; x < width; x += gridWidth) 
    {
      for (int y = 0; y < height; y += gridHeight) {

        int numberOfMarkersInEachSquare = 0;

        // Count markers inside the current grid region
        MarkerManager<Marker> markerM = map.getDefaultMarkerManager();
        for (Marker m : markerM.getMarkers ()) 
        {
          ScreenPosition pos = map.getScreenPosition(m.getLocation());
          if (pos.x > x && pos.x < x + gridWidth && pos.y > y && pos.y < y + gridHeight) 
          {
            numberOfMarkersInEachSquare++;
          }
        }

        // Transition from number of taxis to heat(red color)
        float heat = map(numberOfMarkersInEachSquare, 0, 25, 0, 255);

        // Draw the grid with no stoke
        fill(255, 0, 0, heat);
        noStroke();
        ellipse(x+(circ/2), y+(circ/2), circ+25, circ+25);
        //rect(x, y, gridWidth, gridHeight);
      }
    }
    }
  } else if (currentScreen == 4)
  {
    
    screen4.draw();
  }

  //Date Picker Screen
  else if (currentScreen == 5)
  {
    screen5.draw();
    d1.draw();
  }
}

void  mousePressed()
{  
  int event; 
  Player.rewind();
  Player.play(); 

  if (currentScreen == 1)
  {
    for (int i = 0; i<screen1.widgetList.size (); i++)
    {  
      Widget aWidget = (Widget)  screen1.widgetList.get(i);  
      event = aWidget.getEvent(mouseX, mouseY);  

      switch(event)  
      {  
      case EVENT_BUTTON1:  
        println("button  1!"); 
        //screen1.moveImage(1);
        currentScreen = currentScreen + 1;
        Player.play(); 
        break;  

      case  EVENT_BUTTON2:  
        println("button  2!");
        currentScreen = currentScreen + 4;
        Player.play();   
        break; 

      case  EVENT_BUTTON3:  
        println("button  3!");
        currentScreen = currentScreen + 3; 
        Player.play();  
        break;
      }
    }
  } else if (currentScreen == 2)
  {
    for (int y = 0; y<screen2.widgetList.size (); y++)
    {
      Widget aWidget = (Widget)  screen2.widgetList.get(y);  
      event = aWidget.getEvent(mouseX, mouseY);

      switch(event)
      {  
      case  EVENT_BUTTON4:  
        println("button  4!");  
        currentScreen = 1;
        Player.play(); 
        break; 

      case EVENT_BUTTON6:
        println("button 6!");
        Player.play(); 
        currentChart = 1;
        break;

      case EVENT_BUTTON7:
        currentChart = 2;
        break;

      case EVENT_BUTTON8:
        currentChart = 3;
        break;

      case EVENT_BUTTON9:
        currentChart = 4;
        break;

      case EVENT_BUTTON10:
        currentChart = 5;
        break;
      }
    }
  } else if (currentScreen == 4)
  {
//Judy
    for (int y = 0; y<screen4.widgetList.size (); y++)
    {
      Widget aWidget = (Widget)  screen4.widgetList.get(y);  
      event = aWidget.getEvent(mouseX, mouseY);

      switch(event)
      {  
      case  EVENT_BUTTON4:  
        currentScreen = 1;
        println("button  4!");  
        println(currentScreen);
        Player.play(); 
        break; 

      case EVENT_BUTTON11:
        println("currentPie 1");
        currentPie = 1;
        break;

      case EVENT_BUTTON12:
        println("currentPie 2");
        currentPie = 2;
        break;

      case EVENT_BUTTON13:
        println("currentPie 3");
        currentPie = 3;
        break;

      case EVENT_BUTTON14:
        println("currentPie 4");
        currentPie = 4;
        break;

      case EVENT_BUTTON15:
        println("currentPie 5");
        currentPie = 5;
        break;
      }
    }
  }
  /////////////////////////////////
  else if (currentScreen == 5)

  {
    for (int y = 0; y<screen5.widgetList.size (); y++)
    {
      Widget aWidget = (Widget)  screen5.widgetList.get(y);  
      event = aWidget.getEvent(mouseX, mouseY);
      
     //d1 .getEvent();
      switch(event)

      {  

      case  EVENT_BUTTON4:  
        currentScreen = 1;
        println("button  4!");  
        println(currentScreen);
        Player.play(); 
        break; 


      case  EVENT_BUTTON17:
        dataExtractor.dateDay = Integer.parseInt(d1.getDay());
        dataExtractor.dateMonth =Integer.parseInt(d1.getMonth());  
        dataExtractor.getData();
        initMap(); 
        currentScreen = 3;
        println("button  Map!");  
        println(pickLongitudes);
        //println(currentScreen);
        Player.play(); 
        break;
      }
    }
  }
}

void keyPressed() {
  if (key == 'm' && currentScreen == 3)
  {
    currentScreen=1;
  } 
  else if (key == 'i') {
    map.zoomIn();
  } 
  else if (key == 'o') {
    map.zoomOut();
  } 
  else if (key == 'z') {
    currentMap.zoomIn();
  } 
  else if (key == 'o') {
    currentMap.zoomOut();
  }
}

void mouseClicked() {
  if(currentScreen == 5)
  {
     d1 .getEvent();
    //d1.mouseClicked();
    println("Wanted Date: " + d1.getDay() + "/" + d1.getMonth() + "/" + d1.getYear());
  }
}

void initMap()
{

  map = new UnfoldingMap(this, new Google.GoogleMapProvider());
  map2 = new UnfoldingMap(this, new Microsoft.AerialProvider());
  map3 = new UnfoldingMap(this, new Google.GoogleMapProvider());
  
  MapUtils.createDefaultEventDispatcher(this, map);
  MapUtils.createDefaultEventDispatcher(this, map2);
  MapUtils.createDefaultEventDispatcher(this, map3);
  
   //map.zoomAndPanTo(new Location(52.5f, 13.4f), 10);
  map.zoomAndPanTo(new Location(40.714352800000000000f, -74.005973100000000000f), 10);
  map2.zoomAndPanTo(new Location(40.714352800000000000f, -74.005973100000000000f), 10);
  map3.zoomAndPanTo(new Location(40.714352800000000000f, -74.005973100000000000f), 10);
  //map.outerRotate(360.0);
  
  currentMap = map;
   for (int i=0; i<pickLongitudes.size (); i++) {
    Location currentLocationPickUp = new Location(pickLatitudes.get(i), pickLongitudes.get(i));
    Location currentLocationDropOff = new Location(dropLatitudes.get(i), dropLongitudes.get(i));
    color c1 = color(0, 0, 255);
    color c2 = color (0,255,0);
    
    SimplePointMarker pinPointPickUp = new SimplePointMarker(currentLocationPickUp);
    pinPointPickUp.setColor(c2);
    SimplePointMarker pinPointDropOff = new SimplePointMarker(currentLocationDropOff);
    pinPointDropOff.setColor(c1);
    map.addMarkers(pinPointPickUp);
    map.addMarkers(pinPointDropOff);
    map2.addMarkers(pinPointPickUp);
    map2.addMarkers(pinPointDropOff);
    map3.addMarkers(pinPointPickUp);
    map3.addMarkers(pinPointDropOff);
    SimpleLinesMarker line1 = new SimpleLinesMarker(currentLocationPickUp, currentLocationDropOff);
    map.addMarkers(line1);
    map2.addMarkers(line1);
    map3.addMarkers(line1);
    //markerM.addMarker(pinPointPickUp);
    //markerM.addMarker(pinPointDropOff);

    minim = new Minim(this);
    Player = minim.loadFile("switch-19.wav");
  } 
}

//void mouseReleased(){
//  if(currentScreen == 5)
//  {
//    d1.getEvent();
//  }
//}

//

//
