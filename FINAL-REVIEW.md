CEG 2350 Final Review – Command & Concept Cheat Sheet
Table of Contents

Shell & Environment

SSH & Keys

Files, Directories & OS Layout

Permissions & Ownership

Scripting Basics & I/O Redirection

Text Tools: grep, sed, awk, wc

Processes, ps, and Jobs

Memory Usage

Networking Basics (IP, Routes, Ping, DNS)

Hardware & Virtual Machines

Boot Process

Filesystems, Disks, and tar/gzip

Programming & Compilation

Git & Version Control

1. Shell & Environment
Check current shell & process
echo "$SHELL"
# Example: /bin/bash

ps -p $$ -o pid,ppid,cmd
# Shows your shell process (PID, parent PID, command)

Who you are & home directory
whoami
# ubuntu

echo "$HOME"
# /home/ubuntu

List valid login shells
cat /etc/shells
# /bin/sh
# /bin/bash
# /usr/bin/bash
# ...

Environment variables
env
# Prints all env vars

echo "$PATH"
# e.g. /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

echo "$USER" "$HOME" "$SHELL"

PATH & command lookup
which ls
# /bin/ls

whereis bash
# bash: /bin/bash /usr/share/man/man1/bash.1.gz

Aliases & shell config
alias ll='ls -la'
# Temporary alias for this shell

# Persistent: add to ~/.bashrc
echo "alias ll='ls -la'" >> ~/.bashrc

2. SSH & Keys
SSH key files (per-user)
ls -l ~/.ssh
# id_ed25519      -> private key (600)
# id_ed25519.pub  -> public key
# authorized_keys -> allowed client public keys (for this user)
# known_hosts     -> servers you've connected to

Permissions (very important)
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_ed25519
chmod 600 ~/.ssh/authorized_keys

SSH usage
ssh ubuntu@host.example.com
ssh -i ~/.ssh/id_ed25519 ubuntu@host

3. Files, Directories & OS Layout
Listing files
ls
ls -la      # include hidden files, show details
ls -R dir   # recursive listing

Reading files
cat file.txt
head -n 10 file.txt
tail -n 10 file.txt

Current directory & navigation
pwd          # print working directory
cd /path     # change directory
cd           # go to $HOME
cd ..        # go up one level

Create/remove files & dirs
touch file.txt         # create empty file or update timestamp
mkdir newdir
mkdir -p a/b/c         # nested directories
rmdir emptydir         # remove empty directory
rm file.txt
rm -r dir              # remove directory & its contents

Absolute vs relative paths

Absolute: /home/ubuntu/ceg2350-final

Relative (from /home/ubuntu): ceg2350-final

Top-level filesystem (from /)
cd /
ls
# bin   -> essential commands
# sbin  -> system admin commands
# etc   -> config files
# home  -> user home directories
# var   -> logs, variable data
# tmp   -> temp files
# dev   -> device files
# proc  -> virtual proc info
# sys   -> kernel/hardware info
# boot  -> boot loader, kernel
# usr   -> user-space programs & libs
# ... etc.

4. Permissions & Ownership
Reading ls -l
ls -l app.log
# -rw-r--r-- 1 ubuntu ubuntu 51 Dec  8 20:21 app.log
# ^ ^^^^^^^  ^  ^^^^^ ^^^^^ size date name
# | |        |  user  group
# | perms    link count
# '-' = file, 'd' = directory


Permissions split: user / group / other

r = 4 (read)

w = 2 (write)

x = 1 (execute)

Examples:

rw------- → 600 (owner rw, nobody else)

rw-r----- → 640

rw-r--r-- → 644

rwxr-xr-x → 755 (common for scripts & binaries)

rwxrwxr-x → 775 (shared project dirs)

Change permissions / owner
chmod 600 app.log
chmod 644 app.log
chmod 755 script.sh

chown user:group file
# (typically requires sudo)

Directories permissions recap

r → list names in directory

w → create/delete/rename entries in dir

x → enter (cd) and access contents

5. Scripting Basics & I/O Redirection
Simple script
cat > hello.sh << 'EOF'
#!/usr/bin/env bash
echo "Hello, $USER from $0"
EOF

chmod 755 hello.sh
./hello.sh       # run script in current dir

Positional parameters

Inside a script:

$0 → script name

$1, $2, … → arguments

$# → number of args

Example:

cat > print-args.sh << 'EOF'
#!/usr/bin/env bash
echo "Script name: $0"
echo "Number of args: $#"
echo "First arg: $1"
EOF
chmod 755 print-args.sh
./print-args.sh hello

I/O streams and redirection

stdin = 0 (input)

stdout = 1 (normal output)

stderr = 2 (error output)

Commands:

# Overwrite file
echo "first line" > out.txt

# Append to file
echo "second line" >> out.txt

# Redirect stderr only
ls nope 2> errors.txt

# Redirect stdout and stderr together
command > all.txt 2>&1

Pipes
ps aux | head            # output of ps becomes input to head
grep "ERROR" log.txt | wc -l
df -h / | awk '{print $1, $2, $3, $5}'

Example script: log filter
cat > log-filter.sh << 'EOF'
#!/usr/bin/env bash
if [ "$#" -lt 1 ]; then
  echo "Usage: $0 LOGFILE" >&2
  exit 1
fi

logfile="$1"

if [ ! -f "$logfile" ]; then
  echo "Error: file '$logfile' does not exist." >&2
  exit 2
fi

echo "Showing ERROR and WARN lines from: $logfile"
echo
grep -E "ERROR|WARN" "$logfile"
echo
echo "Count of ERROR/WARN lines:"
grep -E "ERROR|WARN" "$logfile" | wc -l
EOF

chmod 755 log-filter.sh
./log-filter.sh text-practice.txt

6. Text Tools: grep, sed, awk, wc
grep – filter lines
grep "ERROR" text-practice.txt
# lines containing "ERROR"

grep -i "info" text-practice.txt
# case-insensitive "info"

grep -n "WARN" text-practice.txt
# include line numbers

grep -v "debug" text-practice.txt
# lines that DO NOT contain "debug"

grep -E "ERROR|WARN" text-practice.txt
# lines with ERROR OR WARN (extended regex)

grep -E "^INFO" text-practice.txt
# lines that start with INFO

grep -E "success$" text-practice.txt
# lines that end with "success"

sed – stream editor
# Simple substitution (first match per line)
sed 's/User:/USERNAME:/' system-info.txt

# Delete lines containing "debug"
sed '/debug/d' text-practice.txt

# Print only lines 2 through 4
sed -n '2,4p' text-practice.txt

awk – field-based processing
# Print columns 1 and 4
awk '{print $1, $4}' text-practice.txt

# Print 1st, 4th, and 6th fields (6th may be empty)
awk '{print $1, $4, $6}' text-practice.txt

# Filter rows where first field == "ERROR"
awk '$1 == "ERROR" {print $0}' text-practice.txt

# Filter rows where 5th field contains "success"
awk '$5 ~ /success/ {print $0}' text-practice.txt

wc – counts
wc -l system-info.txt
# lines + filename

wc -l < system-info.txt
# just the number of lines

7. Processes, ps, and Jobs
ps – process list
ps aux | head -n 5
# a: all users
# u: user-oriented format
# x: include processes without a terminal


Key columns:

USER – owner

PID – process ID

%CPU – CPU usage percent

%MEM – memory usage percent

VSZ – virtual memory (KB)

RSS – resident memory (KB)

TTY – terminal (or ? for daemons)

STAT – process state

R running

S sleeping

T stopped

Z zombie

extra letters: s (session leader), l (multi-threaded), + (foreground)

TIME – CPU time used

COMMAND – command name/path

Targeted ps
# current shell PID
echo $$

ps -p $$ -o pid,ppid,user,stat,cmd
# show info about this specific process

Find processes with grep
ps aux | grep bash
ps aux | grep '[b]ash'   # avoids matching grep itself

Sort by CPU / memory
# Top CPU users
ps aux | sort -rk 3,3 | head -n 10

# Top memory users
ps aux | sort -rk 4,4 | head -n 10

Jobs, background & foreground
sleep 120 &
# [2] 2036  (job 2, PID 2036)

jobs
# list jobs in this shell

fg %1
# bring job 1 to foreground

bg %2
# continue job 2 in background

kill %2
# send SIGTERM to job 2

kill 2036
# send SIGTERM to process PID 2036

8. Memory Usage
System-wide memory: free
free -h
# total, used, free, buff/cache, available
#
# "Mem: total"      -> total physical RAM
# "Mem: available"  -> realistically free for apps

Per-process memory (from ps aux)

Look at:

%MEM – percent of total RAM for process

RSS – resident memory in KB (actual RAM)

Example:

root   612  0.0  3.9 1775632 38584 ?  Ssl ... /usr/lib/snapd/snapd
# %MEM = 3.9%
# RSS  = 38584 KB (~38 MB)

9. Networking Basics (IP, Routes, Ping, DNS)
Hostname
hostname
# e.g. ceg2350-sandbox

IP addresses & interfaces
ip a
# 1: lo   -> loopback (127.0.0.1/8, ::1)
# 2: enX0 -> main NIC (10.0.0.25/24, etc.)


Key fields:

inet 127.0.0.1/8 → IPv4 loopback

inet 10.0.0.25/24 → IPv4 address with /24 subnet

/24 = 255.255.255.0

fe80::.../64 → IPv6 link-local

link/ether XX:XX:XX:... → MAC address

Routing table
ip route
# default via 10.0.0.1 dev enX0  -> default gateway
# 10.0.0.0/24 dev enX0           -> local subnet


default via 10.0.0.1 → send non-local traffic to gateway 10.0.0.1

10.0.0.0/24 dev enX0 → local network reachable directly

ping – test connectivity
ping -c 4 127.0.0.1
ping -c 4 10.0.0.1
ping -c 4 8.8.8.8
ping -c 4 google.com


-c 4 → send 4 packets then stop

Look at:

time= → round-trip time (ms)

packet loss

min/avg/max in summary

Common error:

ping
# ping: usage error: Destination address required

DNS lookup
nslookup google.com
# or dig google.com (if installed)

HTTP/HTTPS with curl
curl -I https://example.com
# -I -> HEAD request, only headers
# Shows status (200 OK), server, etc.

10. Hardware & Virtual Machines
Hardware basics

CPU – executes instructions, cores/threads.

RAM – working memory (volatile).

Disk – long-term storage (HDD/SSD/NVMe).

GPU – graphics / compute accelerator (integrated vs dedicated).

Motherboard – connects CPU, RAM, devices.

Virtual Machines & Hypervisors

Host – physical machine.

Guest – VM instance.

Hypervisor – software/firmware that runs VMs:

Type 1: bare metal (ESXi, Hyper-V Server).

Type 2: hosted (VirtualBox, VMware Workstation).

Considerations when creating VMs:

Host resources (CPU, RAM, disk).

How many guests, and how much each gets.

11. Boot Process

Typical order:

BIOS/UEFI – firmware startup.

POST – power-on self-test (RAM, CPU checks).

Bootloader – e.g. GRUB; loads OS kernel.

Kernel – initializes hardware, drivers, memory, scheduler.

Init/systemd – starts services and login prompts.

12. Filesystems, Disks, and tar/gzip
Device types

Block devices (disks): /dev/sda, /dev/xvda, etc.

Character devices (streams): /dev/null, /dev/zero, /dev/tty.

Partition tables

MBR:

Older, 2 TB limit, 4 primary partitions.

GPT:

Modern, supports large disks & many partitions, used with UEFI.

Filesystems

Linux: ext4

Windows: NTFS

macOS: APFS (or HFS+)

Inodes & links

Inode: metadata (owner, perms, timestamps, block pointers).

Hard link: another name for the same inode.

ln original.txt copy.txt


Symbolic link: pointer to a path.

ln -s /path/to/original symlink

Disk usage & free space
df -h
# per filesystem usage

df -h /
# root filesystem usage

du -sh .
# total size of current directory

du -sh *     # sizes of items in current dir

Mounting / unmounting
mount          # list current mounts

sudo mount /dev/sdb1 /mnt/usb
sudo umount /mnt/usb


/etc/fstab – controls automatic mounts at boot.

tar & gzip
# Create compressed archive
tar -czf backup.tar.gz mydir/

# Extract
tar -xzf backup.tar.gz


Flags:

c = create

x = extract

z = gzip

f = filename

13. Programming & Compilation
Interpreted vs compiled

Interpreted:

bash, Python.

Source code run by interpreter.

Compiled:

C, C++.

Source → binary → run directly.

C compilation pipeline

Preprocess (#include, #define)

Compile (C → assembly)

Assemble (assembly → object code .o)

Link (object files + libraries → executable)

Example:

gcc -Wall -O2 -o myprog main.c
# -Wall  -> all warnings
# -O2    -> optimization
# -o     -> output binary name

Makefiles (concept)
program: main.o util.o
    gcc -o program main.o util.o

main.o: main.c
    gcc -c main.c

util.o: util.c
    gcc -c util.c


target: dependencies

(tab) command

Running make program:

Rebuilds only what is out-of-date.

Binaries & libraries

Linux binaries: ELF format.

Shared libraries: .so files.

ldd program → show linked shared libs.

14. Git & Version Control
Basic concepts

Repository – project tracked by Git (.git/ dir exists).

Commit – snapshot of changes with message.

Branch – parallel line of development.

Remote – server copy (e.g., GitHub).

Clone
git clone git@github.com:WSU-kduncan/ceg2350f25-Venomraw.git
# (SSH URL, uses your SSH key)

Status, add, commit, push
git status
# show changes & branch

git add file1 file2
git add .             # stage all changes

git commit -m "Meaningful message"
# save snapshot locally

git push origin main
# send commits to remote branch 'main'


If push fails with “fetch first”:

git pull origin main   # integrate remote changes
git push origin main

Branching
git branch             # list branches
git branch lab12       # create branch 'lab12'
git checkout lab12     # switch to lab12
# or: git switch lab12 (newer syntax)

git checkout main
git merge lab12        # merge lab12 into main

.gitignore

.gitignore example:

*.log
*.o
venv/
__pycache__/


Files matching these patterns are ignored by Git.
