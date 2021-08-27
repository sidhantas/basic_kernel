	.file	"kernel.c"
	.text
	.globl	hello
	.type	hello, @function
hello:
	pushl	%ebp
	movl	%esp, %ebp
	nop
	popl	%ebp
	ret
	.size	hello, .-hello
	.globl	_start
	.type	_start, @function
_start:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movl	$753664, -4(%ebp)
	movl	-4(%ebp), %eax
	movb	$88, (%eax)
	movl	$0, %eax
	leave
	ret
	.size	_start, .-_start
	.ident	"GCC: (GNU) 11.2.0"
