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
	.file	"mode4.c"
	.text
	.align	2
	.global	setPixel4
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	add	r3, r0, r0, lsr #31
	ldr	lr, .L6
	rsb	ip, r1, r1, lsl #4
	asr	r1, r3, #1
	add	r1, r1, ip, lsl #3
	ldr	ip, [lr]
	lsl	r1, r1, #1
	ldrsh	r3, [ip, r1]
	tst	r0, #1
	andne	r3, r3, #255
	andeq	r3, r3, #65280
	orrne	r2, r3, r2, lsl #8
	orreq	r2, r3, r2
	strh	r2, [ip, r1]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L7:
	.align	2
.L6:
	.word	videoBuffer
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #36
	ldrb	lr, [sp, #72]	@ zero_extendqisi2
	ldrb	ip, [sp, #72]	@ zero_extendqisi2
	subs	r8, r3, #0
	orr	ip, ip, lr, lsl #8
	strh	ip, [sp, #30]	@ movhi
	ble	.L8
	mov	r7, r2
	sub	lr, r2, #1
	add	r3, r7, r7, lsr #31
	add	r10, lr, r0
	str	lr, [sp, #4]
	rsb	r1, r1, r1, lsl #4
	asr	lr, lr, #1
	add	ip, r0, r0, lsr #31
	asr	r3, r3, #1
	orr	r3, r3, #16777216
	sub	r2, r2, #2
	bic	ip, ip, #1
	add	r4, r0, r1, lsl #4
	orr	r1, lr, #16777216
	ldr	lr, [sp, #4]
	add	fp, r10, r10, lsr #31
	str	r3, [sp, #16]
	asr	r2, r2, #1
	sub	r3, ip, r0
	str	r3, [sp]
	bic	fp, fp, #1
	orr	r2, r2, #16777216
	and	r3, lr, #1
	mov	r5, #0
	ldr	r9, .L32
	str	r1, [sp, #12]
	str	r2, [sp, #20]
	str	r3, [sp, #8]
	sub	fp, fp, r0
	and	r10, r10, #1
	and	r6, r0, #1
	b	.L18
.L30:
	tst	r7, #1
	beq	.L28
	cmp	r7, #1
	bgt	.L29
.L16:
	ldrb	r2, [sp, #72]	@ zero_extendqisi2
	add	r1, r4, fp
	and	r0, r2, #255
	ldrsh	r2, [r3, r1]
	cmp	r10, #0
	andne	r2, r2, #255
	biceq	r2, r2, #255
	orrne	r2, r2, r0, lsl #8
	orreq	r2, r2, r0
	strh	r2, [r3, r1]	@ movhi
.L12:
	add	r5, r5, #1
	cmp	r8, r5
	add	r4, r4, #240
	beq	.L8
.L18:
	cmp	r6, #0
	ldr	r3, [r9]
	beq	.L30
	ldr	r2, [sp]
	add	r1, r4, r2
	ldrb	r2, [r3, r1]	@ zero_extendqisi2
	ldrb	r0, [sp, #72]	@ zero_extendqisi2
	cmp	r7, #1
	orr	r2, r2, r0, lsl #8
	strh	r2, [r3, r1]	@ movhi
	ble	.L12
	ldr	r2, [sp, #8]
	cmp	r2, #0
	beq	.L31
	ldr	r2, [sp, #4]
	cmp	r2, #1
	beq	.L16
	add	r2, r4, #1
	add	r2, r2, r2, lsr #31
	bic	r2, r2, #1
	add	r2, r3, r2
	ldr	r3, [sp, #20]
.L27:
	mov	r0, #3
	ldr	ip, .L32+4
	add	r1, sp, #30
	mov	lr, pc
	bx	ip
	ldr	r3, [r9]
	b	.L16
.L28:
	add	r2, r4, r4, lsr #31
	bic	r2, r2, #1
	add	r2, r3, r2
	mov	r0, #3
	ldr	r3, [sp, #16]
	ldr	ip, .L32+4
	add	r1, sp, #30
	add	r5, r5, #1
	mov	lr, pc
	bx	ip
	cmp	r8, r5
	add	r4, r4, #240
	bne	.L18
.L8:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L29:
	add	r2, r4, r4, lsr #31
	bic	r2, r2, #1
	add	r2, r3, r2
	ldr	r3, [sp, #12]
	b	.L27
.L31:
	add	r2, r4, #1
	add	r2, r2, r2, lsr #31
	bic	r2, r2, #1
	add	r2, r3, r2
	mov	r0, #3
	ldr	r3, [sp, #12]
	ldr	ip, .L32+4
	add	r1, sp, #30
	mov	lr, pc
	bx	ip
	b	.L12
.L33:
	.align	2
.L32:
	.word	videoBuffer
	.word	DMANow
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen4
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	sub	sp, sp, #16
	strb	r0, [sp, #7]
	ldrb	ip, [sp, #7]	@ zero_extendqisi2
	ldrb	r3, [sp, #7]	@ zero_extendqisi2
	ldrb	r1, [sp, #7]	@ zero_extendqisi2
	lsl	r3, r3, #16
	ldrb	r0, [sp, #7]	@ zero_extendqisi2
	orr	r3, r3, ip, lsl #24
	orr	r3, r3, r0
	orr	r3, r3, r1, lsl #8
	add	r0, sp, #12
	str	r3, [sp, #12]
	ldr	r1, .L36
	str	r0, [r2, #212]
	ldr	r3, .L36+4
	ldr	r1, [r1]
	str	r1, [r2, #216]
	str	r3, [r2, #220]
	add	sp, sp, #16
	@ sp needed
	bx	lr
.L37:
	.align	2
.L36:
	.word	videoBuffer
	.word	-2063587968
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r3, #0
	add	r2, r2, r2, lsr #31
	bxle	lr
	add	r3, r1, r3
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	rsb	r3, r3, r3, lsl #4
	asr	r7, r2, #1
	rsb	r2, r1, r1, lsl #4
	add	r0, r0, r0, lsr #31
	lsl	r6, r3, #3
	lsl	r4, r2, #3
	add	r6, r6, r0, asr #1
	add	r4, r4, r0, asr #1
	ldr	r5, [sp, #32]
	ldr	r9, .L47
	ldr	r8, .L47+4
	lsl	r6, r6, #1
	lsl	r4, r4, #1
	lsl	r10, r7, #1
.L40:
	ldr	r2, [r9]
	mov	r1, r5
	add	r2, r2, r4
	mov	r3, r7
	mov	r0, #3
	add	r4, r4, #240
	mov	lr, pc
	bx	r8
	cmp	r4, r6
	add	r5, r5, r10
	bne	.L40
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	videoBuffer
	.word	DMANow
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawFullscreenImage4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawFullscreenImage4, %function
drawFullscreenImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L51
	mov	r1, r0
	ldr	r2, [r3]
	ldr	r4, .L51+4
	mov	r3, #19200
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L52:
	.align	2
.L51:
	.word	videoBuffer
	.word	DMANow
	.size	drawFullscreenImage4, .-drawFullscreenImage4
	.align	2
	.global	drawChar4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawChar4, %function
drawChar4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	lr, r0
	ldr	ip, .L64
	ldr	r8, .L64+4
	ldr	r9, [ip]
	rsb	r1, r1, r1, lsl #4
	add	r2, r2, r2, lsl #1
	sub	r8, r8, r0
	lsl	r5, r3, #24
	lsl	r7, r1, #3
	add	r6, r0, #6
	add	r8, r8, r2, lsl #4
	asr	r5, r5, #16
	add	r10, r9, #1920
.L54:
	add	ip, lr, lr, lsr #31
	add	ip, r7, ip, asr #1
	add	r2, r9, ip, lsl #1
	add	r1, r8, lr
	add	ip, r10, ip, lsl #1
	and	r4, lr, #1
.L57:
	ldrb	r0, [r1]	@ zero_extendqisi2
	cmp	r0, #0
	beq	.L55
	ldrsh	r0, [r2]
	cmp	r4, #0
	and	fp, r0, #255
	biceq	r0, r0, #255
	orr	fp, r5, fp
	orreq	r0, r0, r3
	strhne	fp, [r2]	@ movhi
	strheq	r0, [r2]	@ movhi
.L55:
	add	r2, r2, #240
	cmp	r2, ip
	add	r1, r1, #6
	bne	.L57
	add	lr, lr, #1
	cmp	lr, r6
	bne	.L54
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	videoBuffer
	.word	fontdata_6x8
	.size	drawChar4, .-drawChar4
	.align	2
	.global	drawString4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawString4, %function
drawString4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	cmp	r2, #0
	beq	.L66
	mov	r4, r0
	mov	r6, r1
.L68:
	mov	r0, r4
	mov	r1, r6
	bl	drawChar4
	ldrb	r2, [r5, #1]!	@ zero_extendqisi2
	cmp	r2, #0
	add	r4, r4, #6
	bne	.L68
.L66:
	pop	{r4, r5, r6, lr}
	bx	lr
	.size	drawString4, .-drawString4
	.align	2
	.global	flipPage
	.syntax unified
	.arm
	.fpu softvfp
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r1, [r3]
	tst	r1, #16
	ldr	r2, .L77
	moveq	r2, #100663296
	ldr	r1, .L77+4
	str	r2, [r1]
	ldrh	r2, [r3]
	eor	r2, r2, #16
	strh	r2, [r3]	@ movhi
	bx	lr
.L78:
	.align	2
.L77:
	.word	100704256
	.word	videoBuffer
	.size	flipPage, .-flipPage
	.ident	"GCC: (devkitARM release 53) 9.1.0"
