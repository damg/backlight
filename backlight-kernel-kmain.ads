pragma No_Run_Time ;

with Backlight.Kernel.Multiboot;
use Backlight.Kernel.Multiboot;

package Backlight.Kernel.Kmain is
   procedure Kmain(Mb_Info : Multiboot_Info;
		    Mb_Magic : Dword);
   pragma Export(C, Kmain, "kmain");
end Backlight.Kernel.Kmain;
