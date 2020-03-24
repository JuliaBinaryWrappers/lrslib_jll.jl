# Autogenerated wrapper script for lrslib_jll for i686-linux-gnu
export redund, liblrs, lrsnash, lrs

using GMP_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `redund`
const redund_splitpath = ["bin", "redund"]

# This will be filled out by __init__() for all products, as it must be done at runtime
redund_path = ""

# redund-specific global declaration
function redund(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(redund_path)
    end
end


# Relative path to `liblrs`
const liblrs_splitpath = ["lib", "liblrs.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
liblrs_path = ""

# liblrs-specific global declaration
# This will be filled out by __init__()
liblrs_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const liblrs = "liblrs.so.0"


# Relative path to `lrsnash`
const lrsnash_splitpath = ["bin", "lrsnash"]

# This will be filled out by __init__() for all products, as it must be done at runtime
lrsnash_path = ""

# lrsnash-specific global declaration
function lrsnash(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(lrsnash_path)
    end
end


# Relative path to `lrs`
const lrs_splitpath = ["bin", "lrs"]

# This will be filled out by __init__() for all products, as it must be done at runtime
lrs_path = ""

# lrs-specific global declaration
function lrs(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ':', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        if !isempty(get(ENV, LIBPATH_env, ""))
            env_mapping[LIBPATH_env] = string(LIBPATH, ':', ENV[LIBPATH_env])
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(lrs_path)
    end
end


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"lrslib")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (GMP_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (GMP_jll.LIBPATH_list,))

    global redund_path = normpath(joinpath(artifact_dir, redund_splitpath...))

    push!(PATH_list, dirname(redund_path))
    global liblrs_path = normpath(joinpath(artifact_dir, liblrs_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global liblrs_handle = dlopen(liblrs_path)
    push!(LIBPATH_list, dirname(liblrs_path))

    global lrsnash_path = normpath(joinpath(artifact_dir, lrsnash_splitpath...))

    push!(PATH_list, dirname(lrsnash_path))
    global lrs_path = normpath(joinpath(artifact_dir, lrs_splitpath...))

    push!(PATH_list, dirname(lrs_path))
    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

