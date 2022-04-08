# Using gtk-fortran as a fpm dependency

We demonstrate how the Fortran Package Manager *fpm* can be used to build and run a gtk-fortran program, using gtk-fortran as a fpm dependency. The original version is that GTK 4 example, which just opens an empty GTK window :
https://github.com/vmagnin/gtk-fortran/blob/gtk4/examples/gtkzero_gapp.f90

GTK 4 is supposed to be installed on your machine.	

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
[dependencies]
gtk-4-fortran = { git = "https://github.com/vmagnin/gtk-fortran.git", branch = "experimental_fpm" }

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
```

The project can be built and run with that command:

```bash
$ fpm run
```
