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
   arr1__array_pointer dd 0
   arr1_len dd 4
   booleanArray1__array_pointer db 0
   booleanArray1_len dd 4
; Global variable END

   print_format db "%d ", 0

data ends

text segment

arr1 = -8 ; size = 4
booleanArray1 = -12 ; size = 1
c1 = -13 ; size = 4
arg_n2 = 8 ; size = 4

print PROC
   enter 4, 0
   push eax
   mov eax, [ebp + 8]
   invoke crt_printf, offset print_format, eax
   pop eax
   leave
   ret 4
print ENDP

__start:

   enter 20, 0
   push eax
   push ebx
   push 16
   call crt_malloc
   mov arr1__array_pointer, eax
   mov ebx, eax
   mov DWORD PTR [ebx], 7
   add ebx, 4
   mov DWORD PTR [ebx], 5
   add ebx, 4
   mov DWORD PTR [ebx], 6
   add ebx, 4
   mov DWORD PTR [ebx], 10
   pop eax
   pop ebx
   push arr1__array_pointer
   push eax
   push ebx
   push 4
   call crt_malloc
   mov booleanArray1__array_pointer, eax
   mov ebx, eax
   mov BYTE PTR [ebx], 1
   add ebx, 1
   mov BYTE PTR [ebx], 0
   add ebx, 1
   mov BYTE PTR [ebx], 1
   add ebx, 1
   mov BYTE PTR [ebx], 1
   pop eax
   pop ebx
   push booleanArray1__array_pointer
   pop eax
   mov arr1[ebp], eax
   pop eax
   mov booleanArray1[ebp], eax
   push arr1__array_pointer
   pop eax
   mov edi, eax
   push 2
   pop ebx
   imul ebx, 4
   add edi, ebx
   push DWORD PTR [edi]
   pop eax
   mov c1[ebp], eax

   ; init stack for print
   push c1[ebp]
   ; call print
   call print


   leave

   push 0
   call ExitProcess

   ret

text ends

end __start

