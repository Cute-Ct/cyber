load("@rules_cc//cc:defs.bzl", "cc_library", "cc_test")
load("//build:cpplint.bzl", "cpplint")
load("//build/install:install.bzl", "install", "install_files")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "history_attributes",
    hdrs = ["history_attributes.h"],
    deps = [
        "//proto:qos_profile_cc_proto",
    ],
)

cc_library(
    name = "history",
    hdrs = ["history.h"],
    deps = [
        ":history_attributes",
    ],
)

cc_library(
    name = "listener_handler",
    hdrs = ["listener_handler.h"],
    deps = [
        ":message_info",
        "//base:signal",
        "//message:message_traits",
        "//message:raw_message",
    ],
)

cc_library(
    name = "message_info",
    srcs = ["message_info.cc"],
    hdrs = ["message_info.h"],
    deps = [
        "//common:log",
        "//transport/common:identity",
    ],
)

cc_test(
    name = "message_info_test",
    size = "small",
    srcs = ["message_info_test.cc"],
    deps = [
        "//:cyber_core",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_test(
    name = "message_test",
    size = "small",
    srcs = ["message_test.cc"],
    deps = [
        "//:cyber_core",
        "@com_google_googletest//:gtest_main",
    ],
)

cpplint()

install(
    name = "install",
    deps = [
        ":message_include",
        ":message_lib",
    ],
)

install_files(
    name = "message_include",
    dest = "include/transport/message",
    files = [
        ":listener_handler.h",
        ":message_info.h",
        ":history.h",
        ":history_attributes.h",
    ],
)

install_files(
    name = "message_lib",
    dest = "lib/transport/message",
    files = [
        #":listener_handler.h",
        ":message_info",
        #":history.h",
        #":history_attributes.h",
    ],
)
