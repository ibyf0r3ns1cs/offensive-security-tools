## Install the C/C++ Extension:
Open VSCode, go to the Extensions view (Ctrl + Shift + X), and search for "C/C++." Install the "C/C++" extension provided by Microsoft.  

## Install a C++ Compiler:
You'll need a C++ compiler to build the Reaper project. On Windows, you can use the Visual Studio Build Tools or the Mingw-w64 toolchain. On macOS, you can use Xcode Command Line Tools, and on Linux, you can use the GCC compiler.  

Windows: Install Visual Studio Build Tools: Visual Studio Build Tools https://aka.ms/vs/17/release/vs_BuildTools.exe
## Configure Build System:  
Add folder .vscode and create file tasks.json
```
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
     "Reaper.sln"
    ],
    "group": {
     "kind": "build",
     "isDefault": true
    }
   }
  ]
 } 
 ```
## Install Windows 10 SDK:  
  https://developer.microsoft.com/en-us/windows/downloads/windows-sdk/

## Add MSBuild to PATH:
You can add the directory containing MSBuild.exe to your system's PATH environment variable.
Locate the directory where MSBuild is installed. This is typically something like:
C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\MSBuild\Current\Bin
Check if worked: msbuild --version

## Restart and open VScode again .
Use this command to build and compile (Terminal in VScode):
msbuild /property:Configuration=Release /property:Platform=x64 Terminator.sln
