load("@rules_cc//cc:defs.bzl", "cc_library", "cc_test")
load("//build:cpplint.bzl", "cpplint")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "component",
    hdrs = ["component.h"],
    deps = [
        ":component_base",
        "//scheduler",
    ],
)

cc_test(
    name = "component_test",
    size = "small",
    srcs = ["component_test.cc"],
    deps = [
        "//:cyber",
        "@com_google_googletest//:gtest",
    ],
)

cc_library(
    name = "timer_component",
    srcs = ["timer_component.cc"],
    hdrs = ["timer_component.h"],
    deps = [
        ":component_base",
        "//blocker:blocker_manager",
        "//timer",
        "//transport/message:history",
        "//transport/transmitter",
    ],
)

cc_test(
    name = "timer_component_test",
    size = "small",
    srcs = ["timer_component_test.cc"],
    deps = [
        "//:cyber",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_library(
    name = "component_base",
    hdrs = ["component_base.h"],
    deps = [
        "//base:signal",
        "//base:thread_pool",
        "//class_loader",
        "//node",
        "@com_github_gflags_gflags//:gflags",
    ],
)

cpplint()
