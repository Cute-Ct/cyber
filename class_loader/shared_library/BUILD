load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library", "cc_test")
load("//build:cpplint.bzl", "cpplint")
load("//build/install:install.bzl", "install", "install_files")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "shared_library",
    srcs = ["shared_library.cc"],
    hdrs = ["shared_library.h"],
    linkopts = ["-ldl"],
    deps = [
        ":exceptions",
    ],
)

cc_library(
    name = "exceptions",
    hdrs = ["exceptions.h"],
)

cc_binary(
    name = "libsample.so",
    testonly = True,
    linkshared = True,
    linkstatic = False,
    visibility = ["//visibility:private"],
    deps = [
        ":sample_lib",
    ],
)

cc_library(
    name = "sample_lib",
    testonly = True,
    srcs = ["sample.cc"],
    hdrs = ["sample.h"],
    linkopts = ["-lm"],
    visibility = ["//visibility:private"],
)

cc_test(
    name = "shared_library_test",
    size = "small",
    srcs = ["shared_library_test.cc"],
    data = [
        ":libsample.so",
    ],
    deps = [
        ":shared_library",
        "@com_google_googletest//:gtest_main",
    ],
)

cpplint()

install(
    name = "install",
    deps = [
        ":shared_library_include",
    ],
)

install_files(
    name = "shared_library_include",
    dest = "include/class_loader/shared_library",
    files = [
        ":shared_library.h",
        ":exceptions.h",
    ],
)
