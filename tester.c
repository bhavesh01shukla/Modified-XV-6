#include "types.h"
#include "stat.h"
#include "user.h"
int main()
{
    
    int w,r,ret,p[10];
    
        for(int i=0;i<5;i++)
        {
            p[i]=fork();
            if(p[i]==0)
            {
                for(int i=0;i<=100000000;i++)
                    printf(1,"");
            
                exit();
            }
        }
        for(int i=0;i<5;i++)
        {
            printf(1,"proc %d.... pid %d \n",i,p[i]);
            set_priority(p[i],64-i);
        }
        for(int i=0; i<5;i++)
        {
            ret=waitx(&w,&r);
            printf(1,"pid-%d rtime-%d wtime-%d\n",ret,r,w);
        }
        exit();
}