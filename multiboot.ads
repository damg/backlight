pragma No_Run_Time ;

package Multiboot is
   Kernel_Stacksize : constant := 16#4000#;
   Multiboot_Bootloader_Magic : constant := 16#2badb002#;

   type Dword is range 0 .. 16#FFFFFFFF#;
   type Elf_Section_Header_Table is record
      Num : Dword;
      Size : Dword;
      Addr : Dword;
      Shndx : Dword;
   end record;

   type Acc_Elf_Section_Header_Table is access Elf_Section_Header_Table;

   type Multiboot_Info is record
      Flags : Dword;
      Mem_Lower : Dword;
      Mem_Upper : Dword;
      Boot_Device : Dword;
      Cmdline : Dword;
      Mods_Count : Dword;
      Mods_Addr : Dword;
      Elf_Sec : Elf_Section_Header_Table;
      Mmap_Length : Dword;
      Mmap_Addr : Dword;
   end record;

   type Acc_Multiboot_Info is access Multiboot_Info;

   type Module is record
      Mod_Start : Dword;
      Mod_End : Dword;
      Name : Dword;
      Reserved : Dword;
   end record;

   type Acc_Module is access Module;

   type Memory_Map is record
      Size : Dword;
      Base_Addr_Low : Dword;
      Base_Addr_High : Dword;
      Length_Low : Dword;
      Length_High : Dword;
      Mtype : Dword;
   end record;

   type Acc_Memory_Map is access Memory_Map;
end Multiboot;
