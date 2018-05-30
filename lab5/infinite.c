#include <stdio.h>
#include <signal.h>

void handler(int sig);
void handler(int sig){
	printf("Caugh signal: %d\n", sig);
}

int main(){
	signal(SIGTERM, handler);
	int x=0;
	while(1){
		x++;
	}
}
