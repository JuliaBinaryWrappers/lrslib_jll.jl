# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule lrslib_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("lrslib")
JLLWrappers.@generate_main_file("lrslib", UUID("3873f7d0-7b7c-52c3-bdf4-8ab39b8f337a"))
end  # module lrslib_jll
