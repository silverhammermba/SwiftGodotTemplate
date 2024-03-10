[SwiftGodot][] is great but it needs a lot of boilerplate to get started, especially if you're building cross-platform.
This repo sets up all of that boilerplate to let you jump right in.

[SwiftGodot]: https://github.com/migueldeicaza/SwiftGodot

Setup:

1. Copy all of these files directly into your Godot project directory.
2. Check the version of SwiftGodot in `Driver/Package.swift` and update it if desired.
3. If on Windows, see additional setup instructions below.

Development cycle:

1. Open `Driver` in your Swift editor of choice (usually Xcode or VS Code)
2. Add any newly defined Godot-visible types to `Driver.swift`
3. Build using Swift package manager (command line; building in Xcode puts the built libraries in the wrong directory).
   For Windows, remember to use `subst` before building.
4. In Godot, Project > Reload Current Project (sometimes not needed e.g., when editing the implementation of a function)
5. Check the Output tab in Godot for extension errors.
   If you see any scary symbol errors, try reloading the project or changing the SwiftGodot version.

## Windows

Setting up for development on Windows is a special kind of hell.

1. Set up for [Swift][] development, including [Developer Mode][] so that the build can create symlinks.
2. Shorten the build path for the `Driver` package as much as possible using `subst` to create a virtual drive:

       subst S: C:\Users\Whatever\Foobar\GodotProject\Driver

   Strangely, setting the registry `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem` value `LongPathsEnabled` to `1` does _not_ help.
   You must actually shorten the path for the build to work.

3. Build _only_ from the new virtual drive

       S:
       swift build
   
   If you previously tried to build without `subst` you need to completely delete all temporary build files since some contain the unshortened path and Swift won't overwrite them.

4. Copy all Swift `*.dll`s to the same directory as `SwiftGodot.dll` (repeat for debug/release if needed):

       copy "C:\Program Files\Swift\runtime-development\usr\bin\*.dll" S:\.build\debug\

[Swift]: https://www.swift.org/install/windows/
[Developer Mode]: https://learn.microsoft.com/en-us/windows/apps/get-started/enable-your-device-for-development

Track further Windows build issues [here][win].

[win]: https://github.com/migueldeicaza/SwiftGodot/issues/299