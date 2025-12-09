# 

    .

## 💧 The Three Standard Streams

# 

    StreamFile Descriptor (FD)DescriptionDefault Destination/SourceExample of UseStandard Input0The data stream the program reads for input.Keyboardgrep pattern < file.txtStandard Output1The stream where a program writes its normal, successful results.Terminal Screenls -l (list files)Standard Error2The stream where a program writes diagnostic messages, warnings, or errors.Terminal Screenfind /root (permissions error)Export to Sheets

## 1\. Standard Output (STDOUT) Examples (FD 1)

# 

    This is the most common stream—the normal result of a command.

### Example A: Redirecting Output (`>`)

# 

    You can use > to send the successful output of ls -l to a file instead of the screen.Bashls -l > file_list.txt
    Result: The file list is saved to file_list.txt. Your terminal remains quiet.

### Example B: Appending Output (`>>`)

# 

    Use >> to add the output to the end of an existing file.Bashecho "Finished at $(date)" >> log.txt
    Result: A timestamped message is appended to the log.txt file.

## 2\. Standard Error (STDERR) Examples (FD 2)

# 

    This stream is used for messages that aren't the primary result, usually errors.

### Example A: Redirecting Errors (`2>`)

# 

    The find command often throws "Permission denied" errors when running as a non-root user in privileged directories. You can redirect these errors using the file descriptor 2.Bashfind /root -name "*.log" 2> permission_errors.txt
    Result: Any successful output (found files) prints to the screen. The error messages are saved to permission_errors.txt.

### Example B: Discarding Errors

# 

    If you only care about the successful output and want to silence all errors, you can redirect Stderr to /dev/null (the Linux "black hole" or trashcan).Bashfind /root 2> /dev/null
    Result: Only successful output (if any) is printed to the screen; all error messages are silently discarded.

## 3\. Standard Input (STDIN) Examples (FD 0)

# 

    This stream is typically data being fed into a program.

### Example A: Input Redirection (`<`)

# 

    The grep command usually takes a filename as an argument, but it can read from Stdin using the < operator.Bashgrep "keyword" < document.txt
    Result: grep reads its input directly from document.txt and prints matching lines to Stdout.

### Example B: Pipelining (`|`)

# 

    Pipelining is the most common way to feed Stdin. The output (FD 1) of the first command becomes the input (FD 0) of the second.Bashcat large_file.txt | less
    Result: The entire content of large_file.txt is piped into less, allowing you to view it page-by-page.
