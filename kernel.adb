pragma No_Run_Time ;

with System;

package body Kernel is

   procedure K_Main(Mb_Info : Multiboot_Info;
		    Mb_Magic : Dword) is
   begin
      loop
         null;
      end loop;
   end K_Main;

end Kernel;
