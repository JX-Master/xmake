toolchain("my-c6000")
    set_kind("standalone")
    set_homepage("https://www.ti.com")
    set_description("TI-CGT C6000 compiler")

    set_toolset("cc", "cl6x")
    set_toolset("cxx", "cl6x")
    set_toolset("ld", "cl6x")
    set_toolset("sh", "cl6x")
    set_toolset("ar", "ar6x")
    set_toolset("strip", "strip6x")
    set_toolset("as", "cl6x")

    on_check(function (toolchain)
        return import("lib.detect.find_tool")("cl6x")
    end)

    on_load(function (toolchain)
        local march = "-mv64+"
        if march then
            toolchain:add("cxflags", march)
            toolchain:add("mxflags", march)
            toolchain:add("asflags", march)
            toolchain:add("ldflags", march)
            toolchain:add("shflags", march)
        end
    end)
