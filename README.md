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

to install the cyber tools:
```sh
bazel run //tools:install /usr/local/
```
[help needed] the command above will copy file to `/usr/local` which needs `sudo`, but `sudo bazel run //tools:install /usr/local/` will run whole bazel process as root.

the install python script will need patchelf,
```sh
sudo apt install patchelf
```