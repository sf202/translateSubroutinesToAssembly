! Santiago Fleiderman
! CSC 3210
! Assignment 5  Translates three subroutines into assembly language! fn(1,3,2,4,8,6,5)

.global main
.align 4
main:
save %sp, -92 &-8, %sp
add %sp,-1*4 &-8, %sp
mov 5, %o0
st %o0, [%sp + 92]
mov 6, %o5
mov 8, %o4
mov 4, %o3
mov 2, %o2
mov 3, %o1
mov 1, %o0
call fn
nop
sub %sp, -1*4 & -8, %sp


! Release space on stack reserved for additional args
sub %sp, -2*4&-8,%sp
ret 
restore

.global fn 
fn: 
save %sp, -92 & - 8,%sp
! x =a+b*c
mov %i1,%o0 ! x = a + b* c
mov %i2, %o1 ! 1+6 =7
call .mul
nop 
add %o0, %i0,%l0
mov %i4,%o0
mov %i5,%o1
call .div
nop
sub %i3,%o0,%l1
mov %l0,%o0
ld [%fp + 92 ] ,%o1
call power
nop
mov %o0, %l2
add %l0,%l1,%o0
add %o0,%l2,%o0
mov %o0,%i0
ret 
restore

! 7*7*7*7*7
! power(int base, int exponent)
.global power
power:
save %sp,128-8,%sp
mov 1,%l0
mov 1,%l1
loop:
mov %l0,%o0
mov %i0,%o1
call .mul
nop
mov %o0,%l0
add %l1,1,%l1
test:
cmp %l1,%i1
ble loop
nop
mov %o0, %i0
ret
restore

!set breakpoint 1 : b *&fn +24
!set breakpoint 2 : b *&fn +44
!set breakpoint 3: b*&fn+64
!set breakpoint 4: b *&main +48
!%l0=7
!%l1=3
!%l2 16807
!%o0 16817
