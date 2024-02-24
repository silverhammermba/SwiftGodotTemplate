[SwiftGodot][] is great but it needs a lot of boilerplate to get started, especially if you're building cross-platform.
This repo sets up all of that boilerplate to let you jump right in.

[SwiftGodot]: https://github.com/migueldeicaza/SwiftGodot

Setup: copy all of these files directly into your Godot project directory.
Development cycle:

1. Open `Driver` in your Swift editor of choice (usually Xcode or VS Code)
2. Add any newly defined Godot-visible types to `Driver.swift`
3. Build.
   From the `Driver` directory: `swift build --configuration debug` (building in Xcode puts the built libraries in the wrong directory)
4. In Godot, Project > Reload Current Project (sometimes not needed e.g., when editing just the implementation of a function)
