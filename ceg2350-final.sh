#!/usr/bin/env bash
# ceg2350-final.sh
# CEG 2350 Final Review Trainer

set -u

main_menu() {
  clear
  echo "===== CEG 2350 FINAL TRAINER ====="
  echo "1) Shells & Environment (Intro topics)"
  echo "2) Files, Directories, Permissions"
  echo "3) Scripting, grep/sed/awk & IO redirection"
  echo "4) Hardware, VMs, Boot, Disks & Filesystems"
  echo "5) Processes & systemd services"
  echo "6) Programming & Compilation"
  echo "7) Networking & Protocols"
  echo "8) Git Practice"
  echo "q) Quit"
  echo "=================================="
  read -rp "Choose an option: " choice

  case "$choice" in
    1) section_shells_env ;;
    2) section_files_perms ;;
    3) section_scripting ;;
    4) section_hw_boot_disks ;;
    5) section_processes ;;
    6) section_programming ;;
    7) section_networking ;;
    8) section_git ;;
    q|Q) exit 0 ;;
    *) echo "Invalid choice"; read -rp "Press Enter..." ;;
  esac
}

### SECTION 1: SHELLS & ENVIRONMENT ###########################################

section_shells_env() {
  clear
  echo "== Shells & SSH / Environment Variables =="
  echo
  echo "Current shell (SHELL variable): $SHELL"
  echo "Useful variables:"
  echo "  HOME: $HOME"
  echo "  USER: $USER"
  echo "  PATH: $PATH"
  echo
  echo "Process for this shell (ps -p $$ -o pid,ppid,comm):"
  ps -p $$ -o pid,ppid,comm
  echo
  echo "Try to answer:"
  echo "  - Which shell are you using (bash/sh/zsh)?"
  echo "  - What does PATH control?"
  echo "  - How would you start an SSH connection (syntax only)?"
  echo
  cat <<'EOF'
Sample SSH command structure (memorize the parts):

  ssh -i /path/to/key.pem username@hostname -p 22

  - ssh          : the client program
  - -i key.pem   : private key (must be protected, 600 perms)
  - username     : remote user
  - hostname     : DNS name or IP
  - -p 22        : port (optional, default is 22)

EOF
  read -rp "Press Enter to return to menu..."
}

### SECTION 2: FILES, DIRECTORIES, PERMISSIONS ###############################

section_files_perms() {
  clear
  echo "== Files, Directories, Permissions =="
  mkdir -p lab_files/logs lab_files/archive

  echo "Creating some files in lab_files/logs..."
  echo "Error: disk full"  > lab_files/logs/app.log
  echo "Info: system ok"  >> lab_files/logs/app.log
  echo "Warning: high CPU" >> lab_files/logs/app.log

  echo "Listing with ls -l:"
  ls -l lab_files

  echo
  echo "Now showing permissions on app.log:"
  ls -l lab_files/logs/app.log

  echo
  echo "Changing permissions with chmod 640 on app.log..."
  chmod 640 lab_files/logs/app.log
  ls -l lab_files/logs/app.log

  echo
  cat <<'EOF'
Think about:

 - How to read a permission string like: -rw-r----- ?
   - First char: type (d = directory, - = file, l = symlink)
   - Next 3: user
   - Next 3: group
   - Last 3: other

 - What chmod 755, 644, 700 mean.

Also review:
 - mkdir, cp, mv, rm, rmdir, touch, head, tail, less, more
 - adduser / deluser (with sudo)
 - chown, chgrp
EOF
  read -rp "Try a few chmod/chown/chgrp in another terminal, then press Enter..."
}

### SECTION 3: SCRIPTING, GREP/SED/AWK & IO REDIRECTION #######################

section_scripting() {
  clear
  echo "== Scripting, I/O redirection, grep/sed/awk =="
  mkdir -p scripting_lab
  local logfile="scripting_lab/system-info.txt"

  echo "Gathering some info into $logfile using redirection (>) and tee..."
  {
    echo "User: $USER"
    echo "Home: $HOME"
    echo "Shell: $SHELL"
    echo
    echo "Disk usage (df -h /):"
    df -h /
    echo
    echo "Top 5 processes by memory:"
    ps aux --sort=-%mem | head -n 6
  } | tee "$logfile" > scripting_lab/system-info-tee.txt

  echo
  echo "Now using grep to find lines with 'root' in the log:"
  grep -n "root" "$logfile" || echo "No 'root' lines found."

  echo
  echo "Using sed to replace 'User' with 'USERNAME' in output (doesn't change file):"
  sed 's/^User:/USERNAME:/' "$logfile" | head

  echo
  echo "Using awk to print the 1st and 3rd column of df -h /:"
  df -h / | awk '{print $1, $3}'

  cat <<'EOF'

You just used:
 - I/O redirection: >, |, tee
 - grep: searching by pattern
 - sed: stream editor (search and replace)
 - awk: print columns from structured text

Now create a small Bash script 'scripting_lab/log-filter.sh' that:
 - takes a filename as an argument ($1)
 - uses grep to print only lines with 'Error' or 'Warning'
 - counts them using wc -l
 - prints a message with printf

Make sure it has:
 - Shebang: #!/usr/bin/env bash
 - Executable bit: chmod +x log-filter.sh
 - Use of $#, $1, and an if to check that an argument was provided.
EOF
  read -rp "Press Enter when you've tried writing log-filter.sh..."
}

### SECTION 4: HW, BOOT, DISKS, FILESYSTEMS ##################################

section_hw_boot_disks() {
  clear
  echo "== Hardware, Boot, Disks & Filesystems =="
  mkdir -p hw_lab

  echo "-- CPU info (lscpu | head):"
  lscpu | head -n 10

  echo
  echo "-- RAM info (free -h):"
  free -h

  echo
  echo "-- Block devices (lsblk):"
  lsblk

  echo
  echo "-- Filesystem usage (df -h):"
  df -h

  echo
  echo "Creating a tar.gz backup of lab_files/ into hw_lab/lab_files-backup.tar.gz"
  tar -czf hw_lab/lab_files-backup.tar.gz lab_files 2>/dev/null || echo "No lab_files yet, run section 2 first."

  cat <<'EOF'

Concepts to recall:

 - Hardware parts: CPU, RAM, disk (HDD/SSD/NVMe), motherboard, GPU.
 - VM terms: host, guest, hypervisor.
 - Boot order: BIOS/UEFI -> POST -> bootloader -> kernel -> OS.
 - Block vs character devices (e.g., /dev/sda vs /dev/null).
 - MBR vs GPT partition tables.
 - Filesystems: ext4, NTFS, APFS (Linux/Windows/Mac defaults).
 - Tools: parted, fdisk, lsblk, df, du, mkfs.
 - Mounting and /etc/fstab basics.
 - tar & gzip: create and extract archives.

EOF
  read -rp "Try 'du -sh lab_files' and inspect hw_lab/lab_files-backup.tar.gz, then press Enter..."
}

### SECTION 5: PROCESSES & SYSTEMD ###########################################

section_processes() {
  clear
  echo "== Process Control & systemd =="
  echo
  echo "-- Top 5 processes:"
  ps aux | head -n 6

  echo
  echo "Starting a background sleep 60 job..."
  sleep 60 &
  bg_pid=$!
  echo "Background PID: $bg_pid"

  echo
  echo "Jobs in this shell (jobs):"
  jobs

  echo
  echo "Killing that background process with kill:"
  kill "$bg_pid" 2>/dev/null || echo "Process already exited."
  sleep 1
  ps -p "$bg_pid" || echo "Verified it's gone."

  echo
  echo "-- systemd service example (ssh):"
  sudo systemctl status ssh | head -n 10 || echo "ssh service may have a different name."

  cat <<'EOF'

Review:

 - Terms: process, application, service/daemon.
 - Process states: running, sleeping, stopped, zombie, orphan.
 - Metadata: PID, PPID, controlling terminal, USER, CMD.
 - Foreground vs background (&, bg, fg).
 - Tools: ps, top, jobs, kill.
 - systemd: systemctl (start/stop/restart/enable/disable), journalctl for logs.

If you have tmux installed, practice:
 - tmux new -s final
 - Ctrl-b d  (detach)
 - tmux attach -t final
EOF
  read -rp "Play with ps/kill/jobs in another shell, then press Enter..."
}

### SECTION 6: PROGRAMMING & COMPILATION ######################################

section_programming() {
  clear
  echo "== Programming, Compilation, Makefiles =="
  mkdir -p prog_lab

  cat > prog_lab/hello.c <<'EOF'
#include <stdio.h>

int main(void) {
    printf("Hello from CEG2350 C program!\n");
    return 0;
}
EOF

  echo "Compiling hello.c with gcc -Wall -o hello ..."
  (cd prog_lab && gcc -Wall -o hello hello.c 2> compile.log || echo "gcc not installed or compile failed; check compile.log")

  echo
  if [[ -x prog_lab/hello ]]; then
    echo "Running ./prog_lab/hello:"
    ./prog_lab/hello
  else
    echo "Executable not built; open prog_lab/compile.log to see why."
  fi

  cat <<'EOF'

Concepts to know:

 - Interpreted vs compiled languages:
   * Bash, Python: interpreted.
   * C/C++: compiled to native machine code.
   * Java: compiled to bytecode (JDK) run on JVM.

 - C compilation pipeline:
   * Preprocessor -> Compiler -> Assembler -> Linker
   * Tools: gcc / g++

 - Executable formats:
   * Linux: ELF
   * Windows: EXE

 - Makefiles:
   * Targets, dependencies, actions.
   * Running 'make' to build only what changed.

Also know tools: which, whereis, ldd.
EOF
  read -rp "Skim prog_lab/hello.c and recompile manually, then press Enter..."
}

### SECTION 7: NETWORKING & PROTOCOLS #########################################

section_networking() {
  clear
  echo "== Networking & Protocols =="
  mkdir -p net_lab

  echo "-- IP / interfaces:"
  ip addr show | head -n 20

  echo
  echo "-- Routes:"
  ip route

  echo
  echo "-- DNS lookup (nslookup example.com):"
  nslookup example.com | head -n 10 || echo "nslookup not installed; try 'dig' if available."

  echo
  echo "-- Pinging 1 packet to example.com:"
  ping -c 1 example.com || echo "Ping may be blocked in some environments."

  echo
  echo "-- HTTP vs HTTPS with curl -I (HEAD request):"
  echo "HTTP:"
  curl -I http://example.com 2>/dev/null | head -n 5
  echo
  echo "HTTPS:"
  curl -I https://example.com 2>/dev/null | head -n 5

  cat <<'EOF'

Review concepts:

 - Physical layer methods: WiFi, Ethernet, fiber.
 - NIC, MAC address.
 - IPv4 vs IPv6, CIDR notation, subnets, routes, gateways, NAT.
 - DNS, DHCP, ports, sockets, URLs.
 - Firewalls: inbound (ingress/INPUT) vs outbound (egress/OUTPUT).
   * In AWS: Security Groups.
 - Protocols:
   * HTTP vs HTTPS (certificates & Certificate Authorities).
   * SSH: secure remote shell.

Useful commands:
 - ip, ifconfig, route, ping, curl, wget, hostname, nslookup.
 - Also: arp, iptables, nmap, traceroute, tcpdump (conceptually).

EOF
  read -rp "Run 'hostname -I', 'curl https://wright.edu', etc. Then press Enter..."
}

### SECTION 8: GIT PRACTICE ###################################################

section_git() {
  clear
  echo "== Git & Version Control =="
  echo "This directory should already be a git repo (git init done earlier)."
  echo
  echo "-- git status:"
  git status

  echo
  echo "Creating a small README.md and committing it..."
  if [[ ! -f README.md ]]; then
    cat > README.md <<'EOF'
# CEG2350 Final Practice

This repo is used to practice Git and OS concepts for the CEG 2350 final.
EOF
  fi

  git add README.md ceg2350-final.sh
  git commit -m "Add README and main script" 2>/dev/null || echo "Commit may have failed (maybe nothing new to commit)."

  echo
  git log --oneline -n 5

  cat <<'EOF'

Concepts:

 - What version control is and why we use it.
 - Basic workflow:
   * git clone
   * git status
   * git add
   * git commit
   * git push / pull
   * git branch, git checkout, git merge
 - Files like .gitignore (which patterns go there).

Practice:

 - Make a new branch 'practice-branch':
     git branch practice-branch
     git checkout practice-branch
 - Edit ceg2350-final.sh, add a comment, commit.
 - Merge back into main:
     git checkout main
     git merge practice-branch

EOF
  read -rp "Do the branch/merge practice and then press Enter..."
}

###############################################################################

while true; do
  main_menu
done

