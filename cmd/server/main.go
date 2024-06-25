package main

import (
	"flag"
	"fmt"
)

func main() {

	// Define a command-line flag for customizing the greeting message
	name := flag.String("name", "World", "Specify a name for the greeting")
	flag.Parse()

	// Print the greeting message
	fmt.Printf("Hello, %s!\n", *name)
}
