load("@rules_cc//cc:defs.bzl", "cc_binary", "cc_library")
load("//build/install:install.bzl", "install")
load("//build:cpplint.bzl", "cpplint")

package(default_visibility = ["//visibility:public"])

install(
    name = "install",
    targets = [
      ":cyber_recorder",
    ],
)

cc_binary(
    name = "cyber_recorder",
    srcs = ["main.cc"],
    linkopts = ["-pthread"],
    deps = [
        ":info",
        ":recorder",
        ":recoverer",
        ":spliter",
        "//:init",
        "//common:file",
        "//common:time_conversion",
        "//tools/cyber_recorder/player",
    ],
)

cc_library(
    name = "info",
    srcs = ["info.cc"],
    hdrs = ["info.h"],
    deps = [
        "//common:time_conversion",
        "//proto:record_cc_proto",
        "//record:record_file_reader",
        "//record:record_message",
    ],
)

cc_library(
    name = "recorder",
    srcs = ["recorder.cc"],
    hdrs = ["recorder.h"],
    deps = [
        "//:cyber",
        "//common:log",
        "//proto:record_cc_proto",
        "@fastrtps",
    ],
)

cc_library(
    name = "recoverer",
    srcs = ["recoverer.cc"],
    hdrs = ["recoverer.h"],
    deps = [
        "//base:for_each",
        "//common:log",
        "//proto:record_cc_proto",
        "//record:header_builder",
        "//record:record_file_reader",
        "//record:record_writer",
    ],
)

cc_library(
    name = "spliter",
    srcs = ["spliter.cc"],
    hdrs = ["spliter.h"],
    deps = [
        "//common:log",
        "//proto:record_cc_proto",
        "//record:header_builder",
        "//record:record_file_reader",
        "//record:record_writer",
    ],
)

cpplint()
