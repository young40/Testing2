-- -*- lua -*-

exclude_files = {
    "src/cocos/*",
}

globals = {
    -- for cocos
    "cc",
    "ccui",
    "ccexp",
    "class",
    "handler",
    "display",
    "dump",
    "tolua",
    "release_print",

    "DEBUG",
    "CC_USE_FRAMEWORK",
    "CC_SHOW_FPS",
    "CC_DISABLE_GLOBAL",
    "CC_DESIGN_RESOLUTION",
    "__G__TRACKBACK__",
}

self = false

ignore = {
}
