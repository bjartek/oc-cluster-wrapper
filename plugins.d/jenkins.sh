#!/usr/bin/env bash

plugin_jenkins() {
	echo "This is a jenkins plugin $1"
}

echo "plugin_jenkins" > $DISPATCH_DIR/flags/--with-jenkins
