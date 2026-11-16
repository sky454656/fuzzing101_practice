# Built executable archive

These are executable ELF files from install directories. Shared libraries, static libraries, headers, upstream source, and other install files are excluded.
Some executables may require the omitted libraries and are preserved as build evidence.

| Project | ELF executables | Raw MiB | Archive parts | SHA256 of reconstructed archive |
|---|---:|---:|---:|---|
| fuzzing_gimp | 4 | 32.2 | 1 | 846ce1b9b0f34e0a73994385e256fe05f5ba84bebe3a25f02c06f10db152b906 |
| fuzzing_libexif | 2 | 3.0 | 1 | f9f7435c21c4cfa4cc49edad1423953d6f108eec1fae1b5d4f74971bb6a1627a |
| fuzzing_libtiff | 92 | 181.1 | 2 | 464d8bd186be5d2139cb7363c36f187914adab7789b4dbbf907679bdaf9611fe |
| fuzzing_libxml2 | 4 | 25.8 | 1 | fe3584d21a0b4f5abb46fa1bf03cff2738c5d720c068cd4dd33017c00f122737 |
| fuzzing_tcpdump | 6 | 42.5 | 1 | 96f52854f82a6bad878fe43971c3e5a8ff04315d9a1ca064188d5314e4fb88f4 |
| fuzzing_xpdf | 5 | 17.8 | 1 | bdcda1cf91e17fc70b406d78986e28640b530842983ed3c3e629e0599fe82d53 |
| fuzzing_vlc | 4 | 4.0 | 1 | 3610f53a14ceee2ccb6648e2ef024388d3e7752aeb32d845cd4adae484f29b39 |

To reconstruct a split archive in WSL, run: cat PROJECT.tar.gz.part-* > PROJECT.tar.gz
