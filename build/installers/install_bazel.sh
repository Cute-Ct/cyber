#!/usr/bin/env bash

###############################################################################
# Copyright 2020 The Apollo Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
###############################################################################

# Fail on first error.
set -e

CURR_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
cd "$(dirname "${BASH_SOURCE[0]}")"
. ./installer_base.sh

TARGET_ARCH=$(uname -m)

BAZEL_VERSION="4.2.2"
BUILDTOOLS_VERSION="4.2.5"

if [[ "$TARGET_ARCH" == "x86_64" ]]; then
  # https://docs.bazel.build/versions/master/install-ubuntu.html
  PKG_NAME="bazel_${BAZEL_VERSION}-linux-x86_64.deb"
  DOWNLOAD_LINK="https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/${PKG_NAME}"
  # https://github.com/bazelbuild/bazel/releases/download/4.2.2/bazel_4.2.2-linux-x86_64.deb
  SHA256SUM="f1bc253fa7b611f39be0afab836dbbfb3de17226462d5d52a913b28dda032107"
  download_if_not_cached $PKG_NAME $SHA256SUM $DOWNLOAD_LINK

  apt_get_update_and_install \
    zlib1g-dev

  # https://docs.bazel.build/versions/master/install-ubuntu.html#step-3-install-a-jdk-optional
  # openjdk-11-jdk

  dpkg -i "${PKG_NAME}"

  # Cleanup right after installation
  # rm -rf "${PKG_NAME}"

  ## buildifier ##
  # buildifier-linux-amd64
  PKG_NAME="buildifier-linux-amd64"
  CHECKSUM="f94e71b22925aff76ce01a49e1c6c6d31f521bbbccff047b81f2ea01fd01a945"
  # https://github.com/bazelbuild/buildtools/releases/download/4.2.5/buildifier-linux-amd64
  DOWNLOAD_LINK="https://github.com/bazelbuild/buildtools/releases/download/${BUILDTOOLS_VERSION}/${PKG_NAME}"
  download_if_not_cached "${PKG_NAME}" "${CHECKSUM}" "${DOWNLOAD_LINK}"

  cp -f ${PKG_NAME} "/usr/local/bin/buildifier"
  chmod a+x "/usr/local/bin/buildifier"
  # rm -rf ${PKG_NAME}

  info "Done installing bazel ${BAZEL_VERSION} with buildifier ${BUILDTOOLS_VERSION}"

elif [[ "$TARGET_ARCH" == "aarch64" ]]; then
  # bazel-4.2.2-linux-arm64
  ARM64_BINARY="bazel-${BAZEL_VERSION}-linux-arm64"
  CHECKSUM="de5ddfebe1a769f067c77e29c197fc9a5bc855a502316070f6bb0fbac9ac37f8"
  DOWNLOAD_LINK="https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/${ARM64_BINARY}"
  # https://github.com/bazelbuild/bazel/releases/download/4.2.2/bazel-4.2.2-linux-arm64
  download_if_not_cached "${ARM64_BINARY}" "${CHECKSUM}" "${DOWNLOAD_LINK}"
  cp -f ${ARM64_BINARY} "/usr/local/bin/bazel"
  chmod a+x "/usr/local/bin/bazel"
  # rm -rf "${ARM64_BINARY}"

  cp ../rcfiles/bazel_completion.bash /etc/bash_completion.d/bazel

  PKG_NAME="buildifier-linux-arm64"
  CHECKSUM="54c48bdf5f91892bc6c059d9cfc659f634e890ee382b4cf298789f5788ed2b20"
  DOWNLOAD_LINK="https://github.com/bazelbuild/buildtools/releases/download/4.2.5/${PKG_NAME}"
  download_if_not_cached "${PKG_NAME}" "${CHECKSUM}" "${DOWNLOAD_LINK}"

  cp -f ${PKG_NAME} "/usr/local/bin/buildifier"
  chmod a+x "/usr/local/bin/buildifier"
  # rm -rf ${PKG_NAME}

  info "Done installing bazel ${BAZEL_VERSION} with buildifier ${BUILDTOOLS_VERSION}"
else
  error "Target arch ${TARGET_ARCH} not supported yet"
  exit 1
fi

# Note(storypku):
# Used by `apollo.sh config` to determine native cuda compute capability.
#bash ${CURR_DIR}/install_deviceQuery.sh

# Clean up cache to reduce layer size.
# apt-get clean && \
#     rm -rf /var/lib/apt/lists/*
