load("@rules_cc//cc:defs.bzl", "cc_library")
load("//build:cpplint.bzl", "cpplint")
load("//build/install:install.bzl", "install", "install_files")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "client",
    hdrs = ["client.h"],
    deps = [
        ":client_base",
    ],
)

cc_library(
    name = "client_base",
    hdrs = ["client_base.h"],
)

cc_library(
    name = "service",
    hdrs = ["service.h"],
    deps = [
        ":service_base",
        "//scheduler",
    ],
)

cc_library(
    name = "service_base",
    hdrs = ["service_base.h"],
)

cpplint()

install(
    name = "install",
    deps = [
        ":service_include",
    ],
)

# install file like "/opt/cyber/include/service/client.h"
install_files(
    name = "service_include",
    dest = "include/service",
    files = [
        ":client.h",
        ":client_base.h",
        ":service.h",
        ":service_base.h",
    ],
)