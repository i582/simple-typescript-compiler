.586
.model flat, stdcall

include <\masm32\include\msvcrt.inc>
include <\masm32\include\kernel32.inc>
includelib <\masm32\lib\msvcrt.lib>
includelib <\masm32\lib\kernel32.lib>

data segment

   string_const_0 db "Hello",0
   string_const_1 db "101",0
   string_const_2 db 13,10,0
   string_const_3 db 13,10,0
   string_const_4 db 13,10,0
   string_const_5 db " has length equal ",0
   div_operand_1 dd 0
   div_operand_2 dd 0

; Global variable START
; Global variable END

   println_format db "%s", 0
   print_format db "%d ", 0

data ends

text segment

age1 = -8 ; size = 4
string11 = -12 ; size = 4
str1 = -16 ; size = 4
arg_n2 = 8 ; size = 4
arg_n5 = 8 ; size = 4
arg_num8 = 8 ; size = 4
arg_radix8 = 12 ; size = 4
arg_str11 = 8 ; size = 4
arg_start11 = 12 ; size = 4
arg_end11 = 16 ; size = 4
arg_str14 = 8 ; size = 4
arg_str17 = 8 ; size = 4
arg_str120 = 8 ; size = 4
arg_str220 = 12 ; size = 4

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
toString PROC
   enter 0, 0

   push ebx
   push ecx
   push edx
   push 20
   call crt_malloc
   mov ebx, eax
    
   push [ebp + 12]
   push ebx
   push [ebp + 8]
   call crt__itoa

   pop ebx
   pop ecx
   pop edx
   leave
   ret 8
toString ENDP
slice PROC
   enter 0, 0

   push ebx
   push ecx
   push edx
   cmp DWORD PTR [ebp + 8], 0
   je _error_end ; передан нулевой указатель

   push [ebp + 8]
   call crt_strlen
   mov edx, eax ; в edx теперь хранится длина строки

   mov eax, DWORD PTR [ebp + 12]
   mov ebx, DWORD PTR [ebp + 16]
   cmp eax, ebx
   jg _swap_start_and_end
   jl _no_swap_start_and_end

_swap_start_and_end:
   mov eax, DWORD PTR [ebp + 12]
   mov ebx, DWORD PTR [ebp + 16]
   
   mov DWORD PTR [ebp + 12], ebx
   mov DWORD PTR [ebp + 16], eax


_no_swap_start_and_end:
   mov eax, DWORD PTR [ebp + 12]
   cmp eax, 0
   jl _error_end ; если начало меньше ноля

   mov eax, DWORD PTR [ebp + 12]
   cmp eax, edx
   jg _error_end ; если начало больше или равен длине строки

   mov eax, DWORD PTR [ebp + 12]
   cmp eax, 0
   jl _error_end ; если конец меньше ноля

   cmp [ebp + 16], edx
   jg _error_end ; если конец больше или равен длине строки

   push edx

   mov ebx, [ebp + 16]
   sub ebx, [ebp + 12] ; находим длину среза
   add ebx, 1 ; добавляем место для нуля-терминатора

   push ebx

   push ebx
   call crt_calloc ; выделяем память под срех
   push eax ; сохраняем указатель на память в стеке
   
   pop ecx ; указатель на память
   pop ebx ; длина среза
   
 
   mov edx, DWORD PTR [ebp + 8]
   add edx, DWORD PTR [ebp + 12]
   sub edx, 0 ; вычитаем 1, чтобы начать с нужного символа

   push ebx
   push edx
   push ecx
   call crt_strncpy
   push eax


   add eax, ebx
   mov DWORD PTR [eax], 0
   pop eax

   pop ebx
   pop ecx
   pop edx
   leave
   ret 12

_error_end:
   mov eax, 0

   pop ebx
   pop ecx
   pop edx
   leave
   ret 12
slice ENDP
toNumber PROC
   enter 0, 0

   push ebx
   push ecx
   push edx

   push [ebp + 8]
   call crt_atoi


   pop ebx
   pop ecx
   pop edx

   leave
   ret 4
toNumber ENDP
strlen PROC
   enter 0, 0

   push ebx
   push ecx
   push edx
   push DWORD PTR [ebp + 8]
   call crt_strlen

   pop ebx
   pop ecx
   pop edx
   leave
   ret 4
strlen ENDP
concat PROC
   enter 0, 0

   push ebx
   push ecx
   push edx
   mov ecx, [ebp + 8] ; указатель на первую строку
   mov edx, [ebp + 12] ; указатель на вторую строку

   push [ebp + 8]
   call crt_strlen
   push eax ; узнаем длину первой строки и помещаем ее в стек


   push [ebp + 12]
   call crt_strlen
   push eax ; узнаем длину второй строки и помещаем ее в стек


   pop ecx
   pop edx
   add ecx, edx ; узнаем общую длину строк
   add ecx, 1 ; добавляем место под нуль-терминатор
   push ecx


   call crt_malloc ; выделяем память под строку
   push eax ; сохраняем указатель на память в стеке


   pop eax
   push [ebp + 8] ; указатель на строку, которая копируется (1 строка)
   push eax ; указатель на начало выделенной памяти
   call crt_strcat ; копируем
   push eax

   pop eax
   push [ebp + 12] ; указатель на строку, которая копируется (2 строка)
   push eax ; указатель на начало выделенной памяти
   call crt_strcat ; копируем
   push eax
   pop eax

   ; теперь в ecx лежит строка содержащая объединенные две входные строки


   pop ebx
   pop ecx
   pop edx
   leave
   ret 8
concat ENDP

__start:

   enter 60, 0
   push 5
   push 7
   pop eax
   pop ebx
   add eax, ebx
   push eax
   pop eax
   mov age1[ebp], eax
   push offset string_const_0
   pop eax
   mov string11[ebp], eax

   ; init stack for print
   push 100
   ; call print
   call print

   push offset string_const_1
   pop eax
   mov str1[ebp], eax

   ; init stack for print

   ; init stack for toNumber
   push str1[ebp]
   ; call toNumber
   call toNumber

   push eax
   ; call print
   call print


   ; init stack for println

   ; init stack for concat
   push offset string_const_2

   ; init stack for toString
   push 10

   ; init stack for strlen

   ; init stack for slice
   push 4
   push 0
   push string11[ebp]
   ; call slice
   call slice

   push eax
   ; call strlen
   call strlen

   push eax
   ; call toString
   call toString

   push eax
   ; call concat
   call concat

   push eax
   ; call println
   call println


   ; init stack for println

   ; init stack for concat
   push offset string_const_3
   push string11[ebp]
   ; call concat
   call concat

   push eax
   ; call println
   call println


   ; init stack for print
   push age1[ebp]
   ; call print
   call print


   ; init stack for println
   push offset string_const_4
   ; call println
   call println


   ; init stack for println
   push string11[ebp]
   ; call println
   call println


   ; init stack for println
   push offset string_const_5
   ; call println
   call println


   ; init stack for print

   ; init stack for strlen
   push string11[ebp]
   ; call strlen
   call strlen

   push eax
   ; call print
   call print


   leave

   push 0
   call ExitProcess

   ret

text ends

end __start

