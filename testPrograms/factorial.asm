.586
.model flat, stdcall

include <\masm32\include\msvcrt.inc>
include <\masm32\include\kernel32.inc>
includelib <\masm32\lib\msvcrt.lib>
includelib <\masm32\lib\kernel32.lib>

data segment

   string_const_0 db "Enter number: ",0
   string_const_1 db "Enter number less 11!",13,10,0
   string_const_2 db "Result: ",0
   div_operand_1 dd 0
   div_operand_2 dd 0

; Global variable START
   num1 dd 0
; Global variable END

   input_format db "%d", 0
   input_result dd 0
   println_format db "%s", 0
   print_format db "%d ", 0

data ends

text segment

arg_n5 = 8 ; size = 4
arg_n8 = 8 ; size = 4
arg_a11 = 8 ; size = 4

input PROC
   enter 0, 0
   push eax
   push ebx
   push ecx
   push edx
   invoke crt_scanf, offset input_format, offset input_result
   mov eax, input_result
   pop eax
   pop ebx
   pop ecx
   pop edx
   leave
   ret 
input ENDP
println PROC
   enter 0, 0
   push eax
   push ebx
   push ecx
   push edx
   mov eax, [ebp + 8]
   invoke crt_printf, offset println_format, eax
   pop eax
   pop ebx
   pop ecx
   pop edx
   leave
   ret 4
println ENDP
print PROC
   enter 0, 0
   push eax
   push ebx
   push ecx
   push edx
   mov eax, [ebp + 8]
   invoke crt_printf, offset print_format, eax
   pop eax
   pop ebx
   pop ecx
   pop edx
   leave
   ret 4
print ENDP
factorial PROC
   enter 0, 0
   push arg_a11[ebp]
   pop ecx
   push 2
   pop edx
   cmp ecx, edx
   jge _compare_not_equal146409374434802
   push 1
   jmp _compare_end146409374434802
_compare_not_equal146409374434802:
   push 0
_compare_end146409374434802:
   pop eax
   cmp eax, 0
   je _if_end_15
_if_start_15:
   push 1
   pop eax
   leave
   ret 4
_if_end_15:
   push arg_a11[ebp]

   ; init stack for factorial
   push arg_a11[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   ; call factorial
   call factorial

   push eax
   pop eax
   pop ebx
   imul eax, ebx
   push eax
   pop eax
   leave
   ret 4
   leave
   ret 4
factorial ENDP

__start:

   enter 0, 0
_loop_start_18:
_loop_aftereffects_18:

   ; init stack for println
   push offset string_const_0
   ; call println
   call println


   ; init stack for input
   ; call input
   call input

   push eax
   pop eax
   mov num1, eax
   push num1
   pop ecx
   push 10
   pop edx
   cmp ecx, edx
   jle _compare_not_equal146409375683550
   push 1
   jmp _compare_end146409375683550
_compare_not_equal146409375683550:
   push 0
_compare_end146409375683550:
   pop eax
   cmp eax, 0
   je _if_else_21
_if_start_21:

   ; init stack for println
   push offset string_const_1
   ; call println
   call println

   jmp _if_end_21
_if_else_21:

   ; init stack for println
   push offset string_const_2
   ; call println
   call println


   ; init stack for print

   ; init stack for factorial
   push num1
   ; call factorial
   call factorial

   push eax
   ; call print
   call print

   jmp _loop_end_18
_if_end_21:
   push num1
   pop ecx
   push 10
   pop edx
   cmp ecx, edx
   jle _compare_not_equal146409376649618
   push 1
   jmp _compare_end146409376649618
_compare_not_equal146409376649618:
   push 0
_compare_end146409376649618:
   pop eax
   cmp eax, 0
   je _loop_end_18
   jmp _loop_start_18
_loop_end_18:

   leave

   ret

text ends

end __start

