load("@rules_cc//cc:defs.bzl", "cc_library", "cc_test")
load("//build:cpplint.bzl", "cpplint")
load("//build/install:install.bzl", "install", "install_files")

package(default_visibility = ["//visibility:public"])

cc_library(
  name = "transmitter",
  deps = [
    ":hybrid_transmitter",
    ":intra_transmitter",
    ":rtps_transmitter",
    ":shm_transmitter",
    ],
    )

cc_library(
    name = "hybrid_transmitter",
    hdrs = ["hybrid_transmitter.h"],
    deps = [
        ":transmitter_interface",
    ],
)

cc_library(
    name = "intra_transmitter",
    hdrs = ["intra_transmitter.h"],
    deps = [
        ":transmitter_interface",
    ],
)

cc_library(
    name = "transmitter_interface",
    hdrs = ["transmitter.h"],
    deps = [
        "//event:perf_event_cache",
        "//transport/common:endpoint",
        "//transport/message:message_info",
    ],
)

cc_library(
    name = "rtps_transmitter",
    hdrs = ["rtps_transmitter.h"],
    deps = [
        ":transmitter_interface",
    ],
)

cc_library(
    name = "shm_transmitter",
    hdrs = ["shm_transmitter.h"],
    deps = [
        ":transmitter_interface",
    ],
)

cpplint()

install(
    name = "install",
    deps = [
        ":transmitter_include",
    ],
)

install_files(
    name = "transmitter_include",
    dest = "include/transport/transmitter",
    files = [
        ":hybrid_transmitter.h",
        ":intra_transmitter.h",
        ":transmitter.h",
        ":rtps_transmitter.h",
        ":shm_transmitter.h",
    ],
)
