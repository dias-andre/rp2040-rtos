.syntax unified
.cpu cortex-m33
.thumb

.type kernel_main, %function

.section .text.entry, "ax"
.global _start
.type _start, %function
.thumb_func
_start:
    ldr r0, =0x20082000
    mov sp, r0

copy_data:
    ldr r1, =_sidata
    ldr r2, =_sdata
    ldr r3, =_edata
.data_loop:
    cmp r2, r3
    bge zero_bss
    ldr r0, [r1]
    str r0, [r2]
    adds r1, #4
    adds r2, #4
    b .data_loop

zero_bss:
    ldr r1, =_sbss
    ldr r2, =_ebss
    movs r0, #0
.bss_loop:
    cmp r1, r2
    bge call_kernel
    str r0, [r1]
    adds r1, #4
    b .bss_loop

call_kernel:
    bl kernel_main

hang:
    b hang