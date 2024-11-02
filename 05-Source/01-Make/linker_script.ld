### Example Linker Script: linkerscript.Load



/* Define memory regions */
MEMORY
{
    FLASH (rx) : ORIGIN = 0x00000000, LENGTH = 512K  /* Adjust size as necessary */
    RAM (rw) : ORIGIN = 0x20000000, LENGTH = 128K   /* Adjust size as necessary */
}

/* Define the entry point of the program */
ENTRY(main)

/* Specify the sections */
SECTIONS
{
    /* This section is for the bootloader or interrupt vector table */
    .isr_vector :
    {
        KEEP(*(.isr_vector))  /* Keep the interrupt vector table */
    } > FLASH

    /* This section is for the .text (code) */
    .text :
    {
        *(.text)               /* All .text sections from all object files */
        *(.text*)              /* Include any .text* sections */
        KEEP(*(.init))         /* Initialization routines */
        KEEP(*(.fini))         /* Finalization routines */
    } > FLASH

    /* This section is for initialized data */
    .data :
    {
        *(.data)               /* All .data sections */
    } > RAM AT > FLASH  /* Load in FLASH but run in RAM */

    /* This section is for uninitialized data */
    .bss :
    {
        *(.bss)                /* All .bss sections */
        *(COMMON)              /* All common symbols */
    } > RAM

    /* Stack and heap */
    . = ALIGN(4);           /* Align to 4 bytes */
    .stack (NOLOAD) : 
    {
        . = . + 0x4000;       /* Stack size: 2KB */
    } > RAM

    .heap (NOLOAD) :
    {
        . = . + 0x4000;      /* Heap size: 32KB */
    } > RAM
}