load("@rules_cc//cc:defs.bzl", "cc_library", "cc_test")
load("//build:cpplint.bzl", "cpplint")
load("//build/install:install.bzl", "install", "install_files")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "task",
    hdrs = ["task.h"],
    deps = [
        ":task_manager",
    ],
)

cc_test(
    name = "task_test",
    size = "small",
    srcs = ["task_test.cc"],
    deps = [
        "//:cyber_core",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_library(
    name = "task_manager",
    srcs = ["task_manager.cc"],
    hdrs = ["task_manager.h"],
    copts = ["-faligned-new"],
    deps = [
        "//scheduler:scheduler_factory",
    ],
)

cpplint()

install(
    name = "install",
    deps = [
        ":task_include",
    ],
)

# install file like "/opt/cyber/include/task/task.h"
install_files(
    name = "task_include",
    dest = "include/task",
    files = [
        ":task.h",
        ":task_manager.h",
    ],
)