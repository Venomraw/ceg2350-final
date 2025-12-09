# 🎓 CEG 2350 Final Exam: Master Command Sheet

## 1\. 📂 File & Directory Management (Linux/Mac)

This is the bedrock of system usage.

| Command | Use Case | Example | Tip/Trick |
| --- | --- | --- | --- |
| **`ls`** | Lists contents of a directory. | `ls -lha` (long format, hidden files, human-readable size) | Use `-d` with a directory name (e.g., `ls -d dir/`) to view the directory's metadata, not its contents. |
| **`cd`** | Change directory. | `cd ..` (up one level); `cd -` (return to previous dir) | `cd` with no arguments returns to the **HOME** directory (`$HOME`). |
| **`pwd`** | Print working directory. | `pwd` | Always confirms your absolute path location. |
| **`mkdir`** | Make directory. | `mkdir -p project/src/data` | Use `-p` to create parent directories if they don't exist. |
| **`rmdir`** | Remove empty directory. | `rmdir empty_dir` | Only works if the directory is completely empty. |
| **`cp`** | Copy files or directories. | `cp -r source/ dest/` (copy directory recursively) | Use `-i` (interactive) to prompt before overwriting. |
| **`mv`** | Move or rename files/directories. | `mv old_name.txt new_name.txt` | This command is used for both moving files and renaming them. |
| **`rm`** | Remove files or directories. | `rm -rf project/` (forcefully remove recursively) | **CAUTION:** `-rf` is destructive; use with extreme care! |
| **`touch`** | Create empty file or update timestamp. | `touch notes.txt` | Useful for quickly creating a placeholder file or updating modification time. |
| **`cat`** | Concatenate files and print to stdout. | `cat file1.txt file2.txt` | Often used to quickly view a small file's content. |
| **`head`** | Output the beginning of files (default 10 lines). | `head -n 5 log.txt` (view first 5 lines) | Good for checking the start of configuration files. |
| **`tail`** | Output the end of files. | `tail -f access.log` | Use `-f` (follow) for monitoring logs in real-time. |
| **`less`/`more`** | View file contents page by page. | `less large_file.txt` | **Tip:** `less` is better; you can scroll _backward_ (use arrow keys/PgUp/PgDn). Press `q` to quit. |
| **`vim`** | Command-line text editor. | `vim config.ini` | **Quick Cheat:** Press `i` to Insert, `Esc` to exit insert, `:wq` to save and quit. |

Export to Sheets

* * *

## 2\. 🔐 Permissions & Users (Linux)

Understanding the `rwx` (4, 2, 1) model is non-negotiable.

| Command | Use Case | Example | Tip/Trick |
| --- | --- | --- | --- |
| **`chmod`** | Change file/directory permissions. | `chmod 644 file.txt` (Owner: RW, Group: R, Other: R) | **Octal:** Use `755` for executables; **Symbolic:** Use `chmod g+w file` to add Group Write permission. |
| **`chown`** | Change file/directory ownership (user). | `sudo chown root:sysadmins file.txt` | You need `sudo` for this. The syntax is `user:group`. |
| **`chgrp`** | Change file/directory group ownership. | `chgrp webdevs project/` | Only changes the group, not the owner. |
| **`sudo`** | Execute a command as the **root** user. | `sudo apt update` | Essential for administrative tasks. |
| **`adduser`** | Creates a new user account. | `sudo adduser new_user` | Modern command that handles home directory creation and basic setup. |
| **`deluser`** | Deletes a user account. | `sudo deluser --remove-home old_user` | Use `--remove-home` to delete the user's home directory. |

Export to Sheets

* * *

## 3\. 🌊 I/O Streams and Pipelines

The core of Unix philosophy: chaining commands.

| Operator/Command | Use Case | Example | Tip/Trick |
| --- | --- | --- | --- |
| **`>`** | Redirect **Stdout (1)**, **overwrites** file. | `ls > filelist.txt` | Use for a fresh output every time. |
| **`>>`** | Redirect **Stdout (1)**, **appends** to file. | `date >> log.txt` | Use for monitoring or adding data incrementally. |
| **`<`** | Redirect **Stdin (0)** from a file. | `sort < unsorted.txt` | The `sort` command reads the file content as input. |
| **`2>`** | Redirect **Stderr (2)**, **overwrites** file. | `find / -name missing 2> errors.log` | Separates errors from normal output. |
| **`2>&1`** | Redirect **Stderr (2)** to the same location as **Stdout (1)**. | `cmd > all.log 2>&1` | Use this to capture _all_ output (normal and errors) into one file. |
| \*\*\` | \` (Pipe)\*\* | Pipes Stdout of Command 1 into Stdin of Command 2. | \`ps aux |
| **`tee`** | Reads Stdin, writes to Stdout **AND** files. | \`ls -l | tee output.txt\` |

Export to Sheets

* * *

## 4\. 🔠 Text Processing & Scripting Commands

Tools for manipulating and extracting data.

| Command | Use Case | Example | Tip/Trick |
| --- | --- | --- | --- |
| **`grep`** | **Search** for text using RegEx patterns. | `grep -i 'error' app.log` (case-insensitive search) | Use `grep -E` for Extended RegEx (e.g., `+`, `?`) and `grep -v` to invert the match (show non-matching lines). |
| **`sed`** | **Stream Editor:** Search and replace text patterns. | `sed 's/old/new/g' file.txt` (substitute globally) | The `s/pattern/replace/g` (substitute, global) format is key. |
| **`awk`** | **Data Manipulation:** Process columnar (delimited) data. | `awk '{print $1, $3}' report.txt` (print column 1 and 3) | `$0` refers to the entire line. Use `-F` to specify a field separator other than space/tab. |
| **`diff`** | Compares two files line by line. | `diff fileA.txt fileB.txt` | Essential for scripting conditional checks or debugging configuration changes. |
| **`find`** | Recursively search for files/directories based on criteria. | `find . -name '*.log' -size +1M` | Use `-type d` (directories) or `-type f` (files). Extremely powerful, but often slow. |
| **`file`** | Determines file type. | `file my_script.sh` | Good for confirming if a file is plain text, executable, compressed, etc. |
| **`wc`** | Word, line, and character count. | `wc -l file.txt` (count lines) | Often used at the end of a pipe chain (e.g., \`grep |
| **`sort`** | Sorts the lines of a text file. | `sort -r data.txt` (reverse sort) |  |
| **`uniq`** | Reports or omits repeated adjacent lines. | \`sort names.txt | uniq\` |
| **`whereis`** | Locates binary, source, and manual files for a command. | `whereis bash` |  |
| **`which`** | Shows the **full path** of a shell command's executable. | `which python3` | Tells you exactly _which_ binary will run when you type the command. |

Export to Sheets

* * *

## 5\. ⚙️ Process & Service Control

How the OS manages running programs.

| Command | Use Case | Example | Tip/Trick |
| --- | --- | --- | --- |
| **`ps`** | Display a snapshot of the current processes. | `ps aux` (show all processes for all users) | Use `ps -ef` as an alternative format. The key columns are **PID** and **CMD**. |
| **`top`** | Dynamic, real-time view of running processes and system load. | `top` | Press `k` to kill a process, `M` to sort by memory, `P` to sort by CPU. |
| **`kill`** | Send a signal to a process by PID. | `kill PID` (sends SIGTERM/15 - graceful); `kill -9 PID` (sends SIGKILL/9 - forceful) | Use **`killall`** to kill processes by name. |
| **`jobs`** | Lists background jobs in the current shell. | `jobs -l` | Use **`&`** to run a job in the background (e.g., `sleep 60 &`). |
| **`bg`** | Resume a suspended job in the background. | `bg %1` (sends job #1 to background) |  |
| **`fg`** | Resume a suspended job in the foreground. | `fg %2` (brings job #2 to foreground) |  |
| **`systemctl`** | Controls and manages `systemd` services. | `sudo systemctl restart apache2` | **Key distinction:** `start` (now) vs. `enable` (at boot). Use `status` to diagnose. |
| **`journalctl`** | View logs collected by the `systemd` journal. | `sudo journalctl -xe` (view recent errors) | Use `-u [service]` (e.g., `journalctl -u sshd`) to filter by service. |

Export to Sheets

* * *

## 6\. 🌐 Networking & SSH

Connecting securely and diagnosing connectivity.

| Command | Use Case | Example | Tip/Trick |
| --- | --- | --- | --- |
| **`ssh`** | Securely connect to a remote server. | `ssh -i key.pem user@host` | **Tip:** Your private key file (`key.pem`) **must** have permissions `600` (`-rw-------`). |
| **`sftp`** | Securely transfer files over SSH. | `sftp user@host` (then use `put` and `get` commands) | Used for file transfer where FTP is insecure. |
| **`ip`** | Show and manipulate routing, devices, and tunnels. | `ip addr show` (show IP addresses/interfaces) | Replaces the deprecated `ifconfig` command. |
| **`route`** | View the kernel's IP routing table. | `ip route show` | Tells you which gateway (router) is used for external traffic. |
| **`arp`** | View the Address Resolution Protocol (MAC-to-IP) cache. | `arp -a` | Useful for diagnosing local network connectivity issues. |
| **`iptables`** | Manage Linux firewall rules (for INPUT/OUTPUT chains). | `sudo iptables -L -v` (list rules verbosely) | **Crucial:** Firewall rules are applied sequentially. |
| **`ping`** | Test network connectivity and latency (uses ICMP). | `ping -c 4 8.8.8.8` (send 4 packets) | If `ping` fails, the issue is likely Layer 3 (IP) or lower. |
| **`curl`** | Transfer data from or to a server (supports protocols like HTTP, FTP). | `curl -O http://site.com/file.zip` (download file) | Essential for testing web services and APIs. |
| **`wget`** | Non-interactive network downloader. | `wget -r http://site.com/` (recursive download of a site) |  |

Export to Sheets

* * *

## 7\. 🧩 Git (Version Control)

Your modern developer workflow tools.

| Command | Use Case | Example | Tip/Trick |
| --- | --- | --- | --- |
| **`git clone`** | Create a local copy of a remote repository. | `git clone git@github.com:repo/name.git` |  |
| **`git add`** | Stage changes for the next commit. | `git add .` (stage all modified files) | Changes must be staged before they can be committed. |
| **`git commit`** | Record staged changes to the local repository. | `git commit -m "Fixed login bug"` | Use `-a` to stage and commit all tracked changes at once. |
| **`git push`** | Upload local branch commits to the remote repository. | `git push origin main` | You must be authenticated (usually via SSH key). |
| **`git pull`** | Fetch and merge changes from the remote repository to your local branch. | `git pull` | Best practice to run this before starting work. |
| **`git status`** | Show the status of files in the working directory and staging area. | `git status` | Check this frequently to see modified/untracked files. |
| **`git branch`** | List, create, or delete branches. | `git branch feature/new` |  |
| **`git checkout`** | Switch branches or restore files. | `git checkout main` | Used for switching branches or navigating history. |
| **`git merge`** | Join two or more development histories together. | `git merge feature/new` | Merges the specified branch into your current branch. |

Export to Sheets
