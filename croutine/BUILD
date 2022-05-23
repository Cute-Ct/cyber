load("@rules_cc//cc:defs.bzl", "cc_library", "cc_test")
load("//build:cpplint.bzl", "cpplint")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "croutine",
    srcs = ["croutine.cc"],
    hdrs = ["croutine.h"],
    linkopts = ["-latomic"],
    deps = [
        "//base:atomic_hash_map",
        "//base:atomic_rw_lock",
        "//base:bounded_queue",
        "//base:concurrent_object_pool",
        "//base:macros",
        "//base:wait_strategy",
        "//common",
        "//croutine:routine_context",
        "//croutine:routine_factory",
        "//croutine:swap",
        "//event:perf_event_cache",
        "//time",
    ],
)

cc_library(
    name = "routine_context",
    srcs = ["detail/routine_context.cc"],
    hdrs = ["detail/routine_context.h"],
    deps = [
        "//common",
    ],
)

cc_library(
    name = "routine_factory",
    hdrs = ["routine_factory.h"],
    deps = [
        "//common",
        "//event:perf_event_cache",
    ],
)

cc_library(
    name = "swap",
    srcs = select(
        {
            "@platforms//cpu:x86_64": [
                "detail/swap_x86_64.S",
            ],
            "@platforms//cpu:aarch64": [
                "detail/swap_aarch64.S",
            ],
        },
        no_match_error = "Please Build with a Linux aarch64 or x86_64 platform",
    ),
)

cc_test(
    name = "croutine_test",
    size = "small",
    srcs = ["croutine_test.cc"],
    deps = [
        "//:cyber",
        "@com_google_googletest//:gtest_main",
    ],
)

cpplint()
