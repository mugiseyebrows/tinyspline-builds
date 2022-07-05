@echo off
rem install aqtinstall
set PATH=%LOCALAPPDATA%\Programs\Python\Python310;%LOCALAPPDATA%\Programs\Python\Python39;C:\Miniconda3;%LOCALAPPDATA%\Programs\Python\Python310\Scripts;%HOMEPATH%\Miniconda3;%LOCALAPPDATA%\Programs\Python\Python39\Scripts;C:\Miniconda3\Scripts;%HOMEPATH%\Miniconda3\Scripts;%PATH%
where aqt || pip install aqtinstall

rem flavour v0.5.0 msvc2019 i686
set PATH=C:\Program Files\Git\mingw64\bin;C:\Program Files\7-Zip;%CD%\cmake-3.24.0-rc2-windows-x86_64\bin;C:\Program Files\Git\cmd;%PATH%
if not exist "cmake-3.24.0-rc2-windows-x86_64.zip" curl -L -o cmake-3.24.0-rc2-windows-x86_64.zip "https://github.com/Kitware/CMake/releases/download/v3.24.0-rc2/cmake-3.24.0-rc2-windows-x86_64.zip"
if not exist "cmake-3.24.0-rc2-windows-x86_64" 7z x -y "cmake-3.24.0-rc2-windows-x86_64.zip"
set INCLUDE=
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars32.bat"
git clone https://github.com/msteinbeck/tinyspline.git
pushd tinyspline
git checkout v0.5.0
popd
pushd tinyspline
if not exist build mkdir build
pushd build
cmake -G "Visual Studio 16 2019" -DBUILD_SHARED_LIBS=ON -A Win32 ..
cmake --build .
cmake --install . --prefix C:/tinyspline
popd
popd
7z a "tinyspline-v0.5.0-msvc2019-i686.zip" "C:/tinyspline"
if exist C:\tinyspline rmdir /q /s C:\tinyspline
if exist tinyspline rmdir /q /s tinyspline

rem flavour v0.5.0 msvc2019 x86_64
set PATH=C:\Program Files\Git\mingw64\bin;C:\Program Files\7-Zip;%CD%\cmake-3.24.0-rc2-windows-x86_64\bin;C:\Program Files\Git\cmd;%PATH%
if not exist "cmake-3.24.0-rc2-windows-x86_64.zip" curl -L -o cmake-3.24.0-rc2-windows-x86_64.zip "https://github.com/Kitware/CMake/releases/download/v3.24.0-rc2/cmake-3.24.0-rc2-windows-x86_64.zip"
if not exist "cmake-3.24.0-rc2-windows-x86_64" 7z x -y "cmake-3.24.0-rc2-windows-x86_64.zip"
set INCLUDE=
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"
git clone https://github.com/msteinbeck/tinyspline.git
pushd tinyspline
git checkout v0.5.0
popd
pushd tinyspline
if not exist build mkdir build
pushd build
cmake -G "Visual Studio 16 2019" -DBUILD_SHARED_LIBS=ON -A x64 ..
cmake --build .
cmake --install . --prefix C:/tinyspline
popd
popd
7z a "tinyspline-v0.5.0-msvc2019-x86_64.zip" "C:/tinyspline"
if exist C:\tinyspline rmdir /q /s C:\tinyspline
if exist tinyspline rmdir /q /s tinyspline

rem flavour v0.5.0 mingw7.3.0 i686
set PATH=%CD%\Tools\mingw730_32\bin;%LOCALAPPDATA%\Programs\Python\Python310;%LOCALAPPDATA%\Programs\Python\Python39;C:\Miniconda3;%LOCALAPPDATA%\Programs\Python\Python310\Scripts;C:\Program Files\Git\cmd;%HOMEPATH%\Miniconda3;C:\Program Files\Git\mingw64\bin;%LOCALAPPDATA%\Programs\Python\Python39\Scripts;C:\Miniconda3\Scripts;%HOMEPATH%\Miniconda3\Scripts;C:\Program Files\7-Zip;%CD%\cmake-3.24.0-rc2-windows-x86_64\bin;%PATH%
if not exist Tools\mingw730_32\bin\gcc.exe aqt install-tool windows desktop tools_mingw qt.tools.win32_mingw730
if not exist "cmake-3.24.0-rc2-windows-x86_64.zip" curl -L -o cmake-3.24.0-rc2-windows-x86_64.zip "https://github.com/Kitware/CMake/releases/download/v3.24.0-rc2/cmake-3.24.0-rc2-windows-x86_64.zip"
if not exist "cmake-3.24.0-rc2-windows-x86_64" 7z x -y "cmake-3.24.0-rc2-windows-x86_64.zip"
git clone https://github.com/msteinbeck/tinyspline.git
pushd tinyspline
git checkout v0.5.0
popd
pushd tinyspline
if not exist build mkdir build
pushd build
cmake -G "MinGW Makefiles" -DBUILD_SHARED_LIBS=ON ..
cmake --build .
cmake --install . --prefix C:/tinyspline
popd
popd
7z a "tinyspline-v0.5.0-mingw7.3.0-i686.zip" "C:/tinyspline"
if exist C:\tinyspline rmdir /q /s C:\tinyspline
if exist tinyspline rmdir /q /s tinyspline

rem flavour v0.5.0 mingw7.3.0 x86_64
set PATH=%CD%\Tools\mingw730_64\bin;%LOCALAPPDATA%\Programs\Python\Python310;%LOCALAPPDATA%\Programs\Python\Python39;C:\Miniconda3;%LOCALAPPDATA%\Programs\Python\Python310\Scripts;C:\Program Files\Git\cmd;%HOMEPATH%\Miniconda3;C:\Program Files\Git\mingw64\bin;%LOCALAPPDATA%\Programs\Python\Python39\Scripts;C:\Miniconda3\Scripts;%HOMEPATH%\Miniconda3\Scripts;C:\Program Files\7-Zip;%CD%\cmake-3.24.0-rc2-windows-x86_64\bin;%PATH%
if not exist Tools\mingw730_64\bin\gcc.exe aqt install-tool windows desktop tools_mingw qt.tools.win64_mingw730
if not exist "cmake-3.24.0-rc2-windows-x86_64.zip" curl -L -o cmake-3.24.0-rc2-windows-x86_64.zip "https://github.com/Kitware/CMake/releases/download/v3.24.0-rc2/cmake-3.24.0-rc2-windows-x86_64.zip"
if not exist "cmake-3.24.0-rc2-windows-x86_64" 7z x -y "cmake-3.24.0-rc2-windows-x86_64.zip"
git clone https://github.com/msteinbeck/tinyspline.git
pushd tinyspline
git checkout v0.5.0
popd
pushd tinyspline
if not exist build mkdir build
pushd build
cmake -G "MinGW Makefiles" -DBUILD_SHARED_LIBS=ON ..
cmake --build .
cmake --install . --prefix C:/tinyspline
popd
popd
7z a "tinyspline-v0.5.0-mingw7.3.0-x86_64.zip" "C:/tinyspline"
if exist C:\tinyspline rmdir /q /s C:\tinyspline
if exist tinyspline rmdir /q /s tinyspline

rem flavour v0.5.0 mingw8.1.0 i686
set PATH=%CD%\Tools\mingw810_32\bin;%LOCALAPPDATA%\Programs\Python\Python310;%LOCALAPPDATA%\Programs\Python\Python39;C:\Miniconda3;%LOCALAPPDATA%\Programs\Python\Python310\Scripts;C:\Program Files\Git\cmd;%HOMEPATH%\Miniconda3;C:\Program Files\Git\mingw64\bin;%LOCALAPPDATA%\Programs\Python\Python39\Scripts;C:\Miniconda3\Scripts;%HOMEPATH%\Miniconda3\Scripts;C:\Program Files\7-Zip;%CD%\cmake-3.24.0-rc2-windows-x86_64\bin;%PATH%
if not exist Tools\mingw810_32\bin\gcc.exe aqt install-tool windows desktop tools_mingw qt.tools.win32_mingw810
if not exist "cmake-3.24.0-rc2-windows-x86_64.zip" curl -L -o cmake-3.24.0-rc2-windows-x86_64.zip "https://github.com/Kitware/CMake/releases/download/v3.24.0-rc2/cmake-3.24.0-rc2-windows-x86_64.zip"
if not exist "cmake-3.24.0-rc2-windows-x86_64" 7z x -y "cmake-3.24.0-rc2-windows-x86_64.zip"
git clone https://github.com/msteinbeck/tinyspline.git
pushd tinyspline
git checkout v0.5.0
popd
pushd tinyspline
if not exist build mkdir build
pushd build
cmake -G "MinGW Makefiles" -DBUILD_SHARED_LIBS=ON ..
cmake --build .
cmake --install . --prefix C:/tinyspline
popd
popd
7z a "tinyspline-v0.5.0-mingw8.1.0-i686.zip" "C:/tinyspline"
if exist C:\tinyspline rmdir /q /s C:\tinyspline
if exist tinyspline rmdir /q /s tinyspline

rem flavour v0.5.0 mingw8.1.0 x86_64
set PATH=%CD%\Tools\mingw810_64\bin;%LOCALAPPDATA%\Programs\Python\Python310;%LOCALAPPDATA%\Programs\Python\Python39;C:\Miniconda3;%LOCALAPPDATA%\Programs\Python\Python310\Scripts;C:\Program Files\Git\cmd;%HOMEPATH%\Miniconda3;C:\Program Files\Git\mingw64\bin;%LOCALAPPDATA%\Programs\Python\Python39\Scripts;C:\Miniconda3\Scripts;%HOMEPATH%\Miniconda3\Scripts;C:\Program Files\7-Zip;%CD%\cmake-3.24.0-rc2-windows-x86_64\bin;%PATH%
if not exist Tools\mingw810_64\bin\gcc.exe aqt install-tool windows desktop tools_mingw qt.tools.win64_mingw810
if not exist "cmake-3.24.0-rc2-windows-x86_64.zip" curl -L -o cmake-3.24.0-rc2-windows-x86_64.zip "https://github.com/Kitware/CMake/releases/download/v3.24.0-rc2/cmake-3.24.0-rc2-windows-x86_64.zip"
if not exist "cmake-3.24.0-rc2-windows-x86_64" 7z x -y "cmake-3.24.0-rc2-windows-x86_64.zip"
git clone https://github.com/msteinbeck/tinyspline.git
pushd tinyspline
git checkout v0.5.0
popd
pushd tinyspline
if not exist build mkdir build
pushd build
cmake -G "MinGW Makefiles" -DBUILD_SHARED_LIBS=ON ..
cmake --build .
cmake --install . --prefix C:/tinyspline
popd
popd
7z a "tinyspline-v0.5.0-mingw8.1.0-x86_64.zip" "C:/tinyspline"
if exist C:\tinyspline rmdir /q /s C:\tinyspline
if exist tinyspline rmdir /q /s tinyspline

rem flavour v0.5.0 mingw11.2.0 x86_64
set PATH=%CD%\Tools\mingw1120_64\bin;%LOCALAPPDATA%\Programs\Python\Python310;%LOCALAPPDATA%\Programs\Python\Python39;C:\Miniconda3;%LOCALAPPDATA%\Programs\Python\Python310\Scripts;C:\Program Files\Git\cmd;%HOMEPATH%\Miniconda3;C:\Program Files\Git\mingw64\bin;%LOCALAPPDATA%\Programs\Python\Python39\Scripts;C:\Miniconda3\Scripts;%HOMEPATH%\Miniconda3\Scripts;C:\Program Files\7-Zip;%CD%\cmake-3.24.0-rc2-windows-x86_64\bin;%PATH%
if not exist Tools\mingw1120_64\bin\gcc.exe aqt install-tool windows desktop tools_mingw90 qt.tools.win64_mingw900
if not exist "cmake-3.24.0-rc2-windows-x86_64.zip" curl -L -o cmake-3.24.0-rc2-windows-x86_64.zip "https://github.com/Kitware/CMake/releases/download/v3.24.0-rc2/cmake-3.24.0-rc2-windows-x86_64.zip"
if not exist "cmake-3.24.0-rc2-windows-x86_64" 7z x -y "cmake-3.24.0-rc2-windows-x86_64.zip"
git clone https://github.com/msteinbeck/tinyspline.git
pushd tinyspline
git checkout v0.5.0
popd
pushd tinyspline
if not exist build mkdir build
pushd build
cmake -G "MinGW Makefiles" -DBUILD_SHARED_LIBS=ON ..
cmake --build .
cmake --install . --prefix C:/tinyspline
popd
popd
7z a "tinyspline-v0.5.0-mingw11.2.0-x86_64.zip" "C:/tinyspline"
if exist C:\tinyspline rmdir /q /s C:\tinyspline
if exist tinyspline rmdir /q /s tinyspline

