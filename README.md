# A fpm version of the gtkzero example in gtk-fortran

We demonstrate how the Fortran Package Manager *fpm* can be used to build and run a gtk-fortran program. The original version is that GTK 4 example, which just opens an empty GTK window :
https://github.com/vmagnin/gtk-fortran/blob/gtk4/examples/gtkzero_gapp.f90

`gtk-4-fortran` is supposed to be installed on your machine (`sudo make install` on a Unix-like system).

The `gtkzero_gapp.f90` was divided in two parts. This is the tree of the *fpm* project:

```bash
├── app
│   └── main.f90
├── build
├── fpm.toml
├── LICENSE
├── README.md
├── src
│   └── handlers.f90
└── test
    └── check.f90
```

The `fpm.toml` manifest must contain:

```toml
[build]
link = [
  "gtk-4",
  "pangocairo-1.0",
  "pango-1.0",
  "harfbuzz",
  "gdk_pixbuf-2.0",
  "cairo-gobject",
  "cairo",
  "vulkan",
  "graphene-1.0",
  "gio-2.0",
  "gobject-2.0",
  "glib-2.0",
  "gtk-4-fortran" ]
external-modules = ["gtk", "g"]
```

The project can be built and run with the command:

```bash
$ fpm run --flag '$(pkg-config --cflags gtk-4-fortran) -Xlinker -R/usr/local/lib'
```
