// written by eoin & judy helped fix
class pieChart {

  float[] angles; 
  float total = 0;
  float x, y, w;
  float angle, newAng;
  float legendX, legendY, legendW, legendS;
  String[] labels;
  String titleName;
   
  pieChart(float[] array, String[] label, String title) {
    titleName = title;
    labels=label;
    angles = new float[array.length];

    for (int i=0; i<array.length; i++) {
      total += array[i];
    }

    noStroke();
    PFont font = loadFont("DialogInput-13.vlw");
    textFont(font);

    // fraction of pie
    for (int index=0; index<angles.length; index++)
    {
      angles[index] = array[index]/total;
    }

    x= 500;
    y=300;
    w=300;

    //used for key
    legendX= 800;
    legendY= 100;
    legendW=20;
  }

  void draw() {
    angle = 0;
    newAng = 0;
    int[] colors ={0,255,255, 224,255,255,0,206,209,64,224,208,72,209,204,175,238,238,127,255,212,176,224,230,95,158,160,70,130,180,100,149,237,0,191,255,30,144,255,173,216,230,135,206,235,135,206,250,25,25,112,0,0,128,0,0,139,0,0,205,0,0,255,65,105,225,138,43,226,75,0,130};
  
    PFont font = loadFont("CenturyGothic-Italic-20.vlw");
    textFont(font);
    fill(WHITE);
    text(titleName, 400, 50);

    PFont font2 = loadFont("DialogInput-13.vlw");
    textFont(font2);
    
    //drawing pie chart

    for (int j=0; j<angles.length; j++)
    {
      newAng = angle + angles[j] * 2 * PI;
      fill(colors[j],colors[j+1],colors[j+2]);

      arc(x, y, w, w, angle, newAng);
      angle=newAng;

      rect(legendX, legendY, legendW, legendW);
      fill(WHITE);
      text(labels[j], legendX+legendW, legendY+legendW/1.5);
      legendY= legendY + 30;

      if (j==11) {
        legendX += 100;
        legendY = 100;
      }
    }
  }
}

