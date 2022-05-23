load("@rules_cc//cc:defs.bzl", "cc_binary")
load("//build/install:install.bzl", "install")
load("//build:cpplint.bzl", "cpplint")

package(default_visibility = ["//visibility:public"])

cc_binary(
    name = "talker",
    srcs = ["talker.cc"],
    deps = [
        "//:cyber",
        "//examples/proto:examples_cc_proto",
    ],
)

cc_binary(
    name = "listener",
    srcs = ["listener.cc"],
    deps = [
        "//:cyber",
        "//examples/proto:examples_cc_proto",
    ],
)

install(
    name = "install",
    targets = [
        ":talker",
        ":listener",
    ],
    runtime_dest = "cyber/examples",
    deps = [
        "//examples/common_component_example:install",
        "//examples/timer_component_example:install",
    ],
)

cc_binary(
    name = "paramserver",
    srcs = ["paramserver.cc"],
    deps = [
        "//:cyber",
        "//parameter",
    ],
)

cc_binary(
    name = "service",
    srcs = ["service.cc"],
    deps = [
        "//:cyber",
        "//examples/proto:examples_cc_proto",
    ],
)

cc_binary(
    name = "record",
    srcs = ["record.cc"],
    deps = [
        "//:cyber",
        "//proto:record_cc_proto",
    ],
)

cpplint()
