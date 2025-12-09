## 1\. ✍️ Create the Alias in the Current Session

# 

| Command | Definition | Purpose |
| --- | --- | --- |
| `alias ll='ls -lha'` | Defines `ll` to execute the longer command `ls -lha`. | `ls -lha` shows files in **l**ong format, including **h**idden files (`a`), with **h**uman-readable sizes (like 4.5K or 2.1M). |

Export to Sheets

### Example Command

# 

Bash

    alias ll='ls -lha'

### Verification

# 

Bash

    ll

## 2\. 💾 Save the Alias Persistently

# 

To make sure your alias is available every time you open a new shell session, you need to add the `alias` command to your shell's startup file, usually **`~/.bashrc`** or **`~/.zshrc`**.

1.  **Open the configuration file:**
    
    Bash
    
        nano ~/.bashrc
    
    (Use `~/.zshrc` if you are using Zsh instead of Bash.)
    
2.  **Add the alias definition** to the end of the file:
    
    Bash
    
        # Custom Aliases
        alias ll='ls -lha'
        alias myip='curl ipinfo.io/ip'
    
3.  **Save and close** the file (Ctrl+O, then Ctrl+X in `nano`).
    

* * *

## 3\. 🔄 Activate the New Alias

# 

| Command | Function |
| --- | --- |
| `source ~/.bashrc` | Executes the commands in the specified file within the **current shell environment**. |

Export to Sheets

### Example Command

# 

Bash

    source ~/.bashrc

Your alias (`ll`) is now saved permanently and active immediately!

## ✅ Fundamental Command Review (50 Questions)

### I. Filesystem and Navigation (10 Commands)

## 

| No. | Command | Primary Use Case | Pipelining Role | Example 1: Function | Example 2: Pipelining/Chaining |
| --- | --- | --- | --- | --- | --- |
| **1** | **`ls`** | **Directory Audit.** Listing files, checking modification dates, and verifying permissions. | Provides input (filenames) to downstream commands like `grep` or `xargs`. | `ls -lha` (List all files, long format, human-readable sizes.) | \`ls \*.log |
| **2** | **`cd`** | **Location Change.** Navigating the filesystem to access different project directories or system paths. | None (It's a shell built-in; output is not relevant). | `cd /var/www/html` (Go to the web server's root directory.) | `cd ~` (Go directly to the current user's home directory.) |
| **3** | **`pwd`** | **Verification.** Confirming the absolute path of the current directory. | None (Output is the final result). | `pwd` (Output: `/home/student/project`). | N/A |
| **4** | **`mkdir`** | **Project Setup.** Creating new directories for organizing files and projects. | None (Creates a directory; does not process data). | `mkdir -p docs/manuals` (Create `docs`, and `manuals` inside it, safely.) | N/A |
| **5** | **`touch`** | **Initialization/Timestamp.** Creating an empty file or updating the modification timestamp of an existing file. | None (Input is irrelevant). | `touch report.txt` (Create an empty file named `report.txt`.) | \`ls -t |
| **6** | **`cp`** | **Backup/Duplication.** Creating copies of files or configuration files for safekeeping before editing. | Provides source file name but is usually standalone. | `cp config.ini config.bak` (Copy the file to a backup.) | N/A |
| **7** | **`mv`** | **Renaming/Relocation.** Changing the name of a file or moving it to a new location in the filesystem. | None (File operation). | `mv temp.txt final.txt` (Rename the file.) | `mv * /archive/` (Move all files in current directory to `/archive/`.) |
| **8** | **`rm`** | **Cleanup/Deletion.** Permanently removing files or entire directory structures. | Can take filenames from a pipeline. | `rm -f old_data.log` (Forcefully delete the file.) | \`find /tmp -name '\*.old' |
| **9** | **`cat`** | **Display/Concatenation.** Quickly viewing the entire content of a small file or combining multiple files into one stream. | Used as a **source** command to feed a file's content into a pipeline. | `cat /etc/hosts` (Print the contents of the hosts file.) | \`cat file1 file2 |
| **10** | **`less`** | **Paging/Viewing.** Viewing large files page-by-page, allowing scrolling and searching. | Used as a **sink** command (the end of the pipeline) to format output for viewing. | `less large_log.txt` (View the log file interactively.) | \`journalctl -u sshd |

Export to Sheets

* * *

### II. Permissions and System Basics (10 Commands)

## 

| No. | Command | Primary Use Case | Pipelining Role | Example 1: Function | Example 2: Pipelining/Chaining |
| --- | --- | --- | --- | --- | --- |
| **11** | **`chmod`** | **Access Control.** Changing the read, write, and execute permissions of a file or directory. | None (File operation). | `chmod 755 script.sh` (Give owner rwx, group rx, others rx.) | `chmod +x *.sh` (Make all shell scripts in the current directory executable.) |
| **12** | **`chown`** | **Ownership Assignment.** Changing the primary user and group responsible for a file. | None (File operation). | `sudo chown webuser:www-data config.conf` (Set owner to `webuser` and group to `www-data`.) | N/A |
| **13** | **`sudo`** | **Privilege Escalation.** Temporarily executing a command with root privileges (if the user is authorized). | None (Changes context for a single command). | `sudo systemctl restart apache2` (Restart the web server service as root.) | N/A |
| **14** | **`ln`** | **Linking.** Creating alternative file paths for access without duplication (soft or hard links). | None (File operation). | `ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/` (Create a symbolic link for config.) | N/A |
| **15** | **`ps`** | **Process Snapshot.** Viewing a static list of running processes on the system. | Provides the list of processes as input for filtering. | `ps aux` (List all running processes by all users.) | \`ps aux |
| **16** | **`top`** | **Real-Time Monitoring.** Interactively monitoring CPU and memory usage, identifying resource bottlenecks. | None (It's an interactive viewer). | `top` (Start the real-time process manager.) | N/A |
| **17** | **`kill`** | **Process Termination.** Sending signals to processes (usually to stop them) using their PID. | Takes PIDs from the end of a pipeline. | `kill 1234` (Send SIGTERM to PID 1234.) | N/A |
| **18** | **`df`** | **Disk Free Space.** Reporting the free and used disk space by filesystem. | Can filter the output. | `df -h` (Show disk space in human-readable format.) | \`df -h |
| **19** | **`du`** | **Disk Usage.** Reporting the disk space consumed by a directory hierarchy. | Can provide directory size as input. | `du -sh /var/log` (Summarize the disk usage of the logs directory.) | \`du -sh \* |
| **20** | **`find`** | **File Search.** Recursively searching a directory structure based on name, time, size, etc. | Often the **source** command, providing filenames to `xargs` or `rm`. | `find . -name "*.conf"` (Find all files ending in `.conf` in the current directory tree.) | \`find /tmp -mtime +7 |

Export to Sheets

* * *

### III. I/O Redirection and Text Tools (10 Commands)

## 

| No. | Command | Primary Use Case | Pipelining Role | Example 1: Function | Example 2: Pipelining/Chaining |
| --- | --- | --- | --- | --- | --- |
| **21** | **`grep`** | **Pattern Matching.** Filtering input or file contents to display only lines that match a specific pattern. | Used as a **filter** in the middle of a pipeline. | `grep -i 'error' logs.txt` (Search for 'error', ignoring case.) | \`ps aux |
| **22** | \*\*\` | \`\*\* | **Pipelining.** Connecting the Stdout of one command to the Stdin of the next. | The essential operator for all data chains. | \`command1 |
| **23** | **`>`** | **Stdout Overwrite.** Redirecting the Standard Output to a file, deleting the file's previous contents. | Used at the end of a pipeline to save the final output. | `echo "Start" > status.txt` (Write "Start" to the file.) | \`ls -l |
| **24** | **`>>`** | **Stdout Append.** Redirecting the Standard Output to a file, adding content to the end of the file. | Used at the end of a pipeline to continuously log data. | `echo "Finished" >> status.txt` (Add "Finished" to the file.) | `df -h >> disk_log.txt` (Append disk usage report to a log.) |
| **25** | **`2>`** | **Stderr Redirection.** Redirecting Standard Error (FD 2) messages to a file. | Used at the end of a command to isolate errors. | `./script.sh 2> errors.log` (Save all errors to `errors.log`.) | N/A |
| **26** | **`2>&1`** | **Merge Streams.** Merging Standard Error (2) into Standard Output (1) for combined processing or redirection. | Used to ensure both errors and normal output flow into a pipe or file. | `cmd > all.log 2>&1` (Save all output, errors and normal, to one file.) | \`cmd 2>&1 |
| **27** | **`head`** | **First Lines.** Viewing the beginning of a file. | Used as a **filter** to limit the output of a source command. | `head -n 5 config.file` (Display the first 5 lines.) | \`ls -t |
| **28** | **`tail`** | **Last Lines.** Viewing the end of a file or following log updates. | Used as a **filter** or as a persistent **source** (`-f`). | `tail -f access.log` (Monitor the log file in real-time.) | \`tail -n 10 log.txt |
| **29** | **`wc`** | **Word/Line/Byte Count.** Counting the number of lines, words, or bytes in the input. | Used as a **sink** command, typically the last in a chain, to quantify data. | `wc -l document.txt` (Count lines in a file.) | \`cat file.txt |
| **30** | **`sort`** | **Ordering Data.** Arranging lines of text input alphabetically or numerically. | Used early in the pipeline, usually before `uniq` or `awk`. | `sort -r names.txt` (Sort names in reverse alphabetical order.) | \`grep user logs.txt |

Export to Sheets

* * *

### IV. Networking and Services (10 Commands)

## 

| No. | Command | Primary Use Case | Pipelining Role | Example 1: Function | Example 2: Pipelining/Chaining |
| --- | --- | --- | --- | --- | --- |
| **31** | **`ip addr show`** | **Interface Check.** Displaying the network interface configuration, including IP and MAC addresses. | Output is often filtered to extract a specific IP address. | `ip addr show eth0` (Show details for the `eth0` interface.) | \`ip addr show |
| **32** | **`ping`** | **Connectivity Test.** Determining if a remote host is reachable using ICMP. | None (Output is final result). | `ping -c 4 google.com` (Send 4 packets to test reachability.) | N/A |
| **33** | **`ssh`** | **Remote Access.** Securely connecting to a remote command-line interface. | None (Initiates an interactive session). | `ssh user@remote-host` (Log in to the remote machine.) | N/A |
| **34** | **`scp`** | **Secure File Transfer.** Copying files between local and remote hosts securely. | None (File operation). | `scp local.txt user@host:/tmp/` (Copy local file to remote `/tmp`.) | N/A |
| **35** | **`netstat`** | **Socket Monitoring.** Viewing active network connections and listening ports. | Output is usually filtered to find specific ports or connections. | `netstat -tuln` (Show all TCP/UDP, listening, numeric ports.) | \`netstat -tuln |
| **36** | **`curl`** | **Web Request/Data Transfer.** Making requests to web servers and retrieving data from URLs. | Used as a **source** command to fetch data into a pipeline. | `curl ipinfo.io` (Get external IP address information.) | \`curl example.com |
| **37** | **`systemctl`** | **Service Management.** Starting, stopping, enabling, and checking the status of system services. | None (Manages service state). | `systemctl status sshd` (Check if the SSH daemon is running.) | `systemctl restart nginx` (Restart the web server.) |
| **38** | **`journalctl`** | **Log Viewing.** Querying and displaying the systemd journal logs. | Output is usually piped to `grep` or `less`. | `journalctl -f` (Follow logs in real-time.) | \`journalctl -u cron |
| **39** | **`tmux`** | **Session Persistence.** Maintaining shell sessions and processes on a server, even after disconnecting. | None (Manages session state). | `tmux new -s dev` (Create a new session named 'dev'.) | N/A |
| **40** | **`nslookup`** | **DNS Query.** Looking up IP addresses associated with a hostname and vice-versa. | Output is often filtered to extract the IP address. | `nslookup google.com` (Query the DNS server for Google's IP.) | N/A |

Export to Sheets

* * *

### V. Scripting and Variables (10 Commands)

## 

| No. | Command | Primary Use Case | Pipelining Role | Example 1: Function | Example 2: Pipelining/Chaining |
| --- | --- | --- | --- | --- | --- |
| **41** | **`echo`** | **Printing/Output.** Displaying text or the value of shell variables to the console. | Used as a **source** command to feed a small string into a pipeline. | `echo "Script Starting..."` (Print a status message.) | \`echo "A B C" |
| **42** | **`export`** | **Environment Sharing.** Making a variable available to all child processes (the environment). | None (Sets environment state). | `export API_KEY="abc"` (Set an environment variable.) | N/A |
| **43** | **`read`** | **User Input.** Accepting data typed by the user and storing it in a variable. | None (Input is from keyboard/script). | `read -p "Your Name: " NAME` (Prompt for and store user name.) | N/A |
| **44** | **`for`** | **List Iteration.** Looping over a fixed list of items (files, users, numbers, etc.). | The body of the loop often uses pipelines internally. | `for i in 1 2 3; do echo $i; done` (Print numbers 1, 2, 3.) | N/A |
| **45** | **`while`** | **Condition Testing.** Looping as long as a specified condition remains true (e.g., counting down, or checking a file). | Often used to read input line-by-line from a pipeline (`while read line`). | `COUNT=5; while [ $COUNT -gt 0 ]; do ... done` (Countdown loop.) | N/A |
| **46** | **`test` / `[ ]`** | **Conditional Checking.** Evaluating logical expressions (e.g., does a file exist? Are two numbers equal?). | None (Evaluates a condition for `if` or `while`). | `if [ -f config.ini ]; then ... fi` (Check if the file exists.) | N/A |
| **47** | **`$(( ))`** | **Arithmetic.** Performing integer math calculations. | None (Used for internal calculation). | `RESULT=$(( 5 + 3 * 2 ))` (Calculate and store 11.) | N/A |
| **48** | **`source`** | **Configuration Reload.** Executing the contents of a script within the **current shell** rather than a subshell. | None (Executes script in place). | `source .bashrc` (Reload the shell configuration immediately.) | N/A |
| **49** | **`alias`** | **Shortcut Creation.** Defining a short name for a longer command sequence. | None (Shell configuration). | `alias ll='ls -lha'` (Create a short alias for a long command.) | N/A |
| **50** | **`git status`** | **Repo State Check.** Showing the current status of the working directory, staging area, and branch. | None (Repository status). | `git status` (Check which files are modified or untracked.) | N/A |

## 💾 `df -hT` Pipelining Examples

# 

The raw output of `df -hT` typically looks like this (including temporary/system filesystems):

Filesystem     Type   Size  Used Avail Use% Mounted on
    udev           devtmpfs  1.9G    0  1.9G   0% /dev
    tmpfs          tmpfs   393M  1.1M  392M   1% /run
    /dev/sda2      ext4     98G   18G   75G  19% /
    tmpfs          tmpfs   1.9G    0  1.9G   0% /dev/shm
    /dev/sdb1      xfs      50G   40G   10G  80% /data

### Example 1: Filtering for Real Disks and Sorting by Usage

# 

This is the most common real-world use case: identifying actual storage devices and seeing which ones are filling up fastest.

| Step | Command | Function |
| --- | --- | --- |
| **Source** | `df -hT` | Get all disk usage reports, showing sizes (h) and filesystem type (T). |
| **Pipe 1** | \` | grep -E 'ext4 |
| **Pipe 2** | \` | sort -k6 -hr\` |

Export to Sheets

**Full Command:**

Bash

    df -hT | grep -E 'ext4|xfs|btrfs' | sort -k6 -hr

### Example 2: Finding Filesystems Mounted in `/media`

# 

This example isolates removable media or externally mounted storage using `awk` to target the mount point column.

| Step | Command | Function |
| --- | --- | --- |
| **Source** | `df -hT` | Get all disk usage reports. |
| **Pipe 1** | \` | grep '/media'\` |
| **Pipe 2** | \` | awk '{print "Device:", $1, "Used:", $5}'\` |

Export to Sheets

**Full Command:**

Bash

    df -hT | grep '/media' | awk '{print "Device:", $1, "Used:", $5}'
