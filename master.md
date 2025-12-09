# 

## 1\. 🐚 Shells, Environment, and Script Execution

# 

| Topic | Key Concept/Command | The Trick / High-Yield Note | Example |
| --- | --- | --- | --- |
| **`$PATH`** | Environment variable containing a colon-separated list of directories. | If a script is **not** in a `$PATH` directory, you must run it with its full path or relative path (e.g., `./script.sh`). | `echo $PATH` |
| **Dotfiles** | **`.bashrc` / `.zshrc`** (interactive shell startup) vs. **`.profile`** (login shell startup). | Put **aliases** in `.bashrc`. Put environment **exports** that affect _all_ processes in `.profile`. | `alias l="ls -lha"` |
| **`source`** (or **`.`**) | Executes a script **within the current shell**. | **CRUCIAL:** Needed for environment changes (like updating `$PATH` or aliases) to take effect **immediately** in the current session. | `source ~/.bashrc` |
| **Script Shebang** | The first line `#!/bin/bash` specifies the **interpreter** to use. | The script must also have **execute permission (`chmod +x`)** to be run directly with `./script.sh`. | `#!/usr/bin/env bash` |
| **Bash Conditionals** | Uses the **`test`** command (or `[ ]`). | Know the operators: `-f` (is a file), `-d` (is a directory), `-z` (is string zero length/empty). | `if [ -f "cfg.txt" ]; then echo "Found"; fi` |
| **`getopts`** | Used in Bash scripts to parse command-line options and arguments. | Essential for robust scripting (e.g., to accept `-u username -p port`). | `while getopts "hva:" opt; do ...` |

Export to Sheets

* * *

## 2\. 🌊 I/O Redirection & Text Processing

# 

| Operator/Command | FD Target | Use Case / Trick | Example |
| --- | --- | --- | --- |
| **`>` / `>>`** | **Stdout (1)** | Overwrite (`>`) or Append (`>>`) Standard Output to a file. | `ls > files.txt` |
| **`2>` / `2>>`** | **Stderr (2)** | Redirect **Standard Error** only. | `find / -name fail 2> errors.log` |
| **`2>&1`** | **Stdout (1) & Stderr (2)** | **High-Yield Trick:** Merges FD 2 into FD 1. Must come _after_ FD 1 has been redirected. | `cmd > all.log 2>&1` |
| \*\*\` | \` (Pipe)\*\* | **Stdout (1)** to **Stdin (0)** | Chains commands: The output of the left becomes the input of the right. |
| **`tee`** | Stdout & File | Allows output to be viewed **AND** saved simultaneously. | \`ls -l |
| **`grep`** | Search/Filter | Filters lines based on **Regular Expressions**. | \`grep -E '^(Error |
| **`sed`** | Stream Editor | Search and **Substitute** text within lines. | `sed 's/old_host/new_host/g' config` |
| **`awk`** | Data Manipulation | **Process columnar data** (fields: `$1`, `$2`, etc.). | `awk -F':' '{print $1, $3}' /etc/passwd` |
| **RegEx Anchors** | `^` / `$` / `.` / `*` | **`^`** (Start of line), **`$`** (End of line), **`.`** (Any single character), **`*`** (Zero or more of previous). | `grep '^DEBUG.*\.php$' log` |

Export to Sheets

* * *

## 3\. 💾 Filesystems, Disks, and Ownership

### **Permissions (The Octal System)**

# 

| Permission | Octal Value | Symbol |
| --- | --- | --- |
| Read (r) | **4** | `r` |
| Write (w) | **2** | `w` |
| Execute (x) | **1** | `x` |
| **Common:** | `755` (rwxr-xr-x) | `644` (rw-r--r--) |

Export to Sheets

-   **`chmod 755 script.sh`**: Makes the script executable by everyone.
    
-   **`chmod 600 id_rsa`**: **CRITICAL** for Private Keys (Owner Read/Write only).
    

### **Links and Inodes**

# 

-   **Inode:** Unique index number holding a file's metadata (permissions, owner, size).
    
-   **Hard Link (`ln source target`):** Points to the **same Inode** as the source. Cannot span filesystems. Deleting the source file does **not** delete the data.
    
-   **Symbolic Link (`ln -s source target`):** A separate file that holds the **path** to the source. Can span filesystems. Deleting the source breaks the link.
    

### **Disks and Mounting (Lab 08)**

# 

| Concept | Tools/Files | Trick / Key Difference |
| --- | --- | --- |
| **Partitioning** | `fdisk` (MBR) / `gdisk` (GPT) | **MBR** is limited to **2TB** and 4 partitions. **GPT** is modern, requires **UEFI**. |
| **Filesystems** | `mkfs.ext4`, `mkfs.xfs` | **`mkfs`** is the command to format a partition with a file system. |
| **Persistence** | **`/etc/fstab`** | Configures which partitions are **automounted** at boot. Essential for making a new disk available permanently. |
| **Devices** | **Block** vs. **Character** | **Block:** Transfers large blocks, supports random access (SSD, HDD). **Character:** Transfers byte-by-byte, sequential access (`/dev/null`, `/dev/random`). |

Export to Sheets

* * *

## 4\. 🧠 Process Control and System Services

# 

| Concept | Command/State | The Trick / High-Yield Note | Example |
| --- | --- | --- | --- |
| **Zombie Process** | **`Z`** state in `ps`. | **A terminated child process whose parent failed to collect its exit status.** Consumes a PID but no resources. Cannot be killed; only the parent can be killed. | \`ps aux |
| **Orphan Process** | Child process whose parent died. | Adopted immediately by **`systemd`** (PID 1), which handles its cleanup. |  |
| **`systemctl`** | **`enable`** vs. **`start`** | **`enable`** = Start at next boot (**persistent**). **`start`** = Start right now (**non-persistent**). | `sudo systemctl enable httpd` |
| **Signals** | **`kill`** command. | **`kill PID`** sends **SIGTERM (15)**: the polite request to stop. **`kill -9 PID`** sends **SIGKILL (9)**: the forced, uncatchable stop. | `kill -9 1234` |
| **Background** | **`&`** / **`bg`** / **`fg`** | Use `&` to start a job in the background. Use `jobs` to list them. Use `fg %1` to bring job 1 to the foreground. | `long_cmd &` |
| **Persistence** | **`tmux`** | A **terminal multiplexer** that allows sessions to persist even after the SSH connection is lost (**detaching**). | `tmux attach` |

Export to Sheets

* * *

## 5\. 💻 Programming, Compilation, and Git

# 

| Concept | Command/Stage | The Trick / Key Concept | Example |
| --- | --- | --- | --- |
| **Compilation** | **Linker** | **CRUCIAL:** The Linker resolves references and combines Object Files (`.o`) and libraries to create the final **ELF** executable. | `gcc main.c -o program` |
| **Dependencies** | **`ldd`** | Tool used to check which **shared libraries** (`.so` files) an ELF executable requires at runtime. | `ldd /bin/ls` |
| **Makefiles** | `target: dependency` `\t action` | `make` checks if the `dependency` is newer than the `target`. If so, it runs the `action`. | `make clean` |
| **Languages** | Interpreted vs. Compiled | **Interpreted:** Bash, Python (run line-by-line). **Compiled:** C/C++, Java (translated to machine code first). |  |
| **Git Staging** | `git add` / `git commit` | `add` moves files to the **Staging Area**. `commit` takes a snapshot from the Staging Area to the **Local Repository**. | `git add .` |
| **Branching** | `git checkout -b` / `git merge` | `checkout -b new_feature` creates and switches to a new branch. `merge` integrates branch history. |  |

Export to Sheets

* * *

## 6\. 🌐 Networking and Security (The Gatekeeper)

# 

| Concept | Command / Chain | The Trick / Failure Point | Example |
| --- | --- | --- | --- |
| **Firewalls** | **INPUT** vs. **OUTPUT** | **INPUT (Ingress):** Traffic coming **to** the server. **OUTPUT (Egress):** Traffic leaving **from** the server. | `iptables -L INPUT` |
| **Port Test** | **`curl`** | Use `curl` to test connectivity to a specific protocol/port, bypassing OS tools like `ping`. | `curl -v http://localhost:8080` |
| **Address ID** | **MAC** vs. **IP** | **MAC** is the physical, Layer 2 hardware address. **IP** is the logical, Layer 3 routing address. | `ip addr show` |
| **Diagnostic** | **`netstat -tuln`** (or `ss -tuln`) | **CRITICAL:** Shows which ports the server is actively **LISTENING** on (e.g., confirming if a web server is running on port 80). |  |
| **DNS Lookup** | **`nslookup`** / **`dig`** | Translates a hostname (e.g., `google.com`) to an IP address. | `nslookup google.com` |
| **CIDR** | Slash Notation | The `/N` is the number of bits in the **network** part. | `/24` means 24 network bits, 8 host bits. |
| **SSH File Transfer** | **`sftp`** / **`scp`** | Secure methods to transfer files over an SSH connection (used instead of insecure FTP). | `sftp user@host` |

Export to Sheets

* * *

