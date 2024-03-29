load("@rules_cc//cc:defs.bzl", "cc_library", "cc_test")
load("//build:cpplint.bzl", "cpplint")
load("//build/install:install.bzl", "install", "install_files")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "block",
    srcs = ["block.cc"],
    hdrs = ["block.h"],
    deps = [
        "//base:atomic_rw_lock",
        "//common:log",
    ],
)

cc_library(
    name = "condition_notifier",
    srcs = ["condition_notifier.cc"],
    hdrs = ["condition_notifier.h"],
    deps = [
        ":notifier_base",
        "//common:global_data",
        "//common:log",
        "//common:util",
    ],
)

cc_library(
    name = "multicast_notifier",
    srcs = ["multicast_notifier.cc"],
    hdrs = ["multicast_notifier.h"],
    deps = [
        ":notifier_base",
        "//common:global_data",
        "//common:log",
        "//common:macros",
    ],
)

cc_library(
    name = "notifier_base",
    hdrs = ["notifier_base.h"],
    deps = [
        ":readable_info",
    ],
)

cc_library(
    name = "notifier_factory",
    srcs = ["notifier_factory.cc"],
    hdrs = ["notifier_factory.h"],
    deps = [
        ":condition_notifier",
        ":multicast_notifier",
        ":notifier_base",
        "//common:global_data",
        "//common:log",
    ],
)

cc_library(
    name = "readable_info",
    srcs = ["readable_info.cc"],
    hdrs = ["readable_info.h"],
    deps = [
        "//common:log",
    ],
)

cc_library(
    name = "xsi_segment",
    srcs = ["xsi_segment.cc"],
    hdrs = ["xsi_segment.h"],
    deps = [
        ":segment",
        "//common:log",
        "//common:util",
    ],
)

cc_library(
    name = "posix_segment",
    srcs = ["posix_segment.cc"],
    hdrs = ["posix_segment.h"],
    deps = [
        ":segment",
        "//common:log",
        "//common:util",
    ],
)

cc_library(
    name = "segment",
    srcs = ["segment.cc"],
    hdrs = ["segment.h"],
    deps = [
        ":block",
        ":shm_conf",
        ":shmstate",
        "//common:log",
        "//common:util",
    ],
)

cc_library(
    name = "segment_factory",
    srcs = ["segment_factory.cc"],
    hdrs = ["segment_factory.h"],
    deps = [
        ":posix_segment",
        ":segment",
        ":xsi_segment",
        "//common:global_data",
        "//common:log",
    ],
)

cc_library(
    name = "shm_conf",
    srcs = ["shm_conf.cc"],
    hdrs = ["shm_conf.h"],
    deps = [
        "//common:log",
    ],
)

cc_library(
    name = "shmstate",
    srcs = ["state.cc"],
    hdrs = ["state.h"],
)

cc_test(
    name = "condition_notifier_test",
    size = "small",
    srcs = ["condition_notifier_test.cc"],
    tags = ["exclusive"],
    deps = [
        "//:cyber_core",
        "@com_google_googletest//:gtest_main",
    ],
)

cpplint()

install(
    name = "install",
    deps = [
        ":shm_include",
        ":shm_lib",
    ],
)

install_files(
    name = "shm_include",
    dest = "include/transport/shm",
    files = [
        ":notifier_factory.h",
        ":notifier_base.h",
        ":readable_info.h",
        ":segment_factory.h",
        ":segment.h",
        ":block.h",
        ":shm_conf.h",
        ":state.h",
    ],
)

install_files(
    name = "shm_lib",
    dest = "lib/transport/shm",
    files = [
        ":notifier_factory",
        # ":notifier_base.h",
        ":condition_notifier",
        ":readable_info",
        ":segment_factory",
        ":segment",
        ":xsi_segment",
        ":block",
        ":shm_conf",
        ":shmstate",
        ":posix_segment",
        ":multicast_notifier",
    ],
)