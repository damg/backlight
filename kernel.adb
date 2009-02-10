pragma No_Run_Time ;

with System;
with Kernel.Stdlib;
with Kernel.Video.Cga;

package body Kernel is

   procedure Main(Mb_Info : Multiboot_Info;
                  Mb_Magic : Dword) is
   begin
      Kernel.Video.Cga.Clear_Video_Memory;
      loop
         null;
      end loop;
   end Main;

end Kernel;
