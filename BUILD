load("@rules_cc//cc:defs.bzl", "cc_library")
#load("//tools/install:install.bzl", "install")
load("//build/install:install.bzl", "install", "install_files")
load("//build:cpplint.bzl", "cpplint")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "cyber",
    linkstatic = False,
    deps = [
        ":cyber_core",
    ],
)

#from /apollo root path
exports_files([
    "CPPLINT.cfg",
    "tox.ini",
])


install(
    name = "install",
    data = [
        ".release.bash",
        ":cyber_conf",
        "//python/cyber_py3:runtime_files",
    ],
    rename = {
        ".release.bash": "setup.bash",
    },
    deps = [
        ":pb_cyber",
        "//mainboard:install",
        "//examples:install",
        "//python/internal:install",
        "//tools:install",
        "//scripts:install",
        ":cyber_includes",
    ],
)

install_files(
    name = "pb_cyber",
    dest = "",
    files = [
        "//proto:record_py_pb2",
    ],
)

cc_library(
    name = "binary",
    srcs = ["binary.cc"],
    hdrs = ["binary.h"],
)

cc_library(
    name = "state",
    srcs = ["state.cc"],
    hdrs = ["state.h"],
    deps = [
        "//common",
    ],
)

cc_library(
    name = "init",
    srcs = ["init.cc"],
    hdrs = ["init.h"],
    deps = [
        "//:binary",
        "//:state",
        "//common:file",
        "//logger:async_logger",
        "//node",
        "//proto:clock_cc_proto",
        "//sysmo",
        "//time:clock",
        "//timer:timing_wheel",
    ],
)

cc_library(
    name = "cyber_core",
    srcs = ["cyber.cc"],
    hdrs = ["cyber.h"],
    linkopts = ["-lrt"],
    deps = [
        "//:binary",
        "//:init",
        "//:state",
        "//base",
        "//blocker:blocker_manager",
        "//class_loader",
        "//class_loader:class_loader_manager",
        "//common",
        "//component",
        "//component:timer_component",
        "//croutine",
        "//data",
        "//event:perf_event_cache",
        "//io",
        "//logger",
        "//logger:async_logger",
        "//message:message_traits",
        "//message:protobuf_traits",
        "//message:py_message_traits",
        "//message:raw_message_traits",
        "//node",
        "//parameter:parameter_client",
        "//parameter:parameter_server",
        "//proto:run_mode_conf_cc_proto",
        "//record",
        "//scheduler",
        "//scheduler:scheduler_factory",
        "//service",
        "//service:client",
        "//service_discovery:topology_manager",
        "//sysmo",
        "//task",
        "//time",
        "//time:clock",
        "//time:duration",
        "//time:rate",
        "//timer",
        "//transport",
        "//transport/rtps:participant",
        "//transport/rtps:sub_listener",
        "@com_github_google_glog//:glog",
        "@com_google_protobuf//:protobuf",
        "@fastrtps",
    ],
)

filegroup(
    name = "cyber_conf",
    srcs = glob([
        "conf/*.conf",
    ]),
)

install(
    name = "cyber_includes",
    data = [
    ],
    deps = [
        ":cyber_include",
        "//base:install",
        "//blocker:install",
        "//common:install",
        "//component:install",
        "//proto:install",
        "//class_loader:install",
        "//node:install",
        "//croutine:install",
        "//data:install",
        "//event:install",
        "//time:install",
        "//transport:install",
        "//message:install",
        "//service_discovery:install",
        "//task:install",
        "//scheduler:install",
        "//service:install",
        "//timer:install",
    ],
)

# install file like "/opt/cyber/include/cyber.h"
install_files(
    name = "cyber_include",
    dest = "include",
    files = [
        "//:cyber.h",
        "//:binary.h",
        "//:state.h",
        "//:init.h",
    ],
)

# todo fix thes bazel errors
# Label '//:CPPLINT.cfg' is duplicated in the 'data' attribute of rule 'binary_cpplint'
# Label '//:CPPLINT.cfg' is duplicated in the 'data' attribute of rule 'state_cpplint'
# Label '//:CPPLINT.cfg' is duplicated in the 'data' attribute of rule 'init_cpplint'
# Label '//:CPPLINT.cfg' is duplicated in the 'data' attribute of rule 'cyber_core_cpplint'
#cpplint()
