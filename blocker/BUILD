load("@rules_cc//cc:defs.bzl", "cc_library", "cc_test")
load("//build:cpplint.bzl", "cpplint")
load("//build/install:install.bzl", "install", "install_files")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "blocker_manager",
    srcs = ["blocker_manager.cc"],
    hdrs = ["blocker_manager.h"],
    deps = [
        ":blocker",
    ],
)

cc_test(
    name = "blocker_manager_test",
    size = "small",
    srcs = ["blocker_manager_test.cc"],
    deps = [
        "//:cyber",
        "//proto:unit_test_cc_proto",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_library(
    name = "blocker",
    hdrs = ["blocker.h"],
)

cc_test(
    name = "blocker_test",
    size = "small",
    srcs = ["blocker_test.cc"],
    deps = [
        "//:cyber",
        "//proto:unit_test_cc_proto",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_library(
    name = "intra_reader",
    hdrs = ["intra_reader.h"],
    deps = [
        ":blocker_manager",
    ],
)

cc_library(
    name = "intra_writer",
    hdrs = ["intra_writer.h"],
    deps = [
        ":blocker_manager",
    ],
)

cpplint()

install(
    name = "install",
    deps = [
        ":blocker_include",
    ],
)

install_files(
    name = "blocker_include",
    dest = "include/blocker",
    files = [
        ":blocker.h",
        ":blocker_manager.h",
        ":intra_reader.h",
        "intra_writer.h",
    ],
)