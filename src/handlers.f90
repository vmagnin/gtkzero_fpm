!*************************************
! MIT license
! Vincent MAGNIN, 2020-02-18
! User defined event handlers go here
!*************************************
module handlers

  use, intrinsic :: iso_c_binding, only: c_ptr, c_null_char
  use gtk, only: gtk_window_set_default_size, gtk_window_set_title, &
               & gtk_widget_show, gtk_application_window_new
  implicit none

contains
  ! Callback function for the signal "activate" emitted by g_application_run().
  ! We use a subroutine because it should return void.
  ! The GUI is defined here.
  subroutine activate(app, gdata) bind(c)
    type(c_ptr), value, intent(in) :: app, gdata
    type(c_ptr)                    :: window

    ! Create the window:
    window = gtk_application_window_new(app)
    ! Not compulsory, but can be used if you want a larger window:
    call gtk_window_set_default_size(window, 300, 200)
    ! Don't forget that C strings must end with a null char:
    call gtk_window_set_title(window, "Hello GLib & GTK world!"//c_null_char)
    ! If you don't show it, nothing will appear on screen...
    call gtk_widget_show(window)  
  end subroutine activate

end module handlers
