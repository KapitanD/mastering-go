package main

// #cgo CFLAGS: -I${SRCDIR}/callClib
// #cgo LDFLAGS: ${SRCDIR}/callC.a
// #include <stdlib.h>
// #include <myCHeader.h>
import "C"

import (
	"fmt"
	"unsafe"
)

func main() {
	fmt.Println("Going to call c func")
	a := C.add(1, 2)
	fmt.Printf("a is %v\n", a)

	fmt.Println("Call another func")
	msg := C.CString("My message")
	defer C.free(unsafe.Pointer(msg))
	C.print_message(msg)

	fmt.Println("Done!")
}
