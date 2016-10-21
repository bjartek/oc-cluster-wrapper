#!/usr/bin/env bash

plugin_pipelines() {
	local profile_dir=$1

	#in order to add commands that should be run after oc cluster up is done append to $profile_dir/run_after
	#if you want to add arguments to oc cluster add them to $profile_dir/run
	#I guess another strategy to use her is to copy another SH file to $profile_dir and just add a source and function call in the HEREDOCS below

	cat << EOF > $profile_dir/run_after
echo "Enabling pipelines plugin"
sed -i 's/  extensionScripts: null/  extensionScripts:\\
    - pipelines.js/g' $profile_dir/config/master/master-config.yaml 

echo "window.OPENSHIFT_CONSTANTS.ENABLE_TECH_PREVIEW_FEATURE.pipelines = true;" >> $profile_dir/config/master/pipelines.js
EOF
  RESTART_CLUSTER=true
}

#this plugin adds a flag to the UP command. so we add the flag name to the flags folder in dispatch dir
echo "plugin_pipelines" > $DISPATCH_DIR/flags/--with-pipelines
