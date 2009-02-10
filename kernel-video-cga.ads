pragma No_Run_Time;

with System;

package Kernel.Video.Cga is
   subtype Front_Color_Type is Integer range 0 .. 15;
   subtype Back_Color_Type is Integer range 0 .. 7;
   type Color_Type is record
      Front_Color : Front_Color_Type;
      Back_Color : Back_Color_Type;
      Blink : Boolean;
   end record;
   for Color_Type use
      record
         Front_Color at 0 range 0 .. 3;
         Back_Color at 0 range 4 .. 6;
         Blink at 0 range 7 .. 7;
      end record;
   for Color_Type'Size use 8;

   Color_Black : constant := 0;
   Color_Blue : constant := 1;
   Color_Green : constant := 2;
   Color_Cyan : constant := 3;
   Color_Red : constant := 4;
   Color_Magenta : constant := 5;
   Color_Brown : constant := 6;
   Color_Light_Gray : constant := 7;
   Color_Dark_Gray : constant := 8;
   Color_Light_Blue : constant := 9;
   Color_Light_Green : constant := 10;
   Color_Light_Cyan : constant := 11;
   Color_Light_Red : constant := 12;
   Color_Light_Magenta : constant := 13;
   Color_Yellow : constant := 14;
   Color_White : constant := 15;

   type Video_Memory_Cell is record
      Char : Character;
      Color : Color_Type;
   end record;
   for Video_Memory_Cell use
      record
         Char at 0 range 0 .. 7;
         Color at 1 range 0 .. 7;
      end record;
   for Video_Memory_Cell'Size use 16;

   Black_Video_Memory_Cell : constant Video_Memory_Cell := (Character'Val(0),
                                                            (Color_Black, Color_Black, False));
   Video_Page_Line_Width : constant := 80;
   Video_Page_Line_Count : constant := 25;
   Video_Page_Size : constant := Video_Page_Line_Width * Video_Page_Line_Count;
   Video_Page_Count : constant := 8;

   subtype Video_Page_X is Integer range 0 .. (Video_Page_Line_Width - 1);
   subtype Video_Page_Y is Integer range 0 .. (Video_Page_Line_Count - 1);
   subtype Video_Cell_Index is Integer range 0 .. (Video_Page_Size - 1);
   subtype Video_Page_Index is Integer range 0 .. (Video_Page_Count - 1);

   type Video_Page is array (Video_Cell_Index'Range) of Video_Memory_Cell;
   type Video_Memory is array (Video_Page_Index'Range) of Video_Page;

   procedure Fill_Video_Memory(Color : in Color_Type);
   procedure Fill_Page(Page : in Video_Page_Index;
                       Color : in Color_Type);
   -- Clears a page = fills with black and nulls characters
   procedure Clear_Page(Page : in Video_Page_Index);
   procedure Clear_Video_Memory;

   procedure Set_Video_Cell_Color(Page : in Video_Page_Index;
                                  X : in Video_Page_X;
                                  Y : in Video_Page_Y;
                                  Color : in Color_Type);
   procedure Set_Video_Cell_Character(Page : in Video_Page_Index;
                                      X : in Video_Page_X;
                                      Y : in Video_Page_Y;
                                      Char : in Character);
end Kernel.Video.Cga;
