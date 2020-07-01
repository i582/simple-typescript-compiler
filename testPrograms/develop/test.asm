.586
.model flat, stdcall

include <\masm32\include\msvcrt.inc>
include <\masm32\include\kernel32.inc>
includelib <\masm32\lib\msvcrt.lib>
includelib <\masm32\lib\kernel32.lib>

data segment

   div_operand_1 dd 0
   div_operand_2 dd 0

   print_format db "%d ", 0

data ends

text segment


__start:

   enter 0, 0
   
   
   
   leave

   push 0
   call ExitProcess

   ret

text ends

end __start

