# Autogenerated wrapper script for lrslib_jll for armv7l-linux-gnueabihf
export liblrs, liblrsnash, lrs, lrsnash

using GMP_jll
JLLWrappers.@generate_wrapper_header("lrslib")
JLLWrappers.@declare_library_product(liblrs, "liblrs.so.1")
JLLWrappers.@declare_library_product(liblrsnash, "liblrsnash.so")
JLLWrappers.@declare_executable_product(lrs)
JLLWrappers.@declare_executable_product(lrsnash)
function __init__()
    JLLWrappers.@generate_init_header(GMP_jll)
    JLLWrappers.@init_library_product(
        liblrs,
        "lib/liblrs.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_library_product(
        liblrsnash,
        "lib/liblrsnash.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        lrs,
        "bin/lrs",
    )

    JLLWrappers.@init_executable_product(
        lrsnash,
        "bin/lrsnash",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
