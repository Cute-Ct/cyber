#! /usr/bin/env bash
TOP_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd -P)"
#source ${TOP_DIR}/scripts/apollo.bashrc
source ${TOP_DIR}/cyber/scripts/common.bashrc

export CYBER_PATH="/opt/cyber"

pathprepend "${TOP_DIR}/bin"

export CYBER_DOMAIN_ID=80
export CYBER_IP=127.0.0.1

install -o 1000 -g 1000 -d "${CYBER_PATH}/log"
export GLOG_log_dir="${CYBER_PATH}/log"

export GLOG_alsologtostderr=1
export GLOG_colorlogtostderr=1
export GLOG_minloglevel=0

export sysmo_start=0

# for DEBUG log
#export GLOG_v=4
