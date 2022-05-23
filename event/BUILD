load("@rules_cc//cc:defs.bzl", "cc_library")
load("//build:cpplint.bzl", "cpplint")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "perf_event_cache",
    srcs = ["perf_event_cache.cc"],
    hdrs = ["perf_event_cache.h"],
    deps = [
        ":perf_event",
        "//:state",
        "//base:bounded_queue",
        "//common:global_data",
        "//common:log",
        "//common:macros",
        "//time",
    ],
)

cc_library(
    name = "perf_event",
    hdrs = ["perf_event.h"],
    deps = [
        "//common:global_data",
    ],
)

cpplint()
