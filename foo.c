#include "types.h"
#include "stat.h"
#include "user.h"
int main(int argc, char *argv[])
{
    
    int w,r,ret,p[10];
    if(fork()==0)
    {
        for(int i=0;i<3;i++)
        {
            p[i]=fork();
            if(p[i]==0)
            {
                for(int i=0;i<=100000000;i++)
                {
                    //x=(x+ 25*65);
                    printf(1,"");
                }
                 sleep(1000);
                // exec(argv[1],argv);
                exit();
            }
        }
        for(int i=0;i<3;i++)
        {
            printf(1,"proc %d.... pid %d \n",i,p[i]);
            set_priority(p[i],64-i);
        }
        for(int i=0; i<3;i++)
        {
            ret=waitx(&w,&r);
            printf(1,"pid-%d rtime-%d wtime-%d\n",ret,r,w);
        }
        exit();
    }
    else
    {
        ret=waitx(&w,&r);
        printf(1,"time=%d\n",w+r);
        exit();
    }
}