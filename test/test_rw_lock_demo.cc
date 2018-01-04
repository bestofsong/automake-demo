#include <stdio.h>
#include <sys/types.h>
#include <pthread.h>
#include <utils/swap.h>
#include <demo/rw_lock_demo.h>

void* swapapple(void* x)
{
	swapvec((struct number *)x);
	return NULL;
}

void* addapple(void* x)
{
	int sum;
	sum = addvec((struct number *)x);
	printf("sum = %d\n",sum);
	return NULL;
}


int main()
{
    int x = 12 ,y = 90;
    struct number apple;
	pthread_t ThreadA,ThreadB;
    apple.x= x;
	apple.y= y;
	pthread_rwlock_init(&apple.rwLock,NULL);
	pthread_create(&ThreadA,NULL,swapapple,&apple);
	pthread_create(&ThreadB,NULL,addapple,&apple);
    pthread_join(ThreadA,NULL);
    pthread_join(ThreadB,NULL);
	printf("x = %d,y = %d\n",apple.x,apple.y);
	return 0;
}