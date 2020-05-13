include <\masm32\include\masm32rt.inc>
include <\masm32\include\msvcrt.inc>

includelib <\masm32\lib\msvcrt.lib>



data segment
    doubleNumber dq 0.56
    print8_format db "%lf ", 0
    print4_format db "%d ", 0
data ends

text segment

print4byte PROC
   enter 24, 0

   push eax
   push ebx
   push ecx
   push edx

   mov eax, DWORD PTR [ebp + 8]
  

   printf(offset print4_format, eax, ebx)

   pop eax
   pop ebx
   pop ecx
   pop edx

   leave
   ret 4
print4byte ENDP

print8byte PROC
   enter 24, 0

   push eax
   push ebx
   push ecx
   push edx

   mov eax, DWORD PTR [ebp + 8]
   mov ebx, DWORD PTR [ebp + 12]
   invoke crt_printf, offset print8_format, eax, ebx

   pop eax
   pop ebx
   pop ecx
   pop edx

   leave
   ret 4
print8byte ENDP
__start:


   mov eax, DWORD PTR doubleNumber
   mov ebx, DWORD PTR doubleNumber + 4



   push ebx
   push eax
   call crt_cos


   push eax
   call print4byte

   push ebx
   call print4byte
   push ecx
   call print4byte
   push edx
   call print4byte


   push ebx
   push eax
   call print8byte

 
   leave
   ret

text ends

end __start

