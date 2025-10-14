#include <stdio.h>
#include <syslog.h>

#define INPUT_ARGS_CNT 3

int main(int argc, char *argv[])
{
    openlog(NULL, 0, LOG_USER);
    if (argc != INPUT_ARGS_CNT)
    {
        syslog(LOG_ERR, "Invalid number of arguments: %d", argc);
        closelog();
        return 1;
    }

    const char *file_path = argv[1];
    const char *text = argv[2];

    syslog(LOG_DEBUG, "Opening/Creating file: %s", file_path);
    FILE *file = fopen(file_path, "w");
    if (file == NULL)
    {
        syslog(LOG_ERR, "Failed to create/open file: %s", file_path);
        closelog();
        return 1;
    }

    syslog(LOG_DEBUG, "Writing \"%s\" to %s", text, file_path);
    if (fprintf(file, "%s", text) < 0)
    {
        syslog(LOG_ERR, "Failed to write to file: %s", file_path);
        fclose(file);
        closelog();
        return 1;
    }

    fclose(file);
    closelog();
    return 0;
}