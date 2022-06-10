load("@rules_cc//cc:defs.bzl", "cc_library")
load("//build:cpplint.bzl", "cpplint")
load("//build/install:install.bzl", "install", "install_files")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "qos",
    visibility = ["//visibility:public"],
    deps = [
        ":qos_profile_conf",
    ],
)

cc_library(
    name = "qos_profile_conf",
    srcs = ["qos_profile_conf.cc"],
    hdrs = ["qos_profile_conf.h"],
    deps = [
        "//proto:qos_profile_cc_proto",
    ],
)

cpplint()

install(
    name = "install",
    deps = [
        ":qos_include",
    ],
)

install_files(
    name = "qos_include",
    dest = "include/transport/qos",
    files = [
        ":qos_profile_conf.h",
    ],
)