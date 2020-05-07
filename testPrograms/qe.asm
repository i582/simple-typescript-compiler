.586
.model flat, stdcall

include <\masm32\include\msvcrt.inc>
include <\masm32\include\kernel32.inc>
includelib <\masm32\lib\msvcrt.lib>
includelib <\masm32\lib\kernel32.lib>

data segment

   string_const_0 db "Enter a: ",0
   string_const_1 db "Enter b: ",0
   string_const_2 db "Enter c: ",0
   string_const_3 db 13,10,0
   string_const_4 db "Answer: ",0
   string_const_5 db "x1 = ",0
   string_const_6 db "x2 = ",0
   string_const_7 db "D = ",0
   string_const_8 db 13,10,0
   string_const_9 db "D < 0. Not root. ",0
   string_const_10 db "D = ",0
   div_operand_1 dd 0
   div_operand_2 dd 0

; Global variable START
   a1 dd 0
   b1 dd 0
   c1 dd 0
   x1 dd 0
   D1 dd 0
   n8_arr dd 0 dup (0)
   n8 dd offset n8_arr
   str14_arr dd 0 dup (0)
   str14 dd offset str14_arr
; Global variable END

   sqrt_result dd 0
   input_format db "%d", 0
   input_result dd 0
   println_format db "%s", 0
   print_format db "%d ", 0

data ends

text segment

arg_x2 = 8 ; size = 4
arg_n8 = 8 ; size = 1
arg_n11 = 8 ; size = 4
arg_str14 = 8 ; size = 1
arg_num14 = 9 ; size = 4

sqrt PROC
   enter 0, 0
   mov eax, [ebp + 8]
   mov sqrt_result, eax
   finit
   fild sqrt_result
   fsqrt
   fist sqrt_result
   mov eax, sqrt_result
   leave
   ret 4
sqrt ENDP
input PROC
   enter 0, 0
   invoke crt_scanf, offset input_format, offset input_result
   mov eax, input_result
   leave
   ret 
input ENDP
println PROC
   enter 0, 0
   mov eax, [ebp + 8]
   invoke crt_printf, offset println_format, eax
   leave
   ret 4
println ENDP
print PROC
   enter 0, 0
   mov eax, [ebp + 8]
   invoke crt_printf, offset print_format, eax
   leave
   ret 4
print ENDP
print_n PROC
   enter 0, 0

   ; init stack for println
   push arg_str14[ebp]
   ; call println
   call println


   ; init stack for print
   push arg_num14[ebp]
   ; call print
   call print

   leave
   ret 5
print_n ENDP

__start:

   enter 0, 0

   ; init stack for println
   push offset string_const_0
   ; call println
   call println


   ; init stack for input
   ; call input
   call input

   push eax
   pop eax
   mov a1, eax

   ; init stack for println
   push offset string_const_1
   ; call println
   call println


   ; init stack for input
   ; call input
   call input

   push eax
   pop eax
   mov b1, eax

   ; init stack for println
   push offset string_const_2
   ; call println
   call println


   ; init stack for input
   ; call input
   call input

   push eax
   pop eax
   mov c1, eax

   ; init stack for println
   push offset string_const_3
   ; call println
   call println

   push 0
   pop eax
   mov x1, eax
   push b1
   push b1
   pop eax
   pop ebx
   imul eax, ebx
   push eax
   push 4
   push a1
   push c1
   pop eax
   pop ebx
   imul eax, ebx
   push eax
   pop eax
   pop ebx
   imul eax, ebx
   push eax
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov D1, eax
   push D1
   pop ecx
   push 0
   pop edx
   cmp ecx, edx
   jl _compare_not_equal1050901762359601
   push 1
   jmp _compare_end1050901762359601
_compare_not_equal1050901762359601:
   push 0
_compare_end1050901762359601:
   pop eax
   cmp eax, 0
   je _if_else_18
_if_start_18:

   ; init stack for println
   push offset string_const_4
   ; call println
   call println

   push 1
   pop eax
   imul eax, -1
   push eax
   push b1
   pop eax
   pop ebx
   imul eax, ebx
   push eax

   ; init stack for sqrt
   push D1
   ; call sqrt
   call sqrt

   push eax
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
   push a1
   pop eax
   pop ebx
   imul eax, ebx
   push eax
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop eax
   mov x1, eax

   ; init stack for print_n
   push x1
   push offset string_const_5
   ; call print_n
   call print_n

   push 1
   pop eax
   imul eax, -1
   push eax
   push b1
   pop eax
   pop ebx
   imul eax, ebx
   push eax

   ; init stack for sqrt
   push D1
   ; call sqrt
   call sqrt

   push eax
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   push 2
   push a1
   pop eax
   pop ebx
   imul eax, ebx
   push eax
   pop ebx
   pop eax
   mov div_operand_1, eax
   mov div_operand_2, ebx
   finit
   fild div_operand_2
   fild div_operand_1
   fdiv st(0), st(1)
   fist div_operand_1
   push div_operand_1
   pop eax
   mov x1, eax

   ; init stack for print_n
   push x1
   push offset string_const_6
   ; call print_n
   call print_n


   ; init stack for print_n
   push D1
   push offset string_const_7
   ; call print_n
   call print_n


   ; init stack for println
   push offset string_const_8
   ; call println
   call println

   jmp _if_end_18
_if_else_18:

   ; init stack for println
   push offset string_const_9
   ; call println
   call println


   ; init stack for print_n
   push D1
   push offset string_const_10
   ; call print_n
   call print_n

_if_end_18:

   leave

   ret

text ends

end __start

