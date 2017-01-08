#!/bin/bash
set -e
rm -rf DOtherSide
git clone https://github.com/filcuc/DOtherSide.git --single-branch --depth 1
cd DOtherSide
rm -rf build
mkdir build
cd build

if [ "$MSYSTEM" != "" ]; then
    cmake -G"MSYS Makefiles" -D CMAKE_CXX_FLAGS:STRING="-D_GLIBCXX_USE_CXX11_ABI=0" ..
    if [ "$IS_DYLIB" != "" ]; then
        make DOtherSide_autogen
    else
        make DOtherSideStatic_autogen
    fi
else
    cmake ..
fi

if [ "$IS_DYLIB" != "" ]; then
    make DOtherSide
else
    make DOtherSideStatic
fi
