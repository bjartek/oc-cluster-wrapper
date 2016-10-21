#!/usr/bin/env bash


test_foo() {
	echo "I am a test"
}

#here we add the test command and say that it should execute the test_foo function above
echo "test_foo" > $DISPATCH_DIR/test
