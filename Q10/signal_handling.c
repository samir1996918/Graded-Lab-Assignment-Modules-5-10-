#include <stdio.h>
#include <unistd.h>
#include <signal.h>
#include <stdlib.h>

void handle_sigterm(int sig) {
    printf("Parent received SIGTERM signal\n");
}

void handle_sigint(int sig) {
    printf("Parent received SIGINT signal. Exiting gracefully.\n");
    exit(0);
}

int main() {
    signal(SIGTERM, handle_sigterm);
    signal(SIGINT, handle_sigint);

    pid_t pid1 = fork();

    if (pid1 == 0) {
        sleep(5);
        kill(getppid(), SIGTERM);
        return 0;
    }

    pid_t pid2 = fork();

    if (pid2 == 0) {
        sleep(10);
        kill(getppid(), SIGINT);
        return 0;
    }

    while (1) {
        pause();
    }

    return 0;
}
