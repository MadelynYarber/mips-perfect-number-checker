.data
prompt: .asciiz "Enter a value greater than 1: \n"
space: .asciiz " \n"
checkagain: .asciiz "checking"
sum: .asciiz "="
exitit: .asciiz "Exiting Program"
plus: .asciiz "+"
number: .asciiz "The number "
isprime: .asciiz " is not perfect and is prime."
isperfect: .asciiz " is perfect!"
isnotperfect: .asciiz " is not perfect."


.text
.globl main

main: 

#ASKS USER FOR INPUT
li $v0, 4 
la $a0, prompt 
syscall

#USER INPUT
li $v0, 5
syscall

move $s0, $v0 	#stores input in $s0
li $t0, 0 		# stores 0 in $t0 
li $t1, 1 		# stores 1 in $t1

# INPUT VALIDATION
beq $s0, $t0, exit 		# if n == 0, go to exit
bgt $s0, $t1, cont 		# if n > 1, go to cont
j main


#START LOOP
cont:
li $t2, 0 			#$t2 is sum, sum = 0
move $t3, $zero 	# i = 0
j testthis

loop:  
divu $s0, $t3 			#input % i
mfhi $s1 				#remainder
bne $s1, $t0, testthis 	#if remainder != 0, goto L1

beq $t3, $t0, format1 	# if i == 0, go to format1
bgt $t3, $t1, format2 	# if i > 1, go to format2

#FORMATING AND DISPLAYING INTEGARS
format1:
li $v0, 1  
move $a0, $t3
syscall
j endformat

format2:

#PLUS SIGN DISPLAY
li $v0, 4
la $a0, plus
syscall 

#DISPLAYS INTEGARS
li $v0, 1  
move $a0, $t3
syscall

endformat:

addu $t2, $t2, $t3 	# CALCULATES SUM

#TESTS i  
testthis:
addiu $t3, $t3, 1 	# i++
bgt $s0, $t3, loop 	# if n > i, go to loop

#DISPLAYS THE WORD SUM
li $v0, 4 
la $a0, sum
syscall

#DISPLAYS SUM NUMBER
li $v0, 1  #displays sum
move $a0, $t2
syscall

#FORMATS A NEW LINE
li $v0, 4
la $a0, space
syscall

beq $t2, $t1, prime 		# if sum == 1, go to prime
beq $t2, $s0, perfect 		#if sum == num, go to perfect
bne $t2, $s0, notperfect 	#if sum != num, go to notperfect

#DISPLAYS TO USER IF INTEGAR IS PRIME, PERFECT, OR NOTPERFECT
prime:
li $v0, 4
la $a0, number
syscall

li $v0, 1  
move $a0, $s0
syscall

li $v0, 4
la $a0, isprime
syscall
j after

perfect:
li $v0, 4
la $a0, number
syscall

li $v0, 1  
move $a0, $s0
syscall

li $v0, 4
la $a0, isperfect
syscall
j after

notperfect:
li $v0, 4
la $a0, number
syscall

li $v0, 1  
move $a0, $s0
syscall

li $v0, 4
la $a0, isnotperfect
syscall
j after

after:

#FORMATS A NEW LINE
li $v0, 4
la $a0, space
syscall

#REPEAT
j main

#EXITS OUT OF PROGRAM
exit:
li $v0, 4 
la $a0, exitit
syscall

jr $ra



