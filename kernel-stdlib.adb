pragma No_Run_Time;
with System;
with Kernel.Video.Cga;

package body Kernel.Stdlib is

      procedure Last_Chance_Handler (Source_Location : System.Address;
                                     Line : Integer) is
         Red_Color_Blinking : constant Video.Cga.Color_Type :=
           (Video.Cga.Color_Red,
            Video.Cga.Color_Red,
            True);
      begin
         Video.Cga.Fill_Video_Memory(Red_Color_Blinking);
         Video.Cga.Set_Video_Cell_Character(0, 0, 0, 'E');
         Video.Cga.Set_Video_Cell_Character(0, 1, 0, 'r');
         Video.Cga.Set_Video_Cell_Character(0, 2, 0, 'r');
         Video.Cga.Set_Video_Cell_Character(0, 3, 0, 'o');
         Video.Cga.Set_Video_Cell_Character(0, 4, 0, 'r');
         loop
            null;
         end loop;
      end Last_Chance_Handler;
end Kernel.Stdlib;
