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
	.file	"BossStage.c"
	.text
	.align	2
	.global	initBossStage
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBossStage, %function
initBossStage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #32
	mov	r2, #100
	mov	ip, #120
	mov	r0, #80
	ldr	r3, .L3
	stmib	r3, {r0, r1}
	str	ip, [r3]
	str	r1, [r3, #12]
	str	r2, [r3, #20]
	str	r2, [r3, #16]
	bx	lr
.L4:
	.align	2
.L3:
	.word	boss
	.size	initBossStage, .-initBossStage
	.align	2
	.global	updateBossStage
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBossStage, %function
updateBossStage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L10
	ldrh	r3, [r3]
	tst	r3, #1
	bxeq	lr
	ldr	r3, .L10+4
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bxne	lr
	ldr	r1, .L10+8
	ldr	r2, [r1, #16]
	subs	r2, r2, #10
	movpl	r3, r2
	str	r3, [r1, #16]
	bx	lr
.L11:
	.align	2
.L10:
	.word	oldButtons
	.word	buttons
	.word	boss
	.size	updateBossStage, .-updateBossStage
	.align	2
	.global	drawBossStage
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBossStage, %function
drawBossStage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	drawBossStage, .-drawBossStage
	.comm	boss,24,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
