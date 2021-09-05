add_library(gba.hdll SHARED
    gba.c
)
set_as_hdll(gba)
target_include_directories(gba.hdll
    PRIVATE
)
target_link_libraries(gba.hdll
    libhl
)

install(
    TARGETS gba.hdll
    DESTINATION ${HDLL_DESTINATION}
)
