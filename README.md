# Calculator (Qt / QML / C++)

A simple calculator application built using **Qt Quick (QML)** and **C++**, featuring a responsive user interface and real-time mathematical expression evaluation.  
The project demonstrates interaction between QML and C++ through a custom calculator service that evaluates expressions entered in the UI.

---

## Features

- **Basic Arithmetic:** Supports `+`, `-`, `*`, `/`, and decimal numbers.  
- **Smart Operator Handling:** Prevents invalid operator sequences.  
- **Clear & Reset:** Quickly clear all input with the `C` button.  
- **Real-Time Evaluation:** C++ backend computes results with precision.  
- **Cross-Platform:** Runs on Windows, Linux, and macOS.  

---

## Requirements

- Qt 6.5 or newer (with Qt Quick and QML modules)  
- C++17 compatible compiler  
- Qt Creator IDE  

---

##  Installation

```bash
# Clone the project
git clone https://github.com/PleskachSasha/Calculator.git
cd Calculator

# Create a build folder
mkdir build && cd build

# Run CMake
cmake ..

# Compile the project
make
```
---

## Usage

### Available Buttons

| Button       | Description                     |
|--------------|---------------------------------|
| `0–9`        | Input digits                    |
| `+`, `-`, `*`, `/` | Basic arithmetic operations |
| `.`          | Decimal point                   |
| `=`          | Evaluate expression             |
| `C`          | Clear display                   |

---

## Project Structure
```
сalculator/
├── src/
│   ├── calculatorservice.cpp   # C++ backend implementation for evaluating mathematical expressions
│   ├── calculatorservice.hpp   # Header file declaring the CalculatorService class and evaluate() method
│   ├── main.cpp                # Entry point: initializes Qt, loads QML, and registers CalculatorService
│   └── qml/
│       ├── Main.qml            # Main application window (Window) containing the Calculator component
│       ├── Calculator.qml      # Core calculator logic: display, buttons, and input handling
│       ├── CalcRow.qml         # Reusable row of buttons (e.g., "7 8 9 +")
│       ├── CalcButton.qml      # Individual calculator button component with a clicked() signal
│       └── Display.qml         # Display component showing input and calculation results
├── CMakeLists.txt              # CMake configuration file for building the Qt/QML project
└── README.md                   # Documentation: project description, build instructions, and usage guide
```
---

## Example

**Enter Expression:**  
12 + 3


**Press "="**  
Output → `15`

**Press "C"**  
Display resets.

---

## Notes

- The C++ backend evaluates expressions safely and formats results (e.g., removes trailing zeros).  
- The display automatically resets after pressing `=`.  
- Ideal for learning **Qt Quick signal handling** and **QML–C++ integration**.
