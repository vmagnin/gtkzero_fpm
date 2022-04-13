!-------------------------------------------------------------------------------
! MIT license
! Vincent MAGNIN, 2020-02-18
! Last modified: 2022-04-13
! This example just creates a GTK application with an empty window.
! https://docs.gtk.org/gtk4/getting_started.html
! https://docs.gtk.org/gio/class.Application.html
!-------------------------------------------------------------------------------

!*********************************************************************************************
! In the main program, we declare the GTK application, connect it to its "activate" function
! where we will create the GUI, and finally call the GLib main loop.
!*********************************************************************************************
program gtkzero

  use, intrinsic :: iso_c_binding, only: c_ptr, c_int, c_null_char, c_null_ptr, c_funloc
  ! We will use those GTK functions and values. The "only" statement can improve
  ! significantly the compilation time:
  use gtk, only: gtk_application_new, g_signal_connect, G_APPLICATION_FLAGS_NONE
  use g, only: g_application_run, g_object_unref

  use handlers

  implicit none
  integer(c_int)     :: status
  type(c_ptr)        :: app

  ! First, let's create a GTK application (it will initialize GTK).
  ! The application ID must contain at least one point:
  ! https://docs.gtk.org/gio/type_func.Application.id_is_valid.html
  app = gtk_application_new("gtk-fortran.examples.gtkzero"//c_null_char, &
                            & G_APPLICATION_FLAGS_NONE)
  ! The activate signal will be sent by g_application_run(). 
  ! The c_funloc() function returns the C address of the callback function.
  ! The c_null_ptr means no data is transfered to the callback function.
  call g_signal_connect(app, "activate"//c_null_char, c_funloc(activate), c_null_ptr)
  ! Now, the whole application will be managed by GLib (=> main loop).
  ! Note that commandline arguments argc, argv are not passed.
  ! https://docs.gtk.org/gio/method.Application.run.html
  status = g_application_run(app, 0_c_int, [c_null_ptr])

  print *, "You have exited the GLib main loop, bye, bye..."

  ! Memory is freed:
  call g_object_unref(app)

end program gtkzero
