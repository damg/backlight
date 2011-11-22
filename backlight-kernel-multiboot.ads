-- Backlight OS
-- Copyright (C) 2011 Dmitri Bachtin <d.bachtin@gmail.com>

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.

pragma No_Run_Time ;

package Backlight.Kernel.Multiboot is
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
end Backlight.Kernel.Multiboot;
