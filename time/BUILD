load("@rules_cc//cc:defs.bzl", "cc_library", "cc_test")
load("//build:cpplint.bzl", "cpplint")
load("//build/install:install.bzl", "install", "install_files")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "time",
    srcs = ["time.cc"],
    hdrs = ["time.h"],
    deps = [
        ":duration",
    ],
)

cc_test(
    name = "time_test",
    size = "small",
    srcs = ["time_test.cc"],
    deps = [
        ":time",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_library(
    name = "rate",
    srcs = ["rate.cc"],
    hdrs = ["rate.h"],
    deps = [
        ":duration",
        ":time",
        "//common:log",
    ],
)

cc_library(
    name = "duration",
    srcs = ["duration.cc"],
    hdrs = ["duration.h"],
)

cc_test(
    name = "duration_test",
    size = "small",
    srcs = ["duration_test.cc"],
    deps = [
        ":duration",
        ":time",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_library(
    name = "clock",
    srcs = ["clock.cc"],
    hdrs = ["clock.h"],
    deps = [
        ":time",
        "//base:atomic_rw_lock",
        "//common:global_data",
        "//common:log",
        "//common:macros",
        "//common:util",
        "//proto:run_mode_conf_cc_proto",
    ],
)

cc_test(
    name = "clock_test",
    size = "small",
    srcs = ["clock_test.cc"],
    deps = [
        ":clock",
        "@com_google_googletest//:gtest_main",
    ],
)

cpplint()

install(
    name = "install",
    deps = [
        ":time_include",
    ],
)

install_files(
    name = "time_include",
    dest = "include/time",
    files = [
        ":time.h",
        ":duration.h",
        "rate.h",
    ],
)