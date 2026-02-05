#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

int main() {
    pid_t pid;

    for(int i = 0; i < 3; i++) {
        pid = fork();

        if(pid == 0) {
            // Child process
            printf("Child created with PID: %d\n", getpid());
            return 0;
        }
    }

    // Parent process cleans child processes
    while((pid = wait(NULL)) > 0) {
        printf("Parent cleaned child with PID: %d\n", pid);
    }

    return 0;
}
