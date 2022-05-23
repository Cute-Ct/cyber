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
## build

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

help needed:

`bazel build :install` currently has errors like:
```sh
ERROR: cyber/tools/BUILD:7:1: name 'install' is not defined
ERROR: cyber/BUILD:15:8: no such target '//tools:install': target 'install' not declared in package 'tools' defined by cyber/tools/BUILD and referenced by '//:install'
ERROR: Analysis of target '//:install' failed; build aborted: Analysis failed
```


