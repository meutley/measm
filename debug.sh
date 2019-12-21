DEFAULT_COMMAND_FILE=".debug-cmds"
DEFAULT_TARGET_NAME=main

TARGET_NAME=$1
if [ -z "$TARGET_NAME" ]; then
    echo 
    echo [DEBUG] No parameter given for target. Using default target name: "$DEFAULT_TARGET_NAME"
    TARGET_NAME="$DEFAULT_TARGET_NAME"
fi

COMMAND_FILE=$2
if [ -z "$COMMAND_FILE" ]; then
    echo 
    echo [DEBUG] No parameter given for gdb command file. Using default command file: "$DEFAULT_COMMAND_FILE"
    COMMAND_FILE="$DEFAULT_COMMAND_FILE"
fi

./build.sh "$TARGET_NAME"
if [ $? != 0 ]; then
    echo 
    echo [ERROR] Build failed!
    exit 1
fi

echo 
echo [DEBUG] Starting gdb with command file .debug-cmds...
echo -e [DEBUG] "    gdb ./bin/$TARGET_NAME -x=\"$COMMAND_FILE\""
echo 

gdb ./bin/"$TARGET_NAME" -x="$COMMAND_FILE"

echo 
echo [DEBUG] gdb command finished \(error code "$?"\)