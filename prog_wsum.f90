
PROGRAM main_weight
    use mo_weight
    use mo_profile

    ! use procedures
    ! use netcdf,          only: &
    !    nf90_open, nf90_close, nf90_strerror, nf90_def_dim, nf90_def_var,   &
    !    nf90_put_var, nf90_get_var, nf90_put_att, nf90_get_att,             &
    !    nf90_inquire, nf90_inq_dimid, nf90_inquire_dimension,               &
    !    nf90_inq_varid, nf90_inq_varids, nf90_inquire_variable, nf90_inquire_attribute,      &
    !    NF90_OPEN, NF90_NETCDF4, NF90_CREATE, NF90_WRITE, NF90_NOWRITE,     &
    !    NF90_BYTE, NF90_SHORT, NF90_INT, NF90_FLOAT, NF90_DOUBLE,                      &
    !    NF90_FILL_BYTE, NF90_FILL_SHORT, NF90_FILL_INT, NF90_FILL_FLOAT , NF90_FILL_DOUBLE, &
    !    NF90_NOERR, NF90_UNLIMITED, NF90_GLOBAL

    real mat(2, 3), ws(2, 3), vec2(5)
    LOGICAL mask(2, 3)
    integer fid

    mat = RESHAPE((/7.0, 2.0, 0.0, -5.0, 0.0, 4.0/), (/2, 3/))
    ws  = RESHAPE((/0.5, 1.0, 1.0, 1.0, 1.0, 1.0/), (/2, 3/))

    mask = mat /= 0
    ! print *, mat
    ! call tic
    print *, mask

    fid = init()
    call tic("[1.1 mat wsum] ---------------")
    write(fid, *) wsum_mat(mat)
    write(fid, *) wsum_mat(mat, ws)
    write(fid, *) wsum(mat, ws, mask)
    write(fid, *) wsum_mat(mat, ws, mat /= 0)
    
    CALL SLEEP(1)    
    call toc()

    ! mean
    call tic("[1.2 mat wmean] --------------")
    write(fid, *) wmean(mat)
    write(fid, *) wmean(mat, ws)
    write(fid, *) wmean(mat, ws, mat /= 0)
    call toc()
    ! ! print *, wsum(array)
    ! call toc

END PROGRAM
