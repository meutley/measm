DEFAULT_TARGET_NAME=main
TARGET_NAME=$1
if [ -z "$TARGET_NAME" ]; then
    echo [BUILD] No parameter given. Using default target name: $DEFAULT_TARGET_NAME
    TARGET_NAME="$DEFAULT_TARGET_NAME"
fi

BIN_PATH="./bin/$TARGET_NAME"
OBJ_PATH="./obj/$TARGET_NAME.o"
SOURCE_FILE="$TARGET_NAME.asm"

echo [BUILD] Running nasm...
echo -e [BUILD] "    Source: $SOURCE_FILE"
echo -e [BUILD] "    Obj:    $OBJ_PATH"
nasm -f elf -g -F dwarf "$TARGET_NAME".asm -o ./obj/"$TARGET_NAME".o
if [ $? != 0 ]; then
    echo [ERROR] nasm failed
    exit 1
fi

echo [BUILD] Running ld...
echo [BUILD] "    Bin: $BIN_PATH"
ld -m elf_i386 -o "$BIN_PATH" "$OBJ_PATH"
if [ $? != 0 ]; then
    echo [ERROR] ld failed
    exit 1
fi

echo [BUILD] Build completed successfully!