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
### 4. Install Windows 10 SDK (Windows Only) h
Download and install from [Windows 10 SDK](https://developer.microsoft.com/en-us/windows/downloads/windows-sdk/). 

### 5. Configure Build System
1. Add a `.vscode` folder to your project directory.
2. Create a `tasks.json` file inside the .vscode folder with the following content:

  ```json
{
"version": "2.0.0",
"tasks": [
  {
    "label": "build",
    "type": "shell",
    "command": "msbuild",
    "args": [
      "/property:Configuration=Release",
      "/property:Platform=x64",
      "Terminator.sln"
    ],
    "group": {
      "kind": "build",
      "isDefault": true
    }
  }
]
}
```

### 6. Add MSBuild to PATH (Windows Only)
Locate the directory where MSBuild is installed, typically:

```java
C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\MSBuild\Current\Bin
```

Add this directory to your system's PATH environment variable.
Verify the installation by running:
sh
Copy code
msbuild --version
### 7. Restart VSCode
Close and reopen Visual Studio Code to ensure all changes take effect.

### 8. Build and Compile Terminator
Use the following command in the VSCode terminal to build and compile the Terminator project:

sh
Copy code
msbuild /property:Configuration=Release /property:Platform=x64 Terminator.sln
Using Terminator
After successfully building the project, you can use Terminator to test your organization's EDR in a controlled lab environment.

Important: Always ensure that testing is conducted in a controlled and isolated environment to avoid any potential impact on production systems. The use of such tools should comply with your organization's policies and legal guidelines.

Running Terminator
Navigate to the output directory (typically Release or x64/Release) where the compiled executable is located. Run the Terminator executable with appropriate permissions and follow the project documentation for specific usage instructions.

Conclusion
By following these steps, you can set up a development environment in VSCode, build the Terminator project, and use it to test the resilience of your organization's EDR. This setup helps in assessing the effectiveness of your security measures and improving your incident response capabilities.

For more information and advanced usage, refer to the Terminator GitHub repository.
