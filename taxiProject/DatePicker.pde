class DatePicker
{
//

  public Widget button1, button2, button3, button4, button5, 
  button6, button7, button8, button9, button10, 
  button11, button12, button13, button14, button15, 
  button16, button17, button18, button19, button20, 
  button21, button22, button23, button24, button25, 
  button26, button27, button28, button29, button30, yearForward, 
  yearBackward, showYear, monthForward, monthBackward, showMonth;

  static final int EVENT_DAY1=1;
  static final int EVENT_DAY2=2;
  static final int EVENT_DAY3=3;
  static final int EVENT_DAY4=4;
  static final int EVENT_DAY5=5;
  static final int EVENT_DAY6=6;
  static final int EVENT_DAY7=7;
  final int EVENT_DAY8=8;
  final int EVENT_DAY9=9;
  final int EVENT_DAY10=10;
  final int EVENT_DAY11=11;
  final int EVENT_DAY12=12;
  final int EVENT_DAY13=13;
  final int EVENT_DAY14=14;
  final int EVENT_DAY15=15;
  final int EVENT_DAY16=16;
  final int EVENT_DAY17=17;
  final int EVENT_DAY18=18;
  final int EVENT_DAY19=19;
  final int EVENT_DAY20=20;
  final int EVENT_DAY21=21;
  final int EVENT_DAY22=22;
  final int EVENT_DAY23=23;
  final int EVENT_DAY24=24;
  final int EVENT_DAY25=25;
  final int EVENT_DAY26=26;
  final int EVENT_DAY27=27;
  final int EVENT_DAY28=28;
  final int EVENT_DAY29=29;
  final int EVENT_DAY30=30;
  final int EVENT_YEAR_FORWARD=31;
  final int EVENT_YEAR_BACKWARD = 32;
  final int EVENT_MONTH_FORWARD = 33;
  final int EVENT_MONTH_BACKWARD = 33;

PFont font;
  PFont stdFont;
  int wantedDay=0;
  ArrayList  widgetList; 

  color widgetsDate = color(100, 150, 200);




  DatePicker() {
    //size(700, 700);
    widgetList  =  new  ArrayList();
  }


  void draw() {
    // Calendar table 
    fill(100, 150, 200);
    rect(170+300, 170, 250, 250);
    int spaceY =137 ;
    int spaceX = 210;
    int space =0;
    int counter =1;
    int month = 1;
    //stdFont=loadFont("Serif-10.vlw"); 
    font =loadFont("Dialog-25.vlw");
    stdFont=loadFont("Dialog-12.vlw");
    textFont(stdFont);
    String day1 = getDay();
    String month1 = getMonth();
    String year1 = getYear();
    fill(WHITE);
    
   
    textSize(20);
    text(day1+"/"+month1+"/"+year1, 800, 200); //prints chosen date on screen
    textSize(25);
     textFont(font);
    text("Map Controls:", 100, 250);
     textFont(stdFont);
    
    text("Press O to zoom out.\nPress M to go back to main menu.\nPress 1 & 2 to switch maps.\nDouble click/scroll/press Z to zoom in.", 100, 300);
    
    button1=new Widget(180+300, 240, 23, 23, 
    "1", color(100), EVENT_DAY1);
    button1.draw();

    for (int i=1; i<=6; i++) {
      spaceX = spaceX +30;
      spaceY =130;
      space = 10;
      for (int j=0; j<5+1; j++) {
        if (j==6 ||i==1 || i==2 || i==3 || i==4 || i==5 )
          break;
        button1=new Widget(180+300, 240, 23, 23, 
        "1", color(100), EVENT_DAY1);
        button1.draw();
        widgetList.add(button1);

        button2=new Widget(231+300, 240, 23, 23, 
        "2", color(100), EVENT_DAY2);
        button2.draw();
        widgetList.add(button2);

        button3=new Widget(283+300, 240, 23, 23, 
        "3", color(100), EVENT_DAY3);
        button3.draw();
        widgetList.add(button3);

        button4=new Widget(336+300, 240, 23, 23, 
        "4", color(100), EVENT_DAY4);
        button4.draw();
        widgetList.add(button4);

        button5=new Widget(390+300, 240, 23, 23, 
        "5", color(100), EVENT_DAY5);
        button5.draw();
        widgetList.add(button5);

        button6=new Widget(180+300, 270, 23, 23, 
        "6", color(100), EVENT_DAY6);
        button6.draw();
        widgetList.add(button6);

        button7=new Widget(231+300, 270, 23, 23, 
        "7", color(100), EVENT_DAY7);
        button7.draw();
        widgetList.add(button7);

        button8=new Widget(283+300, 270, 23, 23, 
        "8", color(100), EVENT_DAY8);
        button8.draw();
        widgetList.add(button8);

        button9=new Widget(336+300, 270, 23, 23, 
        "9", color(100), EVENT_DAY9);
        button9.draw();
        widgetList.add(button9);

        button10=new Widget(390+300, 270, 23, 23, 
        "10", color(100), EVENT_DAY10);
        button10.draw();
        widgetList.add(button10);

        button11=new Widget(180+300, 300, 23, 23, 
        "11", color(100), EVENT_DAY11);
        button11.draw();
        widgetList.add(button11);

        button12=new Widget(231+300, 300, 23, 23, 
        "12", color(100), EVENT_DAY12);
        button12.draw();
        widgetList.add(button12);

        button13=new Widget(283+300, 300, 23, 23, 
        "13", color(100), EVENT_DAY13);
        button13.draw();
        widgetList.add(button13);

        button14=new Widget(336+300, 300, 23, 23, 
        "14", color(100), EVENT_DAY14);
        button14.draw(); 
        widgetList.add(button14);

        button15=new Widget(390+300, 300, 23, 23, 
        "15", color(100), EVENT_DAY15);
        button15.draw();
        widgetList.add(button15);

        button16=new Widget(180+300, 330, 23, 23, 
        "16", color(100), EVENT_DAY16);
        button16.draw();
        widgetList.add(button16);

        button17=new Widget(231+300, 330, 23, 23, 
        "17", color(100), EVENT_DAY17);
        button17.draw();
        widgetList.add(button17);

        button18=new Widget(283+300, 330, 23, 23, 
        "18", color(100), EVENT_DAY18);
        button18.draw();
        widgetList.add(button18);

        button19=new Widget(336+300, 330, 23, 23, 
        "19", color(100), EVENT_DAY19);
        button19.draw();
        widgetList.add(button19);

        button20=new Widget(390+300, 330, 23, 23, 
        "20", color(100), EVENT_DAY20);
        button20.draw();
        widgetList.add(button20);

        button21=new Widget(180+300, 360, 23, 23, 
        "21", color(100), EVENT_DAY21);
        button21.draw();
        widgetList.add(button21);

        button22=new Widget(231+300, 360, 23, 23, 
        "22", color(100), EVENT_DAY22);
        button22.draw();
        widgetList.add(button22);

        button23=new Widget(283+300, 360, 23, 23, 
        "23", color(100), EVENT_DAY23);
        button23.draw();
        widgetList.add(button23);

        button24=new Widget(336+300, 360, 23, 23, 
        "24", color(100), EVENT_DAY24);
        button24.draw();
        widgetList.add(button24);

        button25=new Widget(390+300, 360, 23, 23, 
        "25", color(100), EVENT_DAY25);
        button25.draw();
        widgetList.add(button25);

        button26=new Widget(180+300, 390, 23, 23, 
        "26", color(100), EVENT_DAY26);
        button26.draw();
        widgetList.add(button26);

        button27=new Widget(231+300, 390, 23, 23, 
        "27", color(100), EVENT_DAY27);
        button27.draw();
        widgetList.add(button27);

        button28=new Widget(283+300, 390, 23, 23, 
        "28", color(100), EVENT_DAY28);
        button28.draw();
        widgetList.add(button28);

        button29=new Widget(336+300, 390, 23, 23, 
        "29", color(100), EVENT_DAY29);
        button29.draw();
        widgetList.add(button29);

        button30=new Widget(390+300, 390, 23, 23, 
        "30", color(100), EVENT_DAY30);
        button30.draw();
        widgetList.add(button30);
        //int j=0;
        spaceY += (j + 40 + space );
        int width = 23;
        int height = 23;
        fill(255, 255, 255);
        //rect(spaceY+300, spaceX, width, height);
        //println(spaceX + " "  +  spaceY + " " + counter);
        fill(0, 102, 153);
        //text(counter+300, spaceY+5, spaceX+15+50);
        counter++;
        //wantedDay = counter;

        //println("spaceY = " + " " + spaceY + 
        //" " + "spaceX = " + " " + spaceX + " " + counter);
      }
    }

    line(170+300, 220, 420+300, 220);
    //text(YEAR, 345+300, 210);
    //text("1993", 345, 210);
    //text("Jan", 220+300, 210);
    //rect(380, 200, 10, 10);     //Year++
    //rect(330, 200, 10, 10);     // Year--

    stroke(10);

    yearForward=new Widget(380+300, 195, 23, 23, 
    ">", color(200), EVENT_YEAR_FORWARD);
    yearForward.draw();
    widgetList.add(yearForward);

    yearBackward=new Widget(313+300, 195, 23, 23, 
    "<", color(200), EVENT_YEAR_BACKWARD);
    yearBackward.draw();
    widgetList.add(yearBackward);

    String st1 = str(YEAR);
    String st2 = str(MONTH);


    noStroke();
    showYear=new Widget(338+300, 190, 30, 30, 
    st1, color(widgetsDate), EVENT_DAY2);
    showYear.draw();
    widgetList.add(showYear);
    showYear.draw();

    stroke(10);

    //text("Jan", 220, 210);

    noStroke();
    showMonth=new Widget(215+300, 200, 20, 20, 
    st2, color(widgetsDate), EVENT_DAY2);
    showMonth.draw();
    widgetList.add(showMonth);

    stroke(10);
    //rect(205, 200, 10, 10);
    //rect(240, 200, 10, 10);

    monthForward=new Widget(240+300, 195, 23, 23, 
    ">", color(200), EVENT_MONTH_FORWARD);
    monthForward.draw();
    widgetList.add(monthForward);


    monthBackward=new Widget(190+300, 195, 23, 23, 
    "<", color(200), EVENT_MONTH_BACKWARD);
    monthBackward.draw();
    widgetList.add(monthBackward);
  }

  void getEvent() {
    int event;
    //for (int i = 0; i<widgetList.size (); i++) {
    // Widget aWidget = (Widget) widgetList.get(i);
    //event = aWidget.getEvent(mouseX, mouseY);

    switch(button1.getEvent(mouseX, mouseY)) {
    case EVENT_DAY1:
      println("Day" + " " + "1");
      DAY=1;
      break;
    }

    switch(button2.getEvent(mouseX, mouseY)) {
    case EVENT_DAY2:
      println("Day" + " " + "2");
      DAY=2;
      break;
    }

    switch(button3.getEvent(mouseX, mouseY)) {
    case EVENT_DAY3:
      println("Day" + " " + "3");
      DAY=3;
      break;
    }

    switch(button4.getEvent(mouseX, mouseY)) {
    case EVENT_DAY4:
      println("Day" + " " + "4");
      DAY=4;
      break;
    }

    switch(button5.getEvent(mouseX, mouseY)) {
    case EVENT_DAY5:
      println("Day" + " " + "5");
      DAY=5;
      break;
    }

    switch(button6.getEvent(mouseX, mouseY)) {
    case EVENT_DAY6:
      println("Day" + " " + "6");
      DAY=6;
      break;
    }

    switch(button7.getEvent(mouseX, mouseY)) {
    case EVENT_DAY7:
      println("Day" + " " + "7");
      DAY=7;
      break;
    }

    switch(button8.getEvent(mouseX, mouseY)) {
    case EVENT_DAY8:
      println("Day" + " " + "8");
      DAY=8;
      break;
    }

    switch(button9.getEvent(mouseX, mouseY)) {
    case EVENT_DAY9:
      println("Day" + " " + "9");
      DAY=9;
      break;
    }

    switch(button10.getEvent(mouseX, mouseY)) {
    case EVENT_DAY10:
      println("Day" + " " + "10");
      DAY=10;
      break;
    }

    switch(button11.getEvent(mouseX, mouseY)) {
    case EVENT_DAY11:
      println("Day" + " " + "11");
      DAY=11;
      break;
    }

    switch(button12.getEvent(mouseX, mouseY)) {
    case EVENT_DAY12:
      println("Day" + " " + "12");
      DAY=12;
      break;
    }

    switch(button13.getEvent(mouseX, mouseY)) {
    case EVENT_DAY13:
      println("Day" + " " + "13");
      DAY=13;
      break;
    }

    switch(button14.getEvent(mouseX, mouseY)) {
    case EVENT_DAY14:
      println("Day" + " " + "14");
      DAY=14;
      break;
    }

    switch(button15.getEvent(mouseX, mouseY)) {
    case EVENT_DAY15:
      println("Day" + " " + "15");
      DAY=15;
      break;
    }

    switch(button16.getEvent(mouseX, mouseY)) {
    case EVENT_DAY16:
      println("Day" + " " + "16");
      DAY=16;
      break;
    }

    switch(button17.getEvent(mouseX, mouseY)) {
    case EVENT_DAY17:
      println("Day" + " " + "17");
      DAY=17;
      break;
    }

    switch(button18.getEvent(mouseX, mouseY)) {
    case EVENT_DAY18:
      println("Day" + " " + "18");
      DAY=18;
      break;
    }

    switch(button19.getEvent(mouseX, mouseY)) {
    case EVENT_DAY19:
      println("Day" + " " + "19");
      DAY=19;
      break;
    }


    switch(button20.getEvent(mouseX, mouseY)) {
    case EVENT_DAY20:
      println("Day" + " " + "20");
      DAY=20;
      break;
    }

    switch(button21.getEvent(mouseX, mouseY)) {
    case EVENT_DAY21:
      println("Day" + " " + "21");
      DAY=21;
      break;
    }

    switch(button22.getEvent(mouseX, mouseY)) {
    case EVENT_DAY22:
      println("Day" + " " + "22");
      DAY=22;
      break;
    }

    switch(button23.getEvent(mouseX, mouseY)) {
    case EVENT_DAY23:
      println("Day" + " " + "23");
      DAY=23;
      break;
    }

    switch(button24.getEvent(mouseX, mouseY)) {
    case EVENT_DAY24:
      println("Day" + " " + "24");
      DAY=24;
      break;
    }

    switch(button25.getEvent(mouseX, mouseY)) {
    case EVENT_DAY25:
      println("Day" + " " + "25");
      DAY=25;
      break;
    }

    switch(button26.getEvent(mouseX, mouseY)) {
    case EVENT_DAY26:
      println("Day" + " " + "26");
      DAY=26;
      break;
    }

    switch(button27.getEvent(mouseX, mouseY)) {
    case EVENT_DAY27:
      println("Day" + " " + "27");
      DAY=27;
      break;
    }

    switch(button28.getEvent(mouseX, mouseY)) {
    case EVENT_DAY28:
      println("Day" + " " + "28");
      DAY=28;
      break;
    }

    switch(button29.getEvent(mouseX, mouseY)) {
    case EVENT_DAY29:
      println("Day" + " " + "29");
      DAY=29;
      break;
    }

    switch(button30.getEvent(mouseX, mouseY)) {
    case EVENT_DAY30:
      println("Day" + " " + "30");
      DAY=30;
      break;
    }

    switch(yearForward.getEvent(mouseX, mouseY)) {
    case EVENT_YEAR_FORWARD:
      YEAR++;
      println("Year" + " " + YEAR);
      String st1 = str(YEAR);
      noStroke();
      showYear=new Widget(338+300, 190, 30, 30, 
      st1, color(widgetsDate), EVENT_DAY2);
      showYear.draw();
      widgetList.add(showYear);
      showYear.draw();
      break;
    }

    switch(yearBackward.getEvent(mouseX, mouseY)) {
    case EVENT_YEAR_BACKWARD:
      YEAR--;
      println("Year" + " " + YEAR);
      String st1 = str(YEAR);
      noStroke();
      showYear=new Widget(338+300, 190, 30, 30, 
      st1, color(widgetsDate), EVENT_YEAR_BACKWARD);
      showYear.draw();
      widgetList.add(showYear);
      showYear.draw();
      break;
    }


    switch(monthForward.getEvent(mouseX, mouseY)) {
    case EVENT_MONTH_FORWARD:
      MONTH++;
      if (MONTH>=13)
        MONTH=1;
      println("Month" + " " + MONTH);
      String st2 = str(MONTH);
      noStroke();

      showMonth=new Widget(215+300, 200, 20, 20, 
      st2, color(widgetsDate), EVENT_DAY2);
      showMonth.draw();
      widgetList.add(showMonth);
      break;
    }

    switch(monthBackward.getEvent(mouseX, mouseY)) {
    case EVENT_MONTH_BACKWARD:
      MONTH--;
      if (MONTH <= 1)
        MONTH=12;
      println("Month" + " " + MONTH);
      String st2 = str(MONTH);
      noStroke();

      showMonth=new Widget(215+300, 200, 20, 20, 
      st2, color(widgetsDate), EVENT_DAY2);
      showMonth.draw();
      widgetList.add(showMonth);
      break;
    }
  }

  String getDay() {
    String dayString = str(DAY);
    return dayString;
  }

  String getMonth() {
    String monthString = str(MONTH);
    return monthString;
  }

  String getYear() {
    String yearString = str(YEAR);
    return yearString;
  }

  //}
}
