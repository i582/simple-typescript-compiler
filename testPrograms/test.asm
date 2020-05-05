.586
.model flat, stdcall

include <\masm32\include\msvcrt.inc>
include <\masm32\include\kernel32.inc>
includelib <\masm32\lib\msvcrt.lib>
includelib <\masm32\lib\kernel32.lib>

data segment

   string_const_0 db 13,10,0
   div_operand_1 dd 0
   div_operand_2 dd 0

; Global variable START
   size1 dd 0
   b1 dd 0
   array10_arr dd 0 dup (0)
   array10 dd offset array10_arr
   array13_arr dd 0 dup (0)
   array13 dd offset array13_arr
   array32_arr dd 0 dup (0)
   array32 dd offset array32_arr
   array42_arr dd 0 dup (0)
   array42 dd offset array42_arr
   array1_arr dd 98,69,0,4,41,57,35,15,7,63,2,43,33,56,24,77,73,30,38,47
   array1 dd offset array1_arr
; Global variable END

   print_format db "%d ", 0
   println_format db "%s", 0

data ends

text segment

left18 = -4 ; size = 4
right18 = -8 ; size = 4
middle18 = -12 ; size = 4
tmp31 = -16 ; size = 4
i35 = -4 ; size = 4
i45 = -4 ; size = 4
j49 = -8 ; size = 4
temp55 = -12 ; size = 4
arg_a2 = 8 ; size = 4
arg_n7 = 8 ; size = 4
arg_array10 = 8 ; size = 4
arg_size10 = 12 ; size = 4
arg_array13 = 8 ; size = 4
arg_first13 = 12 ; size = 4
arg_last13 = 16 ; size = 4
arg_array32 = 8 ; size = 4
arg_size32 = 12 ; size = 4
arg_n39 = 8 ; size = 4
arg_array42 = 8 ; size = 4
arg_size42 = 12 ; size = 4

print PROC
   enter 0, 0
   mov eax, [ebp + 8]
   invoke crt_printf, offset print_format, eax
   leave
   ret 4
print ENDP
println PROC
   enter 0, 0
   mov eax, [ebp + 8]
   invoke crt_printf, offset println_format, eax
   leave
   ret 4
println ENDP
factorial PROC
   enter 0, 0
   push arg_a2[ebp]
   pop ecx
   push 2
   pop edx
   cmp ecx, edx
   jge _compare_not_equal943589184337719
   push 1
   jmp _compare_end943589184337719
_compare_not_equal943589184337719:
   push 0
_compare_end943589184337719:
   pop eax
   cmp eax, 0
   je _if_end_6
_if_start_6:
   push 1
   pop eax
   leave
   ret 4
_if_end_6:
   push arg_a2[ebp]

   ; init stack for factorial
   push arg_a2[ebp]
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
quickSort PROC
   enter 0, 0

   ; init stack for quickSortHide
   push arg_size10[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   push 0
   push arg_array10[ebp]
   ; call quickSortHide
   call quickSortHide

   leave
   ret 8
quickSort ENDP
quickSortHide PROC
   enter 0, 16
   push arg_first13[ebp]
   pop ecx
   push arg_last13[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal943589184373214
   push 1
   jmp _compare_end943589184373214
_compare_not_equal943589184373214:
   push 0
_compare_end943589184373214:
   pop eax
   cmp eax, 0
   je _if_end_17
_if_start_17:
   push arg_first13[ebp]
   pop eax
   mov left18[ebp], eax
   push arg_last13[ebp]
   pop eax
   mov right18[ebp], eax
   push left18[ebp]
   push right18[ebp]
   pop eax
   pop ebx
   add eax, ebx
   push eax
   push 2
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
   pop edx
   imul edx, 4
   mov esi, arg_array13[ebp]
   push [esi[edx]]
   pop eax
   mov middle18[ebp], eax
_loop_start_21:
_loop_aftereffects_21:
_loop_start_25:
_loop_aftereffects_25:
   push left18[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_array13[ebp]
   push [esi[edx]]
   pop ecx
   push middle18[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal943589184400156
   push 1
   jmp _compare_end943589184400156
_compare_not_equal943589184400156:
   push 0
_compare_end943589184400156:
   pop eax
   cmp eax, 0
   je _loop_end_25
   push left18[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left18[ebp], eax
   jmp _loop_start_25
_loop_end_25:
_loop_start_28:
_loop_aftereffects_28:
   push right18[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_array13[ebp]
   push [esi[edx]]
   pop ecx
   push middle18[ebp]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal943589184417262
   push 1
   jmp _compare_end943589184417262
_compare_not_equal943589184417262:
   push 0
_compare_end943589184417262:
   pop eax
   cmp eax, 0
   je _loop_end_28
   push right18[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right18[ebp], eax
   jmp _loop_start_28
_loop_end_28:
   push left18[ebp]
   pop ecx
   push right18[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal943589184425388
   push 1
   jmp _compare_end943589184425388
_compare_not_equal943589184425388:
   push 0
_compare_end943589184425388:
   pop eax
   cmp eax, 0
   je _if_end_30
_if_start_30:
   push left18[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_array13[ebp]
   push [esi[edx]]
   pop eax
   mov tmp31[ebp], eax
   push right18[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_array13[ebp]
   push [esi[edx]]
   pop edx
   push left18[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_array13[ebp]
   add esi, ecx
   mov [esi], edx
   push tmp31[ebp]
   pop edx
   push right18[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_array13[ebp]
   add esi, ecx
   mov [esi], edx
   push left18[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov left18[ebp], eax
   push right18[ebp]
   push 1
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop eax
   mov right18[ebp], eax
_if_end_30:
   push left18[ebp]
   pop ecx
   push right18[ebp]
   pop edx
   cmp ecx, edx
   jg _compare_not_equal943589184443777
   push 1
   jmp _compare_end943589184443777
_compare_not_equal943589184443777:
   push 0
_compare_end943589184443777:
   pop eax
   cmp eax, 0
   je _loop_end_21
   jmp _loop_start_21
_loop_end_21:

   ; init stack for quickSortHide
   push right18[ebp]
   push arg_first13[ebp]
   push arg_array13[ebp]
   ; call quickSortHide
   call quickSortHide


   ; init stack for quickSortHide
   push arg_last13[ebp]
   push left18[ebp]
   push arg_array13[ebp]
   ; call quickSortHide
   call quickSortHide

_if_end_17:
   leave
   ret 12
quickSortHide ENDP
printArray PROC
   enter 0, 4
   push 0
   pop eax
   mov i35[ebp], eax
_loop_start_37:
   push i35[ebp]
   pop ecx
   push arg_size32[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal943589184462594
   push 1
   jmp _compare_end943589184462594
_compare_not_equal943589184462594:
   push 0
_compare_end943589184462594:
   pop eax
   cmp eax, 0
   je _loop_end_37

   ; init stack for print
   push i35[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_array32[ebp]
   push [esi[edx]]
   ; call print
   call print

_loop_aftereffects_37:
   push i35[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov i35[ebp], eax
   jmp _loop_start_37
_loop_end_37:

   ; init stack for println
   push offset string_const_0
   ; call println
   call println

   leave
   ret 8
printArray ENDP
bubbleSort PROC
   enter 0, 12
   push 1
   pop eax
   mov i45[ebp], eax
_loop_start_47:
   push i45[ebp]
   pop ecx
   push arg_size42[ebp]
   pop edx
   cmp ecx, edx
   jge _compare_not_equal943589184492957
   push 1
   jmp _compare_end943589184492957
_compare_not_equal943589184492957:
   push 0
_compare_end943589184492957:
   pop eax
   cmp eax, 0
   je _loop_end_47
   push 0
   pop eax
   mov j49[ebp], eax
_loop_start_51:
   push j49[ebp]
   pop ecx
   push arg_size42[ebp]
   push i45[ebp]
   pop ebx
   pop eax
   sub eax, ebx
   push eax
   pop edx
   cmp ecx, edx
   jge _compare_not_equal943589184498516
   push 1
   jmp _compare_end943589184498516
_compare_not_equal943589184498516:
   push 0
_compare_end943589184498516:
   pop eax
   cmp eax, 0
   je _loop_end_51
   push j49[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_array42[ebp]
   push [esi[edx]]
   pop ecx
   push j49[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop edx
   imul edx, 4
   mov esi, arg_array42[ebp]
   push [esi[edx]]
   pop edx
   cmp ecx, edx
   jle _compare_not_equal943589184504076
   push 1
   jmp _compare_end943589184504076
_compare_not_equal943589184504076:
   push 0
_compare_end943589184504076:
   pop eax
   cmp eax, 0
   je _if_end_54
_if_start_54:
   push j49[ebp]
   pop edx
   imul edx, 4
   mov esi, arg_array42[ebp]
   push [esi[edx]]
   pop eax
   mov temp55[ebp], eax
   push j49[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop edx
   imul edx, 4
   mov esi, arg_array42[ebp]
   push [esi[edx]]
   pop edx
   push j49[ebp]
   pop ecx
   imul ecx, 4
   mov esi, arg_array42[ebp]
   add esi, ecx
   mov [esi], edx
   push temp55[ebp]
   pop edx
   push j49[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop ecx
   imul ecx, 4
   mov esi, arg_array42[ebp]
   add esi, ecx
   mov [esi], edx
_if_end_54:
_loop_aftereffects_51:
   push j49[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov j49[ebp], eax
   jmp _loop_start_51
_loop_end_51:
_loop_aftereffects_47:
   push i45[ebp]
   push 1
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov i45[ebp], eax
   jmp _loop_start_47
_loop_end_47:
   leave
   ret 8
bubbleSort ENDP

__start:

   enter 0, 0
   push 20
   pop eax
   mov size1, eax

   ; init stack for printArray
   push size1
   push array1
   ; call printArray
   call printArray


   ; init stack for quickSort
   push 20
   push array1
   ; call quickSort
   call quickSort


   ; init stack for printArray
   push size1
   push array1
   ; call printArray
   call printArray

   push size1
   push 45
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov b1, eax

   ; init stack for print

   ; init stack for factorial
   push 5
   ; call factorial
   call factorial

   push eax
   ; call print
   call print


   leave

   ret

text ends

end __start

