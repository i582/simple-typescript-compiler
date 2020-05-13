.686P
.XMM
.model flat, stdcall

include <\masm32\include\msvcrt.inc>
include <\masm32\include\kernel32.inc>
includelib <\masm32\lib\msvcrt.lib>
includelib <\masm32\lib\kernel32.lib>



data segment
   sqrt_result dd 0
   input_format db "%d", 0
   input_result dd 0
   println_format db "%s", 0
   print_format db "%d ", 0

   string db 100 dup(0)
   string_const_0 db "Hello ", 0
   string_const_1 db "World!!!", 0
   string_const_2 db "lsflo", 0

    string_number db "-023", 0 
string_number_f db "-023.56", 0 \

    inputln_format db "%s", 0
   inputln_aresult db 100 dup (0)
   inputln_result dd offset inputln_aresult

data ends

text segment

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
inputln PROC
   enter 0, 0
  
   push ebx
   push ecx
   push edx 

   push 10
   call crt_malloc ; выделяем память под строку
  

   invoke crt_scanf, offset inputln_format, eax
   
   
   pop ebx
   pop ecx
   pop edx
   leave
   ret 
inputln ENDP
print PROC
   enter 24, 0

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
println PROC
   enter 24, 0

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

; на стеке два указателя на начала строки
; если возвращается укаазатель на новую строку в eax
concatTwoString PROC
   enter 32, 0

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


   call crt_calloc ; выделяем память под строку
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


   leave
   ret 8
concatTwoString ENDP

; на стеке:
; указатель на строку
; начало среза
; конец среза
_str = 8
_start = 12
_end = 16
slice_raw PROC
   enter 0, 0

   cmp DWORD PTR _str[ebp], 0
   je _error_end ; передан нулевой указатель

   push _str[ebp]
   call crt_strlen
   mov edx, eax ; в edx теперь хранится длина строки

   mov eax, DWORD PTR _start[ebp]
   mov ebx, DWORD PTR _end[ebp]
   cmp eax, ebx
   jg _swap_start_and_end
   jl _no_swap_start_and_end

_swap_start_and_end:
   mov eax, DWORD PTR _start[ebp]
   mov ebx, DWORD PTR _end[ebp]
   
   mov DWORD PTR _start[ebp], ebx
   mov DWORD PTR _end[ebp], eax


_no_swap_start_and_end:
   mov eax, DWORD PTR _start[ebp]
   cmp eax, 0
   jl _error_end ; если начало меньше ноля

   mov eax, DWORD PTR _start[ebp]
   cmp eax, edx
   jge _error_end ; если начало больше или равен длине строки

   mov eax, DWORD PTR _start[ebp]
   cmp eax, 0
   jl _error_end ; если конец меньше ноля

   cmp _end[ebp], edx
   jge _error_end ; если конец больше или равен длине строки

   push edx

   mov ebx, _end[ebp]
   sub ebx, _start[ebp] ; находим длину среза
   add ebx, 1 ; добавляем место для нуля-терминатора

   push ebx

   push ebx
   call crt_calloc ; выделяем память под срех
   push eax ; сохраняем указатель на память в стеке
   
   pop ecx ; указатель на память
   pop ebx ; длина среза
   
 
   mov edx, DWORD PTR _str[ebp]
   add edx, DWORD PTR _start[ebp]

   push ebx
   push edx
   push ecx
   call crt_strncpy
   push eax

   add eax, ebx

   mov DWORD PTR [eax], 0

   pop eax

 
   leave
   ret 12

_error_end:
   mov eax, 0

   leave
   ret 12
slice_raw ENDP


_str = 8
_start = 12
_end = 16
slice PROC
   enter 0, 0

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
   sub edx, 1 ; вычитаем 1, чтобы начать с нужного символа

   push ebx
   push edx
   push ecx
   call crt_strncpy
   push eax


   add eax, ebx
   mov DWORD PTR [eax], 0
   pop eax

   leave
   ret 12

_error_end:
   mov eax, 0

   leave
   ret 12
slice ENDP

strlen PROC
   enter 0, 0

   push DWORD PTR [ebp + 8]
   call crt_strlen
   
   leave
   ret 8
strlen ENDP


at PROC
   enter 0, 0

   cmp DWORD PTR [ebp + 8], 0
   je _error_end ; передан нулевой указатель

   push DWORD PTR [ebp + 8]
   call crt_strlen
   mov edx, eax ; в edx теперь хранится длина строки

   mov eax, DWORD PTR [ebp + 12]
   cmp eax, 0
   jl _error_end ; если индекс меньше ноля

   mov eax, DWORD PTR [ebp + 12]
   cmp eax, edx
   jge _error_end ; если индекс больше или равен длине строки
   

   push 2
   call crt_calloc ; выделяем память под символ с нулем терминатором
   push eax ; сохраняем указатель на память в стеке


   mov edx, DWORD PTR [ebp + 8]
   add edx, DWORD PTR [ebp + 12]

   mov ecx, DWORD PTR [edx]
   mov DWORD PTR [eax], ecx


   push eax

   mov ebx, 0
   add eax, 1
   mov DWORD PTR [eax], ebx

   pop eax

   pop ecx

   leave
   ret 8

_error_end:
   mov eax, 0

   leave
   ret 8

at ENDP


find PROC
   enter 0, 0

   push [ebp + 8]
   push [ebp + 12]
   call crt_strstr

   cmp eax, 0
   je _not_found

   mov ebx, [ebp + 12]
   sub eax, ebx

   leave
   ret 8

_not_found:
   mov eax, -1

   leave
   ret 8
find ENDP

to_string PROC
   enter 0, 0

   push 100
   call crt_calloc
   mov ebx, eax
    
   push [ebp + 12]
   push ebx
   push [ebp + 8]
   call crt__itoa

   
   push ebx
   call crt_strlen
   add eax, 1
   
   mov ecx, ebx
   add ecx, eax


   push ecx
   call crt_free

   mov eax, ebx

   leave
   ret 8
to_string ENDP

fromString PROC
   enter 0, 0

   push eax
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
fromString ENDP

__start:

   enter 0, 0


   ; push 1
   ; push 50
   ; call crt_calloc
   ; mov ebx, eax
   


   ;mov DWORD PTR [eax], 9

   ; mov ebx, eax
   ; add ebx, 4
   ; mov DWORD PTR [ebx], 5

   ; push DWORD PTR [eax]
   ; call print

   ; push DWORD PTR [ebx]
   ; call print

   ; mov (eax + 4), 5
   ; call print

   ; push offset string_const_1
   ; push offset string_const_0
   ; call concatTwoString

   ; push 10
   ; push 5
   ; push eax
   ; call slice

   ; push eax
   ; call println

;    push 3
;    push offset string_const_0
;    call at

;    push eax
;    call println
   
;    push 3
;    push offset string_const_0
;    call at

;    push eax
;    call println

;    push offset string_const_0
;    push offset string_const_2
;    call find
   
;    push offset string_const_0
;    push offset string_const_2
;    call find

;    push eax
;    call print
   ; push offset string_const_0
   ; push eax
   ; call crt_strcat
   ; push 10
   ; call crt_calloc
   ; mov ebx, eax
    
   ; push 2
   ; push ebx
   ; push 45
   ; call crt__itoa


   ; push 2
   ; push 5215323
   ; call to_string
   ; mov ebx, eax

   ; push ebx
   ; call println

   ;  push 10
   ; push 12
   ; call to_string
   ; mov ebx, eax

   ; push ebx
   ; call println

   ; ; init stack for println
   ; push offset string_const_1
   ; ; call println
   ; call println

   ; ; init stack for println
   ; push offset string
   ; ; call println
   ; call println

   

   ; push offset string_number
   ; call fromString

   ; push eax
   ; call print

   movsd xmm0, 13.56

   call crt_cos

   push eax
   call println

   ; push ebx
   ; call crt_free
   leave
   ret

text ends

end __start

