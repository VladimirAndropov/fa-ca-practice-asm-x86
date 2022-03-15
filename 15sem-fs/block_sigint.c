#include <signal.h>
#include <unistd.h>
#include <stdio.h>

void handler(int n) {
    const char msg[] = "Ctrl-C pressed\n";
    write(STDOUT_FILENO, msg, sizeof(msg)-1);
}

int main() {
    struct sigaction sa;
    sa.sa_handler = handler;
    sa.sa_flags = SA_NODEFER;
    sigaction(SIGINT, &sa, NULL);

    sigset_t mask;
    sigemptyset(&mask);
    sigaddset(&mask, SIGINT);

    while (1) {
        sigprocmask(SIG_BLOCK, &mask, NULL);
        printf("sleep started\n");
        sleep(10);
        printf("sleep ended\n");
        sigprocmask(SIG_UNBLOCK, &mask, NULL);
    }
}
