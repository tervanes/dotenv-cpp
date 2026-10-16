# Security Policy

## Scope

This repository maintains vcpkg packaging for the upstream [`laserpants/dotenv-cpp`](https://github.com/laserpants/dotenv-cpp) project.

Security reports may concern:

- The vcpkg port, package metadata, install scripts, or patches maintained here.
- Vulnerabilities introduced by repository automation or packaging configuration.
- Security-relevant behavior in the bundled upstream source when it is distributed through this port.

## Reporting a vulnerability

Please do not disclose suspected vulnerabilities in a public issue or pull request before maintainers have had an opportunity to assess them.

Use GitHub's private vulnerability reporting or security advisory workflow for this repository when available. If private reporting is not available, contact the repository maintainers privately through GitHub and include:

- A concise description of the vulnerability.
- The affected version or commit.
- Reproduction steps or a minimal proof of concept.
- Any suggested mitigation.

Do not include credentials, production data, or other sensitive information in the report.

## Response process

Maintainers will acknowledge reports when possible, investigate the affected packaging or upstream behavior, and coordinate disclosure and remediation with the upstream project when appropriate.

Reports involving the upstream implementation may need to be forwarded to the `laserpants/dotenv-cpp` maintainers so that the fix can be addressed at the source.

## Supported versions

The current vcpkg port version listed in [`ports/dotenv-cpp/vcpkg.json`](ports/dotenv-cpp/vcpkg.json) is the supported packaging version. Older port revisions may not receive updates.
