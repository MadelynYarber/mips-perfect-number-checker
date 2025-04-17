# MIPS Perfect Number Checker 
A MIPS assembly program that checks whether a number is **perfect**, **prime**, or **neither**. It uses custom functions to analyze an integer’s factors, sum them, and print formatted results.

Built for execution in the QtSpim simulator as a project for coursework on MIPS function conventions, syscalls, and control flow.

---
## Features
- Prompts the user for a number > 1
- Calculates and prints all factors of the number
- Displays the sum of those factors
- Determines whether the number is:
  - Perfect (sum of factors equals the number)
  - Prime (only factor is 1)
  - Neither
- Continues prompting until user enters a number < 2
- Follows proper MIPS calling conventions

---
## Functions Used
### `is_a_factor`
- Parameters:  
  - `$a0` – number to be divided  
  - `$a1` – potential factor  
- Returns `1` in `$v0` if `$a1` is a factor of `$a0`, else `0`

### `print_sum_of_factors`
- Parameter: `$a0` – integer to analyze  
- Prints factors in `1+2+...=sum` format  
- Returns sum in `$v0`

---
## What It Demonstrates
- MIPS calling conventions
- Syscall usage for input/output
- Conditionals and loop structures
- Custom function creation and register preservation
- Number theory logic at the assembly level

---
## Run With
- **QtSpim simulator**
- Load `.asm` file and step/run program

---

## Author

[Madelyn Yarber](https://github.com/MadelynYarber)
