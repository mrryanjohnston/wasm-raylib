CC = emcc
CFLAGS = -O2 -DPLATFORM_WEB -Iraylib/raylib/src
LDFLAGS = -I./raylib/raylib/src -L./raylib/raylib/src -l:libraylib.web.a -s USE_GLFW=3 -s ASYNCIFY
TARGET = raylib.js
SRC = code.c

all: raylib/raylib/src/libraylib.web.a $(TARGET) 

raylib/raylib/src/libraylib.web.a:
	[ -d "raylib/raylib" ] || git clone https://github.com/raysan5/raylib.git raylib/raylib
	$(MAKE) -C raylib/raylib/src PLATFORM=PLATFORM_WEB -B

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET) $(LDFLAGS)

clean:
	rm -f $(TARGET) raylib.wasm
