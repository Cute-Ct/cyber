load("@rules_cc//cc:defs.bzl", "cc_library", "cc_test")
load("//build:cpplint.bzl", "cpplint")
load("//build/install:install.bzl", "install", "install_files")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "transport",
    srcs = ["transport.cc"],
    hdrs = ["transport.h"],
    deps = [
        "//service_discovery:role",
        "//task",
        "//transport/dispatcher:intra_dispatcher",
        "//transport/dispatcher:rtps_dispatcher",
        "//transport/dispatcher:shm_dispatcher",
        "//transport/message:history",
        "//transport/qos",
        "//transport/receiver",
        "//transport/rtps:attributes_filler",
        "//transport/rtps:participant",
        "//transport/rtps:sub_listener",
        "//transport/rtps:underlay_message",
        "//transport/rtps:underlay_message_type",
        "//transport/transmitter",
        "@fastrtps",
    ],
)

cc_test(
    name = "transport_test",
    size = "small",
    srcs = ["transport_test.cc"],
    deps = [
        "//:cyber_core",
        "//proto:unit_test_cc_proto",
        "@com_google_googletest//:gtest",
    ],
)

cpplint()

install(
    name = "install",
    deps = [
        ":transport_include",
        "//transport/dispatcher:install",
        "//transport/message:install",
        "//transport/common:install",
        "//transport/rtps:install",
        "//transport/shm:install",
        "//transport/qos:install",
        "//transport/receiver:install",
        "//transport/transmitter:install",
    ],
)

install_files(
    name = "transport_include",
    dest = "include/transport",
    files = [
        ":transport.h",
    ],
)
