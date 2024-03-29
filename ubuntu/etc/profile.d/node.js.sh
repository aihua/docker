#!/bin/sh

if [ -z "${NODE_JS_HOME}" ] ; then
	node_js_version="16.13.2"
	node_js_path="/opt/node.js/${node_js_version}"
    node_prefix_path="/data/repo/node.js/global"

	if [ -x "${node_js_path}/bin/node" ] ; then
		NODE_JS_HOME=${node_js_path} ; export NODE_JS_HOME
		PATH=${NODE_JS_HOME}/bin:${node_prefix_path}/bin:${PATH} ; export PATH
	fi
	
	unset node_js_path
	unset node_js_version
fi
