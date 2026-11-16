# Fuzzing101 Practice

This repository preserves the scripts, configuration files, inputs, and results from my Fuzzing101 practice. Upstream library source code and library files are excluded.

## Repository structure

| Path | Contents |
|---|---|
| [fuzzing_gimp/](fuzzing_gimp/) | GIMP configuration and fuzzing dictionary |
| [fuzzing_libtiff/](fuzzing_libtiff/) | LibTIFF notes, Docker configuration, and run scripts |
| [fuzzing_libxml2/](fuzzing_libxml2/) | Libxml2 fuzzing dictionary |
| [fuzzing_tcpdump/](fuzzing_tcpdump/) | BOOTP notes, run script, and a reproduction PCAP |
| [fuzzing_vlc/](fuzzing_vlc/) | VLC notes, Docker configuration, and Makefile |
| [artifacts/](artifacts/) | Project archives containing practice inputs, full output directories, crashes, hangs, coverage data, logs, and configuration |
| [build-executables/](build-executables/) | Archives of compiled fuzzing executables, excluding shared and static libraries and headers |

Libexif and Xpdf practice data are available in their project archives under artifacts/ and build-executables/ rather than in separate top-level directories.

## Using the archives

Archive names correspond to the practice projects. Extracting an archive restores its original path below fuzzing/.

The Libexif artifacts archive and LibTIFF executable archive are split into parts. Reassemble them on Linux or WSL:

```bash
cat artifacts/fuzzing_libexif.tar.gz.part-* > fuzzing_libexif.tar.gz
cat build-executables/fuzzing_libtiff.tar.gz.part-* > fuzzing_libtiff-build.tar.gz
```

See the [artifacts index](artifacts/README.md) and [build executables index](build-executables/README.md) for archive contents and SHA-256 checksums.

## Scope and limitations

- AFL/AFL++ crash and hang files are raw fuzzing results. Their counts do not represent confirmed distinct vulnerabilities.
- The executable archives document the builds. They may not run without the omitted library files.
- Upstream library sources, downloaded source archives, Git metadata, and debugger command histories are excluded.
