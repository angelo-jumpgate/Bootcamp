   #!/bin/bash
    # find free memory and make it human readable
    free -h>~/backups/freemem/free_mem.txt
    # find out our disk usage
    du -h / >~/backups/diskuse/disk_usage.txt
    # find all open files
    lsof > ~/backups/openlist/open_list.txt
    # find file system disk space statistics & lets look in all partitions and drives
    df -T -h >~/backups/freedisk/free_disk.txt