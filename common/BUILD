load("@rules_cc//cc:defs.bzl", "cc_library", "cc_test")
load("//build:cpplint.bzl", "cpplint")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "common",
    deps = [
        "//common:environment",
        "//common:file",
        "//common:global_data",
        "//common:log",
        "//common:macros",
        "//common:time_conversion",
        "//common:types",
        "//common:util",
    ],
)

cc_library(
    name = "file",
    srcs = ["file.cc"],
    hdrs = ["file.h"],
    deps = [
        "//common:log",
        "@com_google_protobuf//:protobuf",
    ],
)

cc_test(
    name = "file_test",
    size = "small",
    srcs = ["file_test.cc"],
    deps = [
        "//:cyber",
        "//proto:unit_test_cc_proto",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_library(
    name = "log",
    hdrs = ["log.h"],
    deps = [
        "//:binary",
        "@com_github_google_glog//:glog",
    ],
)

cc_test(
    name = "log_test",
    size = "small",
    srcs = ["log_test.cc"],
    deps = [
        "//:cyber",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_library(
    name = "environment",
    hdrs = ["environment.h"],
    deps = [
        "//common:log",
    ],
)

cc_test(
    name = "environment_test",
    size = "small",
    srcs = ["environment_test.cc"],
    deps = [
        ":environment",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_library(
    name = "global_data",
    srcs = ["global_data.cc"],
    hdrs = ["global_data.h"],
    data = [
        "//:cyber_conf",
    ],
    deps = [
        "//base:atomic_hash_map",
        "//base:atomic_rw_lock",
        "//common:environment",
        "//common:file",
        "//common:macros",
        "//common:util",
        "//proto:cyber_conf_cc_proto",
    ],
)

cc_test(
    name = "macros_test",
    size = "small",
    srcs = ["macros_test.cc"],
    deps = [
        "//:cyber",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_library(
    name = "macros",
    hdrs = ["macros.h"],
    deps = [
        "//base:macros",
    ],
)

cc_library(
    name = "time_conversion",
    hdrs = ["time_conversion.h"],
)

cc_library(
    name = "types",
    hdrs = ["types.h"],
)

cc_library(
    name = "util",
    hdrs = ["util.h"],
)

cpplint()
