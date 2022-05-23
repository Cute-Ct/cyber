load("@rules_cc//cc:defs.bzl", "cc_library")

cc_library(
    name = "fastcdr",
    hdrs = glob(["include/fastcdr/**"]),
    includes = [
        ".",
    ],
    linkopts = [
        "-L/usr/local/fast-rtps/lib",
        "-lfastcdr",
    ],
    strip_include_prefix = "include/",
    visibility = ["//visibility:public"],
)
