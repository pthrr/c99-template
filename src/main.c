#include <processing.h>
#include <stdio.h>
#include <unistd.h>
#include <signal.h>
#include <stdlib.h>
#include <iso646.h>
#include <assert.h>

void handle_exit(int sig)
{
    printf("Handling signal: %i\n", sig);
    exit(1);
}

int main(int argc, char **argv)
{
    signal(SIGINT, handle_exit);
    signal(SIGTERM, handle_exit);
    signal(SIGABRT, handle_exit);

    int opt;

    for (; (opt = getopt(argc, argv, "hv")) != -1;) {
        switch (opt) {
        case 'h':
            printf("Help: This program accepts the following options:\n");
            printf("  -h        Show this help message\n");
            printf("  -v        Display the program version\n");
            return 0;
        case 'v':
            printf("Program version: 0.1.0\n");
            return 0;
        default:
            fprintf(stderr, "Usage: %s [-h] [-v]\n", argv[0]);
            return 1;
        }
    }

    if (optind < argc) {
        printf("Non-option arguments: ");

        for (; optind < argc;) {
            printf("%s ", argv[optind++]);
        }

        printf("\n");
    }

    printf("1+2= %i\n", add(1, 2));
    return 0;
}
