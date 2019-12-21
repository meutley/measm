echo 
echo [CLEAN] Cleaning obj folder "./obj"...
if [ -n "$(ls -A ./obj)" ]; then
    rm ./obj/*
fi

echo [CLEAN] Cleaning bin folder "./bin"...
if [ -n "$(ls -A ./bin)" ]; then
    rm ./bin/*
fi

echo [CLEAN] Clean completed!