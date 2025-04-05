	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"Temple.c"
	.text
	.align	2
	.global	initTemple
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTemple, %function
initTemple:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #452
	mov	r0, #55
	mov	r1, #50
	mov	r2, #40
	ldr	r3, .L3
	stmib	r3, {r0, r1, r2}
	str	ip, [r3]
	bx	lr
.L4:
	.align	2
.L3:
	.word	temple
	.size	initTemple, .-initTemple
	.align	2
	.global	checkTempleCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkTempleCollision, %function
checkTempleCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	lr, .L12
	ldr	r4, [lr]
	ldr	ip, [lr, #8]
	add	ip, r4, ip
	cmp	ip, r0
	ble	.L9
	add	r0, r0, r2
	cmp	r4, r0
	blt	.L11
.L9:
	mov	r0, #0
	pop	{r4, lr}
	bx	lr
.L11:
	ldr	r0, [lr, #4]
	ldr	r2, [lr, #12]
	add	r2, r0, r2
	cmp	r2, r1
	ble	.L9
	add	r1, r1, r3
	cmp	r0, r1
	movge	r0, #0
	movlt	r0, #1
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	temple
	.size	checkTempleCollision, .-checkTempleCollision
	.comm	temple,16,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
