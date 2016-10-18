#!/usr/bin/env bash

plugin_pipelines() {
	local profile_dir=$1

	cat << EOF > $profile_dir/run_after
echo "Enabling pipelines plugin"
sed -i 's/  extensionScripts: null/  extensionScripts:\\
    - pipelines.js/g' $profile_dir/config/master/master-config.yaml 

echo "window.OPENSHIFT_CONSTANTS.ENABLE_TECH_PREVIEW_FEATURE.pipelines = true;" >> $profile_dir/config/master/pipelines.js
EOF
  RESTART_CLUSTER=true
}

echo "plugin_pipelines" > $DISPATCH_DIR/flags/--with-pipelines
