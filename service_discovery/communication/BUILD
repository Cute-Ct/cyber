load("@rules_cc//cc:defs.bzl", "cc_library")
load("//build:cpplint.bzl", "cpplint")
load("//build/install:install.bzl", "install", "install_files")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "participant_listener",
    srcs = ["participant_listener.cc"],
    hdrs = ["participant_listener.h"],
    deps = [
        "//common:log",
        "@fastrtps",
    ],
)

cc_library(
    name = "subscriber_listener",
    srcs = ["subscriber_listener.cc"],
    hdrs = ["subscriber_listener.h"],
    deps = [
        "//common:log",
        "//transport/rtps:underlay_message",
        "//transport/rtps:underlay_message_type",
        "@fastrtps",
    ],
)

cpplint()

install(
    name = "install",
    deps = [
        ":communication_include",
         ":communication_lib",
    ],
)

install_files(
    name = "communication_include",
    dest = "include/service_discovery/communication",
    files = [
        ":participant_listener.h",
        ":subscriber_listener.h",
    ],
)

install_files(
    name = "communication_lib",
    dest = "lib/service_discovery/communication",
    files = [
        ":participant_listener",
        ":subscriber_listener",
    ],
)
