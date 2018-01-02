#ifdef __cplusplus
extern {
#endif

#include <pthread.h>
#include <utils/swap.h>
#include "rw_lock_demo.h"

int addvec(struct number* num)
{
	int sum;
	pthread_rwlock_rdlock(&num->rwLock);
    sum = num->x+num->y;
	pthread_rwlock_unlock(&num->rwLock);
	return sum;
}

void swapvec(struct number* num)
{
	pthread_rwlock_wrlock(&num->rwLock);
    swap(&num->x,&num->y);
	pthread_rwlock_unlock(&num->rwLock);
}
#ifdef __cplusplus
}
#endif

