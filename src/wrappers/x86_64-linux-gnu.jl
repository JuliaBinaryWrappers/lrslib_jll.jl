# Autogenerated wrapper script for lrslib_jll for x86_64-linux-gnu
export liblrs, liblrsnash, lrs, lrsnash, redund

using GMP_jll
JLLWrappers.@generate_wrapper_header("lrslib")
JLLWrappers.@declare_library_product(liblrs, "liblrs.so.0")
JLLWrappers.@declare_library_product(liblrsnash, "liblrsnash.so")
JLLWrappers.@declare_executable_product(lrs)
JLLWrappers.@declare_executable_product(lrsnash)
JLLWrappers.@declare_executable_product(redund)
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

    JLLWrappers.@init_executable_product(
        redund,
        "bin/redund",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
