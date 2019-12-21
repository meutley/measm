DEFAULT_TARGET_NAME=main
TARGET_NAME=$1
if [ -z "$TARGET_NAME" ]; then
    echo 
    echo No parameter given. Using default target name: "$DEFAULT_TARGET_NAME"
    TARGET_NAME="$DEFAULT_TARGET_NAME"
fi

./clean.sh "$TARGET_NAME"
./build.sh "$TARGET_NAME"
if [ $? != 0 ]; then
    echo 
    echo [ERROR] Build failed!
    exit 1
fi

echo 
./bin/"$TARGET_NAME"
echo -e [RUN] Command "\"./bin/$TARGET_NAME\"" completed \(error code $?\)