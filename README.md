# Using gtk-fortran as a fpm dependency

We demonstrate how the Fortran Package Manager [fpm](https://fpm.fortran-lang.org/) can be used to build and run a gtk-fortran program, using gtk-fortran as a fpm dependency. The present `gtkzero_fpm` example is based on the GTK 4 [`gtkzero_gapp` example](https://github.com/vmagnin/gtk-fortran/blob/gtk4/examples/gtkzero_gapp.f90) and just opens an empty GTK window.

## Requirements

- The GTK 4 development files are supposed to be installed on your system.
- You need fpm,
- and a modern Fortran compiler (>= Fortran 2008).

## The sources

The original `gtkzero_gapp.f90` has been divided in two files `main.f90` and `handlers.f90`. This is the tree of the project, before building:

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

The `fpm.toml` manifest must contain a dependencies section with gtk-fortran:

```toml
[dependencies]
gtk-fortran = { git = "https://github.com/vmagnin/gtk-fortran.git", branch = "experimental_fpm" }
```

## Building and running

The project can be downloaded, built and run very simply:

```bash
$ git clone git@github.com:vmagnin/gtkzero_fpm.git
$ cd gtkzero_fpm
$ fpm run
```
You should see on screen an empty GTK window with an "hello world" title.

## License

This example is under MIT license. You can therefore use it to begin your own project, and just copy that license above the concerned code sections.

