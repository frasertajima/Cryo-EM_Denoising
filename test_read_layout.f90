program test_read_layout
    implicit none

    real(4) :: array(1, 4, 4, 2)
    integer :: i, j, b

    ! Read the binary file
    open(unit=100, file='test_layout3.bin', form='unformatted', access='stream', status='old')
    read(100) array
    close(100)

    print *, "Fortran read array(1, 4, 4, 2)"
    print *, ""

    print *, "Batch 1 (array(1,:,:,1)):"
    do i = 1, 4
        print '(4F8.1)', (array(1, i, j, 1), j=1, 4)
    end do
    print *, ""

    print *, "Batch 2 (array(1,:,:,2)):"
    do i = 1, 4
        print '(4F8.1)', (array(1, i, j, 2), j=1, 4)
    end do
    print *, ""

    ! Check specific values
    if (array(1, 1, 1, 1) == 0.0 .and. array(1, 4, 4, 1) == 15.0 .and. &
        array(1, 1, 1, 2) == 16.0 .and. array(1, 4, 4, 2) == 31.0) then
        print *, "✓ PASS: Values match expected!"
    else
        print *, "✗ FAIL: Values don't match"
        print *, "  Expected: (1,1,1,1)=0, (1,4,4,1)=15, (1,1,1,2)=16, (1,4,4,2)=31"
        print '(A,4F8.1)', "  Got: ", array(1,1,1,1), array(1,4,4,1), array(1,1,1,2), array(1,4,4,2)
    endif

end program test_read_layout
