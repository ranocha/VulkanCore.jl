# using VulkanCore
# using VulkanCore.LibVulkan
using Test
using GLFW

@static if Sys.isapple()
    glfw = joinpath(GLFW.GLFW_jll.artifact_dir, "lib", "libglfw.dylib")
    run(`install_name_tool -add_rpath $(joinpath(ENV["VULKAN_SDK"], "lib", "libvulkan.dylib")) $glfw`)
end

@testset "GLFW" begin
    @test GLFW.VulkanSupported()
	# if GLFW.VulkanSupported()
	# 	include("glfw.jl")
	# end
end

# @static if get(ENV, "JULIA_GITHUB_ACTIONS_CI", "OFF") == "OFF"
# 	include("old_tests.jl")
# end
