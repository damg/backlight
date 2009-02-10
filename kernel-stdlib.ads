pragma No_Run_Time;

with System;

package Kernel.Stdlib is
   procedure Last_Chance_Handler (Source_Location : System.Address;
                                  Line : Integer);
   pragma Export(C, Last_Chance_Handler, "__gnat_last_chance_handler");
end Kernel.Stdlib;
