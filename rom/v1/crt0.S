/*
 * Sample crt0.S startup file.
 *
 * IMPORTANT: THIS FILE NEEDS A LINKER SCRIPT WHICH DEFINES THE NEEDED
 *            SYMBOLS __s_bss, __e_bss, __s_data, __e_data, __e_text
 */

                .text
                

/*
 *        This is the reset code.
 *        It copies the startup data into the RAM (.data section)
 *        and clears the bss.
 */
                .globl        ___main
startup:
___main:         lea.l        __s_bss,%a0        /* Clear bss */
                move.l        #__e_bss,%d0
1:                cmp.l        %d0,%a0
                beq.s        2f
                clr.b        (%a0)+
                bra.s        1b
2:
                lea.l        __e_text,%a0        /* Move data to ram */
                lea.l        __s_data,%a1
                move.l        #__e_data,%d0
1:                cmp.l        %a1,%d0
                beq.s        2f
                move.b        (%a0)+,(%a1)+
                bra.s        1b
2:
                clr.l        -(%sp)                /* **envp is null     */
                clr.l        -(%sp)                /* **argv is null     */
                clr.l        -(%sp)                /* argc is zero, too  */
                jsr        main                /* Call the C-program */
                lea        12(%sp),%sp        /* Clean up the stack 3*4 */
/*
 * main usually should not return. If it does anyway, halt the system.
 */
halt:                bra halt
