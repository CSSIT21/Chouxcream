package logger

import (
	"path/filepath"
	"runtime"
	"strconv"
)

func Log(fn logger, message string) {
	_, file, line, ok := runtime.Caller(1)
	if ok {
		fn("[" + filepath.Base(file) + ":" + strconv.Itoa(line) + "] " + message)
	} else {
		fn("[N/A] " + message)
	}
}
