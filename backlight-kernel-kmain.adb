pragma No_Run_Time ;

with System;

package body Backlight.Kernel.Kmain is

   procedure Kmain(Mb_Info : Multiboot_Info;
		    Mb_Magic : Dword) is
   begin
      loop
         null;
      end loop;
   end Kmain;

end Backlight.Kernel.Kmain;
