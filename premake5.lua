project "ImGui"
	kind "StaticLib"
	language "C++"
    staticruntime "off"

	targetdir ("Build/Bin/" .. outputdir .. "/%{prj.name}")
	objdir ("Build/Intermediate/" .. outputdir .. "/%{prj.name}")
	newoption { trigger = "imgui-use-vulkan-glfw", description="Use Vulkan and GLFW" }
	newoption { trigger = "imgui-use-vulkan-volk", description="Use volk" }

	files
	{
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_internal.h",
		"imgui_tables.cpp",
		"imgui_widgets.cpp",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui_demo.cpp"
	}

    filter { "options:imgui-use-vulkan-glfw" }
       includedirs
       {
           "%{prj.location}",
           "%{IncludeDir.glfw}",
           "%{IncludeDir.vulkan}"
       }
       files
       {
           "backends/imgui_impl_vulkan.cpp",
           "backends/imgui_impl_vulkan.h",
           "backends/imgui_impl_glfw.cpp",
           "backends/imgui_impl_glfw.h"
       }
    filter "options:imgui-use-vulkan-volk"
		defines { "VOLK_NAMESPACE", "VK_NO_PROTOTYPES" }

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++23"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
