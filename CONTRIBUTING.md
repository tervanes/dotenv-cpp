# Contributing

Thank you for helping maintain the `dotenv-cpp` vcpkg port.

This repository packages the upstream [`laserpants/dotenv-cpp`](https://github.com/laserpants/dotenv-cpp) project. Contributions should keep the packaging reproducible, preserve upstream attribution, and avoid changing imported upstream code unless the change is required for the port.

## Before you start

- Read the [README](README.md) for the package layout and supported workflow.
- Review the upstream project's current behavior before proposing packaging changes.
- Check existing issues and pull requests for related work.
- Keep credentials, local build output, and private environment files out of commits.

## Making port changes

The main packaging files are:

- `ports/dotenv-cpp/vcpkg.json` for package metadata and dependencies.
- `ports/dotenv-cpp/portfile.cmake` for fetching, configuring, building, and installing the package.
- `ports/dotenv-cpp/patches/` for minimal upstream adjustments needed by vcpkg.
- `versions/` for vcpkg version and baseline registration.

When updating the upstream version:

1. Update the version and source reference in the port metadata.
2. Recalculate and verify the source archive hash.
3. Update the vcpkg version database and baseline.
4. Keep patches minimal and document why each patch is necessary.
5. Preserve upstream license files and copyright notices.

Do not vendor unrelated dependencies or make broad changes to the upstream implementation in a packaging-only pull request.

## Validation

Run the checks relevant to your change. At minimum, validate the port with vcpkg:

```sh
vcpkg format-manifest ports/dotenv-cpp/vcpkg.json
vcpkg install dotenv-cpp --overlay-ports="$PWD/ports"
```

For changes that affect the upstream CMake integration, also build and run the local tests:

```sh
cmake -B build -S . -DBUILD_TESTS=ON -DBUILD_DOCS=OFF
cmake --build build
ctest --test-dir build --output-on-failure
```

Do not commit generated build directories, local package caches, secrets, or `.env` files.

## Pull requests

Pull requests should:

- Explain the packaging problem and the chosen solution.
- Identify whether the change affects the upstream source, the vcpkg port, or version metadata.
- Include the validation commands that were run.
- Keep unrelated formatting or refactoring out of the diff.
- Preserve the existing license and attribution requirements.

Use a clear title such as `fix: update the port source hash` or `feat: add vcpkg packaging`.

## Code of conduct

By participating, you agree to follow [`CODE_OF_CONDUCT.md`](CODE_OF_CONDUCT.md).
