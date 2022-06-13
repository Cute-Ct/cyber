load("@rules_cc//cc:defs.bzl", "cc_library")
load("//build:cpplint.bzl", "cpplint")
load("//build/install:install.bzl", "install", "install_files")

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

install(
    name = "install",
    deps = [
        ":event_include",
        ":event_lib",
    ],
)

install_files(
    name = "event_include",
    dest = "include/event",
    files = [
        ":perf_event_cache.h",
        ":perf_event.h",
    ],
)



install_files(
    name = "event_lib",
    dest = "lib/event",
    files = [
        ":perf_event_cache",
        ":perf_event.h",
    ],
)
