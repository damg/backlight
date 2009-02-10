ENTRY(kstart)
SECTIONS
{
  .text  0x100000 :
  {
    text = .; _text = .; __text = .;
    *(.text)
    . = ALIGN(4096);
  }
  .data  :
  {
    data = .; _data = .; __data = .;
    *(.data)
    kimage_text = .;
    LONG(text);
    kimage_data = .;
    LONG(data);
    kimage_bss = .;
    LONG(bss);
    kimage_end = .;
    LONG(end);
    . = ALIGN(4096);
  }
  .bss  :
  {
    bss = .; _bss = .; __bss = .;
    *(.bss)
    . = ALIGN(4096);
  }
  end = .; _end = .; __end = .;
}
