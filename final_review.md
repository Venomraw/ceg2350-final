## 1\. 🐚 Shells, Commands, and I/O (10 Questions)

# 

| No. | Question (Concept Focus) | Answer/Command | Trick/Explanation |
| --- | --- | --- | --- |
| 1 | **I/O Redirection:** Capture normal output to `log.txt` and **silence** all error output. | `cmd > log.txt 2> /dev/null` | **`/dev/null`** is the character device that discards data. |
| 2 | **Pipelining:** Find the total number of lines in `/etc/passwd` that contain the word "user". | \`grep 'user' /etc/passwd | wc -l\` |
| 3 | **Viewing Files:** What command allows you to view a large file page-by-page and move **backward**? | **`less`** | **`more`** only allows forward movement. |
| 4 | **Permissions:** Write the command to make `script.sh` executable and run it immediately from the current directory. | `chmod +x script.sh && ./script.sh` | **`./`** specifies the current directory, necessary if the file is not in `$PATH`. |
| 5 | **Environment:** If you type `myprog`, how does the shell find the executable file? | It searches directories listed in the **`$PATH`** variable, in order. | Use **`which myprog`** to see the exact location found. |
| 6 | **Environment Trick:** What is the simplest command to verify your current **HOME** directory? | `echo $HOME` or simply `cd` (with no arguments). | `cd` without arguments defaults to the `$HOME` path. |
| 7 | **Execution Trick:** You edit your `.bashrc` file. What must you type to activate the changes in your current terminal session? | **`source ~/.bashrc`** or **`. ~/.bashrc`** | Runs the script in the **current** shell (prevents losing changes in a sub-shell). |
| 8 | **Scripting Test:** What operator tests if `my_dir` is a directory? | **`[ -d my_dir ]`** | **`-f`** tests for a regular file; **`-d`** tests for a directory. |
| 9 | **Manipulation:** What command reports file differences (essential for config file debugging)? | **`diff`** | Often used to compare two versions of a configuration file. |
| 10 | **Data Tool:** What tool is best for extracting the 3rd column from a space-separated data file? | **`awk '{print $3}' file`** | `awk` is the standard tool for columnar data processing. |

Export to Sheets

* * *

## 2\. 🔐 Permissions and Filesystems (10 Questions)

# 

| No. | Question (Concept Focus) | Answer/Command | Trick/Explanation |
| --- | --- | --- | --- |
| 11 | **rwx Octal:** What are the octal values for **Read (r)**, **Write (w)**, and **Execute (x)**? | **4**, **2**, **1** | A file with `rwx` for the owner is **700**. |
| 12 | **Permissions:** Set permissions to **Owner: rwx, Group: r-x, Other: r--** using the octal method. | `chmod 754 file.txt` | 7=4+2+1, 5=4+1, 4=4. |
| 13 | **Security Failure:** What exact permissions must your SSH private key have? | **`600`** (`-rw-------`) | The SSH client **will fail** if permissions are too loose (e.g., `640`). |
| 14 | **Ownership:** Change the owner of `log.txt` to `admin` and the group to `devs`. | `sudo chown admin:devs log.txt` | You must use `sudo` for administrative changes to ownership. |
| 15 | **Disk Standard:** Which partition table standard is required for disks larger than 2TB? | **GPT** (GUID Partition Table) | **MBR** is limited to 2TB and 4 primary partitions. |
| 16 | **Persistence:** What configuration file ensures a filesystem is mounted automatically at boot? | **`/etc/fstab`** | You must add an entry here for the mount to persist after a reboot. |
| 17 | **Inode Concept:** Which type of link shares the **same Inode** as the target file? | **Hard Link** | If the original file is deleted, the data remains accessible via the hard link. |
| 18 | **Links:** Which type of link contains the **path** to the target file and can cross filesystems? | **Symbolic (Soft) Link** | These are simple pointers; if the target is deleted, the link breaks (dangling). |
| 19 | **Metadata:** What structure holds all a file's metadata (permissions, owner, size) except its name and content? | The **Inode** | Running out of inodes prevents file creation, even if disk space is available. |
| 20 | **Devices:** Give two examples of **Character Devices**. | **`/dev/null`**, **`/dev/zero`**, **`/dev/random`** | Character devices transfer data sequentially, one byte at a time. |

Export to Sheets

* * *

## 3\. ⚙️ Process and Service Control (12 Questions)

# 

| No. | Question (Concept Focus) | Answer/Command | Trick/Explanation |
| --- | --- | --- | --- |
| 21 | **Process State:** The terminated process that still occupies a PID because its parent hasn't harvested the exit status. | **Zombie** (`Z`) | Cannot be killed directly; the parent must be killed or restarted. |
| 22 | **Process State:** A child process whose parent died, forcing it to be adopted by `systemd`. | **Orphan** | Adopted by PID 1 (`systemd` or `init`) for cleanup. |
| 23 | **View Processes:** What command gives a static snapshot of all processes? | **`ps aux`** or **`ps -ef`** | The most common command for a quick process check. |
| 24 | **View Processes:** What command gives a dynamic, real-time, interactive view of resource usage? | **`top`** | Pressing **`M`** sorts by Memory, **`P`** sorts by CPU. |
| 25 | **Service Control:** Command to start a service **right now**. | **`sudo systemctl start sshd`** | Non-persistent: service will stop after reboot. |
| 26 | **Service Control:** Command to make a service start **automatically at boot**. | **`sudo systemctl enable sshd`** | Persistent configuration. |
| 27 | **Signals:** What signal (number and name) is the **polite request** to stop, allowing cleanup? | **SIGTERM (15)** | This is the default signal sent by `kill PID`. |
| 28 | **Signals:** What signal (number and name) is the **forceful, guaranteed** stop? | **SIGKILL (9)** | The OS forces termination; the process cannot ignore this signal. |
| 29 | **Job Control:** You run `sleep 3600 &`. What command lists this running background job? | **`jobs`** | Lists jobs specific to the current shell. |
| 30 | **Job Control:** Command to bring job number 1 from the background to the foreground. | **`fg %1`** | Allows you to interact with the process again. |
| 31 | **Persistence:** What tool is used to keep a shell session and running programs alive when you disconnect from SSH? | **`tmux`** (terminal multiplexer) | Allows you to **detach** and **attach** sessions. |
| 32 | **Service Log:** What command is used to view the logs for the `systemd` journal? | **`journalctl`** | Use `journalctl -u [service]` to filter by unit. |

Export to Sheets

* * *

## 4\. 💻 Programming and Compilation (8 Questions)

# 

| No. | Question (Concept Focus) | Answer/Command | Trick/Explanation |
| --- | --- | --- | --- |
| 33 | **Languages:** Give one example of a **Compiled** and one of an **Interpreted** language. | **Compiled:** C, C++ **Interpreted:** Bash, Python | Compiled languages are translated to machine code before execution. |
| 34 | **Compilation:** What is the first stage of the C/C++ compilation process? | **Pre-processor** | Handles directives like `#include` and `#define`. |
| 35 | **Compilation:** What is the final stage of the C/C++ compilation process? | **Linker** | Binds object files and resolves external references from libraries. |
| 36 | **Executable Format:** What is the name of the standard executable format for Linux systems? | **ELF** (Executable and Linkable Format) | Windows uses **EXE**. |
| 37 | **Dependencies:** What command is used to check which **shared libraries** an executable relies on? | **`ldd`** | Example: `ldd /bin/bash` |
| 38 | **Makefiles:** What is the primary purpose of a `target` in a Makefile? | It is the file that the `make` utility is trying to **create**. | `all: clean build` → `all` is the target. |
| 39 | **Makefiles:** What defines the files that must be present and up-to-date before an `action` is run? | **Dependencies** | If a dependency is newer than the target, the action runs. |
| 40 | **GCC Flag:** What flag is used to specify the output filename for the compiled program? | **`-o`** | Example: `gcc main.c -o my_program` |

Export to Sheets

* * *

## 5\. 🌐 Networking and Security (10 Questions)

# 

| No. | Question (Concept Focus) | Answer/Command | Trick/Explanation |
| --- | --- | --- | --- |
| 41 | **Address Type:** Which address type is physical, unique to the NIC, and operates at Layer 2? | **MAC Address** | **IP Address** is the logical, Layer 3 address. |
| 42 | **Ports:** What are the standard port numbers for **SSH** and **HTTPS**? | **SSH (22)**, **HTTPS (443)** | Know these standards for firewall configuration. |
| 43 | **CIDR:** What does `/22` mean in CIDR notation in terms of network bits? | **22 network bits** | 32−22=10 host bits. |
| 44 | **Firewall Chain:** Which `iptables` chain filters traffic destined **for the local server**? | **INPUT (Ingress)** | This is where you allow or deny SSH (22) or HTTP (80). |
| 45 | **Firewall Chain:** Which `iptables` chain filters traffic originating **from the local server**? | **OUTPUT (Egress)** | Used to restrict what the server can connect to externally. |
| 46 | **Connectivity:** What command tests ICMP connectivity to a remote host? | **`ping`** | If `ping` fails, the issue is likely L3 (IP) or lower. |
| 47 | **Application Check:** What tool is best to check if a web server is responding on a specific port? | **`curl`** or **`wget`** | They operate at the application layer (L7). |
| 48 | **Network Config:** What command is used in modern Linux to view IP addresses and interface status? | **`ip addr show`** | Replaces the legacy `ifconfig`. |
| 49 | **DNS:** What command translates a hostname (e.g., `server.com`) to an IP address? | **`nslookup`** or **`dig`** | Tests the Domain Name System resolution. |
| 50 | **Secure Transfer:** Name two commands used for secure file transfer over SSH. | **`sftp`**, **`scp`** | They use SSH for authentication and encryption. |

Export to Sheets

* * *

## 6\. 🧠 Hardware, VM, and Boot (10 Questions)

# 

| No. | Question (Concept Focus) | Answer/Command | Trick/Explanation |
| --- | --- | --- | --- |
| 51 | **Storage Speed:** Which storage interface bypasses SATA and connects directly to the PCIe bus for maximum speed? | **NVMe** (Non-Volatile Memory Express) | This is the fastest standard for SSDs. |
| 52 | **GPU Type:** Which type of GPU shares the system's main RAM? | **Integrated (iGPU)** | **Discrete/Dedicated** GPUs have their own VRAM. |
| 53 | **VMs:** What software layer creates and manages Virtual Machines (VMs)? | **Hypervisor** | Provides the abstraction of dedicated hardware to the guest OS. |
| 54 | **Boot Stage 1:** What firmware initializes the hardware upon power-on? | **BIOS / UEFI** | UEFI is the modern standard, replacing BIOS. |
| 55 | **Boot Stage 2:** What is the hardware diagnostic check run by the firmware? | **POST** (Power-On Self-Test) |  |
| 56 | **Boot Stage 3:** What program runs after the firmware to find and load the kernel? | **Bootloader** (e.g., GRUB) |  |
| 57 | **Boot Stage 4:** What is the core component of the OS that manages resources and starts the initial processes? | **Kernel** |  |
| 58 | **OS Init:** What is the name of the modern service manager/init system in Linux? | **`systemd`** | It runs as PID 1 and starts all services defined in unit files. |
| 59 | **RAM Type:** Is RAM volatile or non-volatile? | **Volatile** | Data is lost when power is removed. |
| 60 | **VM Consideration:** What is the primary hardware constraint on the host machine when running multiple VMs? | Sufficient **RAM** (Memory) | Each guest OS requires a dedicated, fixed allocation of RAM. |

Export to Sheets

## 1\. 🐚 Shells, I/O, and Environment Integration (10 Questions)

# 

| No. | Question (Focus) | Answer/Command | Trick/Explanation |
| --- | --- | --- | --- |
| 1 | **I/O Trick:** Write a command to display the content of `log.txt` on the screen **while simultaneously** appending it to `archive.txt`. | \`cat log.txt | tee -a archive.txt\` |
| 2 | **Redirection:** What is the specific File Descriptor number for **Standard Error**? | **2** | Stdout is 1, Stdin is 0. |
| 3 | **Shebang Error:** If a script starts with `#!/bin/bash` but runs into an error, what likely command was forgotten? | **`chmod +x script.sh`** | Without execute permission, the shell doesn't know to treat it as a program. |
| 4 | **RegEx Logic:** What RegEx pattern would match a line containing "error" followed by exactly one digit? | `error.\d` | **`.`** matches any character, and **`\d`** matches any digit. |
| 5 | **Environment:** If you type `ls`, what environment variable tells the shell which directories to search for the `ls` binary? | **`$PATH`** |  |
| 6 | **Execution:** What is the difference between running a script with `bash script.sh` and `./script.sh`? | **`bash script.sh`** doesn't require execute permission (`+x`). | The script is simply fed to the interpreter. |
| 7 | **Conditional Test:** Write the `test` command to check if the string variable `$VERSION` is **not** empty. | `[ -n "$VERSION" ]` | **`-z`** tests for zero length (empty); **`-n`** tests for non-zero length. |
| 8 | **Scripting:** What built-in Bash command is used to read input from the user into a variable? | **`read`** | Example: `read -p "Enter name: " NAME` |
| 9 | **Alias:** Where is the best place to define a permanent alias for common commands (e.g., `alias l="ls -lha"`)? | **`.bashrc`** | This file is loaded every time an **interactive shell** starts. |
| 10 | **Data Extraction:** What `awk` field variable refers to the **entire line** of input? | **`$0`** |  |

Export to Sheets

* * *

## 2\. 🔐 Permissions and Security (10 Questions)

# 

| No. | Question (Focus) | Answer/Command | Trick/Explanation |
| --- | --- | --- | --- |
| 11 | **rwx:** A directory needs to allow users to `cd` into it and view files but not create files. What is the minimum permission set needed? | **`5`** (`r-x`) | Execute (`x`) is required to traverse or enter a directory. |
| 12 | **Security:** The directory `~/.ssh/` is improperly set to `777`. What permission command fixes it to a secure default? | **`chmod 700 ~/.ssh`** | Only the owner should have access to the SSH configuration directory. |
| 13 | **Symbolic chmod:** Write the symbolic command to **add** write permission for the **group** on `report.pdf`. | `chmod g+w report.pdf` | **`g`** for group, **`+`** for add, **`w`** for write. |
| 14 | **Ownership:** If you use `sudo chown student log.txt`, what is the group ownership set to? | It remains **unchanged**. | The group only changes if specified: `user:group`. |
| 15 | **Superuser:** What command temporarily grants you the ability to run commands as the **root** user? | **`sudo`** |  |
| 16 | **Permissions:** Explain why a user cannot delete a file in a directory if the file's permission is `444`. | File deletion depends on **write permission on the parent directory**, not the file itself. |  |
| 17 | **User Management:** What is the difference between `adduser` and `useradd`? | **`adduser`** is a higher-level script that handles home directory creation and standard setup. **`useradd`** is the low-level binary. | Always use `adduser` unless specific low-level control is needed. |
| 18 | **Link Failure:** A symlink, `/link/to/data`, points to `/mnt/data/file.txt`. If you delete `/mnt/data/file.txt`, what happens to the symlink? | It becomes a **dangling link** (points to a non-existent path). |  |
| 19 | **Hard Link Failure:** Why can't you create a hard link to a file on a different partition? | Hard links point to a specific **Inode**, and Inodes are unique only within a single filesystem/partition. |  |
| 20 | **Security:** Why is it bad practice to run services (like a web server) as the **root** user? | If the service is compromised, the attacker gains **root access** to the entire system. |  |

Export to Sheets

* * *

## 3\. 💾 Filesystems and Disks (10 Questions)

# 

| No. | Question (Focus) | Answer/Command | Trick/Explanation |
| --- | --- | --- | --- |
| 21 | **Disk Tool:** Which partition tool would you use to verify that a large disk is using the GPT format? | **`gdisk`** or **`parted`** | `fdisk` is primarily for MBR. |
| 22 | **Metadata:** Name one piece of information stored in the **Inode** structure. | Owner ID, Permissions, Size, Timestamps (A-M-C), Block Pointers. | **Not** the filename. |
| 23 | **Compression:** What is the standard Linux utility used to create a single archive file, often used before compression? | **`tar`** | Example: `tar -czvf archive.tar.gz /data` |
| 24 | **Device Type:** What type of device is the keyboard or a serial port? | **Character Device** | Sequential access of single bytes. |
| 25 | **Free Space:** What command shows you the **available disk space** by filesystem (Partition)? | **`df -h`** (disk free) | `du` shows directory usage. |
| 26 | **Usage:** What command shows you the **disk space usage** of a directory tree? | **`du -sh /home/user`** (disk usage) |  |
| 27 | **Filesystem:** What is the name of the process that makes a storage device accessible to the OS file hierarchy? | **Mounting** |  |
| 28 | **Mounting:** What command is used to detach a mounted filesystem (e.g., a USB drive)? | **`umount /mnt/usb`** | Note the lack of 'n' in the command. |
| 29 | **File Structure:** Where is the **root filesystem** of a Linux system mounted? | **`/`** (the slash) | All other filesystems attach here. |
| 30 | **Filesystem Creation:** What is the syntax for formatting the partition `/dev/sdb1` with the XFS filesystem? | `sudo mkfs.xfs /dev/sdb1` | **`mkfs`** is the utility to create the filesystem structure. |

Export to Sheets

* * *

## 4\. 💻 Programming and Compilation (10 Questions)

# 

| No. | Question (Focus) | Answer/Command | Trick/Explanation |
| --- | --- | --- | --- |
| 31 | **Compilation:** What is the output file of the **Assembler** stage in C/C++ compilation? | **Object File (`.o`)** | This file is machine code but is not yet runnable. |
| 32 | **Linker Role:** If a program fails to start with a "library not found" error, which compilation stage failed to resolve the dependency properly at runtime? | The **Linker** | The linker created a dynamically linked executable. |
| 33 | **Tool:** What command would confirm if a binary (`/usr/bin/python3`) is compiled statically or dynamically? | **`ldd /usr/bin/python3`** | If it's dynamic, it will list required shared libraries. |
| 34 | **GCC Flag:** What is the purpose of the `-c` flag in a `gcc` command? | It stops the compilation process **before the linking stage**. | It only produces the object file (`.o`). |
| 33 | **Makefile Action:** What special character must precede the command (action) line in a Makefile? | A **Tab** character | Spaces are not recognized; this is a common Makefile error. |
| 36 | **Makefile:** Write the basic syntax for a target named `clean` that deletes the program `app`. | `clean:` `\trm app` | The action must start with a tab. |
| 37 | **Interpreted:** Name one popular **interpreted** scripting language (other than Bash). | **Python** or **Ruby** |  |
| 38 | **C/C++:** What do the `#include` and `#define` directives primarily involve in the compilation process? | The **Pre-processor** | It performs simple text substitution. |
| 39 | **Git:** What command moves changes from your **Working Directory** to the **Staging Area**? | **`git add [file]`** |  |
| 40 | **Git:** What command creates a snapshot of the **Staging Area** and moves it to the **Local Repository**? | **`git commit -m "message"`** |  |

Export to Sheets

* * *

## 5\. 🌐 Networking and Boot (10 Questions)

# 

| No. | Question (Focus) | Answer/Command | Trick/Explanation |
| --- | --- | --- | --- |
| 41 | **Firewall Trick:** You want to deny SSH traffic but allow everything else. Where must this **deny rule** be placed relative to the default policy? | **Before** the default policy. | Rules are sequential. If the default is ACCEPT, the rule must be hit first. |
| 42 | **Diagnosis:** What command is best to determine if a web server is **listening** on port 8080? | **`netstat -tuln`** or **`ss -tuln`** | Shows established and listening ports/sockets. |
| 43 | **Networking:** What is the full process of translating a URL to an IP address called? | **DNS** (Domain Name System) resolution. |  |
| 44 | **NAT:** What networking component allows multiple internal devices to share a single public IP address for external communication? | **NAT** (Network Address Translation) |  |
| 45 | **Boot:** What is the difference between **BIOS** and **UEFI**? | **UEFI** is the modern replacement, supports **GPT** (larger disks), and offers a faster boot time. |  |
| 46 | **Boot:** After the kernel loads, what is the next major component it hands control to? | The **Init System** (`systemd` in modern Linux). |  |
| 47 | **Troubleshooting:** You can ping your internal gateway but not external sites. What piece of network configuration is likely wrong? | The **Route/Default Gateway**. | Your machine knows how to talk locally, but not how to leave your network. |
| 48 | **IP Test:** What command would you use to check the IP address of your default gateway? | **`ip route show`** | Look for the line starting with `default`. |
| 49 | **VM Hypervisor:** What is the difference between a **Type 1 (Bare-Metal)** and a **Type 2 (Hosted)** hypervisor? | **Type 1** runs directly on hardware (e.g., ESXi). **Type 2** runs on a host OS (e.g., VirtualBox). |  |
| 50 | **Security Group:** In an AWS Security Group, why do you not need a separate rule to allow the HTTP response back from a web server?  
  
 |

### 1\. System Architecture and Boot Chain (10 Questions)

# 

<table data-path-to-node="16"><tbody><tr><td><div><div><response-element ng-version="0.0.0-PLACEHOLDER"><table-block _nghost-ng-c2069143918=""><div _ngcontent-ng-c2069143918=""><div _ngcontent-ng-c2069143918="" not-end-of-paragraph="" jslog="275421;track:impression,attention"><table><thead><tr><td>No.</td><td>Question (Focus)</td><td>Answer/Concept</td><td>Trick/Explanation</td></tr></thead><tbody><tr><td>1</td><td><b>RAM vs. Disk:</b> What is the primary difference in data retention between RAM and an SSD?</td><td><b>RAM is volatile</b> (loses data on power loss); <b>SSD is non-volatile</b> (retains data).</td><td></td></tr><tr><td>2</td><td><b>GPU Types:</b> What is the main drawback of an <b>integrated</b> GPU compared to a discrete GPU?</td><td>It <b>shares system RAM</b> with the CPU, reducing memory available to the OS.</td><td></td></tr><tr><td>3</td><td><b>Boot Stage:</b> What is the firmware that runs first and initiates the POST?</td><td><b>BIOS / UEFI</b></td><td></td></tr><tr><td>4</td><td><b>Boot Stage:</b> What is the software component whose job is to find and load the OS kernel?</td><td><b>Bootloader</b> (e.g., GRUB)</td><td></td></tr><tr><td>5</td><td><b>Init System:</b> What is the function of the <code>systemd</code> process after the kernel has loaded?</td><td>It runs as <b>PID 1</b> and manages the <b>services/daemons</b> (user space) startup.</td><td></td></tr><tr><td>6</td><td><b>VMs:</b> What is a <b>Type 1 Hypervisor</b> and why is it considered more efficient?</td><td><b>Bare-Metal</b> (runs directly on hardware). More efficient because it bypasses a Host OS.</td><td></td></tr><tr><td>7</td><td><b>Disks:</b> Why is the NVMe interface superior to SATA for connecting an SSD?</td><td>It connects directly to the <b>PCIe bus</b>, offering higher throughput and lower latency.</td><td></td></tr><tr><td>8</td><td><b>Process State:</b> What is the purpose of the <b>POST</b>?</td><td>To initialize and test the primary hardware components (CPU, memory, storage).</td><td></td></tr><tr><td>9</td><td><b>Storage Limit:</b> What physical limitation led to the development of GPT to replace MBR?</td><td>MBR cannot address partitions larger than <b>2 Terabytes</b>.</td><td></td></tr><tr><td>10</td><td><b>OS Core:</b> What is the one file that <i>must</i> be successfully loaded for the OS to run?</td><td>The <b>Kernel</b></td><td></td></tr></tbody></table></div><div _ngcontent-ng-c2069143918="" hide-from-message-actions=""><button _ngcontent-ng-c2069143918="" mat-button="" mat-ripple-loader-uninitialized="" mat-ripple-loader-class-name="mat-mdc-button-ripple" jslog="184701;track:generic_click,impression;BardVeMetadataKey:[[&quot;r_b349f886862b285b&quot;,&quot;c_ce9d54f79d27cd4f&quot;,null,null,null,null,null,null,1,null,null,null,0]]"><span></span><span><span _ngcontent-ng-c2069143918=""><span _ngcontent-ng-c2069143918=""><mat-icon _ngcontent-ng-c2069143918="" role="img" fonticon="drive_spreadsheet" aria-hidden="true"></mat-icon></span><span _ngcontent-ng-c2069143918="">Export to Sheets</span></span></span><span></span><span></span></button><button _ngcontent-ng-c2069143918="" mat-icon-button="" mattooltip="Copy table" aria-label="Copy table" mat-ripple-loader-uninitialized="" mat-ripple-loader-class-name="mat-mdc-button-ripple" mat-ripple-loader-centered="" jslog="276666;track:generic_click,impression;BardVeMetadataKey:[[&quot;r_b349f886862b285b&quot;,&quot;c_ce9d54f79d27cd4f&quot;,null,null,null,null,null,null,1,null,null,null,0]]"><span></span><mat-icon _ngcontent-ng-c2069143918="" role="img" fonticon="content_copy" aria-hidden="true"></mat-icon><span></span><span></span></button></div></div></table-block></response-element></div></div><hr><hr></td></tr></tbody></table>

### 2\. 🔐 File Structures and Links (10 Questions)

# 

<table data-path-to-node="16"><tbody><tr><td><div><div><response-element ng-version="0.0.0-PLACEHOLDER"><table-block _nghost-ng-c2069143918=""><div _ngcontent-ng-c2069143918=""><div _ngcontent-ng-c2069143918="" not-end-of-paragraph="" jslog="275421;track:impression,attention"><table><thead><tr><td>No.</td><td>Question (Focus)</td><td>Answer/Concept</td><td>Trick/Explanation</td></tr></thead><tbody><tr><td>11</td><td><b>Inode:</b> Name the single piece of metadata that an Inode does <b>not</b> store.</td><td>The <b>Filename</b> (this is stored in the directory entry).</td><td></td></tr><tr><td>12</td><td><b>Link Failure:</b> What must happen to a <b>Symbolic Link</b> to cause it to break (become dangling)?</td><td>The original <b>target file</b> must be deleted or moved.</td><td></td></tr><tr><td>13</td><td><b>Link Resilience:</b> If you delete the original file, what happens to its <b>Hard Link</b>?</td><td>The Hard Link remains, and the <b>data persists</b> until the last link is removed.</td><td></td></tr><tr><td>14</td><td><b>Device Type:</b> If you are reading data from <code>/dev/zero</code>, what device type is it and why?</td><td><b>Character device</b>. Data is transmitted sequentially, one byte at a time.</td><td></td></tr><tr><td>15</td><td><b>Filesystem Standard:</b> What is the default filesystem used by modern Linux distributions (e.g., Ubuntu/RHEL)?</td><td><b>Ext4</b> (Extended Filesystem 4)</td><td></td></tr><tr><td>16</td><td><b>Permissions:</b> Explain the symbolic permission <code>u=rwx,go=</code>.</td><td><b>Owner</b> gets Read/Write/Execute; <b>Group</b> and <b>Others</b> get <b>no</b> permissions.</td><td></td></tr><tr><td>17</td><td><b>Tool Difference:</b> What is the conceptual difference between <code>du</code> and <code>df</code>?</td><td><b><code>du</code></b> (Disk Usage) shows <b>directory size</b>; <b><code>df</code></b> (Disk Free) shows <b>partition free space</b>.</td><td></td></tr><tr><td>18</td><td><b>Tar vs. Gzip:</b> Which command primarily bundles files into a single archive, and which handles the compression?</td><td><b><code>tar</code></b> bundles; <b><code>gzip</code></b> compresses.</td><td>Often combined: <code>tar -czvf</code>.</td></tr><tr><td>19</td><td><b>Permissions:</b> If a file has permission <code>644</code>, which user has <b>write</b> access?</td><td>Only the <b>Owner</b>.</td><td>6=4+2. Group/Other only have 4 (read).</td></tr><tr><td>20</td><td><b>Link Limitation:</b> What prevents a hard link from linking a file in <code>/home</code> to a file in <code>/mnt/data</code>?</td><td>They reside on different <b>filesystems/partitions</b>.</td><td></td></tr></tbody></table></div><div _ngcontent-ng-c2069143918="" hide-from-message-actions=""><button _ngcontent-ng-c2069143918="" mat-button="" mat-ripple-loader-uninitialized="" mat-ripple-loader-class-name="mat-mdc-button-ripple" jslog="184701;track:generic_click,impression;BardVeMetadataKey:[[&quot;r_b349f886862b285b&quot;,&quot;c_ce9d54f79d27cd4f&quot;,null,null,null,null,null,null,1,null,null,null,0]]"><span></span><span><span _ngcontent-ng-c2069143918=""><span _ngcontent-ng-c2069143918=""><mat-icon _ngcontent-ng-c2069143918="" role="img" fonticon="drive_spreadsheet" aria-hidden="true"></mat-icon></span><span _ngcontent-ng-c2069143918="">Export to Sheets</span></span></span><span></span><span></span></button><button _ngcontent-ng-c2069143918="" mat-icon-button="" mattooltip="Copy table" aria-label="Copy table" mat-ripple-loader-uninitialized="" mat-ripple-loader-class-name="mat-mdc-button-ripple" mat-ripple-loader-centered="" jslog="276666;track:generic_click,impression;BardVeMetadataKey:[[&quot;r_b349f886862b285b&quot;,&quot;c_ce9d54f79d27cd4f&quot;,null,null,null,null,null,null,1,null,null,null,0]]"><span></span><mat-icon _ngcontent-ng-c2069143918="" role="img" fonticon="content_copy" aria-hidden="true"></mat-icon><span></span><span></span></button></div></div></table-block></response-element></div></div><hr><hr></td></tr></tbody></table>

### 3\. ⚙️ Process and Service Failure States (10 Questions)

# 

<table data-path-to-node="16"><tbody><tr><td><div><div><response-element ng-version="0.0.0-PLACEHOLDER"><table-block _nghost-ng-c2069143918=""><div _ngcontent-ng-c2069143918=""><div _ngcontent-ng-c2069143918="" not-end-of-paragraph="" jslog="275421;track:impression,attention"><table><thead><tr><td>No.</td><td>Question (Focus)</td><td>Answer/Concept</td><td>Trick/Explanation</td></tr></thead><tbody><tr><td>21</td><td><b>Process State:</b> Explain why a <b>Zombie</b> process cannot be killed with <code>kill -9</code>.</td><td>It is already <b>dead</b>; it exists only as a metadata entry waiting for its parent process.</td><td></td></tr><tr><td>22</td><td><b>Parent/Child:</b> What process is the immediate parent of an <b>Orphan</b> process?</td><td><b><code>systemd</code></b> (PID 1)</td><td></td></tr><tr><td>23</td><td><b>Service Control:</b> Which <code>systemctl</code> command is guaranteed to re-read the service's configuration file <i>before</i> restarting it?</td><td><b><code>systemctl daemon-reload</code></b> followed by <b><code>systemctl restart</code></b></td><td><b><code>reload</code></b> is insufficient if the unit file was changed.</td></tr><tr><td>24</td><td><b>Signals:</b> Why should you always try <code>kill PID</code> (SIGTERM) before <code>kill -9 PID</code> (SIGKILL)?</td><td><b>SIGTERM</b> allows the program to <b>gracefully clean up</b> resources (e.g., save data, close sockets).</td><td></td></tr><tr><td>25</td><td><b>Persistence:</b> When using <code>tmux</code>, what command allows you to leave your shell session running and exit your terminal window?</td><td><b><code>tmux detach</code></b></td><td></td></tr><tr><td>26</td><td><b>Monitoring:</b> If you want to view a log file in real-time as new entries are added, what command and flag should you use?</td><td><b><code>tail -f [filename]</code></b></td><td><code>-f</code> stands for "follow."</td></tr><tr><td>27</td><td><b>Daemon:</b> What is the term for a background process that runs continuously to provide a service (often ending in 'd', like <code>httpd</code>)?</td><td><b>Daemon</b> (or Service)</td><td></td></tr><tr><td>28</td><td><b>Troubleshooting:</b> If <code>systemctl status web_service</code> shows <code>inactive (dead)</code>, what is the next diagnostic step?</td><td>Check the logs using <b><code>journalctl -u web_service</code></b>.</td><td></td></tr><tr><td>29</td><td><b>PID vs PPID:</b> What does a process's <b>PPID</b> tell you?</td><td>The <b>Process ID (PID)</b> of its <b>Parent</b> process.</td><td></td></tr><tr><td>30</td><td><b>Job Control:</b> When a process is suspended via <b><code>Ctrl+Z</code></b>, what process state is it in?</td><td><b>Stopped</b></td><td>It can be resumed with <code>fg</code> or <code>bg</code>.</td></tr></tbody></table></div><div _ngcontent-ng-c2069143918="" hide-from-message-actions=""><button _ngcontent-ng-c2069143918="" mat-button="" mat-ripple-loader-uninitialized="" mat-ripple-loader-class-name="mat-mdc-button-ripple" jslog="184701;track:generic_click,impression;BardVeMetadataKey:[[&quot;r_b349f886862b285b&quot;,&quot;c_ce9d54f79d27cd4f&quot;,null,null,null,null,null,null,1,null,null,null,0]]"><span></span><span><span _ngcontent-ng-c2069143918=""><span _ngcontent-ng-c2069143918=""><mat-icon _ngcontent-ng-c2069143918="" role="img" fonticon="drive_spreadsheet" aria-hidden="true"></mat-icon></span><span _ngcontent-ng-c2069143918="">Export to Sheets</span></span></span><span></span><span></span></button><button _ngcontent-ng-c2069143918="" mat-icon-button="" mattooltip="Copy table" aria-label="Copy table" mat-ripple-loader-uninitialized="" mat-ripple-loader-class-name="mat-mdc-button-ripple" mat-ripple-loader-centered="" jslog="276666;track:generic_click,impression;BardVeMetadataKey:[[&quot;r_b349f886862b285b&quot;,&quot;c_ce9d54f79d27cd4f&quot;,null,null,null,null,null,null,1,null,null,null,0]]"><span></span><mat-icon _ngcontent-ng-c2069143918="" role="img" fonticon="content_copy" aria-hidden="true"></mat-icon><span></span><span></span></button></div></div></table-block></response-element></div></div><hr><hr></td></tr></tbody></table>

### 4\. 💻 Programming and Compilation (10 Questions)

# 

<table data-path-to-node="16"><tbody><tr><td><div><div><response-element ng-version="0.0.0-PLACEHOLDER"><table-block _nghost-ng-c2069143918=""><div _ngcontent-ng-c2069143918=""><div _ngcontent-ng-c2069143918="" not-end-of-paragraph="" jslog="275421;track:impression,attention"><table><thead><tr><td>No.</td><td>Question (Focus)</td><td>Answer/Concept</td><td>Trick/Explanation</td></tr></thead><tbody><tr><td>31</td><td><b>Compilation:</b> Which stage is responsible for including code from external <code>.so</code> or <code>.a</code> files?</td><td>The <b>Linker</b></td><td></td></tr><tr><td>32</td><td><b>Interpreted:</b> Why is a Python script often slower to execute than a C program?</td><td>It is <b>interpreted at runtime</b>, line by line, rather than being compiled directly to machine code beforehand.</td><td></td></tr><tr><td>33</td><td><b>Makefiles:</b> If a <code>target</code> is newer than its <code>dependency</code>, what does <code>make</code> do?</td><td><b>Nothing</b>. The target is considered up-to-date.</td><td></td></tr><tr><td>34</td><td><b>GCC Flags:</b> What is the purpose of the <code>-Wall</code> flag in <code>gcc</code>?</td><td>To enable <b>All</b> common compiler <b>warnings</b>.</td><td></td></tr><tr><td>35</td><td><b>Tool:</b> What is the fundamental difference between the output of <code>which</code> and <code>whereis</code>?</td><td><b><code>which</code></b> shows the path to the <b>executable</b> binary; <b><code>whereis</code></b> shows the executable, source, and manual page locations.</td><td></td></tr><tr><td>36</td><td><b>ELF:</b> Why is the ELF format known as "Executable and <b>Linkable</b> Format"?</td><td>Because it is designed to be used both as a final executable <b>and</b> as an object file during linking.</td><td></td></tr><tr><td>37</td><td><b>Git:</b> What command should you run <i>before</i> you start working on a new feature in a branch?</td><td><b><code>git pull</code></b></td><td>Ensures your branch is up-to-date with the remote history.</td></tr><tr><td>38</td><td><b>Git:</b> Where does Git look to see which files it should intentionally <b>ignore</b> and not track?</td><td>The <b><code>.gitignore</code></b> file.</td><td></td></tr><tr><td>39</td><td><b>I/O in C:</b> In C programming, which function is generally preferred over <code>printf</code> for security reasons when writing to logs or standard output?</td><td><b><code>fprintf</code></b> (or careful use of <code>printf</code>)</td><td>Prevents format string vulnerabilities.</td></tr><tr><td>40</td><td><b>Makefile Target:</b> The <code>all</code> target often depends on the final program executable. If you type <code>make</code> with no arguments, which target does it attempt to build by default?</td><td>The <b>first</b> target listed in the Makefile (often named <code>all</code>).</td><td></td></tr></tbody></table></div><div _ngcontent-ng-c2069143918="" hide-from-message-actions=""><button _ngcontent-ng-c2069143918="" mat-button="" mat-ripple-loader-uninitialized="" mat-ripple-loader-class-name="mat-mdc-button-ripple" jslog="184701;track:generic_click,impression;BardVeMetadataKey:[[&quot;r_b349f886862b285b&quot;,&quot;c_ce9d54f79d27cd4f&quot;,null,null,null,null,null,null,1,null,null,null,0]]"><span></span><span><span _ngcontent-ng-c2069143918=""><span _ngcontent-ng-c2069143918=""><mat-icon _ngcontent-ng-c2069143918="" role="img" fonticon="drive_spreadsheet" aria-hidden="true"></mat-icon></span><span _ngcontent-ng-c2069143918="">Export to Sheets</span></span></span><span></span><span></span></button><button _ngcontent-ng-c2069143918="" mat-icon-button="" mattooltip="Copy table" aria-label="Copy table" mat-ripple-loader-uninitialized="" mat-ripple-loader-class-name="mat-mdc-button-ripple" mat-ripple-loader-centered="" jslog="276666;track:generic_click,impression;BardVeMetadataKey:[[&quot;r_b349f886862b285b&quot;,&quot;c_ce9d54f79d27cd4f&quot;,null,null,null,null,null,null,1,null,null,null,0]]"><span></span><mat-icon _ngcontent-ng-c2069143918="" role="img" fonticon="content_copy" aria-hidden="true"></mat-icon><span></span><span></span></button></div></div></table-block></response-element></div></div><hr><hr></td></tr></tbody></table>

### 5\. 🌐 Networking and Protocols (10 Questions)

# 

<table data-path-to-node="16"><tbody><tr><td><div><div><response-element ng-version="0.0.0-PLACEHOLDER"><table-block _nghost-ng-c2069143918=""><div _ngcontent-ng-c2069143918=""><div _ngcontent-ng-c2069143918="" not-end-of-paragraph="" jslog="275421;track:impression,attention"><table><thead><tr><td>No.</td><td>Question (Focus)</td><td>Answer/Concept</td><td>Trick/Explanation</td></tr></thead><tbody><tr><td>41</td><td><b>Protocol:</b> Which protocol is responsible for translating IP addresses to MAC addresses on a local network?</td><td><b>ARP</b> (Address Resolution Protocol)</td><td></td></tr><tr><td>42</td><td><b>Subnetting:</b> If a network has a mask of <code>/24</code>, how many hosts (approx.) can the network support?</td><td>28−2=254 usable hosts.</td><td>(32−24=8 host bits).</td></tr><tr><td>43</td><td><b>DNS:</b> What is the role of a DNS server?</td><td>To translate human-readable <b>Hostnames</b> (URLs) into numerical <b>IP Addresses</b>.</td><td></td></tr><tr><td>44</td><td><b>DHCP:</b> What client/server protocol is used to automatically assign IP addresses and other configurations to devices?</td><td><b>DHCP</b> (Dynamic Host Configuration Protocol)</td><td></td></tr><tr><td>45</td><td><b>Diagnosis:</b> You can access a website by IP address but not by hostname. What service is likely failing?</td><td><b>DNS</b> resolution is failing.</td><td></td></tr><tr><td>46</td><td><b>Routing:</b> What configuration tells your computer where to send packets destined for a network <i>outside</i> your local subnet?</td><td>The <b>Default Gateway</b> (router) / Routing Table.</td><td></td></tr><tr><td>47</td><td><b>Firewall:</b> What does it mean for an AWS Security Group to be <b>Stateful</b>?</td><td>If a rule allows <b>inbound</b> traffic, the <b>outbound response</b> traffic is automatically allowed without a separate rule.</td><td></td></tr><tr><td>48</td><td><b>SSH:</b> What protocol does <b><code>sftp</code></b> use for its underlying connection?</td><td><b>SSH</b> (Secure Shell)</td><td></td></tr><tr><td>49</td><td><b>Troubleshooting:</b> The <code>netstat</code> output shows your web server is LISTENING on <code>0.0.0.0:80</code>. What does <code>0.0.0.0</code> mean?</td><td>It means the service is <b>listening on all available network interfaces</b> and IP addresses.</td><td></td></tr><tr><td>50</td><td><b>HTTP vs. HTTPS:</b> What provides the encryption for an HTTPS connection?</td><td><b>TLS/SSL Certificates</b> (handled by the browser and server).</td></tr></tbody></table></div></div></table-block></response-element></div></div></td><td>AWS Security Groups are <b>stateful</b>.</td><td>Return traffic is automatically allowed.</td></tr></tbody></table>

### 1\. System Architecture and Boot Chain (10 Questions)

## 

| No. | Question (Focus) | Answer/Concept | Trick/Explanation |
| --- | --- | --- | --- |
| 1 | **RAM vs. Disk:** What is the primary difference in data retention between RAM and an SSD? | **RAM is volatile** (loses data on power loss); **SSD is non-volatile** (retains data). |  |
| 2 | **GPU Types:** What is the main drawback of an **integrated** GPU compared to a discrete GPU? | It **shares system RAM** with the CPU, reducing memory available to the OS. |  |
| 3 | **Boot Stage:** What is the firmware that runs first and initiates the POST? | **BIOS / UEFI** |  |
| 4 | **Boot Stage:** What is the software component whose job is to find and load the kernel? | **Bootloader** (e.g., GRUB) |  |
| 5 | **Init System:** What is the function of the `systemd` process after the kernel has loaded? | It runs as **PID 1** and manages the **services/daemons** (user space) startup. |  |
| 6 | **VMs:** What is a **Type 1 Hypervisor** and why is it considered more efficient? | **Bare-Metal** (runs directly on hardware). More efficient because it bypasses a Host OS. |  |
| 7 | **Disks:** Why is the NVMe interface superior to SATA for connecting an SSD? | It connects directly to the **PCIe bus**, offering higher throughput and lower latency. |  |
| 8 | **Process State:** What is the purpose of the **POST**? | To initialize and test the primary hardware components (CPU, memory, storage). |  |
| 9 | **Storage Limit:** What physical limitation led to the development of GPT to replace MBR? | MBR cannot address partitions larger than **2 Terabytes**. |  |
| 10 | **OS Core:** What is the one file that _must_ be successfully loaded for the OS to run? | The **Kernel** |  |

Export to Sheets

* * *

* * *

### 2\. 🔐 File Structures and Links (10 Questions)

## 

| No. | Question (Focus) | Answer/Concept | Trick/Explanation |
| --- | --- | --- | --- |
| 11 | **Inode:** Name the single piece of metadata that an Inode does **not** store. | The **Filename** (this is stored in the directory entry). |  |
| 12 | **Link Failure:** What must happen to a **Symbolic Link** to cause it to break (become dangling)? | The original **target file** must be deleted or moved. |  |
| 13 | **Link Resilience:** If you delete the original file, what happens to its **Hard Link**? | The Hard Link remains, and the **data persists** until the last link is removed. |  |
| 14 | **Device Type:** If you are reading data from `/dev/zero`, what device type is it and why? | **Character device**. Data is transmitted sequentially, one byte at a time. |  |
| 15 | **Filesystem Standard:** What is the default filesystem used by modern Linux distributions (e.g., Ubuntu/RHEL)? | **Ext4** (Extended Filesystem 4) |  |
| 16 | **Permissions:** Explain the symbolic permission `u=rwx,go=`. | **Owner** gets Read/Write/Execute; **Group** and **Others** get **no** permissions. |  |
| 17 | **Tool Difference:** What is the conceptual difference between `du` and `df`? | **`du`** (Disk Usage) shows **directory size**; **`df`** (Disk Free) shows **partition free space**. |  |
| 18 | **Tar vs. Gzip:** Which command primarily bundles files into a single archive, and which handles the compression? | **`tar`** bundles; **`gzip`** compresses. | Often combined: `tar -czvf`. |
| 19 | **Permissions:** If a file has permission `644`, which user has **write** access? | Only the **Owner**. | 6=4+2. Group/Other only have 4 (read). |
| 20 | **Link Limitation:** What prevents a hard link from linking a file in `/home` to a file in `/mnt/data`? | They reside on different **filesystems/partitions**. |  |

Export to Sheets

* * *

* * *

### 3\. ⚙️ Process and Service Failure States (10 Questions)

## 

| No. | Question (Focus) | Answer/Concept | Trick/Explanation |
| --- | --- | --- | --- |
| 21 | **Process State:** Explain why a **Zombie** process cannot be killed with `kill -9`. | It is already **dead**; it exists only as a metadata entry waiting for its parent process. |  |
| 22 | **Parent/Child:** What process is the immediate parent of an **Orphan** process? | **`systemd`** (PID 1) |  |
| 23 | **Service Control:** Which `systemctl` command is guaranteed to re-read the service's configuration file _before_ restarting it? | **`systemctl daemon-reload`** followed by **`systemctl restart`** | **`reload`** is insufficient if the unit file was changed. |
| 24 | **Signals:** Why should you always try `kill PID` (SIGTERM) before `kill -9 PID` (SIGKILL)? | **SIGTERM** allows the program to **gracefully clean up** resources (e.g., save data, close sockets). |  |
| 25 | **Persistence:** When using `tmux`, what command allows you to leave your shell session running and exit your terminal window? | **`tmux detach`** |  |
| 26 | **Monitoring:** If you want to view a log file in real-time as new entries are added, what command and flag should you use? | **`tail -f [filename]`** | `-f` stands for "follow." |
| 27 | **Daemon:** What is the term for a background process that runs continuously to provide a service (often ending in 'd', like `httpd`)? | **Daemon** (or Service) |  |
| 28 | **Troubleshooting:** If `systemctl status web_service` shows `inactive (dead)`, what is the next diagnostic step? | Check the logs using **`journalctl -u web_service`**. |  |
| 29 | **PID vs PPID:** What does a process's **PPID** tell you? | The **Process ID (PID)** of its **Parent** process. |  |
| 30 | **Job Control:** When a process is suspended via **`Ctrl+Z`**, what process state is it in? | **Stopped** | It can be resumed with `fg` or `bg`. |

Export to Sheets

* * *

* * *

### 4\. 💻 Programming and Compilation (10 Questions)

## 

| No. | Question (Focus) | Answer/Concept | Trick/Explanation |
| --- | --- | --- | --- |
| 31 | **Compilation:** Which stage is responsible for including code from external `.so` or `.a` files? | The **Linker** |  |
| 32 | **Interpreted:** Why is a Python script often slower to execute than a C program? | It is **interpreted at runtime**, line by line, rather than being compiled directly to machine code beforehand. |  |
| 33 | **Makefiles:** If a `target` is newer than its `dependency`, what does `make` do? | **Nothing**. The target is considered up-to-date. |  |
| 34 | **GCC Flags:** What is the purpose of the `-Wall` flag in `gcc`? | To enable **All** common compiler **warnings**. |  |
| 35 | **Tool:** What is the fundamental difference between the output of `which` and `whereis`? | **`which`** shows the path to the **executable** binary; **`whereis`** shows the executable, source, and manual page locations. |  |
| 36 | **ELF:** Why is the ELF format known as "Executable and **Linkable** Format"? | Because it is designed to be used both as a final executable **and** as an object file during linking. |  |
| 37 | **Git:** What command should you run _before_ you start working on a new feature in a branch? | **`git pull`** | Ensures your branch is up-to-date with the remote history. |
| 38 | **Git:** Where does Git look to see which files it should intentionally **ignore** and not track? | The **`.gitignore`** file. |  |
| 39 | **I/O in C:** In C programming, which function is generally preferred over `printf` for security reasons when writing to logs or standard output? | **`fprintf`** (or careful use of `printf`) | Prevents format string vulnerabilities. |
| 40 | **Makefile Target:** The `all` target often depends on the final program executable. If you type `make` with no arguments, which target does it attempt to build by default? | The **first** target listed in the Makefile (often named `all`). |  |

Export to Sheets

* * *

* * *

### 5\. 🌐 Networking and Protocols (10 Questions)

## 

| No. | Question (Focus) | Answer/Concept | Trick/Explanation |
| --- | --- | --- | --- |
| 41 | **Protocol:** Which protocol is responsible for translating IP addresses to MAC addresses on a local network? | **ARP** (Address Resolution Protocol) |  |
| 42 | **Subnetting:** If a network has a mask of `/24`, how many hosts (approx.) can the network support? | 28−2=254 usable hosts. | (32−24=8 host bits). |
| 43 | **DNS:** What is the role of a DNS server? | To translate human-readable **Hostnames** (URLs) into numerical **IP Addresses**. |  |
| 44 | **DHCP:** What client/server protocol is used to automatically assign IP addresses and other configurations to devices? | **DHCP** (Dynamic Host Configuration Protocol) |  |
| 45 | **Diagnosis:** You can access a website by IP address but not by hostname. What service is likely failing? | **DNS** resolution is failing. |  |
| 46 | **Routing:** What configuration tells your computer where to send packets destined for a network _outside_ your local subnet? | The **Default Gateway** (router) / Routing Table. |  |
| 47 | **Firewall:** What does it mean for an AWS Security Group to be **Stateful**? | If a rule allows **inbound** traffic, the **outbound response** traffic is automatically allowed without a separate rule. |  |
| 48 | **SSH:** What protocol does **`sftp`** use for its underlying connection? | **SSH** (Secure Shell) |  |
| 49 | **Troubleshooting:** The `netstat` output shows your web server is LISTENING on `0.0.0.0:80`. What does `0.0.0.0` mean? | It means the service is **listening on all available network interfaces** and IP addresses. |  |
| 50 | **HTTP vs. HTTPS:** What provides the encryption for an HTTPS connection? | **TLS/SSL Certificates** (handled by the browser and server). |

## 🛠️ Code Snippet Drill (50 Questions)

### 1\. Bash Scripting and Conditionals (10 Questions)

# 

| No. | Snippet | Question | Answer |
| --- | --- | --- | --- |
| 1 | `VAR="Hello"` `echo '$VAR'` | What is the exact output of the `echo` command? | **$VAR** |
| 2 | `FILE="/tmp/data"` `if [ ! -f $FILE ]; then ...` | If `/tmp/data` does **not** exist, does the `if` block execute? | **Yes** (`! -f` means "not a file"). |
| 3 | `for i in 1 2 3; do echo $i; done` | What is the output of the loop? | **1 2 3** (each on a new line) |
| 4 | `read -p "Enter val: " V` `if [ -z "$V" ]; then ...` | What condition causes the `if` block to execute? | The user presses **Enter** without typing anything (`-z` tests for zero length/empty string). |
| 5 | `while getopts "p:v" opt; do ...` | If the user runs `./script.sh -p 8080`, what variable holds the value `8080`? | The built-in variable **`$OPTARG`** |
| 6 | \`echo "name=alice" | cut -d'=' -f2\` | What is the final output of this pipeline? |
| 7 | `printf "Value is: %-10s\n" "TEST"` | What is the output, including any padding? | **Value is: TEST** (TEST followed by 6 spaces) |
| 8 | `STATUS=1` `if [ $STATUS -eq 0 ]; then ... else ...` | Which block (if or else) executes? | The **else** block (`-eq 0` tests for equal to 0, which is false). |
| 9 | `if [ "$1" == "clean" ]; then ... else ...` | What argument must be passed to execute the `if` block? | **clean** (The first positional argument, `$1`). |
| 10 | `echo "test" > /dev/null` `echo $?` | What is the final output of this sequence? | **0** |

Export to Sheets

### 2\. I/O Redirection and Text Processing (10 Questions)

# 

| No. | Snippet | Question | Answer/Result |
| --- | --- | --- | --- |
| 11 | `ls /root 2> errors.log` | Where is the **Permission denied** message stored? | In the file **`errors.log`** (FD 2). |
| 12 | `ls /usr > all.log 2>&1` | If `all.log` already has content, what happens to the file? | It is **overwritten** (`>`). |
| 13 | `grep -E '^[A-Z]{3}' file.txt` | What lines does this pattern match? | Lines that **start** (`^`) with exactly **three uppercase letters**. |
| 14 | \`echo "10:1:200" | awk -F':' '{print $3}'\` | What is the output? |
| 15 | \`echo "old-user" | sed 's/-user/-admin/'\` | What is the final string output by `sed`? |
| 16 | `find /etc -name "*.conf" 2> /dev/null` | Why is `2> /dev/null` included here? | To **suppress/discard** any permission or error messages. |
| 17 | `echo "1" > data.txt` `echo "2" >> data.txt` | What is the content of `data.txt` after both commands? | **1** **2** (The second command appends). |
| 18 | \`cat numbers.txt | sort -r\` | What does the `-r` flag do to the sorted output? |
| 19 | \`echo "word" | wc -c\` | What is the output of this command? |
| 20 | \`cmd | tee log.txt\` | What happens to the command's output? |

Export to Sheets

### 3\. File Permissions and Links (10 Questions)

# 

| No. | Snippet | Question | Answer/Action |
| --- | --- | --- | --- |
| 21 | `ls -l id_rsa` shows `-rw-r--r--`. | What is the octal permission? | **644** |
| 22 | `chmod u=rwx,go= file` | What is the octal permission of `file` after this command? | **700** |
| 23 | `chmod g-w,o-rwx config.ini` | What does this command do? | Removes **write** for group and removes **all** permissions for others. |
| 24 | `ln -s /data/file /link` | Is `/link` a Hard Link or a Symbolic Link? | **Symbolic Link** (`-s`). |
| 25 | `ls -i file1 file2` shows they have the same Inode number. | What kind of link exists between them? | **Hard Link** |
| 26 | `chown alice:devs report.doc` | Who is the owner and who is the group? | Owner: **alice**, Group: **devs** |
| 27 | `chmod 755 /var/www` | Does the group have permission to create files in this directory? | **Yes** (Group has **rwx** if sticky bit isn't set, but standard `755` means **Group Execute** to enter, and **Write** is missing). **No, Group needs 'w' (7) to create files.** |
| 28 | `ln /tmp/orig /tmp/link` | If `/tmp/orig` is deleted, what happens to `/tmp/link`? | **Nothing**. It remains a valid file. |
| 29 | `umount /dev/sdb1` | What is the error in this command? | It should be **`umount`** (no 'n'). |
| 30 | `df -h /home` | What information does this command show? | The **free disk space** remaining on the filesystem mounted at `/home`. |

Export to Sheets

### 4\. Process Control and Services (10 Questions)

# 

| No. | Snippet | Question | Answer/Status |
| --- | --- | --- | --- |
| 31 | `long_job &` `logout` | What happens to `long_job` when run in a standard SSH session? | It is **terminated** (hang-up signal `SIGHUP` is sent). |
| 32 | `sleep 1000` `Ctrl+Z` | What is the process status after `Ctrl+Z`? | **Stopped** |
| 33 | \`ps aux | grep 'Z'\` | What kind of process is being searched for? |
| 34 | `systemctl enable nginx` | What state change does this make to the service? | It ensures the service will **start at boot** (persistent). |
| 35 | `systemctl restart db.service` | What two consecutive actions does this command perform? | **Stop** followed by **Start**. |
| 36 | `kill 5432` | What signal is sent to PID 5432? | **SIGTERM (15)** (polite request to stop). |
| 37 | `tmux new -s dev` `Ctrl+b, d` | What command is needed to return to the session later? | **`tmux attach -t dev`** |
| 38 | `journalctl -u cron.service` | What information does this display? | The **logs** generated by the `cron` service. |
| 39 | `PID=123` `PPID=1` | What is the likely _type_ of process? | An **Orphan** process adopted by `systemd`. |
| 40 | `bg %2` | What happens to job number 2? | It resumes running in the **background**. |

Export to Sheets

### 5\. Networking and Compilation (10 Questions)

# 

| No. | Snippet | Question | Answer/Reason |
| --- | --- | --- | --- |
| 41 | `iptables -A INPUT -p tcp --dport 22 -j ACCEPT` | What traffic is this rule allowing? | **Inbound SSH traffic** (TCP port 22). |
| 42 | `ip addr show eth0` | What specific address type is displayed here? | The **IP Address** and **MAC Address** of the `eth0` interface. |
| 43 | `curl google.com:8080` | What is this command trying to test? | Connectivity to `google.com` on a **non-standard HTTP port (8080)**. |
| 44 | `ldd myprogram` | What is the purpose of this command? | To list the **shared libraries (.so files)** required by `myprogram`. |
| 45 | `gcc -c main.c` | What is the output file generated by this command? | **`main.o`** (The object file; linking is skipped). |
| 46 | `make clean` | In the Makefile, what specifies the commands run by this? | The **`clean` target** and its associated actions. |
| 47 | `nslookup 1.1.1.1` | What kind of translation is this request performing? | **Reverse DNS lookup** (IP to Hostname). |
| 48 | `ssh -i ~/.ssh/key user@host` | If `~/.ssh/key` has permission `664`, why will the SSH command fail? | The **private key permissions are too lax** (group has read access). |
| 49 | `git add file.txt` `git status` | What area is `file.txt` moved to, and how is it reported by `git status`? | The **Staging Area**; reported as **Changes to be committed**. |
| 50 | `ip route show` `default via 192.168.1.1` | What does the `default via` entry represent? | The **Default Gateway/Router** for the network. |

## ✅ Easy Review: Fundamental Concepts (50 Questions)

### 1\. Shells, Commands, and I/O (10 Questions)

## 

| No. | Question (Focus) | Answer/Command |
| --- | --- | --- |
| 1 | What command is used to list the contents of the current directory? | **`ls`** |
| 2 | What is the main command used to change directories in the shell? | **`cd`** |
| 3 | What is the shell command used to copy a file? | **`cp`** |
| 4 | What command is used to move or rename a file? | **`mv`** |
| 5 | What is the File Descriptor number for **Standard Output (Stdout)**? | **1** |
| 6 | What operator is used to redirect output to a file, **overwriting** it? | **`>`** |
| 7 | What operator is used to redirect output to a file, **appending** to it? | **`>>`** |
| 8 | What is the key command used to send the output of one command as input to another? | \*\*\` |
| 9 | What simple command is used to view the content of a file directly to the screen? | **`cat`** |
| 10 | What command is used to find lines in a file that match a specific pattern? | **`grep`** |

Export to Sheets

* * *

### 2\. Permissions and Ownership (10 Questions)

## 

| No. | Question (Focus) | Answer/Concept |
| --- | --- | --- |
| 11 | What is the octal value for **Read** permission? | **4** |
| 12 | What is the octal value for **Write** permission? | **2** |
| 13 | What is the octal value for **Execute** permission? | **1** |
| 14 | What command is used to change a file's permissions? | **`chmod`** |
| 15 | What command is used to change the owner of a file? | **`chown`** |
| 16 | Which user has the highest level of privileges in Linux? | **Root** |
| 17 | What command is used to temporarily run a command with root privileges? | **`sudo`** |
| 18 | What command creates a **symbolic (soft) link** to a file? | **`ln -s`** |
| 19 | What unique number identifies a file's metadata on the filesystem? | **Inode** |
| 20 | What file on the server stores the client's public SSH keys for access? | **`authorized_keys`** |

Export to Sheets

* * *

### 3\. Processes and Services (10 Questions)

## 

| No. | Question (Focus) | Answer/Concept |
| --- | --- | --- |
| 21 | What is the command used to view a snapshot of currently running processes? | **`ps`** or **`ps aux`** |
| 22 | What is the command used to view processes in real-time, often sorted by CPU or memory usage? | **`top`** |
| 23 | What signal (name or number) is a polite request to terminate a process? | **SIGTERM** (15) |
| 24 | What signal (name or number) is used to forcefully kill a process? | **SIGKILL** (9) |
| 25 | What is the unique identifier assigned to every running process? | **PID** (Process ID) |
| 26 | What command is used to start a system service immediately? | **`systemctl start [service]`** |
| 27 | What command is used to configure a service to start after every reboot? | **`systemctl enable [service]`** |
| 28 | What is the state of a process suspended with **`Ctrl+Z`**? | **Stopped** |
| 29 | What is the key difference between a process and a daemon/service? | A **daemon/service** runs continuously in the background. |
| 30 | What tool is used to allow a shell session to persist after an SSH disconnect? | **`tmux`** |

Export to Sheets

* * *

### 4\. Networking and Hardware (10 Questions)

## 

| No. | Question (Focus) | Answer/Concept |
| --- | --- | --- |
| 31 | What is the standard protocol and port for unencrypted web traffic? | **HTTP (Port 80)** |
| 32 | What is the standard protocol and port for secure web traffic? | **HTTPS (Port 443)** |
| 33 | What command is used to test basic network connectivity using ICMP? | **`ping`** |
| 34 | What command is used to securely connect to a remote host's command line? | **`ssh`** |
| 35 | What protocol translates hostnames (like `google.com`) into IP addresses? | **DNS** (Domain Name System) |
| 36 | What command shows your system's network interface IP addresses? | **`ip addr show`** (or `ifconfig`) |
| 37 | Which primary firewall chain filters traffic coming _in_ to the server? | **INPUT** (Ingress) |
| 38 | What does **RAM** stand for? | **Random Access Memory** |
| 39 | Which type of disk drive is typically the fastest (HDD, SSD, or NVMe)? | **NVMe** |
| 40 | What is the software layer that allows multiple operating systems to run on one physical machine? | **Hypervisor** |

Export to Sheets

* * *

### 5\. Scripting, Compilation, and Boot (10 Questions)

## 

| No. | Question (Focus) | Answer/Concept |
| --- | --- | --- |
| 41 | What is the command used to search for the location of an executable file? | **`which`** |
| 42 | What environment variable lists the directories the shell searches for commands? | **`$PATH`** |
| 43 | What is the very first line in a shell script that specifies the interpreter? | The **Shebang** (`#!`) |
| 44 | Which popular language is **interpreted** (Bash, C, or C++)? | **Bash** (or Python) |
| 45 | What is the name of the program that converts source code into an executable file? | **Compiler** (e.g., `gcc`) |
| 46 | What is the purpose of the **Linker** stage in compilation? | To combine object files and libraries into the final executable. |
| 47 | What is the first stage in the computer's boot sequence (firmware)? | **BIOS** / **UEFI** |
| 48 | What is the file that contains entries for filesystems to be **automounted** at boot? | **`/etc/fstab`** |
| 49 | What command is used to send local changes to a remote Git repository? | **`git push`** |
| 50 | What command prepares files in the working directory to be included in the next commit? | **`git add`** |

## Easy Review: Fundamentals, Set 2 (50 Questions)

### 1\. Filesystem Navigation and Management (10 Questions)

# 

| No. | Question (Focus) | Answer/Command |
| --- | --- | --- |
| 1 | What command is used to display the **current working directory**? | **`pwd`** (print working directory) |
| 2 | What command is used to create a new, empty directory? | **`mkdir`** |
| 3 | What command is used to remove an empty directory? | **`rmdir`** |
| 4 | What command is used to create an empty file or update its timestamp? | **`touch`** |
| 5 | What command is used to forcibly delete a file or directory (recursively)? | **`rm -rf`** |
| 6 | What command views the **beginning** of a file? | **`head`** |
| 7 | What command views the **end** of a file (useful for logs)? | **`tail`** |
| 8 | What is the parent directory symbol in shell commands? | **`..`** (double dot) |
| 9 | What is the current directory symbol in shell commands? | **`.`** (single dot) |
| 10 | What is the shortcut for the current user's **home directory**? | **`~`** (tilde) |

Export to Sheets

* * *

### 2\. Shell Variables and Customization (10 Questions)

# 

| No. | Question (Focus) | Answer/Concept |
| --- | --- | --- |
| 11 | What command is used to define a shell variable and make it available to child processes? | **`export`** |
| 12 | What is the common name for configuration files like `.bashrc` and `.profile`? | **Dotfiles** |
| 13 | What is the variable that contains the current user's login name? | **`$USER`** |
| 14 | What is the variable that contains the path to the user's home directory? | **`$HOME`** |
| 15 | What command is used to define a shortcut for a longer command (e.g., `ll='ls -lha'`)? | **`alias`** |
| 16 | What symbol is used at the beginning of a line to make it a **comment** in a Bash script? | **`#`** (pound sign) |
| 17 | What command is used to print text to the standard output in Bash? | **`echo`** or **`printf`** |
| 18 | What command reloads a shell configuration file within the current shell session? | **`source`** (or **`.`**) |
| 19 | What symbol is used to access the value stored in a shell variable? | **`$`** (dollar sign) |
| 20 | What Bash structure is best suited for executing a block of code a specific number of times over a list? | **`for` loop** |

Export to Sheets

* * *

### 3\. Basic Networking Terminology (10 Questions)

# 

| No. | Question (Focus) | Answer/Concept |
| --- | --- | --- |
| 21 | What address is the physical, hardware-assigned address of a network interface? | **MAC Address** |
| 22 | What addressing scheme (v4 or v6) uses four sets of numbers separated by dots (e.g., 192.168.1.1)? | **IPv4** |
| 23 | What term describes a logical division of an IP network? | **Subnet** |
| 24 | What is the common device that routes traffic between different subnets? | **Router** or **Gateway** |
| 25 | What is the term for the numerical label assigned to a specific application or service on a host (e.g., 22, 80)? | **Port** |
| 26 | What command is used to check the operational status of network interfaces? | **`ip`** (or `ifconfig`) |
| 27 | What command downloads data from a URL non-interactively in the terminal? | **`wget`** (or `curl`) |
| 28 | What service automatically assigns IP addresses to devices on a network? | **DHCP** (Dynamic Host Configuration Protocol) |
| 29 | What does the acronym **URL** stand for? | **Uniform Resource Locator** |
| 30 | What device connects different physical devices on the same local network (Layer 2)? | **Switch** |

Export to Sheets

* * *

### 4\. Hardware and Filesystem Basics (10 Questions)

# 

| No. | Question (Focus) | Answer/Concept |
| --- | --- | --- |
| 31 | What component is considered the "brain" of the computer? | **CPU** (Central Processing Unit) |
| 32 | What hardware component connects all other components (CPU, RAM, Disks)? | **Motherboard** |
| 33 | What does **RAM** temporarily store while the computer is running? | **Data and Instructions** (Active Programs) |
| 34 | Which storage technology uses spinning platters to store data? | **HDD** (Hard Disk Drive) |
| 35 | What is the process of preparing a disk partition to accept data (creating the structure)? | **Formatting** (or `mkfs`) |
| 36 | What command shows the disk space usage for a specific directory? | **`du`** (disk usage) |
| 37 | What command is used to attach a filesystem (like a disk or partition) to a directory structure? | **`mount`** |
| 38 | What is the primary difference between a file and a directory in a filesystem? | A **directory** is a container that holds file and directory names (and their inode numbers). |
| 39 | What character device is used to discard unwanted output? | **`/dev/null`** |
| 40 | What is the name of the file that contains the entire filesystem hierarchy in Linux/Mac? | **Root (`/`)** |

Export to Sheets

* * *

### 5\. Git Basics and Compilation (10 Questions)

# 

| No. | Question (Focus) | Answer/Concept |
| --- | --- | --- |
| 41 | What is the primary purpose of **Git**? | **Version Control** (tracking changes to code) |
| 42 | What command downloads a copy of a remote Git repository to your local machine? | **`git clone`** |
| 43 | What command shows the difference between your working directory and the last commit? | **`git status`** |
| 44 | What command retrieves and merges changes from the remote repository? | **`git pull`** |
| 45 | What command combines changes from two different branches? | **`git merge`** |
| 46 | What is the name of the stage in C/C++ compilation where `#include` statements are handled? | **Pre-processor** |
| 47 | What is the file type produced by the **Compiler** before linking? | **Object File (`.o`)** |
| 48 | What is the name of the executable file format used by Linux? | **ELF** (Executable and Linkable Format) |
| 49 | What tool is used to automate the compilation process by checking dependencies? | **`make`** |
| 50 | What is the standard filename for the configuration file used by `make`? | **`Makefile`** |

Export to Sheets

## 🔬 Lab-Specific Command Drill

### 1\. 📂 Lab 1: Shell Introduction and Basic Commands

## 

| Command | Function | Exam Example Question | Exam Example Answer |
| --- | --- | --- | --- |
| **`ls`** | Lists directory contents (`-lha` for long, human-readable format). | List all files in the current directory, showing hidden files, permissions, and sizes. | `ls -lha` |
| **`cd`** | Changes the current directory. | Change the directory to the user's home directory. | `cd ~` or `cd` |
| **`pwd`** | Prints the current working directory. | Verify the current working directory. | `pwd` |
| **`mkdir`** | Creates a new directory. | Create a directory named `reports` inside the `/tmp` folder. | `mkdir /tmp/reports` |
| **`touch`** | Creates an empty file or updates a timestamp. | Create a file named `config.txt` inside the current directory. | `touch config.txt` |
| **`mv`** | Moves or renames files. | Rename `old_script.sh` to `final_script.sh`. | `mv old_script.sh final_script.sh` |
| **`cp`** | Copies files and directories. | Copy `backup.db` to the `/var/tmp/` directory. | `cp backup.db /var/tmp/` |
| **`rm`** | Removes files and directories. | Forcibly remove the entire directory structure `project/data`. | `rm -rf project/data` |

Export to Sheets

* * *

### 2\. 🔐 Lab 2: Permissions and Ownership

## 

| Command | Function | Exam Example Question | Exam Example Answer |
| --- | --- | --- | --- |
| **`ls -l`** | Shows detailed file permissions, owner, group, and size. | Use `ls -l` to identify the owner and group of the file `/etc/passwd`. | `ls -l /etc/passwd` |
| **`chmod`** | Changes file permissions (octal or symbolic). | Set permissions for `script.sh` to **Owner: rwx, Group: rx, Others: none**. | `chmod 750 script.sh` |
| **`chown`** | Changes file owner and group. | Change the owner of `data.log` to `admin` and the group to `devs`. | `sudo chown admin:devs data.log` |
| **`sudo`** | Executes a command with elevated privileges. | Use `sudo` to restart the `apache` web server service. | `sudo systemctl restart apache` |
| **`ln`** | Creates links (`-s` for symbolic link). | Create a symbolic link named `home_link` pointing to `/home/shared/`. | `ln -s /home/shared/ home_link` |

Export to Sheets

* * *

### 3\. 🌊 Lab 3: I/O Redirection and Pipelining

## 

| Command | Function | Exam Example Question | Exam Example Answer |
| --- | --- | --- | --- |
| **`>` / `>>`** | Redirects **Stdout** (overwrite / append). | Run `ls -l` and save the output to `files.txt`, overwriting previous content. | `ls -l > files.txt` |
| **`2>` / `2>&1`** | Redirects **Stderr**. | Run `find /root` and send all error messages to `/dev/null`. | `find /root 2> /dev/null` |
| \*\*\` | \`\*\* | Pipes Stdout to Stdin of the next command. | Find all processes owned by your user and count the total number of lines. |
| **`grep`** | Filters input using patterns/RegEx. | Search the file `log.txt` for lines containing "FATAL" or "ERROR". | \`grep -E '(FATAL |
| **`wc`** | Prints newline, word, and byte counts. | Count the number of words in `document.txt`. | `wc -w document.txt` |
| **`tee`** | Reads from Stdin and writes to both Stdout and a file. | Run `cal` and display the output while also saving it to `calendar.txt`. | \`cal |
| **`sort` / `uniq`** | Sorts lines and removes adjacent duplicates. | Display all unique usernames from the file `names.txt`. | \`sort names.txt |

Export to Sheets

* * *

### 4\. ⚙️ Lab 4: Processes and System Control

## 

| Command | Function | Exam Example Question | Exam Example Answer |
| --- | --- | --- | --- |
| **`ps`** | Reports a snapshot of processes. | List all processes owned by the user `web_dev`. | `ps -u web_dev` |
| **`top`** | Real-time process monitoring. | Identify the process consuming the most CPU time. | `top` (and look at the `%CPU` column) |
| **`kill`** | Sends a signal to a process. | Send the graceful termination signal to the process with PID 1234. | `kill 1234` |
| **`&`** | Runs a job in the background. | Start the `sleep 600` command in the background. | `sleep 600 &` |
| **`jobs`** | Lists background jobs in the shell. | Check the status of all jobs running in the current terminal. | `jobs` |
| **`fg` / `bg`** | Moves jobs between foreground and background. | Bring the first background job back into the foreground. | `fg %1` |
| **`systemctl`** | Controls the systemd service manager. | Check the current status of the SSH daemon. | `systemctl status sshd` |
| **`journalctl`** | Views the systemd logs. | View the logs for the `docker` service. | `journalctl -u docker` |
| **`tmux`** | Terminal multiplexer. | Create a new `tmux` session named `work` and detach from it. | `tmux new -s work` then **Ctrl+b, d** |

Export to Sheets

* * *

### 5\. 💻 Lab 5: Bash Scripting and Conditionals

## 

| Command | Function | Exam Example Question | Exam Example Answer |
| --- | --- | --- | --- |
| **`#!/bin/bash`** | The shebang line, specifying the interpreter. | Add the shebang line to the script file `check.sh`. | `#!/bin/bash` (as the first line) |
| **`echo`** | Prints output. | Print the value of the environment variable `$HOME`. | `echo $HOME` |
| **`read`** | Takes user input and stores it in a variable. | Prompt the user to enter their age and store it in variable `AGE`. | `read -p "Your Age: " AGE` |
| **`test`** / **`[ ]`** | Evaluates conditional expressions. | Write a condition to check if the file `/etc/hosts` exists. | `[ -f /etc/hosts ]` |
| **`if` / `elif` / `else`** | Conditional flow control. | Complete the structure for a two-way decision (`if`/`else`). | `if condition; then ... else ... fi` |
| **`for` loop** | Iterates over a list of items. | Write a loop that prints the numbers 1, 2, and 3. | `for i in 1 2 3; do echo $i; done` |
| **`getopts`** | Parses command-line options within a script. | Use `getopts` to accept the option `-p` with an argument (value). | `while getopts "p:" opt; do ...` |

Export to Sheets

* * *

### 6\. 🌐 Lab 6: Networking and SSH

## 

| Command | Function | Exam Example Question | Exam Example Answer |
| --- | --- | --- | --- |
| **`ssh`** | Secure shell for remote login. | Log into the remote host `server.local` as the user `dev_user`. | `ssh dev_user@server.local` |
| **`ssh-keygen`** | Generates SSH public/private key pairs. | Generate a new RSA key pair without a passphrase. | `ssh-keygen -t rsa -N ""` |
| **`ssh-copy-id`** | Copies the public key to a remote host's `authorized_keys`. | Install the public key on `remote_host` for user `deploy`. | `ssh-copy-id deploy@remote_host` |
| **`ip addr show`** | Displays network interface addresses and status. | Find the IPv4 address for the primary network interface. | `ip addr show` |
| **`ping`** | Tests ICMP connectivity. | Check if the host `192.168.1.1` is reachable. | `ping 192.168.1.1 -c 3` |
| **`netstat`** (or **`ss`**) | Displays network connections and listening ports. | List all TCP ports the server is currently listening on. | `netstat -tuln` |
| **`curl` / `wget`** | Transfers data from URLs. | Check if the web server on the local machine is responding on port 8080. | `curl localhost:8080` |
| **`scp`** | Securely copies files between hosts. | Copy the local file `report.pdf` to the remote user's home directory. | `scp report.pdf user@host:~/` |

Export to Sheets

* * *

### 7\. 💾 Lab 7: Disks, Filesystems, and Mounting

## 

| Command | Function | Exam Example Question | Exam Example Answer |
| --- | --- | --- | --- |
| **`fdisk` / `gdisk`** | Manages disk partitioning. | View the partition table of the disk `/dev/sdb`. | `sudo fdisk /dev/sdb` (or `sudo gdisk /dev/sdb`) |
| **`mkfs`** | Creates a filesystem on a partition. | Format the partition `/dev/sdb1` with the Ext4 filesystem. | `sudo mkfs.ext4 /dev/sdb1` |
| **`mount`** | Attaches a filesystem to a mount point. | Mount the partition `/dev/sdb1` to the empty directory `/mnt/data`. | `sudo mount /dev/sdb1 /mnt/data` |
| **`umount`** | Detaches a mounted filesystem. | Unmount the filesystem currently mounted at `/mnt/usb`. | `sudo umount /mnt/usb` |
| **`df`** | Reports disk space usage by filesystem. | Check the available free space on all mounted filesystems. | `df -h` |
| **`du`** | Reports disk space usage by directory. | Calculate the total disk usage of the `/var/log` directory. | `du -sh /var/log` |
| **`/etc/fstab`** | Configuration file for persistent mounting. | Explain the purpose of the `/etc/fstab` file. | Configures **automatic mounting** of filesystems at boot time. |

Export to Sheets

* * *

### 8\. 💻 Lab 8: Compilation and Git

## 

| Command | Function | Exam Example Question | Exam Example Answer |
| --- | --- | --- | --- |
| **`gcc` / `g++`** | C/C++ compiler. | Compile `main.c` and create an executable named `program`. | `gcc main.c -o program` |
| **`make`** | Executes targets in the Makefile. | Run the default build target defined in the current Makefile. | `make` |
| **`ldd`** | Prints shared library dependencies. | Check which shared libraries the `/bin/bash` executable depends on. | `ldd /bin/bash` |
| **`git clone`** | Downloads a repository. | Download the repository URL `https://github.com/repo/project.git`. | `git clone https://github.com/repo/project.git` |
| **`git add`** | Moves changes to the staging area. | Add all modified files in the current directory to the staging area. | `git add .` |
| **`git commit`** | Records changes to the local repository. | Commit the staged changes with the message "Finished Lab 8". | `git commit -m "Finished Lab 8"` |
| **`git push`** | Uploads local commits to the remote repository. | Send the current branch's commits to the remote. | `git push` |
| **`git status`** | Shows the state of the repository. | Check which files are untracked or staged for the next commit. | `git status` |
| **`git merge`** | Integrates changes from one branch into another. | Merge the `feature` branch into the current branch. | `git merge feature` |


## 1\. ✍️ Write the Script

# 

You can use any text editor (like `vim`, `nano`, or `gedit`) to create the file.

1.  **Open the editor and create the file:**
    
    Bash
    
        nano myscript.sh
    
    (Replace `myscript.sh` with your desired filename.)
    
2.  **Add the Shebang line:** The first line of any professional Bash script must be the **Shebang** (`#!`) followed by the path to the interpreter. This tells the operating system which program should execute the file.
    
    Bash
    
        #!/bin/bash
    
3.  **Add your commands:** Below the Shebang, add any commands you want the script to execute.
    

### Example `myscript.sh`

# 

1.  Bash
    
        #!/bin/bash
        # This is a comment. The script starts below.
        
        echo "Hello, I am running a Bash script."
        echo "Current directory is:"
        pwd
        ls -l
    
2.  **Save and close:** In `nano`, press **Ctrl+O** (Write Out/Save) and then **Ctrl+X** (Exit).
    

* * *

## 2\. 🔐 Make the File Executable

# 

Bash

    chmod +x myscript.sh

## 3\. ▶️ Run the Script

# 

You have two primary ways to run the newly created script:

### A. Run as an Executable (Recommended)

# 

Bash

    ./myscript.sh

### B. Run with the Interpreter (Alternative)

# 

You can also explicitly pass the file to the `bash` interpreter. This works even if the file is missing the `+x` permission or the Shebang line.

Bash

    bash myscript.sh

* * *

**Summary:**

| Step | Action | Command/Syntax |
| --- | --- | --- |
| **Create/Edit** | Write code with Shebang | `nano myscript.sh` `#!/bin/bash` |
| **Permission** | Add execute permission | `chmod +x myscript.sh` |
| **Execute** | Run the script | `./myscript.sh` |

## 

.

* * *

## 🖥️ tmux Session Management: Create, Name, and Detach

## 

| Step | Action | Command/Keystroke | Purpose |
| --- | --- | --- | --- |
| **1\. Create & Name** | Start a new `tmux` session and give it a unique name (`work`). | `tmux new -s work` | Initializes the isolated session, allowing processes to run independently of the terminal connection. |
| **2\. Begin Work** | Execute your long-running command (e.g., a script or compilation). | `./long_script.sh` | The command starts running inside the persistent session. |
| **3\. Detach** | Exit the `tmux` interface _without_ stopping the running process. | **`Ctrl + b`**, then **`d`** | This returns you to your main shell, leaving the `work` session active in the background. |
| **4\. Reattach** | Later, resume the session from the exact point you left off. | `tmux attach -t work` | This is the command you run after you SSH back into the server. |
| **(Optional) Check** | List all currently running `tmux` sessions. | `tmux ls` | Verifies the session is running (or helps find the session name if you forgot it). |
