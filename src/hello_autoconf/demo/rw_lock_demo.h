#ifndef _RW_LOCK_DEMO_H
#define _RW_LOCK_DEMO_H

struct number
{
	int x;
	int y;
	pthread_rwlock_t rwLock;
};

int addvec(struct number* num);
void swapvec(struct number* num);

#endif
