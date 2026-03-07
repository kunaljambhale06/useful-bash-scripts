#  useful-bash-scripts

> A collection of simple, practical, and beginner-friendly Bash scripts written while learning and exploring shell scripting — useful for anyone building a foundation in Linux and DevOps.

---

## 📖 About This Repository

This repo is a hands-on learning playground for Bash scripting. Each script focuses on a specific concept or real-world utility, making it easy to pick up and understand individual ideas without getting overwhelmed.

**This repository is ideal for:**
- Practising core Bash concepts
- Saving scripts learned or experimented with
- Building a strong foundation for Linux & DevOps
- Helping other beginners understand shell scripting

**What makes this repo useful:**
-  Beginner-friendly and easy to follow
-  Each script is focused on a single concept
-  Real, useful mini-utilities — not just toy examples
-  Great for learning Bash fundamentals step by step

---

## 📂 Scripts Included

### 1) `password.sh` — Password Generator
Generates a random, secure password using `/dev/urandom` and `tr` to filter characters. Great for understanding how Linux entropy sources work.

**Concepts covered:** `/dev/urandom`, `tr`, command substitution

---

### 2) `host.sh` — Host Reachability Checker
Checks whether a hostname or IP address is reachable using `ping`. Useful for quick network diagnostics.

**Concepts covered:** `ping`, conditionals, exit status handling

---

### 3) `control.sh` — Cleanup on Ctrl+C (Trap Example)
Demonstrates how to gracefully handle interrupts using `trap` and `SIGINT`. Shows how to run cleanup logic when a script is terminated unexpectedly.

**Concepts covered:** `trap`, signals (`SIGINT`), cleanup handlers

---

### 4) `input.sh` — Taking Input from User
Shows how to read and handle user input interactively in a Bash script using the `read` command.

**Concepts covered:** `read`, user prompts, input validation basics

---

### 5) `exit.sh` — Exit Script with Exit Codes
Demonstrates how to exit a script with specific exit codes and why exit codes matter in shell scripting and automation pipelines.

**Concepts covered:** `exit`, exit codes, error signaling

---

### 6) `file_check.sh` — File Existence Checker
Checks whether a specified file exists on the filesystem and reports the result. A classic Bash utility example.

**Concepts covered:** `-f` flag, `if` conditionals, file tests

---

### 7) `root.sh` — Root User Checker
Checks whether the script is being run as the root user, which is commonly required for administrative tasks.

**Concepts covered:** `$EUID`, user privilege checks, conditionals

---

### 8) `factorial.sh` — Factorial Calculator
Calculates the factorial of a given number using recursion or a loop. A great example of using functions and arithmetic in Bash.

**Concepts covered:** functions, loops, arithmetic (`$(( ))`), recursion

---

### 9) `line_count.sh` — Line Count in a File
Counts the number of lines in a given file using `wc`. Demonstrates how to combine standard Linux utilities with Bash scripting.

**Concepts covered:** `wc -l`, command substitution, arguments (`$1`)

---

## 🚀 Getting Started

**Clone the repository:**
```bash
git clone https://github.com/kunaljambhale06/useful-bash-scripts.git
cd useful-bash-scripts
```

**Make a script executable and run it:**
```bash
chmod +x password.sh
./password.sh
```

> 💡 Most scripts can be run directly after making them executable. Some (like `root.sh`) may require `sudo`.

---

## 🛠️ Prerequisites

- A Linux/macOS system (or WSL on Windows)
- Bash shell (`bash --version` to check)
- Basic familiarity with the terminal

---

## 🤝 Contributing

This is primarily a personal learning repo, but contributions are welcome! If you have a beginner-friendly Bash script you'd like to add:

1. Fork the repo
2. Add your script with clear comments
3. Update this README with a description
4. Open a pull request

---


