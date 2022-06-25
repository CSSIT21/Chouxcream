package logger

import (
	"path/filepath"
	"runtime"
	"strconv"
	"strings"

	"github.com/davecgh/go-spew/spew"
)

func Dump(a interface{}) {
	_, file, line, ok := runtime.Caller(1)
	message := spew.Sdump(a)

	if ok {
		println("[" + filepath.Base(file) + ":" + strconv.Itoa(line) + "] {")
	} else {
		println("[N/A] {")
	}
	println(strings.Replace(message, "\n", "\n  ", -1))
	println("}")
}
