# Open Cyber

Modified version of ApolloAuto/apollo/cyber. Baseline version is apollo v7.0.0. 

## Difference from ApolloAuto/apollo/cyber:

- Cyber is a standalone project
- Docker is not used

| apollo/cyber (in ApolloAuto)     | cyber (this standalone version) |
| -------------------------------- | ----------- |
| /tools                           | merged into /build       |
| /BUILD and /cyber/BUILD          | merged int /BUILD        |


## Install prerequisites and dependencies
```sh
./install_deps.sh
```
This script will download `bazel` (`bazel-4.2.2-linux-arm64`) from github and its size is >100M.  The file can be put into `cyber/build/installers` to save downloading time.

## build

install `jdk` before running `bazel`: 

```sh
apt install default-jdk-headless
```
then
```sh
bazel build :cyber
```
or
```sh
bazel build //mainboard:mainboard
```
or build with cpplint:
```sh
bazel test //examples:talker_cpplint
```
cpplint errors will be displayed in the `test.log` file.

## Installation
```sh
bazel run //tools:install /opt/cyber/
```
it will install tools into `/opt/cyber` like:
```
/opt/cyber/
├── bin
│   ├── cyber_channel
│   ├── cyber_launch
│   ├── cyber_monitor
│   └── cyber_recorder
```
to install the cyber:
```sh
bazel build :install
bazel run :install /opt/cyber/
```
During build, if there is any bazel fetching error like this:
```sh
INFO: Repository six instantiated at:
  /home/nvidia/gitlab/cyber/WORKSPACE:72:10: in <toplevel>
  /home/nvidia/.cache/bazel/_bazel_nvidia/74e5ea07038a5a936b5238c85ebefb29/external/com_github_grpc_grpc/bazel/grpc_deps.bzl:331:21: in grpc_deps
  /home/nvidia/.cache/bazel/_bazel_nvidia/74e5ea07038a5a936b5238c85ebefb29/external/com_github_grpc_grpc/bazel/grpc_python_deps.bzl:11:21: in grpc_python_deps
Repository rule http_archive defined at:
  /home/nvidia/.cache/bazel/_bazel_nvidia/74e5ea07038a5a936b5238c85ebefb29/external/bazel_tools/tools/build_defs/repo/http.bzl:336:31: in <toplevel>
WARNING: Download from https://files.pythonhosted.org/packages/dd/bf/4138e7bfb757de47d1f4b6994648ec67a51efe58fa907c1e11e350cddfca/six-1.12.0.tar.gz failed: class java.io.IOException connect timed out
ERROR: An error occurred during the fetch of repository 'six':
```
1. Get `cyber/build/bazel_tools/six-1.12.0.tar.gz`'s absolute path like `/home/nvidia/gitlab/cyber/build/bazel_tools/six-1.12.0.tar.gz`
2. Edit file of `/home/nvidia/.cache/bazel/_bazel_nvidia/74e5ea07038a5a936b5238c85ebefb29/external/com_github_grpc_grpc/bazel/grpc_python_deps.bzl`, change `urls` to be like:
```bzl
#urls = ["https://files.pythonhosted.org/packages/dd/bf/4138e7bfb757de47d1f4b6994648ec67a51efe58fa907c1e11e350cddfca/six-1.12.0.tar.gz"],
urls = ["file:///home/nvidia/gitlab/cyber/build/bazel_tools/six-1.12.0.tar.gz"],
```


Installing python script will need patchelf,
```sh
sudo apt install patchelf
```