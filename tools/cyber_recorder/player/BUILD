load("@rules_cc//cc:defs.bzl", "cc_library")
load("//build:cpplint.bzl", "cpplint")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "play_param",
    hdrs = ["play_param.h"],
)

cc_library(
    name = "play_task",
    srcs = ["play_task.cc"],
    hdrs = ["play_task.h"],
    deps = [
        "//common:log",
        "//message:raw_message",
        "//node:writer",
    ],
)

cc_library(
    name = "play_task_buffer",
    srcs = ["play_task_buffer.cc"],
    hdrs = ["play_task_buffer.h"],
    deps = [
        ":play_task",
    ],
)

cc_library(
    name = "play_task_consumer",
    srcs = ["play_task_consumer.cc"],
    hdrs = ["play_task_consumer.h"],
    deps = [
        ":play_task_buffer",
        "//common:log",
        "//time",
    ],
)

cc_library(
    name = "play_task_producer",
    srcs = ["play_task_producer.cc"],
    hdrs = ["play_task_producer.h"],
    deps = [
        ":play_param",
        ":play_task_buffer",
        "//:cyber",
        "//common:log",
        "//message:protobuf_factory",
        "//message:raw_message",
        "//node",
        "//node:writer",
        "//record:record_reader",
        "//record:record_viewer",
    ],
)

cc_library(
    name = "player",
    srcs = ["player.cc"],
    hdrs = ["player.h"],
    deps = [
        ":play_param",
        ":play_task_buffer",
        ":play_task_consumer",
        ":play_task_producer",
        "//:init",
    ],
)

cpplint()
