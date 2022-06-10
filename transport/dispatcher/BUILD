load("@rules_cc//cc:defs.bzl", "cc_library", "cc_test")
load("//build:cpplint.bzl", "cpplint")
load("//build/install:install.bzl", "install", "install_files")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "dispatcher",
    srcs = ["dispatcher.cc"],
    hdrs = ["dispatcher.h"],
    deps = [
        "//common",
        "//message:message_traits",
        "//proto:role_attributes_cc_proto",
        "//transport/message:listener_handler",
        "//transport/message:message_info",
    ],
)

cc_test(
    name = "dispatcher_test",
    size = "small",
    srcs = ["dispatcher_test.cc"],
    deps = [
        "//:cyber_core",
        "//proto:unit_test_cc_proto",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_library(
    name = "intra_dispatcher",
    srcs = ["intra_dispatcher.cc"],
    hdrs = ["intra_dispatcher.h"],
    deps = [
        ":dispatcher",
        "//message:message_traits",
        "//proto:role_attributes_cc_proto",
    ],
)

cc_test(
    name = "intra_dispatcher_test",
    size = "small",
    srcs = ["intra_dispatcher_test.cc"],
    deps = [
        "//:cyber_core",
        "//proto:unit_test_cc_proto",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_library(
    name = "rtps_dispatcher",
    srcs = ["rtps_dispatcher.cc"],
    hdrs = ["rtps_dispatcher.h"],
    deps = [
        ":dispatcher",
        "//message:message_traits",
        "//proto:role_attributes_cc_proto",
        "//transport/rtps:attributes_filler",
        "//transport/rtps:participant",
        "//transport/rtps:sub_listener",
    ],
)

cc_test(
    name = "rtps_dispatcher_test",
    size = "small",
    srcs = ["rtps_dispatcher_test.cc"],
    deps = [
        "//:cyber_core",
        "//proto:unit_test_cc_proto",
        "@com_google_googletest//:gtest",
    ],
)

cc_library(
    name = "shm_dispatcher",
    srcs = ["shm_dispatcher.cc"],
    hdrs = ["shm_dispatcher.h"],
    deps = [
        ":dispatcher",
        "//message:message_traits",
        "//proto:proto_desc_cc_proto",
        "//scheduler:scheduler_factory",
        "//transport/shm:notifier_factory",
        "//transport/shm:readable_info",
        "//transport/shm:segment_factory",
    ],
)

cc_test(
    name = "shm_dispatcher_test",
    size = "small",
    srcs = ["shm_dispatcher_test.cc"],
    deps = [
        "//:cyber_core",
        "//proto:unit_test_cc_proto",
        "@com_google_googletest//:gtest_main",
    ],
)

cpplint()

install(
    name = "install",
    deps = [
        ":dispatcher_include",
    ],
)

# install file like "/opt/cyber/include/transport/dispatcher/log.h"
install_files(
    name = "dispatcher_include",
    dest = "include/transport/dispatcher",
    files = [
        ":dispatcher.h",
        ":intra_dispatcher.h",
        ":rtps_dispatcher.h",
        ":shm_dispatcher.h",
    ],
)
