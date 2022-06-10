load("@rules_cc//cc:defs.bzl", "cc_library")
load("//build:cpplint.bzl", "cpplint")
load("//build/install:install.bzl", "install", "install_files")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "class_factory",
    srcs = ["class_factory.cc"],
    hdrs = ["class_factory.h"],
)

cc_library(
    name = "class_loader_utility",
    srcs = ["class_loader_utility.cc"],
    hdrs = ["class_loader_utility.h"],
    deps = [
        ":class_factory",
        "//class_loader/shared_library",
        "//common:log",
    ],
)

cpplint()

install(
    name = "install",
    deps = [
        ":utility_include",
    ],
)

install_files(
    name = "utility_include",
    dest = "include/class_loader/utility",
    files = [
        ":class_loader_utility.h",
        ":class_factory.h",
    ],
)
