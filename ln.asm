
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
  if(argc != 3){
   a:	83 39 03             	cmpl   $0x3,(%ecx)
{
   d:	55                   	push   %ebp
   e:	89 e5                	mov    %esp,%ebp
  10:	53                   	push   %ebx
  11:	51                   	push   %ecx
  12:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
  15:	74 13                	je     2a <main+0x2a>
    printf(2, "Usage: ln old new\n");
  17:	52                   	push   %edx
  18:	52                   	push   %edx
  19:	68 a8 07 00 00       	push   $0x7a8
  1e:	6a 02                	push   $0x2
  20:	e8 1b 04 00 00       	call   440 <printf>
    exit();
  25:	e8 87 02 00 00       	call   2b1 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2a:	50                   	push   %eax
  2b:	50                   	push   %eax
  2c:	ff 73 08             	pushl  0x8(%ebx)
  2f:	ff 73 04             	pushl  0x4(%ebx)
  32:	e8 da 02 00 00       	call   311 <link>
  37:	83 c4 10             	add    $0x10,%esp
  3a:	85 c0                	test   %eax,%eax
  3c:	78 05                	js     43 <main+0x43>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
  3e:	e8 6e 02 00 00       	call   2b1 <exit>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  43:	ff 73 08             	pushl  0x8(%ebx)
  46:	ff 73 04             	pushl  0x4(%ebx)
  49:	68 bb 07 00 00       	push   $0x7bb
  4e:	6a 02                	push   $0x2
  50:	e8 eb 03 00 00       	call   440 <printf>
  55:	83 c4 10             	add    $0x10,%esp
  58:	eb e4                	jmp    3e <main+0x3e>
  5a:	66 90                	xchg   %ax,%ax
  5c:	66 90                	xchg   %ax,%ax
  5e:	66 90                	xchg   %ax,%ax

00000060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  60:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  61:	31 d2                	xor    %edx,%edx
{
  63:	89 e5                	mov    %esp,%ebp
  65:	53                   	push   %ebx
  66:	8b 45 08             	mov    0x8(%ebp),%eax
  69:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  70:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
  74:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  77:	83 c2 01             	add    $0x1,%edx
  7a:	84 c9                	test   %cl,%cl
  7c:	75 f2                	jne    70 <strcpy+0x10>
    ;
  return os;
}
  7e:	5b                   	pop    %ebx
  7f:	5d                   	pop    %ebp
  80:	c3                   	ret    
  81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  88:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8f:	90                   	nop

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	56                   	push   %esi
  94:	53                   	push   %ebx
  95:	8b 5d 08             	mov    0x8(%ebp),%ebx
  98:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(*p && *p == *q)
  9b:	0f b6 13             	movzbl (%ebx),%edx
  9e:	0f b6 0e             	movzbl (%esi),%ecx
  a1:	84 d2                	test   %dl,%dl
  a3:	74 1e                	je     c3 <strcmp+0x33>
  a5:	b8 01 00 00 00       	mov    $0x1,%eax
  aa:	38 ca                	cmp    %cl,%dl
  ac:	74 09                	je     b7 <strcmp+0x27>
  ae:	eb 20                	jmp    d0 <strcmp+0x40>
  b0:	83 c0 01             	add    $0x1,%eax
  b3:	38 ca                	cmp    %cl,%dl
  b5:	75 19                	jne    d0 <strcmp+0x40>
  b7:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  bb:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
  bf:	84 d2                	test   %dl,%dl
  c1:	75 ed                	jne    b0 <strcmp+0x20>
  c3:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
  c5:	5b                   	pop    %ebx
  c6:	5e                   	pop    %esi
  return (uchar)*p - (uchar)*q;
  c7:	29 c8                	sub    %ecx,%eax
}
  c9:	5d                   	pop    %ebp
  ca:	c3                   	ret    
  cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  cf:	90                   	nop
  d0:	0f b6 c2             	movzbl %dl,%eax
  d3:	5b                   	pop    %ebx
  d4:	5e                   	pop    %esi
  return (uchar)*p - (uchar)*q;
  d5:	29 c8                	sub    %ecx,%eax
}
  d7:	5d                   	pop    %ebp
  d8:	c3                   	ret    
  d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000000e0 <strlen>:

uint
strlen(const char *s)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  e6:	80 39 00             	cmpb   $0x0,(%ecx)
  e9:	74 15                	je     100 <strlen+0x20>
  eb:	31 d2                	xor    %edx,%edx
  ed:	8d 76 00             	lea    0x0(%esi),%esi
  f0:	83 c2 01             	add    $0x1,%edx
  f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
  f7:	89 d0                	mov    %edx,%eax
  f9:	75 f5                	jne    f0 <strlen+0x10>
    ;
  return n;
}
  fb:	5d                   	pop    %ebp
  fc:	c3                   	ret    
  fd:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 100:	31 c0                	xor    %eax,%eax
}
 102:	5d                   	pop    %ebp
 103:	c3                   	ret    
 104:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 10b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 10f:	90                   	nop

00000110 <memset>:

void*
memset(void *dst, int c, uint n)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 117:	8b 4d 10             	mov    0x10(%ebp),%ecx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
 11d:	89 d7                	mov    %edx,%edi
 11f:	fc                   	cld    
 120:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 122:	89 d0                	mov    %edx,%eax
 124:	5f                   	pop    %edi
 125:	5d                   	pop    %ebp
 126:	c3                   	ret    
 127:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 12e:	66 90                	xchg   %ax,%ax

00000130 <strchr>:

char*
strchr(const char *s, char c)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	53                   	push   %ebx
 134:	8b 45 08             	mov    0x8(%ebp),%eax
 137:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 13a:	0f b6 18             	movzbl (%eax),%ebx
 13d:	84 db                	test   %bl,%bl
 13f:	74 1d                	je     15e <strchr+0x2e>
 141:	89 d1                	mov    %edx,%ecx
    if(*s == c)
 143:	38 d3                	cmp    %dl,%bl
 145:	75 0d                	jne    154 <strchr+0x24>
 147:	eb 17                	jmp    160 <strchr+0x30>
 149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 150:	38 ca                	cmp    %cl,%dl
 152:	74 0c                	je     160 <strchr+0x30>
  for(; *s; s++)
 154:	83 c0 01             	add    $0x1,%eax
 157:	0f b6 10             	movzbl (%eax),%edx
 15a:	84 d2                	test   %dl,%dl
 15c:	75 f2                	jne    150 <strchr+0x20>
      return (char*)s;
  return 0;
 15e:	31 c0                	xor    %eax,%eax
}
 160:	5b                   	pop    %ebx
 161:	5d                   	pop    %ebp
 162:	c3                   	ret    
 163:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000170 <gets>:

char*
gets(char *buf, int max)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	57                   	push   %edi
 174:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 175:	31 f6                	xor    %esi,%esi
{
 177:	53                   	push   %ebx
 178:	89 f3                	mov    %esi,%ebx
 17a:	83 ec 1c             	sub    $0x1c,%esp
 17d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 180:	eb 2f                	jmp    1b1 <gets+0x41>
 182:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 188:	83 ec 04             	sub    $0x4,%esp
 18b:	8d 45 e7             	lea    -0x19(%ebp),%eax
 18e:	6a 01                	push   $0x1
 190:	50                   	push   %eax
 191:	6a 00                	push   $0x0
 193:	e8 31 01 00 00       	call   2c9 <read>
    if(cc < 1)
 198:	83 c4 10             	add    $0x10,%esp
 19b:	85 c0                	test   %eax,%eax
 19d:	7e 1c                	jle    1bb <gets+0x4b>
      break;
    buf[i++] = c;
 19f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1a3:	83 c7 01             	add    $0x1,%edi
 1a6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 1a9:	3c 0a                	cmp    $0xa,%al
 1ab:	74 23                	je     1d0 <gets+0x60>
 1ad:	3c 0d                	cmp    $0xd,%al
 1af:	74 1f                	je     1d0 <gets+0x60>
  for(i=0; i+1 < max; ){
 1b1:	83 c3 01             	add    $0x1,%ebx
 1b4:	89 fe                	mov    %edi,%esi
 1b6:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1b9:	7c cd                	jl     188 <gets+0x18>
 1bb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 1bd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 1c0:	c6 03 00             	movb   $0x0,(%ebx)
}
 1c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1c6:	5b                   	pop    %ebx
 1c7:	5e                   	pop    %esi
 1c8:	5f                   	pop    %edi
 1c9:	5d                   	pop    %ebp
 1ca:	c3                   	ret    
 1cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1cf:	90                   	nop
 1d0:	8b 75 08             	mov    0x8(%ebp),%esi
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	01 de                	add    %ebx,%esi
 1d8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 1da:	c6 03 00             	movb   $0x0,(%ebx)
}
 1dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1e0:	5b                   	pop    %ebx
 1e1:	5e                   	pop    %esi
 1e2:	5f                   	pop    %edi
 1e3:	5d                   	pop    %ebp
 1e4:	c3                   	ret    
 1e5:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001f0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f5:	83 ec 08             	sub    $0x8,%esp
 1f8:	6a 00                	push   $0x0
 1fa:	ff 75 08             	pushl  0x8(%ebp)
 1fd:	e8 ef 00 00 00       	call   2f1 <open>
  if(fd < 0)
 202:	83 c4 10             	add    $0x10,%esp
 205:	85 c0                	test   %eax,%eax
 207:	78 27                	js     230 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 209:	83 ec 08             	sub    $0x8,%esp
 20c:	ff 75 0c             	pushl  0xc(%ebp)
 20f:	89 c3                	mov    %eax,%ebx
 211:	50                   	push   %eax
 212:	e8 f2 00 00 00       	call   309 <fstat>
  close(fd);
 217:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 21a:	89 c6                	mov    %eax,%esi
  close(fd);
 21c:	e8 b8 00 00 00       	call   2d9 <close>
  return r;
 221:	83 c4 10             	add    $0x10,%esp
}
 224:	8d 65 f8             	lea    -0x8(%ebp),%esp
 227:	89 f0                	mov    %esi,%eax
 229:	5b                   	pop    %ebx
 22a:	5e                   	pop    %esi
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    
 22d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 230:	be ff ff ff ff       	mov    $0xffffffff,%esi
 235:	eb ed                	jmp    224 <stat+0x34>
 237:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 23e:	66 90                	xchg   %ax,%ax

00000240 <atoi>:

int
atoi(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 247:	0f be 11             	movsbl (%ecx),%edx
 24a:	8d 42 d0             	lea    -0x30(%edx),%eax
 24d:	3c 09                	cmp    $0x9,%al
  n = 0;
 24f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 254:	77 1f                	ja     275 <atoi+0x35>
 256:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 25d:	8d 76 00             	lea    0x0(%esi),%esi
    n = n*10 + *s++ - '0';
 260:	83 c1 01             	add    $0x1,%ecx
 263:	8d 04 80             	lea    (%eax,%eax,4),%eax
 266:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 26a:	0f be 11             	movsbl (%ecx),%edx
 26d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 270:	80 fb 09             	cmp    $0x9,%bl
 273:	76 eb                	jbe    260 <atoi+0x20>
  return n;
}
 275:	5b                   	pop    %ebx
 276:	5d                   	pop    %ebp
 277:	c3                   	ret    
 278:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 27f:	90                   	nop

00000280 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	57                   	push   %edi
 284:	8b 55 10             	mov    0x10(%ebp),%edx
 287:	8b 45 08             	mov    0x8(%ebp),%eax
 28a:	56                   	push   %esi
 28b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 28e:	85 d2                	test   %edx,%edx
 290:	7e 13                	jle    2a5 <memmove+0x25>
 292:	01 c2                	add    %eax,%edx
  dst = vdst;
 294:	89 c7                	mov    %eax,%edi
 296:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 2a0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 2a1:	39 fa                	cmp    %edi,%edx
 2a3:	75 fb                	jne    2a0 <memmove+0x20>
  return vdst;
}
 2a5:	5e                   	pop    %esi
 2a6:	5f                   	pop    %edi
 2a7:	5d                   	pop    %ebp
 2a8:	c3                   	ret    

000002a9 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2a9:	b8 01 00 00 00       	mov    $0x1,%eax
 2ae:	cd 40                	int    $0x40
 2b0:	c3                   	ret    

000002b1 <exit>:
SYSCALL(exit)
 2b1:	b8 02 00 00 00       	mov    $0x2,%eax
 2b6:	cd 40                	int    $0x40
 2b8:	c3                   	ret    

000002b9 <wait>:
SYSCALL(wait)
 2b9:	b8 03 00 00 00       	mov    $0x3,%eax
 2be:	cd 40                	int    $0x40
 2c0:	c3                   	ret    

000002c1 <pipe>:
SYSCALL(pipe)
 2c1:	b8 04 00 00 00       	mov    $0x4,%eax
 2c6:	cd 40                	int    $0x40
 2c8:	c3                   	ret    

000002c9 <read>:
SYSCALL(read)
 2c9:	b8 05 00 00 00       	mov    $0x5,%eax
 2ce:	cd 40                	int    $0x40
 2d0:	c3                   	ret    

000002d1 <write>:
SYSCALL(write)
 2d1:	b8 10 00 00 00       	mov    $0x10,%eax
 2d6:	cd 40                	int    $0x40
 2d8:	c3                   	ret    

000002d9 <close>:
SYSCALL(close)
 2d9:	b8 15 00 00 00       	mov    $0x15,%eax
 2de:	cd 40                	int    $0x40
 2e0:	c3                   	ret    

000002e1 <kill>:
SYSCALL(kill)
 2e1:	b8 06 00 00 00       	mov    $0x6,%eax
 2e6:	cd 40                	int    $0x40
 2e8:	c3                   	ret    

000002e9 <exec>:
SYSCALL(exec)
 2e9:	b8 07 00 00 00       	mov    $0x7,%eax
 2ee:	cd 40                	int    $0x40
 2f0:	c3                   	ret    

000002f1 <open>:
SYSCALL(open)
 2f1:	b8 0f 00 00 00       	mov    $0xf,%eax
 2f6:	cd 40                	int    $0x40
 2f8:	c3                   	ret    

000002f9 <mknod>:
SYSCALL(mknod)
 2f9:	b8 11 00 00 00       	mov    $0x11,%eax
 2fe:	cd 40                	int    $0x40
 300:	c3                   	ret    

00000301 <unlink>:
SYSCALL(unlink)
 301:	b8 12 00 00 00       	mov    $0x12,%eax
 306:	cd 40                	int    $0x40
 308:	c3                   	ret    

00000309 <fstat>:
SYSCALL(fstat)
 309:	b8 08 00 00 00       	mov    $0x8,%eax
 30e:	cd 40                	int    $0x40
 310:	c3                   	ret    

00000311 <link>:
SYSCALL(link)
 311:	b8 13 00 00 00       	mov    $0x13,%eax
 316:	cd 40                	int    $0x40
 318:	c3                   	ret    

00000319 <mkdir>:
SYSCALL(mkdir)
 319:	b8 14 00 00 00       	mov    $0x14,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret    

00000321 <chdir>:
SYSCALL(chdir)
 321:	b8 09 00 00 00       	mov    $0x9,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <dup>:
SYSCALL(dup)
 329:	b8 0a 00 00 00       	mov    $0xa,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <getpid>:
SYSCALL(getpid)
 331:	b8 0b 00 00 00       	mov    $0xb,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <sbrk>:
SYSCALL(sbrk)
 339:	b8 0c 00 00 00       	mov    $0xc,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <sleep>:
SYSCALL(sleep)
 341:	b8 0d 00 00 00       	mov    $0xd,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <uptime>:
SYSCALL(uptime)
 349:	b8 0e 00 00 00       	mov    $0xe,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    

00000351 <waitx>:
SYSCALL(waitx)
 351:	b8 16 00 00 00       	mov    $0x16,%eax
 356:	cd 40                	int    $0x40
 358:	c3                   	ret    

00000359 <cps>:
SYSCALL(cps)
 359:	b8 17 00 00 00       	mov    $0x17,%eax
 35e:	cd 40                	int    $0x40
 360:	c3                   	ret    

00000361 <set_priority>:
SYSCALL(set_priority)
 361:	b8 18 00 00 00       	mov    $0x18,%eax
 366:	cd 40                	int    $0x40
 368:	c3                   	ret    

00000369 <getpinfo>:
 369:	b8 19 00 00 00       	mov    $0x19,%eax
 36e:	cd 40                	int    $0x40
 370:	c3                   	ret    
 371:	66 90                	xchg   %ax,%ax
 373:	66 90                	xchg   %ax,%ax
 375:	66 90                	xchg   %ax,%ax
 377:	66 90                	xchg   %ax,%ax
 379:	66 90                	xchg   %ax,%ax
 37b:	66 90                	xchg   %ax,%ax
 37d:	66 90                	xchg   %ax,%ax
 37f:	90                   	nop

00000380 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	56                   	push   %esi
 385:	53                   	push   %ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 386:	89 d3                	mov    %edx,%ebx
{
 388:	83 ec 3c             	sub    $0x3c,%esp
 38b:	89 45 bc             	mov    %eax,-0x44(%ebp)
  if(sgn && xx < 0){
 38e:	85 d2                	test   %edx,%edx
 390:	0f 89 92 00 00 00    	jns    428 <printint+0xa8>
 396:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 39a:	0f 84 88 00 00 00    	je     428 <printint+0xa8>
    neg = 1;
 3a0:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
    x = -xx;
 3a7:	f7 db                	neg    %ebx
  } else {
    x = xx;
  }

  i = 0;
 3a9:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 3b0:	8d 75 d7             	lea    -0x29(%ebp),%esi
 3b3:	eb 08                	jmp    3bd <printint+0x3d>
 3b5:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3b8:	89 7d c4             	mov    %edi,-0x3c(%ebp)
  }while((x /= base) != 0);
 3bb:	89 c3                	mov    %eax,%ebx
    buf[i++] = digits[x % base];
 3bd:	89 d8                	mov    %ebx,%eax
 3bf:	31 d2                	xor    %edx,%edx
 3c1:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 3c4:	f7 f1                	div    %ecx
 3c6:	83 c7 01             	add    $0x1,%edi
 3c9:	0f b6 92 d8 07 00 00 	movzbl 0x7d8(%edx),%edx
 3d0:	88 14 3e             	mov    %dl,(%esi,%edi,1)
  }while((x /= base) != 0);
 3d3:	39 d9                	cmp    %ebx,%ecx
 3d5:	76 e1                	jbe    3b8 <printint+0x38>
  if(neg)
 3d7:	8b 45 c0             	mov    -0x40(%ebp),%eax
 3da:	85 c0                	test   %eax,%eax
 3dc:	74 0d                	je     3eb <printint+0x6b>
    buf[i++] = '-';
 3de:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 3e3:	ba 2d 00 00 00       	mov    $0x2d,%edx
    buf[i++] = digits[x % base];
 3e8:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 3eb:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3ee:	8b 7d bc             	mov    -0x44(%ebp),%edi
 3f1:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 3f5:	eb 0f                	jmp    406 <printint+0x86>
 3f7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3fe:	66 90                	xchg   %ax,%ax
 400:	0f b6 13             	movzbl (%ebx),%edx
 403:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 406:	83 ec 04             	sub    $0x4,%esp
 409:	88 55 d7             	mov    %dl,-0x29(%ebp)
 40c:	6a 01                	push   $0x1
 40e:	56                   	push   %esi
 40f:	57                   	push   %edi
 410:	e8 bc fe ff ff       	call   2d1 <write>

  while(--i >= 0)
 415:	83 c4 10             	add    $0x10,%esp
 418:	39 de                	cmp    %ebx,%esi
 41a:	75 e4                	jne    400 <printint+0x80>
    putc(fd, buf[i]);
}
 41c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 41f:	5b                   	pop    %ebx
 420:	5e                   	pop    %esi
 421:	5f                   	pop    %edi
 422:	5d                   	pop    %ebp
 423:	c3                   	ret    
 424:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 428:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 42f:	e9 75 ff ff ff       	jmp    3a9 <printint+0x29>
 434:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 43b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 43f:	90                   	nop

00000440 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 440:	55                   	push   %ebp
 441:	89 e5                	mov    %esp,%ebp
 443:	57                   	push   %edi
 444:	56                   	push   %esi
 445:	53                   	push   %ebx
 446:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 449:	8b 75 0c             	mov    0xc(%ebp),%esi
 44c:	0f b6 1e             	movzbl (%esi),%ebx
 44f:	84 db                	test   %bl,%bl
 451:	0f 84 b9 00 00 00    	je     510 <printf+0xd0>
  ap = (uint*)(void*)&fmt + 1;
 457:	8d 45 10             	lea    0x10(%ebp),%eax
 45a:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 45d:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 460:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 462:	89 45 d0             	mov    %eax,-0x30(%ebp)
 465:	eb 38                	jmp    49f <printf+0x5f>
 467:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 46e:	66 90                	xchg   %ax,%ax
 470:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 473:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 478:	83 f8 25             	cmp    $0x25,%eax
 47b:	74 17                	je     494 <printf+0x54>
  write(fd, &c, 1);
 47d:	83 ec 04             	sub    $0x4,%esp
 480:	88 5d e7             	mov    %bl,-0x19(%ebp)
 483:	6a 01                	push   $0x1
 485:	57                   	push   %edi
 486:	ff 75 08             	pushl  0x8(%ebp)
 489:	e8 43 fe ff ff       	call   2d1 <write>
 48e:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 491:	83 c4 10             	add    $0x10,%esp
 494:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 497:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 49b:	84 db                	test   %bl,%bl
 49d:	74 71                	je     510 <printf+0xd0>
    c = fmt[i] & 0xff;
 49f:	0f be cb             	movsbl %bl,%ecx
 4a2:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 4a5:	85 d2                	test   %edx,%edx
 4a7:	74 c7                	je     470 <printf+0x30>
      }
    } else if(state == '%'){
 4a9:	83 fa 25             	cmp    $0x25,%edx
 4ac:	75 e6                	jne    494 <printf+0x54>
      if(c == 'd'){
 4ae:	83 f8 64             	cmp    $0x64,%eax
 4b1:	0f 84 99 00 00 00    	je     550 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4b7:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 4bd:	83 f9 70             	cmp    $0x70,%ecx
 4c0:	74 5e                	je     520 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4c2:	83 f8 73             	cmp    $0x73,%eax
 4c5:	0f 84 d5 00 00 00    	je     5a0 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4cb:	83 f8 63             	cmp    $0x63,%eax
 4ce:	0f 84 8c 00 00 00    	je     560 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4d4:	83 f8 25             	cmp    $0x25,%eax
 4d7:	0f 84 b3 00 00 00    	je     590 <printf+0x150>
  write(fd, &c, 1);
 4dd:	83 ec 04             	sub    $0x4,%esp
 4e0:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4e4:	6a 01                	push   $0x1
 4e6:	57                   	push   %edi
 4e7:	ff 75 08             	pushl  0x8(%ebp)
 4ea:	e8 e2 fd ff ff       	call   2d1 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 4ef:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 4f2:	83 c4 0c             	add    $0xc,%esp
 4f5:	6a 01                	push   $0x1
 4f7:	83 c6 01             	add    $0x1,%esi
 4fa:	57                   	push   %edi
 4fb:	ff 75 08             	pushl  0x8(%ebp)
 4fe:	e8 ce fd ff ff       	call   2d1 <write>
  for(i = 0; fmt[i]; i++){
 503:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 507:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 50a:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 50c:	84 db                	test   %bl,%bl
 50e:	75 8f                	jne    49f <printf+0x5f>
    }
  }
}
 510:	8d 65 f4             	lea    -0xc(%ebp),%esp
 513:	5b                   	pop    %ebx
 514:	5e                   	pop    %esi
 515:	5f                   	pop    %edi
 516:	5d                   	pop    %ebp
 517:	c3                   	ret    
 518:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 51f:	90                   	nop
        printint(fd, *ap, 16, 0);
 520:	83 ec 0c             	sub    $0xc,%esp
 523:	b9 10 00 00 00       	mov    $0x10,%ecx
 528:	6a 00                	push   $0x0
 52a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 52d:	8b 45 08             	mov    0x8(%ebp),%eax
 530:	8b 13                	mov    (%ebx),%edx
 532:	e8 49 fe ff ff       	call   380 <printint>
        ap++;
 537:	89 d8                	mov    %ebx,%eax
 539:	83 c4 10             	add    $0x10,%esp
      state = 0;
 53c:	31 d2                	xor    %edx,%edx
        ap++;
 53e:	83 c0 04             	add    $0x4,%eax
 541:	89 45 d0             	mov    %eax,-0x30(%ebp)
 544:	e9 4b ff ff ff       	jmp    494 <printf+0x54>
 549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 550:	83 ec 0c             	sub    $0xc,%esp
 553:	b9 0a 00 00 00       	mov    $0xa,%ecx
 558:	6a 01                	push   $0x1
 55a:	eb ce                	jmp    52a <printf+0xea>
 55c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 560:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 563:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 566:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 568:	6a 01                	push   $0x1
        ap++;
 56a:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 56d:	57                   	push   %edi
 56e:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 571:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 574:	e8 58 fd ff ff       	call   2d1 <write>
        ap++;
 579:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 57c:	83 c4 10             	add    $0x10,%esp
      state = 0;
 57f:	31 d2                	xor    %edx,%edx
 581:	e9 0e ff ff ff       	jmp    494 <printf+0x54>
 586:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 58d:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 590:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 593:	83 ec 04             	sub    $0x4,%esp
 596:	e9 5a ff ff ff       	jmp    4f5 <printf+0xb5>
 59b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 59f:	90                   	nop
        s = (char*)*ap;
 5a0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 5a3:	8b 18                	mov    (%eax),%ebx
        ap++;
 5a5:	83 c0 04             	add    $0x4,%eax
 5a8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 5ab:	85 db                	test   %ebx,%ebx
 5ad:	74 17                	je     5c6 <printf+0x186>
        while(*s != 0){
 5af:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 5b2:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 5b4:	84 c0                	test   %al,%al
 5b6:	0f 84 d8 fe ff ff    	je     494 <printf+0x54>
 5bc:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 5bf:	89 de                	mov    %ebx,%esi
 5c1:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5c4:	eb 1a                	jmp    5e0 <printf+0x1a0>
          s = "(null)";
 5c6:	bb cf 07 00 00       	mov    $0x7cf,%ebx
        while(*s != 0){
 5cb:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 5ce:	b8 28 00 00 00       	mov    $0x28,%eax
 5d3:	89 de                	mov    %ebx,%esi
 5d5:	8b 5d 08             	mov    0x8(%ebp),%ebx
 5d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5df:	90                   	nop
  write(fd, &c, 1);
 5e0:	83 ec 04             	sub    $0x4,%esp
          s++;
 5e3:	83 c6 01             	add    $0x1,%esi
 5e6:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5e9:	6a 01                	push   $0x1
 5eb:	57                   	push   %edi
 5ec:	53                   	push   %ebx
 5ed:	e8 df fc ff ff       	call   2d1 <write>
        while(*s != 0){
 5f2:	0f b6 06             	movzbl (%esi),%eax
 5f5:	83 c4 10             	add    $0x10,%esp
 5f8:	84 c0                	test   %al,%al
 5fa:	75 e4                	jne    5e0 <printf+0x1a0>
 5fc:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 5ff:	31 d2                	xor    %edx,%edx
 601:	e9 8e fe ff ff       	jmp    494 <printf+0x54>
 606:	66 90                	xchg   %ax,%ax
 608:	66 90                	xchg   %ax,%ax
 60a:	66 90                	xchg   %ax,%ax
 60c:	66 90                	xchg   %ax,%ax
 60e:	66 90                	xchg   %ax,%ax

00000610 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 610:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 611:	a1 84 0a 00 00       	mov    0xa84,%eax
{
 616:	89 e5                	mov    %esp,%ebp
 618:	57                   	push   %edi
 619:	56                   	push   %esi
 61a:	53                   	push   %ebx
 61b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 61e:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 620:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 623:	39 c8                	cmp    %ecx,%eax
 625:	73 19                	jae    640 <free+0x30>
 627:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 62e:	66 90                	xchg   %ax,%ax
 630:	39 d1                	cmp    %edx,%ecx
 632:	72 14                	jb     648 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 634:	39 d0                	cmp    %edx,%eax
 636:	73 10                	jae    648 <free+0x38>
{
 638:	89 d0                	mov    %edx,%eax
 63a:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 63c:	39 c8                	cmp    %ecx,%eax
 63e:	72 f0                	jb     630 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 640:	39 d0                	cmp    %edx,%eax
 642:	72 f4                	jb     638 <free+0x28>
 644:	39 d1                	cmp    %edx,%ecx
 646:	73 f0                	jae    638 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 648:	8b 73 fc             	mov    -0x4(%ebx),%esi
 64b:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 64e:	39 fa                	cmp    %edi,%edx
 650:	74 1e                	je     670 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 652:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 655:	8b 50 04             	mov    0x4(%eax),%edx
 658:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 65b:	39 f1                	cmp    %esi,%ecx
 65d:	74 28                	je     687 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 65f:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 661:	5b                   	pop    %ebx
  freep = p;
 662:	a3 84 0a 00 00       	mov    %eax,0xa84
}
 667:	5e                   	pop    %esi
 668:	5f                   	pop    %edi
 669:	5d                   	pop    %ebp
 66a:	c3                   	ret    
 66b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 66f:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 670:	03 72 04             	add    0x4(%edx),%esi
 673:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 676:	8b 10                	mov    (%eax),%edx
 678:	8b 12                	mov    (%edx),%edx
 67a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 67d:	8b 50 04             	mov    0x4(%eax),%edx
 680:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 683:	39 f1                	cmp    %esi,%ecx
 685:	75 d8                	jne    65f <free+0x4f>
    p->s.size += bp->s.size;
 687:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 68a:	a3 84 0a 00 00       	mov    %eax,0xa84
    p->s.size += bp->s.size;
 68f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 692:	8b 53 f8             	mov    -0x8(%ebx),%edx
 695:	89 10                	mov    %edx,(%eax)
}
 697:	5b                   	pop    %ebx
 698:	5e                   	pop    %esi
 699:	5f                   	pop    %edi
 69a:	5d                   	pop    %ebp
 69b:	c3                   	ret    
 69c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	57                   	push   %edi
 6a4:	56                   	push   %esi
 6a5:	53                   	push   %ebx
 6a6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6ac:	8b 3d 84 0a 00 00    	mov    0xa84,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6b2:	8d 70 07             	lea    0x7(%eax),%esi
 6b5:	c1 ee 03             	shr    $0x3,%esi
 6b8:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 6bb:	85 ff                	test   %edi,%edi
 6bd:	0f 84 ad 00 00 00    	je     770 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6c3:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 6c5:	8b 4a 04             	mov    0x4(%edx),%ecx
 6c8:	39 f1                	cmp    %esi,%ecx
 6ca:	73 72                	jae    73e <malloc+0x9e>
 6cc:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 6d2:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6d7:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 6da:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 6e1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 6e4:	eb 1b                	jmp    701 <malloc+0x61>
 6e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6ed:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6f0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6f2:	8b 48 04             	mov    0x4(%eax),%ecx
 6f5:	39 f1                	cmp    %esi,%ecx
 6f7:	73 4f                	jae    748 <malloc+0xa8>
 6f9:	8b 3d 84 0a 00 00    	mov    0xa84,%edi
 6ff:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 701:	39 d7                	cmp    %edx,%edi
 703:	75 eb                	jne    6f0 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 705:	83 ec 0c             	sub    $0xc,%esp
 708:	ff 75 e4             	pushl  -0x1c(%ebp)
 70b:	e8 29 fc ff ff       	call   339 <sbrk>
  if(p == (char*)-1)
 710:	83 c4 10             	add    $0x10,%esp
 713:	83 f8 ff             	cmp    $0xffffffff,%eax
 716:	74 1c                	je     734 <malloc+0x94>
  hp->s.size = nu;
 718:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 71b:	83 ec 0c             	sub    $0xc,%esp
 71e:	83 c0 08             	add    $0x8,%eax
 721:	50                   	push   %eax
 722:	e8 e9 fe ff ff       	call   610 <free>
  return freep;
 727:	8b 15 84 0a 00 00    	mov    0xa84,%edx
      if((p = morecore(nunits)) == 0)
 72d:	83 c4 10             	add    $0x10,%esp
 730:	85 d2                	test   %edx,%edx
 732:	75 bc                	jne    6f0 <malloc+0x50>
        return 0;
  }
}
 734:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 737:	31 c0                	xor    %eax,%eax
}
 739:	5b                   	pop    %ebx
 73a:	5e                   	pop    %esi
 73b:	5f                   	pop    %edi
 73c:	5d                   	pop    %ebp
 73d:	c3                   	ret    
    if(p->s.size >= nunits){
 73e:	89 d0                	mov    %edx,%eax
 740:	89 fa                	mov    %edi,%edx
 742:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 748:	39 ce                	cmp    %ecx,%esi
 74a:	74 54                	je     7a0 <malloc+0x100>
        p->s.size -= nunits;
 74c:	29 f1                	sub    %esi,%ecx
 74e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 751:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 754:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 757:	89 15 84 0a 00 00    	mov    %edx,0xa84
}
 75d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 760:	83 c0 08             	add    $0x8,%eax
}
 763:	5b                   	pop    %ebx
 764:	5e                   	pop    %esi
 765:	5f                   	pop    %edi
 766:	5d                   	pop    %ebp
 767:	c3                   	ret    
 768:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 76f:	90                   	nop
    base.s.ptr = freep = prevp = &base;
 770:	c7 05 84 0a 00 00 88 	movl   $0xa88,0xa84
 777:	0a 00 00 
    base.s.size = 0;
 77a:	bf 88 0a 00 00       	mov    $0xa88,%edi
    base.s.ptr = freep = prevp = &base;
 77f:	c7 05 88 0a 00 00 88 	movl   $0xa88,0xa88
 786:	0a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 789:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 78b:	c7 05 8c 0a 00 00 00 	movl   $0x0,0xa8c
 792:	00 00 00 
    if(p->s.size >= nunits){
 795:	e9 32 ff ff ff       	jmp    6cc <malloc+0x2c>
 79a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 7a0:	8b 08                	mov    (%eax),%ecx
 7a2:	89 0a                	mov    %ecx,(%edx)
 7a4:	eb b1                	jmp    757 <malloc+0xb7>
