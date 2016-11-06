class  Widget  {  
  //
    int x, y, width, height; 
    String  label;  
    int  event;  
    color widgetColor;
    color labelColor, border;
    PFont  widgetFont;  
    PImage image;
    String widgetText;
    boolean noPic = false;

    
    Widget(int  x,  int  y, int event, PImage taxiImage)  
    {  
        this.x=x;  
        this.y=y;   
        this.event=event;  
        image = taxiImage;
    } 
   Widget (int x, int y, int widgetWidth, int widgetHeight, String widgetText, color widgetColor, int event)
  {
        this.x=x;  
        this.y=y;   
        this.event=event;
        this.width = widgetWidth;
        this. height = widgetHeight;
        this.widgetColor = widgetColor;
        this.widgetText = widgetText;
        noPic = true;     
  } 
      
    void  draw()
    {  
      if(noPic)
      {
        //white outline if mouse is over the widget
        if (mouseX > x && mouseX < x+width && mouseY > y && mouseY < y+height)
         {
           stroke(WHITE);
         }
         else
         {
           noStroke();
         }
         fill(widgetColor);
         rect(x, y, width, height);
         fill(0);
         text(widgetText, x+width/8+5, y+height/2+3); 
         
         
      }
      else if (currentScreen == 1)
      {
        image(image, x, y,300,150);
      }
            
      else
      {
         image(taxiImageMainMenu, x, y,300,150);
      }
      
      
    }  
    
    int getEvent(int mX, int mY)
    {  
      if(noPic)
      {
        if(mX>x && mX<x+width && mY>y && mY<y+height)
          return event;
      }
      else
      {
        if(mX>x && mX<x+taxiImageBarChart.width && mY>y && mY<y+taxiImageBarChart.height)
        {  
            return  event;  
        }
      }
        return  EVENT_NULL;  
    }  
    
  

}
