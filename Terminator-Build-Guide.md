# Setting Up and Using Terminator to Test EDR in Lab Environment

## Introduction

This guide will walk you through the process of setting up a C/C++ development environment in Visual Studio Code (VSCode) to build and use the Terminator project from GitHub. The Terminator project, available at [ZeroMemoryEx/Terminator](https://github.com/ZeroMemoryEx/Terminator), is a tool designed to stop Endpoint Detection and Response (EDR) solutions, and it can be used to test the resilience of your organization's EDR in a controlled lab environment.

## Prerequisites

- Visual Studio Code (VSCode)
- C++ compiler (Visual Studio Build Tools for Windows, Xcode Command Line Tools for macOS, or GCC for Linux)
- Windows 10 SDK (for Windows users)
- Git (to clone the Terminator repository)

## Step-by-Step Setup

### 1. Install the C/C++ Extension

1. Open VSCode.
2. Go to the Extensions view (Ctrl + Shift + X).
3. Search for "C/C++".
4. Install the "C/C++" extension provided by Microsoft.

### 2. Install a C++ Compiler

You'll need a C++ compiler to build the Terminator project.

- **Windows**: Install Visual Studio Build Tools from [Visual Studio Build Tools](https://aka.ms/vs/17/release/vs_BuildTools.exe).
- **macOS**: Install Xcode Command Line Tools.
- **Linux**: Install the GCC compiler.

### 3. Clone the Terminator Repository

Open your terminal and run the following command to clone the Terminator repository:

```sh
git clone https://github.com/ZeroMemoryEx/Terminator.git
cd Terminator
```
