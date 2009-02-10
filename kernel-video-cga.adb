pragma No_Run_Time;

package body Kernel.Video.Cga is
   Video_Memory_Start : constant := 16#B8000#;
   Vidmem : aliased Video_Memory;
   for Vidmem'Address use System'To_Address(Video_Memory_Start);

   procedure Fill_Page(Page : in Video_Page_Index;
                       Color : in Color_Type) is
   begin
      for I in Vidmem(Page)'Range loop
         Vidmem(Page)(I) := (Character'Val(0),
                             Color);
      end loop;
   end Fill_Page;

   procedure Fill_Video_Memory(Color : in Color_Type) is
   begin
      for I in Vidmem'Range loop
         Fill_Page(I, Color);
      end loop;
   end Fill_Video_Memory;

   procedure Clear_Page(Page : in Video_Page_Index) is
   begin
      Fill_Page(Page, (Color_Black, Color_Black, False));
   end Clear_Page;

   procedure Clear_Video_Memory is
   begin
      Fill_Video_Memory((Color_Black, Color_Black, False));
   end Clear_Video_Memory;

   -- converts x-y coordinates to page index
   function Xy_To_Video_Cell_Index(X : in Video_Page_X;
                                   Y : in Video_Page_Y)
                                  return Video_Cell_Index is
   begin
      return X + Y*Video_Page_Line_Width;
   end Xy_To_Video_Cell_Index;

   procedure Set_Video_Cell_Color(Page : in Video_Page_Index;
                                  X : in Video_Page_X;
                                  Y : in Video_Page_Y;
                                  Color : in Color_Type) is
      Offset : Video_Cell_Index := Xy_To_Video_Cell_Index(X,Y);
   begin
      Vidmem(Page)(Offset).Color := Color;
   end Set_Video_Cell_Color;

   procedure Set_Video_Cell_Character(Page : in Video_Page_Index;
                                      X : in Video_Page_X;
                                      Y : in Video_Page_Y;
                                      Char : in Character) is
     Offset : Video_Cell_Index := Xy_To_Video_Cell_Index(X,Y);
   begin
      Vidmem(Page)(Offset).Char := Char;
   end Set_Video_Cell_Character;

end Kernel.Video.Cga;
