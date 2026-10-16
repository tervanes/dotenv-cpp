# dotenv-cpp

vcpkg packaging for [`laserpants/dotenv-cpp`](https://github.com/laserpants/dotenv-cpp), a header-only C++ library for loading environment variables from `.env` files.

This repository maintains the vcpkg port and version metadata. The bundled library source, API, and upstream license originate from the upstream `laserpants/dotenv-cpp` project.

## Package information

- **Package:** `dotenv-cpp`
- **Version:** `0.9.3`
- **License:** BSD 3-Clause
- **Upstream project:** [`laserpants/dotenv-cpp`](https://github.com/laserpants/dotenv-cpp)

## Installation with vcpkg

This repository is structured as a vcpkg registry. Add it to the consuming project's `vcpkg-configuration.json`:

```json
{
  "registries": [
    {
      "kind": "git",
      "repository": "https://github.com/tervanes/dotenv-cpp.git",
      "baseline": "<registry-commit>",
      "packages": [
        "dotenv-cpp"
      ]
    }
  ]
}
```

Replace `<registry-commit>` with the commit that should be used as the registry baseline. Pinning a commit keeps dependency resolution reproducible.

Declare the dependency in the consuming project's `vcpkg.json`:

```json
{
  "dependencies": [
    "dotenv-cpp"
  ]
}
```

Then install the package:

```sh
vcpkg install dotenv-cpp
```

The port name is `dotenv-cpp`. Use `dotenv-cpp` rather than `dotenv` when installing this registry entry.

If you are maintaining a local vcpkg checkout instead of consuming the port through a registry, `vcpkg add port dotenv-cpp` creates a port skeleton in that checkout. It does not install the package; use `vcpkg install dotenv-cpp` after the port is available.

Use the installed package from a CMake project by providing the vcpkg toolchain file:

```sh
cmake -B build \
  -S . \
  -DCMAKE_TOOLCHAIN_FILE="$VCPKG_ROOT/scripts/buildsystems/vcpkg.cmake"
cmake --build build
```

The exact toolchain-file path and command-line syntax may vary by platform. See the [vcpkg documentation](https://learn.microsoft.com/vcpkg/get_started/get-started) for setup instructions.

Add the package to the consuming project's `CMakeLists.txt`:

```cmake
find_package(laserpants_dotenv CONFIG REQUIRED)

add_executable(example main.cpp)
target_link_libraries(example PRIVATE laserpants::dotenv)
```

## Port layout

The packaging files are organized as follows:

```text
ports/dotenv-cpp/
├── patches/01.patch
├── portfile.cmake
└── vcpkg.json
versions/
├── baseline.json
└── d-/dotenv-cpp.json
```

- `vcpkg.json` declares the package metadata and host build dependencies.
- `portfile.cmake` fetches and installs the upstream source through CMake.
- `patches/01.patch` applies the packaging-specific adjustment required by the port.
- `versions/` registers the package version and baseline for vcpkg.

## Licensing and attribution

The upstream library remains licensed under the BSD 3-Clause License and retains its original copyright notice. See [`LICENSES/UPSTREAM-BSD-3-Clause.txt`](LICENSES/UPSTREAM-BSD-3-Clause.txt).

Packaging and repository contributions are covered by the root [`LICENSE`](LICENSE). See [`LICENSES/README.md`](LICENSES/README.md) for the repository's attribution details.

## Contributing

Please read [`CONTRIBUTING.md`](CONTRIBUTING.md) before submitting changes.

## Security

Please read [`SECURITY.md`](SECURITY.md) before reporting a vulnerability.

## Code of conduct

Participation in this project is governed by [`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md).
