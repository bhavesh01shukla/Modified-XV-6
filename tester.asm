
_tester:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "stat.h"
#include "user.h"
int main()
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	8d 75 d4             	lea    -0x2c(%ebp),%esi
  12:	53                   	push   %ebx
  13:	8d 5d c0             	lea    -0x40(%ebp),%ebx
  16:	51                   	push   %ecx
  17:	83 ec 38             	sub    $0x38,%esp
    
    int w,r,ret,p[10];
    
        for(int i=0;i<5;i++)
        {
            p[i]=fork();
  1a:	e8 ea 02 00 00       	call   309 <fork>
  1f:	89 03                	mov    %eax,(%ebx)
            if(p[i]==0)
  21:	85 c0                	test   %eax,%eax
  23:	74 69                	je     8e <main+0x8e>
  25:	83 c3 04             	add    $0x4,%ebx
        for(int i=0;i<5;i++)
  28:	39 de                	cmp    %ebx,%esi
  2a:	75 ee                	jne    1a <main+0x1a>
                    printf(1,"");
            
                exit();
            }
        }
        for(int i=0;i<5;i++)
  2c:	31 db                	xor    %ebx,%ebx
        {
            printf(1,"proc %d.... pid %d \n",i,p[i]);
            set_priority(p[i],64-i);
  2e:	bf 40 00 00 00       	mov    $0x40,%edi
            printf(1,"proc %d.... pid %d \n",i,p[i]);
  33:	8b 74 9d c0          	mov    -0x40(%ebp,%ebx,4),%esi
  37:	56                   	push   %esi
  38:	53                   	push   %ebx
  39:	68 08 08 00 00       	push   $0x808
  3e:	6a 01                	push   $0x1
  40:	e8 5b 04 00 00       	call   4a0 <printf>
            set_priority(p[i],64-i);
  45:	59                   	pop    %ecx
  46:	58                   	pop    %eax
  47:	89 f8                	mov    %edi,%eax
  49:	29 d8                	sub    %ebx,%eax
        for(int i=0;i<5;i++)
  4b:	83 c3 01             	add    $0x1,%ebx
            set_priority(p[i],64-i);
  4e:	50                   	push   %eax
  4f:	56                   	push   %esi
  50:	e8 6c 03 00 00       	call   3c1 <set_priority>
        for(int i=0;i<5;i++)
  55:	83 c4 10             	add    $0x10,%esp
  58:	83 fb 05             	cmp    $0x5,%ebx
  5b:	75 d6                	jne    33 <main+0x33>
  5d:	8d 7d bc             	lea    -0x44(%ebp),%edi
  60:	8d 75 b8             	lea    -0x48(%ebp),%esi
        }
        for(int i=0; i<5;i++)
        {
            ret=waitx(&w,&r);
  63:	83 ec 08             	sub    $0x8,%esp
  66:	57                   	push   %edi
  67:	56                   	push   %esi
  68:	e8 44 03 00 00       	call   3b1 <waitx>
            printf(1,"pid-%d rtime-%d wtime-%d\n",ret,r,w);
  6d:	5a                   	pop    %edx
  6e:	ff 75 b8             	pushl  -0x48(%ebp)
  71:	ff 75 bc             	pushl  -0x44(%ebp)
  74:	50                   	push   %eax
  75:	68 1d 08 00 00       	push   $0x81d
  7a:	6a 01                	push   $0x1
  7c:	e8 1f 04 00 00       	call   4a0 <printf>
        for(int i=0; i<5;i++)
  81:	83 c4 20             	add    $0x20,%esp
  84:	83 eb 01             	sub    $0x1,%ebx
  87:	75 da                	jne    63 <main+0x63>
                exit();
  89:	e8 83 02 00 00       	call   311 <exit>
  8e:	bb 01 e1 f5 05       	mov    $0x5f5e101,%ebx
  93:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  97:	90                   	nop
                    printf(1,"");
  98:	83 ec 08             	sub    $0x8,%esp
  9b:	68 1c 08 00 00       	push   $0x81c
  a0:	6a 01                	push   $0x1
  a2:	e8 f9 03 00 00       	call   4a0 <printf>
                for(int i=0;i<=100000000;i++)
  a7:	83 c4 10             	add    $0x10,%esp
  aa:	83 eb 01             	sub    $0x1,%ebx
  ad:	75 e9                	jne    98 <main+0x98>
  af:	eb d8                	jmp    89 <main+0x89>
  b1:	66 90                	xchg   %ax,%ax
  b3:	66 90                	xchg   %ax,%ax
  b5:	66 90                	xchg   %ax,%ax
  b7:	66 90                	xchg   %ax,%ax
  b9:	66 90                	xchg   %ax,%ax
  bb:	66 90                	xchg   %ax,%ax
  bd:	66 90                	xchg   %ax,%ax
  bf:	90                   	nop

000000c0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  c0:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  c1:	31 d2                	xor    %edx,%edx
{
  c3:	89 e5                	mov    %esp,%ebp
  c5:	53                   	push   %ebx
  c6:	8b 45 08             	mov    0x8(%ebp),%eax
  c9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
  d0:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
  d4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  d7:	83 c2 01             	add    $0x1,%edx
  da:	84 c9                	test   %cl,%cl
  dc:	75 f2                	jne    d0 <strcpy+0x10>
    ;
  return os;
}
  de:	5b                   	pop    %ebx
  df:	5d                   	pop    %ebp
  e0:	c3                   	ret    
  e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  e8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  ef:	90                   	nop

000000f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	56                   	push   %esi
  f4:	53                   	push   %ebx
  f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  f8:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(*p && *p == *q)
  fb:	0f b6 13             	movzbl (%ebx),%edx
  fe:	0f b6 0e             	movzbl (%esi),%ecx
 101:	84 d2                	test   %dl,%dl
 103:	74 1e                	je     123 <strcmp+0x33>
 105:	b8 01 00 00 00       	mov    $0x1,%eax
 10a:	38 ca                	cmp    %cl,%dl
 10c:	74 09                	je     117 <strcmp+0x27>
 10e:	eb 20                	jmp    130 <strcmp+0x40>
 110:	83 c0 01             	add    $0x1,%eax
 113:	38 ca                	cmp    %cl,%dl
 115:	75 19                	jne    130 <strcmp+0x40>
 117:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 11b:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
 11f:	84 d2                	test   %dl,%dl
 121:	75 ed                	jne    110 <strcmp+0x20>
 123:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
}
 125:	5b                   	pop    %ebx
 126:	5e                   	pop    %esi
  return (uchar)*p - (uchar)*q;
 127:	29 c8                	sub    %ecx,%eax
}
 129:	5d                   	pop    %ebp
 12a:	c3                   	ret    
 12b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 12f:	90                   	nop
 130:	0f b6 c2             	movzbl %dl,%eax
 133:	5b                   	pop    %ebx
 134:	5e                   	pop    %esi
  return (uchar)*p - (uchar)*q;
 135:	29 c8                	sub    %ecx,%eax
}
 137:	5d                   	pop    %ebp
 138:	c3                   	ret    
 139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000140 <strlen>:

uint
strlen(const char *s)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 146:	80 39 00             	cmpb   $0x0,(%ecx)
 149:	74 15                	je     160 <strlen+0x20>
 14b:	31 d2                	xor    %edx,%edx
 14d:	8d 76 00             	lea    0x0(%esi),%esi
 150:	83 c2 01             	add    $0x1,%edx
 153:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 157:	89 d0                	mov    %edx,%eax
 159:	75 f5                	jne    150 <strlen+0x10>
    ;
  return n;
}
 15b:	5d                   	pop    %ebp
 15c:	c3                   	ret    
 15d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 160:	31 c0                	xor    %eax,%eax
}
 162:	5d                   	pop    %ebp
 163:	c3                   	ret    
 164:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 16b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 16f:	90                   	nop

00000170 <memset>:

void*
memset(void *dst, int c, uint n)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	57                   	push   %edi
 174:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 177:	8b 4d 10             	mov    0x10(%ebp),%ecx
 17a:	8b 45 0c             	mov    0xc(%ebp),%eax
 17d:	89 d7                	mov    %edx,%edi
 17f:	fc                   	cld    
 180:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 182:	89 d0                	mov    %edx,%eax
 184:	5f                   	pop    %edi
 185:	5d                   	pop    %ebp
 186:	c3                   	ret    
 187:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 18e:	66 90                	xchg   %ax,%ax

00000190 <strchr>:

char*
strchr(const char *s, char c)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	53                   	push   %ebx
 194:	8b 45 08             	mov    0x8(%ebp),%eax
 197:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 19a:	0f b6 18             	movzbl (%eax),%ebx
 19d:	84 db                	test   %bl,%bl
 19f:	74 1d                	je     1be <strchr+0x2e>
 1a1:	89 d1                	mov    %edx,%ecx
    if(*s == c)
 1a3:	38 d3                	cmp    %dl,%bl
 1a5:	75 0d                	jne    1b4 <strchr+0x24>
 1a7:	eb 17                	jmp    1c0 <strchr+0x30>
 1a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1b0:	38 ca                	cmp    %cl,%dl
 1b2:	74 0c                	je     1c0 <strchr+0x30>
  for(; *s; s++)
 1b4:	83 c0 01             	add    $0x1,%eax
 1b7:	0f b6 10             	movzbl (%eax),%edx
 1ba:	84 d2                	test   %dl,%dl
 1bc:	75 f2                	jne    1b0 <strchr+0x20>
      return (char*)s;
  return 0;
 1be:	31 c0                	xor    %eax,%eax
}
 1c0:	5b                   	pop    %ebx
 1c1:	5d                   	pop    %ebp
 1c2:	c3                   	ret    
 1c3:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 1ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001d0 <gets>:

char*
gets(char *buf, int max)
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	57                   	push   %edi
 1d4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d5:	31 f6                	xor    %esi,%esi
{
 1d7:	53                   	push   %ebx
 1d8:	89 f3                	mov    %esi,%ebx
 1da:	83 ec 1c             	sub    $0x1c,%esp
 1dd:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 1e0:	eb 2f                	jmp    211 <gets+0x41>
 1e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 1e8:	83 ec 04             	sub    $0x4,%esp
 1eb:	8d 45 e7             	lea    -0x19(%ebp),%eax
 1ee:	6a 01                	push   $0x1
 1f0:	50                   	push   %eax
 1f1:	6a 00                	push   $0x0
 1f3:	e8 31 01 00 00       	call   329 <read>
    if(cc < 1)
 1f8:	83 c4 10             	add    $0x10,%esp
 1fb:	85 c0                	test   %eax,%eax
 1fd:	7e 1c                	jle    21b <gets+0x4b>
      break;
    buf[i++] = c;
 1ff:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 203:	83 c7 01             	add    $0x1,%edi
 206:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 209:	3c 0a                	cmp    $0xa,%al
 20b:	74 23                	je     230 <gets+0x60>
 20d:	3c 0d                	cmp    $0xd,%al
 20f:	74 1f                	je     230 <gets+0x60>
  for(i=0; i+1 < max; ){
 211:	83 c3 01             	add    $0x1,%ebx
 214:	89 fe                	mov    %edi,%esi
 216:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 219:	7c cd                	jl     1e8 <gets+0x18>
 21b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 21d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 220:	c6 03 00             	movb   $0x0,(%ebx)
}
 223:	8d 65 f4             	lea    -0xc(%ebp),%esp
 226:	5b                   	pop    %ebx
 227:	5e                   	pop    %esi
 228:	5f                   	pop    %edi
 229:	5d                   	pop    %ebp
 22a:	c3                   	ret    
 22b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 22f:	90                   	nop
 230:	8b 75 08             	mov    0x8(%ebp),%esi
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	01 de                	add    %ebx,%esi
 238:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 23a:	c6 03 00             	movb   $0x0,(%ebx)
}
 23d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 240:	5b                   	pop    %ebx
 241:	5e                   	pop    %esi
 242:	5f                   	pop    %edi
 243:	5d                   	pop    %ebp
 244:	c3                   	ret    
 245:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 24c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000250 <stat>:

int
stat(const char *n, struct stat *st)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	56                   	push   %esi
 254:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 255:	83 ec 08             	sub    $0x8,%esp
 258:	6a 00                	push   $0x0
 25a:	ff 75 08             	pushl  0x8(%ebp)
 25d:	e8 ef 00 00 00       	call   351 <open>
  if(fd < 0)
 262:	83 c4 10             	add    $0x10,%esp
 265:	85 c0                	test   %eax,%eax
 267:	78 27                	js     290 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 269:	83 ec 08             	sub    $0x8,%esp
 26c:	ff 75 0c             	pushl  0xc(%ebp)
 26f:	89 c3                	mov    %eax,%ebx
 271:	50                   	push   %eax
 272:	e8 f2 00 00 00       	call   369 <fstat>
  close(fd);
 277:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 27a:	89 c6                	mov    %eax,%esi
  close(fd);
 27c:	e8 b8 00 00 00       	call   339 <close>
  return r;
 281:	83 c4 10             	add    $0x10,%esp
}
 284:	8d 65 f8             	lea    -0x8(%ebp),%esp
 287:	89 f0                	mov    %esi,%eax
 289:	5b                   	pop    %ebx
 28a:	5e                   	pop    %esi
 28b:	5d                   	pop    %ebp
 28c:	c3                   	ret    
 28d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 290:	be ff ff ff ff       	mov    $0xffffffff,%esi
 295:	eb ed                	jmp    284 <stat+0x34>
 297:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29e:	66 90                	xchg   %ax,%ax

000002a0 <atoi>:

int
atoi(const char *s)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	53                   	push   %ebx
 2a4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2a7:	0f be 11             	movsbl (%ecx),%edx
 2aa:	8d 42 d0             	lea    -0x30(%edx),%eax
 2ad:	3c 09                	cmp    $0x9,%al
  n = 0;
 2af:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 2b4:	77 1f                	ja     2d5 <atoi+0x35>
 2b6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2bd:	8d 76 00             	lea    0x0(%esi),%esi
    n = n*10 + *s++ - '0';
 2c0:	83 c1 01             	add    $0x1,%ecx
 2c3:	8d 04 80             	lea    (%eax,%eax,4),%eax
 2c6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 2ca:	0f be 11             	movsbl (%ecx),%edx
 2cd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2d0:	80 fb 09             	cmp    $0x9,%bl
 2d3:	76 eb                	jbe    2c0 <atoi+0x20>
  return n;
}
 2d5:	5b                   	pop    %ebx
 2d6:	5d                   	pop    %ebp
 2d7:	c3                   	ret    
 2d8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2df:	90                   	nop

000002e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	57                   	push   %edi
 2e4:	8b 55 10             	mov    0x10(%ebp),%edx
 2e7:	8b 45 08             	mov    0x8(%ebp),%eax
 2ea:	56                   	push   %esi
 2eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2ee:	85 d2                	test   %edx,%edx
 2f0:	7e 13                	jle    305 <memmove+0x25>
 2f2:	01 c2                	add    %eax,%edx
  dst = vdst;
 2f4:	89 c7                	mov    %eax,%edi
 2f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2fd:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
 300:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 301:	39 fa                	cmp    %edi,%edx
 303:	75 fb                	jne    300 <memmove+0x20>
  return vdst;
}
 305:	5e                   	pop    %esi
 306:	5f                   	pop    %edi
 307:	5d                   	pop    %ebp
 308:	c3                   	ret    

00000309 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 309:	b8 01 00 00 00       	mov    $0x1,%eax
 30e:	cd 40                	int    $0x40
 310:	c3                   	ret    

00000311 <exit>:
SYSCALL(exit)
 311:	b8 02 00 00 00       	mov    $0x2,%eax
 316:	cd 40                	int    $0x40
 318:	c3                   	ret    

00000319 <wait>:
SYSCALL(wait)
 319:	b8 03 00 00 00       	mov    $0x3,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret    

00000321 <pipe>:
SYSCALL(pipe)
 321:	b8 04 00 00 00       	mov    $0x4,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <read>:
SYSCALL(read)
 329:	b8 05 00 00 00       	mov    $0x5,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <write>:
SYSCALL(write)
 331:	b8 10 00 00 00       	mov    $0x10,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <close>:
SYSCALL(close)
 339:	b8 15 00 00 00       	mov    $0x15,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <kill>:
SYSCALL(kill)
 341:	b8 06 00 00 00       	mov    $0x6,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <exec>:
SYSCALL(exec)
 349:	b8 07 00 00 00       	mov    $0x7,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    

00000351 <open>:
SYSCALL(open)
 351:	b8 0f 00 00 00       	mov    $0xf,%eax
 356:	cd 40                	int    $0x40
 358:	c3                   	ret    

00000359 <mknod>:
SYSCALL(mknod)
 359:	b8 11 00 00 00       	mov    $0x11,%eax
 35e:	cd 40                	int    $0x40
 360:	c3                   	ret    

00000361 <unlink>:
SYSCALL(unlink)
 361:	b8 12 00 00 00       	mov    $0x12,%eax
 366:	cd 40                	int    $0x40
 368:	c3                   	ret    

00000369 <fstat>:
SYSCALL(fstat)
 369:	b8 08 00 00 00       	mov    $0x8,%eax
 36e:	cd 40                	int    $0x40
 370:	c3                   	ret    

00000371 <link>:
SYSCALL(link)
 371:	b8 13 00 00 00       	mov    $0x13,%eax
 376:	cd 40                	int    $0x40
 378:	c3                   	ret    

00000379 <mkdir>:
SYSCALL(mkdir)
 379:	b8 14 00 00 00       	mov    $0x14,%eax
 37e:	cd 40                	int    $0x40
 380:	c3                   	ret    

00000381 <chdir>:
SYSCALL(chdir)
 381:	b8 09 00 00 00       	mov    $0x9,%eax
 386:	cd 40                	int    $0x40
 388:	c3                   	ret    

00000389 <dup>:
SYSCALL(dup)
 389:	b8 0a 00 00 00       	mov    $0xa,%eax
 38e:	cd 40                	int    $0x40
 390:	c3                   	ret    

00000391 <getpid>:
SYSCALL(getpid)
 391:	b8 0b 00 00 00       	mov    $0xb,%eax
 396:	cd 40                	int    $0x40
 398:	c3                   	ret    

00000399 <sbrk>:
SYSCALL(sbrk)
 399:	b8 0c 00 00 00       	mov    $0xc,%eax
 39e:	cd 40                	int    $0x40
 3a0:	c3                   	ret    

000003a1 <sleep>:
SYSCALL(sleep)
 3a1:	b8 0d 00 00 00       	mov    $0xd,%eax
 3a6:	cd 40                	int    $0x40
 3a8:	c3                   	ret    

000003a9 <uptime>:
SYSCALL(uptime)
 3a9:	b8 0e 00 00 00       	mov    $0xe,%eax
 3ae:	cd 40                	int    $0x40
 3b0:	c3                   	ret    

000003b1 <waitx>:
SYSCALL(waitx)
 3b1:	b8 16 00 00 00       	mov    $0x16,%eax
 3b6:	cd 40                	int    $0x40
 3b8:	c3                   	ret    

000003b9 <cps>:
SYSCALL(cps)
 3b9:	b8 17 00 00 00       	mov    $0x17,%eax
 3be:	cd 40                	int    $0x40
 3c0:	c3                   	ret    

000003c1 <set_priority>:
SYSCALL(set_priority)
 3c1:	b8 18 00 00 00       	mov    $0x18,%eax
 3c6:	cd 40                	int    $0x40
 3c8:	c3                   	ret    

000003c9 <getpinfo>:
 3c9:	b8 19 00 00 00       	mov    $0x19,%eax
 3ce:	cd 40                	int    $0x40
 3d0:	c3                   	ret    
 3d1:	66 90                	xchg   %ax,%ax
 3d3:	66 90                	xchg   %ax,%ax
 3d5:	66 90                	xchg   %ax,%ax
 3d7:	66 90                	xchg   %ax,%ax
 3d9:	66 90                	xchg   %ax,%ax
 3db:	66 90                	xchg   %ax,%ax
 3dd:	66 90                	xchg   %ax,%ax
 3df:	90                   	nop

000003e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
 3e5:	53                   	push   %ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 3e6:	89 d3                	mov    %edx,%ebx
{
 3e8:	83 ec 3c             	sub    $0x3c,%esp
 3eb:	89 45 bc             	mov    %eax,-0x44(%ebp)
  if(sgn && xx < 0){
 3ee:	85 d2                	test   %edx,%edx
 3f0:	0f 89 92 00 00 00    	jns    488 <printint+0xa8>
 3f6:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 3fa:	0f 84 88 00 00 00    	je     488 <printint+0xa8>
    neg = 1;
 400:	c7 45 c0 01 00 00 00 	movl   $0x1,-0x40(%ebp)
    x = -xx;
 407:	f7 db                	neg    %ebx
  } else {
    x = xx;
  }

  i = 0;
 409:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 410:	8d 75 d7             	lea    -0x29(%ebp),%esi
 413:	eb 08                	jmp    41d <printint+0x3d>
 415:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 418:	89 7d c4             	mov    %edi,-0x3c(%ebp)
  }while((x /= base) != 0);
 41b:	89 c3                	mov    %eax,%ebx
    buf[i++] = digits[x % base];
 41d:	89 d8                	mov    %ebx,%eax
 41f:	31 d2                	xor    %edx,%edx
 421:	8b 7d c4             	mov    -0x3c(%ebp),%edi
 424:	f7 f1                	div    %ecx
 426:	83 c7 01             	add    $0x1,%edi
 429:	0f b6 92 40 08 00 00 	movzbl 0x840(%edx),%edx
 430:	88 14 3e             	mov    %dl,(%esi,%edi,1)
  }while((x /= base) != 0);
 433:	39 d9                	cmp    %ebx,%ecx
 435:	76 e1                	jbe    418 <printint+0x38>
  if(neg)
 437:	8b 45 c0             	mov    -0x40(%ebp),%eax
 43a:	85 c0                	test   %eax,%eax
 43c:	74 0d                	je     44b <printint+0x6b>
    buf[i++] = '-';
 43e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 443:	ba 2d 00 00 00       	mov    $0x2d,%edx
    buf[i++] = digits[x % base];
 448:	89 7d c4             	mov    %edi,-0x3c(%ebp)
 44b:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 44e:	8b 7d bc             	mov    -0x44(%ebp),%edi
 451:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 455:	eb 0f                	jmp    466 <printint+0x86>
 457:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 45e:	66 90                	xchg   %ax,%ax
 460:	0f b6 13             	movzbl (%ebx),%edx
 463:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 466:	83 ec 04             	sub    $0x4,%esp
 469:	88 55 d7             	mov    %dl,-0x29(%ebp)
 46c:	6a 01                	push   $0x1
 46e:	56                   	push   %esi
 46f:	57                   	push   %edi
 470:	e8 bc fe ff ff       	call   331 <write>

  while(--i >= 0)
 475:	83 c4 10             	add    $0x10,%esp
 478:	39 de                	cmp    %ebx,%esi
 47a:	75 e4                	jne    460 <printint+0x80>
    putc(fd, buf[i]);
}
 47c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 47f:	5b                   	pop    %ebx
 480:	5e                   	pop    %esi
 481:	5f                   	pop    %edi
 482:	5d                   	pop    %ebp
 483:	c3                   	ret    
 484:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 488:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 48f:	e9 75 ff ff ff       	jmp    409 <printint+0x29>
 494:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 49b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 49f:	90                   	nop

000004a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	57                   	push   %edi
 4a4:	56                   	push   %esi
 4a5:	53                   	push   %ebx
 4a6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4a9:	8b 75 0c             	mov    0xc(%ebp),%esi
 4ac:	0f b6 1e             	movzbl (%esi),%ebx
 4af:	84 db                	test   %bl,%bl
 4b1:	0f 84 b9 00 00 00    	je     570 <printf+0xd0>
  ap = (uint*)(void*)&fmt + 1;
 4b7:	8d 45 10             	lea    0x10(%ebp),%eax
 4ba:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 4bd:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 4c0:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 4c2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4c5:	eb 38                	jmp    4ff <printf+0x5f>
 4c7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 4ce:	66 90                	xchg   %ax,%ax
 4d0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 4d3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 4d8:	83 f8 25             	cmp    $0x25,%eax
 4db:	74 17                	je     4f4 <printf+0x54>
  write(fd, &c, 1);
 4dd:	83 ec 04             	sub    $0x4,%esp
 4e0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 4e3:	6a 01                	push   $0x1
 4e5:	57                   	push   %edi
 4e6:	ff 75 08             	pushl  0x8(%ebp)
 4e9:	e8 43 fe ff ff       	call   331 <write>
 4ee:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 4f1:	83 c4 10             	add    $0x10,%esp
 4f4:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 4f7:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 4fb:	84 db                	test   %bl,%bl
 4fd:	74 71                	je     570 <printf+0xd0>
    c = fmt[i] & 0xff;
 4ff:	0f be cb             	movsbl %bl,%ecx
 502:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 505:	85 d2                	test   %edx,%edx
 507:	74 c7                	je     4d0 <printf+0x30>
      }
    } else if(state == '%'){
 509:	83 fa 25             	cmp    $0x25,%edx
 50c:	75 e6                	jne    4f4 <printf+0x54>
      if(c == 'd'){
 50e:	83 f8 64             	cmp    $0x64,%eax
 511:	0f 84 99 00 00 00    	je     5b0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 517:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 51d:	83 f9 70             	cmp    $0x70,%ecx
 520:	74 5e                	je     580 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 522:	83 f8 73             	cmp    $0x73,%eax
 525:	0f 84 d5 00 00 00    	je     600 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 52b:	83 f8 63             	cmp    $0x63,%eax
 52e:	0f 84 8c 00 00 00    	je     5c0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 534:	83 f8 25             	cmp    $0x25,%eax
 537:	0f 84 b3 00 00 00    	je     5f0 <printf+0x150>
  write(fd, &c, 1);
 53d:	83 ec 04             	sub    $0x4,%esp
 540:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 544:	6a 01                	push   $0x1
 546:	57                   	push   %edi
 547:	ff 75 08             	pushl  0x8(%ebp)
 54a:	e8 e2 fd ff ff       	call   331 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 54f:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 552:	83 c4 0c             	add    $0xc,%esp
 555:	6a 01                	push   $0x1
 557:	83 c6 01             	add    $0x1,%esi
 55a:	57                   	push   %edi
 55b:	ff 75 08             	pushl  0x8(%ebp)
 55e:	e8 ce fd ff ff       	call   331 <write>
  for(i = 0; fmt[i]; i++){
 563:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 567:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 56a:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 56c:	84 db                	test   %bl,%bl
 56e:	75 8f                	jne    4ff <printf+0x5f>
    }
  }
}
 570:	8d 65 f4             	lea    -0xc(%ebp),%esp
 573:	5b                   	pop    %ebx
 574:	5e                   	pop    %esi
 575:	5f                   	pop    %edi
 576:	5d                   	pop    %ebp
 577:	c3                   	ret    
 578:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 57f:	90                   	nop
        printint(fd, *ap, 16, 0);
 580:	83 ec 0c             	sub    $0xc,%esp
 583:	b9 10 00 00 00       	mov    $0x10,%ecx
 588:	6a 00                	push   $0x0
 58a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 58d:	8b 45 08             	mov    0x8(%ebp),%eax
 590:	8b 13                	mov    (%ebx),%edx
 592:	e8 49 fe ff ff       	call   3e0 <printint>
        ap++;
 597:	89 d8                	mov    %ebx,%eax
 599:	83 c4 10             	add    $0x10,%esp
      state = 0;
 59c:	31 d2                	xor    %edx,%edx
        ap++;
 59e:	83 c0 04             	add    $0x4,%eax
 5a1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5a4:	e9 4b ff ff ff       	jmp    4f4 <printf+0x54>
 5a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 5b0:	83 ec 0c             	sub    $0xc,%esp
 5b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5b8:	6a 01                	push   $0x1
 5ba:	eb ce                	jmp    58a <printf+0xea>
 5bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 5c0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 5c3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 5c6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 5c8:	6a 01                	push   $0x1
        ap++;
 5ca:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 5cd:	57                   	push   %edi
 5ce:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 5d1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 5d4:	e8 58 fd ff ff       	call   331 <write>
        ap++;
 5d9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5dc:	83 c4 10             	add    $0x10,%esp
      state = 0;
 5df:	31 d2                	xor    %edx,%edx
 5e1:	e9 0e ff ff ff       	jmp    4f4 <printf+0x54>
 5e6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5ed:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 5f0:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 5f3:	83 ec 04             	sub    $0x4,%esp
 5f6:	e9 5a ff ff ff       	jmp    555 <printf+0xb5>
 5fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5ff:	90                   	nop
        s = (char*)*ap;
 600:	8b 45 d0             	mov    -0x30(%ebp),%eax
 603:	8b 18                	mov    (%eax),%ebx
        ap++;
 605:	83 c0 04             	add    $0x4,%eax
 608:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 60b:	85 db                	test   %ebx,%ebx
 60d:	74 17                	je     626 <printf+0x186>
        while(*s != 0){
 60f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 612:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 614:	84 c0                	test   %al,%al
 616:	0f 84 d8 fe ff ff    	je     4f4 <printf+0x54>
 61c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 61f:	89 de                	mov    %ebx,%esi
 621:	8b 5d 08             	mov    0x8(%ebp),%ebx
 624:	eb 1a                	jmp    640 <printf+0x1a0>
          s = "(null)";
 626:	bb 37 08 00 00       	mov    $0x837,%ebx
        while(*s != 0){
 62b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 62e:	b8 28 00 00 00       	mov    $0x28,%eax
 633:	89 de                	mov    %ebx,%esi
 635:	8b 5d 08             	mov    0x8(%ebp),%ebx
 638:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 63f:	90                   	nop
  write(fd, &c, 1);
 640:	83 ec 04             	sub    $0x4,%esp
          s++;
 643:	83 c6 01             	add    $0x1,%esi
 646:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 649:	6a 01                	push   $0x1
 64b:	57                   	push   %edi
 64c:	53                   	push   %ebx
 64d:	e8 df fc ff ff       	call   331 <write>
        while(*s != 0){
 652:	0f b6 06             	movzbl (%esi),%eax
 655:	83 c4 10             	add    $0x10,%esp
 658:	84 c0                	test   %al,%al
 65a:	75 e4                	jne    640 <printf+0x1a0>
 65c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 65f:	31 d2                	xor    %edx,%edx
 661:	e9 8e fe ff ff       	jmp    4f4 <printf+0x54>
 666:	66 90                	xchg   %ax,%ax
 668:	66 90                	xchg   %ax,%ax
 66a:	66 90                	xchg   %ax,%ax
 66c:	66 90                	xchg   %ax,%ax
 66e:	66 90                	xchg   %ax,%ax

00000670 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 670:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 671:	a1 f8 0a 00 00       	mov    0xaf8,%eax
{
 676:	89 e5                	mov    %esp,%ebp
 678:	57                   	push   %edi
 679:	56                   	push   %esi
 67a:	53                   	push   %ebx
 67b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 67e:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 680:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 683:	39 c8                	cmp    %ecx,%eax
 685:	73 19                	jae    6a0 <free+0x30>
 687:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 68e:	66 90                	xchg   %ax,%ax
 690:	39 d1                	cmp    %edx,%ecx
 692:	72 14                	jb     6a8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 694:	39 d0                	cmp    %edx,%eax
 696:	73 10                	jae    6a8 <free+0x38>
{
 698:	89 d0                	mov    %edx,%eax
 69a:	8b 10                	mov    (%eax),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 69c:	39 c8                	cmp    %ecx,%eax
 69e:	72 f0                	jb     690 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6a0:	39 d0                	cmp    %edx,%eax
 6a2:	72 f4                	jb     698 <free+0x28>
 6a4:	39 d1                	cmp    %edx,%ecx
 6a6:	73 f0                	jae    698 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 6a8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 6ab:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 6ae:	39 fa                	cmp    %edi,%edx
 6b0:	74 1e                	je     6d0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 6b2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6b5:	8b 50 04             	mov    0x4(%eax),%edx
 6b8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6bb:	39 f1                	cmp    %esi,%ecx
 6bd:	74 28                	je     6e7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 6bf:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 6c1:	5b                   	pop    %ebx
  freep = p;
 6c2:	a3 f8 0a 00 00       	mov    %eax,0xaf8
}
 6c7:	5e                   	pop    %esi
 6c8:	5f                   	pop    %edi
 6c9:	5d                   	pop    %ebp
 6ca:	c3                   	ret    
 6cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 6cf:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 6d0:	03 72 04             	add    0x4(%edx),%esi
 6d3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 6d6:	8b 10                	mov    (%eax),%edx
 6d8:	8b 12                	mov    (%edx),%edx
 6da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 6dd:	8b 50 04             	mov    0x4(%eax),%edx
 6e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 6e3:	39 f1                	cmp    %esi,%ecx
 6e5:	75 d8                	jne    6bf <free+0x4f>
    p->s.size += bp->s.size;
 6e7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 6ea:	a3 f8 0a 00 00       	mov    %eax,0xaf8
    p->s.size += bp->s.size;
 6ef:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6f2:	8b 53 f8             	mov    -0x8(%ebx),%edx
 6f5:	89 10                	mov    %edx,(%eax)
}
 6f7:	5b                   	pop    %ebx
 6f8:	5e                   	pop    %esi
 6f9:	5f                   	pop    %edi
 6fa:	5d                   	pop    %ebp
 6fb:	c3                   	ret    
 6fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000700 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 709:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 70c:	8b 3d f8 0a 00 00    	mov    0xaf8,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 712:	8d 70 07             	lea    0x7(%eax),%esi
 715:	c1 ee 03             	shr    $0x3,%esi
 718:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 71b:	85 ff                	test   %edi,%edi
 71d:	0f 84 ad 00 00 00    	je     7d0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 723:	8b 17                	mov    (%edi),%edx
    if(p->s.size >= nunits){
 725:	8b 4a 04             	mov    0x4(%edx),%ecx
 728:	39 f1                	cmp    %esi,%ecx
 72a:	73 72                	jae    79e <malloc+0x9e>
 72c:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 732:	bb 00 10 00 00       	mov    $0x1000,%ebx
 737:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 73a:	8d 04 dd 00 00 00 00 	lea    0x0(,%ebx,8),%eax
 741:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 744:	eb 1b                	jmp    761 <malloc+0x61>
 746:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 74d:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 750:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 752:	8b 48 04             	mov    0x4(%eax),%ecx
 755:	39 f1                	cmp    %esi,%ecx
 757:	73 4f                	jae    7a8 <malloc+0xa8>
 759:	8b 3d f8 0a 00 00    	mov    0xaf8,%edi
 75f:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 761:	39 d7                	cmp    %edx,%edi
 763:	75 eb                	jne    750 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 765:	83 ec 0c             	sub    $0xc,%esp
 768:	ff 75 e4             	pushl  -0x1c(%ebp)
 76b:	e8 29 fc ff ff       	call   399 <sbrk>
  if(p == (char*)-1)
 770:	83 c4 10             	add    $0x10,%esp
 773:	83 f8 ff             	cmp    $0xffffffff,%eax
 776:	74 1c                	je     794 <malloc+0x94>
  hp->s.size = nu;
 778:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 77b:	83 ec 0c             	sub    $0xc,%esp
 77e:	83 c0 08             	add    $0x8,%eax
 781:	50                   	push   %eax
 782:	e8 e9 fe ff ff       	call   670 <free>
  return freep;
 787:	8b 15 f8 0a 00 00    	mov    0xaf8,%edx
      if((p = morecore(nunits)) == 0)
 78d:	83 c4 10             	add    $0x10,%esp
 790:	85 d2                	test   %edx,%edx
 792:	75 bc                	jne    750 <malloc+0x50>
        return 0;
  }
}
 794:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 797:	31 c0                	xor    %eax,%eax
}
 799:	5b                   	pop    %ebx
 79a:	5e                   	pop    %esi
 79b:	5f                   	pop    %edi
 79c:	5d                   	pop    %ebp
 79d:	c3                   	ret    
    if(p->s.size >= nunits){
 79e:	89 d0                	mov    %edx,%eax
 7a0:	89 fa                	mov    %edi,%edx
 7a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 7a8:	39 ce                	cmp    %ecx,%esi
 7aa:	74 54                	je     800 <malloc+0x100>
        p->s.size -= nunits;
 7ac:	29 f1                	sub    %esi,%ecx
 7ae:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 7b1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 7b4:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 7b7:	89 15 f8 0a 00 00    	mov    %edx,0xaf8
}
 7bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 7c0:	83 c0 08             	add    $0x8,%eax
}
 7c3:	5b                   	pop    %ebx
 7c4:	5e                   	pop    %esi
 7c5:	5f                   	pop    %edi
 7c6:	5d                   	pop    %ebp
 7c7:	c3                   	ret    
 7c8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7cf:	90                   	nop
    base.s.ptr = freep = prevp = &base;
 7d0:	c7 05 f8 0a 00 00 fc 	movl   $0xafc,0xaf8
 7d7:	0a 00 00 
    base.s.size = 0;
 7da:	bf fc 0a 00 00       	mov    $0xafc,%edi
    base.s.ptr = freep = prevp = &base;
 7df:	c7 05 fc 0a 00 00 fc 	movl   $0xafc,0xafc
 7e6:	0a 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e9:	89 fa                	mov    %edi,%edx
    base.s.size = 0;
 7eb:	c7 05 00 0b 00 00 00 	movl   $0x0,0xb00
 7f2:	00 00 00 
    if(p->s.size >= nunits){
 7f5:	e9 32 ff ff ff       	jmp    72c <malloc+0x2c>
 7fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 800:	8b 08                	mov    (%eax),%ecx
 802:	89 0a                	mov    %ecx,(%edx)
 804:	eb b1                	jmp    7b7 <malloc+0xb7>
