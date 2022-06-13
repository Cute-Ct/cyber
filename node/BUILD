load("@rules_cc//cc:defs.bzl", "cc_library", "cc_test")
load("//build:cpplint.bzl", "cpplint")
load("//build/install:install.bzl", "install", "install_files")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "node",
    srcs = ["node.cc"],
    hdrs = ["node.h"],
    deps = [
        ":node_channel_impl",
        ":node_service_impl",
    ],
)

cc_library(
    name = "node_channel_impl",
    hdrs = ["node_channel_impl.h"],
    deps = [
        ":reader",
        ":writer",
        "//blocker:intra_reader",
        "//blocker:intra_writer",
        "//common:global_data",
        "//message:message_traits",
        "//proto:run_mode_conf_cc_proto",
    ],
)

cc_test(
    name = "node_channel_impl_test",
    size = "small",
    srcs = ["node_channel_impl_test.cc"],
    deps = [
        "//:cyber",
        "//proto:unit_test_cc_proto",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_library(
    name = "node_service_impl",
    hdrs = ["node_service_impl.h"],
    deps = [
        ":reader",
        ":writer",
        "//common:global_data",
        "//service",
        "//service:client",
        "//service_discovery:topology_manager",
    ],
)

cc_test(
    name = "node_test",
    size = "small",
    srcs = ["node_test.cc"],
    deps = [
        "//:cyber",
        "//proto:unit_test_cc_proto",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_library(
    name = "reader",
    hdrs = ["reader.h"],
    deps = [
        ":reader_base",
        "//blocker",
        "//common:global_data",
        "//croutine:routine_factory",
        "//data:data_visitor",
        "//proto:topology_change_cc_proto",
        "//scheduler",
        "//service_discovery:topology_manager",
        "//time",
        "//transport",
    ],
)

cc_library(
    name = "reader_base",
    hdrs = ["reader_base.h"],
    deps = [
        "//event:perf_event_cache",
        "//transport",
    ],
)

cc_test(
    name = "reader_test",
    size = "small",
    srcs = ["reader_test.cc"],
    deps = [
        "//:cyber",
        "//proto:unit_test_cc_proto",
        "@com_google_googletest//:gtest",
    ],
)

cc_library(
    name = "writer",
    hdrs = ["writer.h"],
    deps = [
        ":writer_base",
        "//common:log",
        "//proto:topology_change_cc_proto",
        "//service_discovery:topology_manager",
        "//transport",
    ],
)

cc_library(
    name = "writer_base",
    hdrs = ["writer_base.h"],
    deps = [
        "//common:macros",
        "//common:util",
        "//proto:role_attributes_cc_proto",
    ],
)

cc_test(
    name = "writer_reader_test",
    size = "small",
    srcs = ["writer_reader_test.cc"],
    deps = [
        "//:cyber",
        "//proto:unit_test_cc_proto",
        "@com_google_googletest//:gtest",
    ],
)

cc_test(
    name = "writer_test",
    size = "small",
    srcs = ["writer_test.cc"],
    deps = [
        "//:cyber",
        "//node:writer_base",
        "//proto:unit_test_cc_proto",
        "@com_google_googletest//:gtest",
    ],
)

cpplint()

install(
    name = "install",
    deps = [
        ":node_include",
        ":node_lib",
    ],
)

install_files(
    name = "node_include",
    dest = "include/node",
    files = [
        ":node.h",
        ":node_channel_impl.h",
        ":reader.h",
        ":reader_base.h",
        "writer.h",
        "writer_base.h",
        "node_service_impl.h",
    ],
)

install_files(
    name = "node_lib",
    dest = "lib/node",
    files = [
        ":node",
        # ":node_channel_impl.h",
        # ":reader.h",
        # ":reader_base.h",
        # "writer.h",
        # "writer_base.h",
        # "node_service_impl.h",
    ],
)

