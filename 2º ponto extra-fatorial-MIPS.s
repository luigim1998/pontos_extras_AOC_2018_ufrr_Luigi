# Title: Fatorial de n
# Author: Luigi Muller Sousa Linhares
# Matricula: 2017009506
# Descricao: Calcula o fatorial de n
# Input: o inteiro n
# Output: o fatorial de n

############### Code Segment ####################
.data
	ent: .asciiz "Insira o valor: "
	sai: .asciiz "Fatorial: "
############### Data Segment ####################
.text
.globl main
main:
	
	la $a0, ent
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $a0, $v0
	
	jal fact
	
	move $t0, $v0
	
	la $a0, sai
	li $v0, 4
	syscall
	
	move $a0, $t0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
fact:
	slti $t0, $a0, 2
	beq $t0, $0, else
	li $v0, 1
	jr $ra
else:
	addiu $sp, $sp, -8
	sw $a0, 4($sp)
	sw $ra, 0($sp)
	addiu $a0, $a0, -1
	jal fact
	lw $a0, 4($sp)
	lw $ra, 0($sp)
	mul $v0, $a0, $v0
	addiu $sp, $sp, 8
	jr $ra