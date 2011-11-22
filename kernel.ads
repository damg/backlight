pragma No_Run_Time ;

with Multiboot;
use Multiboot;

package Kernel is
   procedure K_Main(Mb_Info : Multiboot_Info;
		    Mb_Magic : Dword);
   pragma Export(C, K_Main, "kmain");
end Kernel;
