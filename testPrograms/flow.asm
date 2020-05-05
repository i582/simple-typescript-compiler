.586
.model flat, stdcall

include <\masm32\include\msvcrt.inc>
include <\masm32\include\kernel32.inc>
includelib <\masm32\lib\msvcrt.lib>
includelib <\masm32\lib\kernel32.lib>

data segment

   div_operand_1 dd 0
   div_operand_2 dd 0

; Global variable START
   b1 dd 0
   c1 dd 0
   d1 dd 0
; Global variable END


data ends

text segment



__start:

   enter 0, 0
   push 100
   pop eax
   mov b1, eax
   push 100
   pop eax
   mov c1, eax
   push b1
   push c1
   push 146
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov d1, eax
   push d1
   pop ecx
   push 500
   pop edx
   cmp ecx, edx
   jle _compare_not_equal953318523611581
   push 1
   jmp _compare_end953318523611581
_compare_not_equal953318523611581:
   push 0
_compare_end953318523611581:
   pop eax
   cmp eax, 0
   je _if_else_3
_if_start_3:
   push 100
   pop eax
   mov d1, eax
   jmp _if_end_3
_if_else_3:
   push 0
   pop eax
   mov d1, eax
_if_end_3:

   leave

   ret

text ends

end __start

