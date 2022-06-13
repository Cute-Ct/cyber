load("@rules_cc//cc:defs.bzl", "cc_library", "cc_test")
load("//build:cpplint.bzl", "cpplint")
load("//build/install:install.bzl", "install", "install_files")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "processor",
    srcs = ["processor.cc"],
    hdrs = ["processor.h"],
    deps = [
        "//data",
        "//scheduler:processor_context",
    ],
)

cc_library(
    name = "processor_context",
    srcs = ["processor_context.cc"],
    hdrs = ["processor_context.h"],
    deps = [
        "//croutine",
        "//data",
    ],
)

cc_library(
    name = "scheduler",
    srcs = ["scheduler.cc"],
    hdrs = ["scheduler.h"],
    deps = [
        "//croutine",
        "//scheduler:mutex_wrapper",
        "//scheduler:pin_thread",
        "//scheduler:processor",
    ],
)

cc_library(
    name = "mutex_wrapper",
    hdrs = ["common/mutex_wrapper.h"],
)

cc_library(
    name = "cv_wrapper",
    hdrs = ["common/cv_wrapper.h"],
)

cc_library(
    name = "pin_thread",
    srcs = ["common/pin_thread.cc"],
    hdrs = ["common/pin_thread.h"],
    deps = [
        "//common:log",
    ],
)

cc_library(
    name = "scheduler_factory",
    srcs = ["scheduler_factory.cc"],
    hdrs = ["scheduler_factory.h"],
    deps = [
        "//proto:component_conf_cc_proto",
        "//scheduler:scheduler_choreography",
        "//scheduler:scheduler_classic",
    ],
)

cc_library(
    name = "scheduler_choreography",
    srcs = ["policy/scheduler_choreography.cc"],
    hdrs = ["policy/scheduler_choreography.h"],
    deps = [
        "//scheduler",
        "//scheduler:choreography_context",
        "//scheduler:classic_context",
    ],
)

cc_library(
    name = "scheduler_classic",
    srcs = ["policy/scheduler_classic.cc"],
    hdrs = ["policy/scheduler_classic.h"],
    deps = [
        "//scheduler",
        "//scheduler:classic_context",
    ],
)

cc_library(
    name = "choreography_context",
    srcs = ["policy/choreography_context.cc"],
    hdrs = ["policy/choreography_context.h"],
    deps = [
        "//croutine",
        "//proto:choreography_conf_cc_proto",
        "//scheduler:processor",
    ],
)

cc_library(
    name = "classic_context",
    srcs = ["policy/classic_context.cc"],
    hdrs = ["policy/classic_context.h"],
    deps = [
        "//croutine",
        "//proto:classic_conf_cc_proto",
        "//scheduler:cv_wrapper",
        "//scheduler:mutex_wrapper",
        "//scheduler:processor",
    ],
)

cc_test(
    name = "scheduler_test",
    size = "small",
    srcs = ["scheduler_test.cc"],
    deps = [
        "//:cyber",
        "//scheduler:scheduler_factory",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_test(
    name = "scheduler_classic_test",
    size = "small",
    srcs = ["scheduler_classic_test.cc"],
    deps = [
        "//:cyber",
        "//scheduler:scheduler_factory",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_test(
    name = "scheduler_choreo_test",
    size = "small",
    srcs = ["scheduler_choreo_test.cc"],
    deps = [
        "//:cyber",
        "//scheduler:scheduler_factory",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_test(
    name = "processor_test",
    size = "small",
    srcs = ["processor_test.cc"],
    deps = [
        "//:cyber",
        "//scheduler:processor",
        "@com_google_googletest//:gtest_main",
    ],
)

cc_test(
    name = "pin_thread_test",
    size = "small",
    srcs = ["common/pin_thread_test.cc"],
    deps = [
        "//:cyber",
        "//scheduler:pin_thread",
        "@com_google_googletest//:gtest_main",
    ],
)

cpplint()

install(
    name = "install",
    deps = [
        ":scheduler_include",
        ":scheduler_lib",
    ],
)

# install file like "/opt/cyber/include/scheduler/scheduler_factory.h"
install_files(
    name = "scheduler_include",
    dest = "include/scheduler",
    files = [
        ":scheduler_factory.h",
        "policy/scheduler_choreography.h",
        "policy/scheduler_classic.h",
        "common/mutex_wrapper.h",
        "common/pin_thread.h",
        ":scheduler.h",
    ],
)

install_files(
    name = "scheduler_lib",
    dest = "lib/scheduler",
    files = [
        ":scheduler_factory",
        ":scheduler_choreography",
        ":scheduler_classic",
        # "common/mutex_wrapper.h",
        ":pin_thread",
        ":scheduler",
        ":processor",
        ":classic_context",
        ":processor_context",
        ":choreography_context",
    ],
)
