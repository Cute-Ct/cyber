load("@rules_cc//cc:defs.bzl", "cc_library", "cc_test")
load("//build:cpplint.bzl", "cpplint")
load("//build/install:install.bzl", "install", "install_files")

package(default_visibility = ["//visibility:public"])

cc_test(
    name = "sysmo_test",
    size = "small",
    srcs = ["sysmo_test.cc"],
    deps = [
        "//:cyber_core",
        "//scheduler:scheduler_factory",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_library(
    name = "sysmo",
    srcs = ["sysmo.cc"],
    hdrs = ["sysmo.h"],
    deps = [
        "//scheduler:scheduler_factory",
    ],
)

cpplint()

install(
    name = "install",
    deps = [
        # ":node_include",
        ":sysmo_lib",
    ],
)

install_files(
    name = "sysmo_lib",
    dest = "lib/sysmo",
    files = [
        ":sysmo",
    ],
)
