extern printf
extern scanf

section .data
x2 dq 1.0
x4 dq 1.0
x6 dq 1.0
x8 dq 1.0
number1 dq 0.4
number2 dq 2.0
number3 dq 24.0
number4 dq 720.0
number5 dq 40320.0
number6 dq 1.0
f_sin db "Valoarea lui sin de %f este %f",10,0
f_read db "%lf\n",0
msg2 db "Introduce x de la tastatura:", 9,10
len2 equ $ - msg2
section .bss
section .text

global main
main:

push rbp
mov rbp,rsp

mov ecx,msg2
mov edx, len2
mov ebx, 1 
mov eax, 4
int 0x80

mov rdi, f_read
mov rax, 0 ; one float
mov rsi, number1
call scanf
movsd qword [number1], xmm0

movsd xmm0, [number1] ; double precision
mulsd xmm0, [number1] ; multiply with xmm
movsd [x2], xmm0

movsd xmm0, [x2] ; double precision
mulsd xmm0, [x2] ; multiply with xmm
movsd [x4], xmm0

movsd xmm0, [x4] ; double precision
mulsd xmm0, [x2] ; multiply with xmm
movsd [x6], xmm0

movsd xmm0, [x4] ; double precision
mulsd xmm0, [x4] ; multiply with xmm
movsd [x8], xmm0

movsd xmm2, [x2]
divsd xmm2, [number2]
movsd [x2], xmm2

movsd xmm2, [x4]
divsd xmm2, [number3]
movsd [x4], xmm2

movsd xmm2, [x6]
divsd xmm2, [number4]
movsd [x6], xmm2

movsd xmm2, [x8]
divsd xmm2, [number5]
movsd [x8], xmm2

movsd xmm2, [number6]
subsd xmm2, [x2]
movsd [number6], xmm2

movsd xmm2, [number6]
addsd xmm2, [x4]
movsd [number6], xmm2

movsd xmm2, [number6]
subsd xmm2, [x6]
movsd [number6], xmm2

movsd xmm2, [number6]
addsd xmm2, [x8]
movsd [number6], xmm2

mov rdi,f_sin
movsd xmm0, [number1]
movsd xmm1, [number6]
mov rax,2 ; one float
call printf

mov rsp, rbp
pop rbp 
ret
