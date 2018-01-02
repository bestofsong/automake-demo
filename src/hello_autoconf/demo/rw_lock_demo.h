#ifndef _RW_LOCK_DEMO_H
#define _RW_LOCK_DEMO_H

#ifdef __cplusplus
extern "C"
{
#endif

struct number
{
	int x;
	int y;
	pthread_rwlock_t rwLock;
};

int addvec(struct number* num);
void swapvec(struct number* num);

#ifdef __cplusplus
}
#endif

#endif
