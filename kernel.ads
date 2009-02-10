pragma No_Run_Time ;

with Multiboot;
use Multiboot;

package Kernel is
   procedure Main(Mb_Info : Multiboot_Info;
                  Mb_Magic : Dword);
   pragma Export(C, Main, "kmain");
end Kernel;
