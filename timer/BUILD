load("@rules_cc//cc:defs.bzl", "cc_library", "cc_test")
load("//build:cpplint.bzl", "cpplint")
load("//build/install:install.bzl", "install", "install_files")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "timer",
    srcs = ["timer.cc"],
    hdrs = ["timer.h"],
    deps = [
        ":timing_wheel",
        "//common:global_data",
    ],
)

cc_library(
    name = "timer_task",
    hdrs = ["timer_task.h"],
)

cc_library(
    name = "timer_bucket",
    hdrs = ["timer_bucket.h"],
    deps = [
        ":timer_task",
    ],
)

cc_library(
    name = "timing_wheel",
    srcs = ["timing_wheel.cc"],
    hdrs = ["timing_wheel.h"],
    deps = [
        ":timer_bucket",
        "//task",
        "//time",
        "//time:duration",
        "//time:rate",
    ],
)

cc_test(
    name = "timer_test",
    size = "small",
    srcs = ["timer_test.cc"],
    deps = [
        "//:cyber_core",
        "//:init",
        "@com_google_googletest//:gtest_main",
    ],
)

cpplint()

install(
    name = "install",
    deps = [
        ":timer_include",
        ":timer_lib",
    ],
)

# install file like "/opt/cyber/include/timer/timer.h"
install_files(
    name = "timer_include",
    dest = "include/timer",
    files = [
        ":timer.h",
        ":timing_wheel.h",
        "timer_bucket.h",
        "timer_task.h",
    ],
)

install_files(
    name = "timer_lib",
    dest = "lib/timer",
    files = [
        # ":timer.h",
        ":timing_wheel",
        # "timer_bucket.h",
        # "timer_task.h",
    ],
)
