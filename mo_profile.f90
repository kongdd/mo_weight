module mo_profile 
    USE omp_lib
    REAL(8) :: START, END

contains


integer function init()
    open  (130, file = "profile.log") ! , ACCESS='APPEND'
    init = 130
end function


subroutine close()
    close (130)
end subroutine


subroutine tic(prefix)
    character(len=*), optional, intent(in) :: prefix

    if (present(prefix)) then
        write (130, *) prefix
    endif
    START = omp_get_wtime ( )
end subroutine


subroutine toc()
    ! CHARACTER(256) outfile = 'profile.log'
    END = omp_get_wtime ()
    write (130, "(A10, 3F18.6)") "elapsed:", START, END, END - START
end subroutine

end module mo_profile
