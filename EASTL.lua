-- scaffold geniefile for EASTL

EASTL_script = path.getabsolute(path.getdirectory(_SCRIPT))
EASTL_root = path.join(EASTL_script, "EASTL")

EASTL_includedirs = {
	path.join(EASTL_script, "config"),
	EASTL_root,
}

EASTL_libdirs = {}
EASTL_links = {}
EASTL_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { EASTL_includedirs }
	end,

	_add_defines = function()
		defines { EASTL_defines }
	end,

	_add_libdirs = function()
		libdirs { EASTL_libdirs }
	end,

	_add_external_links = function()
		links { EASTL_links }
	end,

	_add_self_links = function()
		links { "EASTL" }
	end,

	_create_projects = function()

project "EASTL"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		EASTL_includedirs,
	}

	defines {}

	files {
		path.join(EASTL_script, "config", "**.h"),
		path.join(EASTL_root, "**.h"),
		path.join(EASTL_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
