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
	.file	"analogSound.c"
	.text
	.align	2
	.global	initSound
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSound, %function
initSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	mov	r1, #128
	mvn	r3, #170
	strh	r1, [r2, #132]	@ movhi
	strh	r3, [r2, #128]	@ movhi
	ldr	r3, .L3
	ldrh	r1, [r2, #130]
	and	r3, r3, r1
	orr	r3, r3, #2
	strh	r3, [r2, #130]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	16381
	.size	initSound, .-initSound
	.align	2
	.global	playNoteWithDuration
	.syntax unified
	.arm
	.fpu softvfp
	.type	playNoteWithDuration, %function
playNoteWithDuration:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrh	r3, [r0]
	cmp	r3, #0
	beq	.L6
	ldrb	r3, [r0, #2]	@ zero_extendqisi2
	ldr	r2, .L8
	lsl	r3, r3, #8
	smull	ip, r3, r2, r3
	lsl	r1, r1, #6
	asr	r3, r3, #6
	and	r1, r1, #255
	rsb	r3, r3, #64
	orr	r3, r3, r1
	mvn	r3, r3, lsl #20
	mvn	r3, r3, lsr #20
	mov	r2, #67108864
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r2, #104]	@ movhi
	ldrh	r3, [r0]
	orr	r3, r3, #49152
	strh	r3, [r2, #108]	@ movhi
	bx	lr
.L6:
	mov	r2, #67108864
	strh	r3, [r2, #104]	@ movhi
	strh	r3, [r2, #108]	@ movhi
	bx	lr
.L9:
	.align	2
.L8:
	.word	274877907
	.size	playNoteWithDuration, .-playNoteWithDuration
	.align	2
	.global	playChannel1
	.syntax unified
	.arm
	.fpu softvfp
	.type	playChannel1, %function
playChannel1:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldrb	r4, [sp, #20]	@ zero_extendqisi2
	ldr	lr, .L14
	cmp	r4, #0
	ldr	ip, .L14+4
	moveq	ip, lr
	ldrb	lr, [sp, #12]	@ zero_extendqisi2
	and	r2, r2, #7
	cmp	lr, #0
	orrne	r2, r2, #1
	mov	r4, #67108864
	ldrb	r5, [sp, #24]	@ zero_extendqisi2
	ldrb	lr, [sp, #16]	@ zero_extendqisi2
	lsl	r5, r5, #6
	and	r5, r5, #255
	and	r1, r1, #63
	lsl	lr, lr, #8
	orr	r1, r1, r5
	and	lr, lr, #1792
	orr	r1, r1, lr
	lsl	r3, r3, #4
	orr	ip, ip, r1
	and	r3, r3, #112
	lsl	ip, ip, #16
	orr	r0, r0, #49152
	lsr	ip, ip, #16
	orr	r3, r2, r3
	strh	ip, [r4, #98]	@ movhi
	strh	r0, [r4, #100]	@ movhi
	strh	r3, [r4, #96]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	-4096
	.word	-4095
	.size	playChannel1, .-playChannel1
	.align	2
	.global	playDrumSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	playDrumSound, %function
playDrumSound:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	movne	ip, #8
	moveq	ip, #0
	str	lr, [sp, #-4]!
	mov	lr, #67108864
	ldrb	r2, [sp, #4]	@ zero_extendqisi2
	and	r0, r0, #7
	lsl	r1, r1, #4
	lsl	r2, r2, #8
	and	r1, r1, #240
	and	r3, r3, #63
	orr	ip, ip, r0
	and	r2, r2, #1792
	orr	r1, r1, ip
	orr	r3, r3, r2
	orr	r1, r1, #49152
	orr	r3, r3, #61440
	strh	r3, [lr, #120]	@ movhi
	strh	r1, [lr, #124]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
	.size	playDrumSound, .-playDrumSound
	.align	2
	.global	playAnalogSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	playAnalogSound, %function
playAnalogSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #17
	ldrls	pc, [pc, r0, asl #2]
	b	.L20
.L23:
	.word	.L40
	.word	.L39
	.word	.L38
	.word	.L37
	.word	.L36
	.word	.L35
	.word	.L34
	.word	.L33
	.word	.L32
	.word	.L31
	.word	.L30
	.word	.L29
	.word	.L28
	.word	.L27
	.word	.L26
	.word	.L25
	.word	.L24
	.word	.L22
.L22:
	mov	r3, #67108864
	mov	r2, #117
	ldr	r0, .L41
	ldr	r1, .L41+4
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #96]	@ movhi
.L20:
	bx	lr
.L40:
	mov	r3, #67108864
	mov	r2, #49152
	ldr	r1, .L41+8
	strh	r1, [r3, #120]	@ movhi
	strh	r2, [r3, #124]	@ movhi
	bx	lr
.L39:
	mov	r3, #67108864
	ldr	r1, .L41+12
	ldr	r2, .L41+16
	strh	r1, [r3, #120]	@ movhi
	strh	r2, [r3, #124]	@ movhi
	bx	lr
.L38:
	mov	r3, #67108864
	ldr	r1, .L41+20
	ldr	r2, .L41+24
	strh	r1, [r3, #120]	@ movhi
	strh	r2, [r3, #124]	@ movhi
	bx	lr
.L37:
	mov	r3, #67108864
	ldr	r1, .L41+20
	ldr	r2, .L41+28
	strh	r1, [r3, #120]	@ movhi
	strh	r2, [r3, #124]	@ movhi
	bx	lr
.L36:
	mov	r3, #67108864
	mov	r1, #61696
	ldr	r2, .L41+32
	strh	r1, [r3, #120]	@ movhi
	strh	r2, [r3, #124]	@ movhi
	bx	lr
.L35:
	mov	r3, #67108864
	ldr	r1, .L41+36
	ldr	r2, .L41+40
	strh	r1, [r3, #120]	@ movhi
	strh	r2, [r3, #124]	@ movhi
	bx	lr
.L34:
	mov	r3, #67108864
	ldr	r1, .L41+44
	ldr	r2, .L41+48
	strh	r1, [r3, #120]	@ movhi
	strh	r2, [r3, #124]	@ movhi
	bx	lr
.L33:
	mov	r3, #67108864
	ldr	r1, .L41+52
	ldr	r2, .L41+56
	strh	r1, [r3, #120]	@ movhi
	strh	r2, [r3, #124]	@ movhi
	bx	lr
.L32:
	mov	r3, #67108864
	mov	r0, #61696
	mov	r2, #55
	ldr	r1, .L41+60
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L31:
	mov	r3, #67108864
	mov	r0, #61696
	mov	r2, #53
	ldr	r1, .L41+4
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L30:
	mov	r3, #67108864
	mov	r2, #53
	ldr	r0, .L41+64
	ldr	r1, .L41+68
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L29:
	mov	r3, #67108864
	mov	r2, #23
	ldr	r0, .L41+72
	ldr	r1, .L41+60
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L28:
	mov	r3, #67108864
	mov	r2, #23
	ldr	r0, .L41+76
	ldr	r1, .L41+80
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L27:
	mov	r3, #67108864
	mov	r2, #39
	ldr	r0, .L41+76
	ldr	r1, .L41+60
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L26:
	mov	r3, #67108864
	mov	r2, #36
	ldr	r0, .L41+84
	ldr	r1, .L41+80
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L25:
	mov	r3, #67108864
	mov	r2, #36
	ldr	r0, .L41+88
	ldr	r1, .L41+92
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L24:
	mov	r3, #67108864
	mov	r2, #117
	ldr	r0, .L41+84
	ldr	r1, .L41+60
	strh	r0, [r3, #98]	@ movhi
	strh	r1, [r3, #100]	@ movhi
	strh	r2, [r3, #96]	@ movhi
	bx	lr
.L42:
	.align	2
.L41:
	.word	-2879
	.word	-14634
	.word	-3820
	.word	-3552
	.word	-16327
	.word	-2786
	.word	-16272
	.word	-16264
	.word	-16232
	.word	-3810
	.word	-16325
	.word	-4064
	.word	-16353
	.word	-3296
	.word	-16240
	.word	-14670
	.word	-3712
	.word	-14782
	.word	-3445
	.word	-2943
	.word	-14734
	.word	-3455
	.word	-3451
	.word	-14757
	.size	playAnalogSound, .-playAnalogSound
	.comm	NOTES,2,2
	.ident	"GCC: (devkitARM release 53) 9.1.0"
