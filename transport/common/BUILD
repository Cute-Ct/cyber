load("@rules_cc//cc:defs.bzl", "cc_library", "cc_test")
load("//build:cpplint.bzl", "cpplint")
load("//build/install:install.bzl", "install", "install_files")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "endpoint",
    srcs = ["endpoint.cc"],
    hdrs = ["endpoint.h"],
    deps = [
        ":identity",
        "//common:global_data",
        "//proto:role_attributes_cc_proto",
    ],
)

cc_test(
    name = "endpoint_test",
    size = "small",
    srcs = ["endpoint_test.cc"],
    deps = [
        "//:cyber_core",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_library(
    name = "identity",
    srcs = ["identity.cc"],
    hdrs = ["identity.h"],
    deps = [
        "//common:util",
        "@uuid",
    ],
)

cc_test(
    name = "identity_test",
    size = "small",
    srcs = ["identity_test.cc"],
    deps = [
        "//:cyber_core",
        "@com_google_googletest//:gtest_main",
    ],
)

cpplint()

install(
    name = "install",
    deps = [
        ":common_include",
    ],
)

# install file like "/opt/cyber/include/transport/common/identity.h"
install_files(
    name = "common_include",
    dest = "include/transport/common",
    files = [
        ":identity.h",
        ":endpoint.h",
    ],
)
