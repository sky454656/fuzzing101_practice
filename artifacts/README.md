# Fuzzing practice artifacts

Archives contain practice inputs, outputs, crashes, hangs, coverage, notes, scripts and configuration files outside upstream source and install/build directories.
Excluded: upstream library source trees and downloaded source archives, installed build trees, Git metadata, and shell debug history.
AFL crash inputs are raw findings, not confirmed distinct vulnerabilities.

| Project | Files | Raw MiB | Archive MiB |
|---|---:|---:|---:|
| fuzzing_gimp | 2745 | 2.1 | 0.5 |
| fuzzing_libexif | 4235 | 247.7 | 106.9 |
| fuzzing_libtiff | 1852 | 19.7 | 11.2 |
| fuzzing_libxml2 | 29777 | 61.4 | 8.1 |
| fuzzing_tcpdump | 10799 | 4.6 | 1.8 |
| fuzzing_vlc | 840 | 4.1 | 0.9 |
| fuzzing_xpdf | 3 | 0.0 | 0.0 |

Libexif archive is split into 45 MiB parts. Reconstruct in WSL with: cat fuzzing_libexif.tar.gz.part-* > fuzzing_libexif.tar.gz

Libexif archive SHA256: 3a28f1569eea569d6b1fb45b4082d377e85b5ba7cafa58a981b8824a878f91f4
