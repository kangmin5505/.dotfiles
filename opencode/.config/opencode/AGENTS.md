# Personal Build Preferences

## Build Commands (Override)

**Use CMake presets directly. Do NOT use `./build.sh`.**

Available presets (defined in `CMakePresets.json`):

```bash
# Debug build (most common)
cmake --preset debug && cmake --build --preset debug

# Release build
cmake --preset release && cmake --build --preset release

# Debug build with unit tests
cmake --preset debug -DUNIT_TESTS=ON && cmake --build --preset debug

# Coverage build
cmake --preset coverage && cmake --build --preset coverage

# Profile build
cmake --preset profile && cmake --build --preset profile
```

Build output directories: `build_preset_<preset_name>/` (e.g. `build_preset_debug/`).

All presets use Ninja generator and export `compile_commands.json`.
