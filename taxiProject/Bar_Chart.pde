class BarrChart
{
 //final int yTotalSize = 600;
 //final int xTotalSize = 600;
 int barrX =450;//(xTotalSize/6) * 5;
 int barrY = 450;//(yTotalSize/6) * 5;
 String[] XList;
 float[] YList;
 String XLabel;
 String YLabel;
 float xPos;
 float yPos;
 float xGap;
 float highestY;
 float xSize;
 float margin;
 
 float xPosHold;
 
  BarrChart(String[] XList, float[] YList, 
              String XLabel, String YLabel, int xPos, int yPos)
 {  if(XList.length == YList.length)
   {
     this.XList = XList;
     this.YList = YList;
     this.XLabel = XLabel;
     this.YLabel = YLabel;
     this.xPos = xPos;
     xPosHold = xPos;
     this.yPos = yPos;
     xSize = barrX/4 * 3;        //=450
     xSize = xSize/XList.length;
     xGap = (barrX/4)/XList.length;
     highestY = determineHighY(YList);
     margin = 10;
     textSize(10);
   }
   else
   {
      println("ERROR XList and YList must be same length"); 
   }
 }
     int determineHighY(float[] YList)
   {
     int highestY = 0;
     for(int i=0; i<YList.length; i++)
     {
        int tempY = (int) YList[i];
        if (tempY > highestY) 
        {
          highestY = tempY;
        }    
     }
     int temp = highestY%10;
     temp = 10-temp;
     highestY = highestY + temp;
     return highestY;
   }
 
   void draw()
   {
     fill(WHITE);
     textSize(15);
     rect(xPos-10, yPos, margin, barrY);  //draw y axis
     rect(xPos-10, yPos+barrY, barrX, margin);  //draw x axis
     text(XLabel, xPos + barrX/2.2, yPos + barrY + barrY/6);
     text(YLabel, xPos - 145, yPos + barrY/2);
     text(highestY + "-", xPos - 90, yPos + 10);
     float multiplier = barrY/highestY;
     float tempYPosMod = barrY/10;
     int yNameMod = (int) highestY/10;
     float tempYPos = yPos;
     for (int i=1; i<11; i++)
     {
       tempYPos = tempYPos + tempYPosMod;
       text((int)highestY - (int)yNameMod*(int)i + "-", xPos - 90, tempYPos + 10);
     }
     for(int i=0; i<XList.length; i++)
     {
       fill(255, 213, 0);
       float ySize = YList[i];
       ySize = ySize * multiplier;
       tempYPos = yPos+barrY-ySize;
       rect(xPos + xGap/2,tempYPos, xSize, ySize);
       fill(WHITE);
       text(XList[i], xPos + xSize/2 + xGap/2, yPos + barrY + barrY/10 );
       xPos = xPos + xSize + xGap; 
     }
     xPos = xPosHold;
   }
  
}
//
