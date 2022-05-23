load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "fastrtps",
    hdrs = glob(["include/fastrtps/**"]),
    includes = [
        ".",
    ],
    linkopts = [
        "-L/usr/local/fast-rtps/lib",
        "-lfastrtps",
    ],
    strip_include_prefix = "include/",
    visibility = ["//visibility:public"],
    deps = [
        "@fastcdr",
    ],
)
