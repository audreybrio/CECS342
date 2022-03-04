!CECS 342 Sec 5
!Assignment 5        

!main
        program array
        implicit none
!initialize vars
        integer i, temp, t, j, m, k, num, N
        logical s
        parameter (N=10)
        integer A(N)
        s = .true.
!get input from users for array of size 10
        write(*, '(a)') 'Enter 10 numbers separated by commas:'
        read(*,*) A
        write(*,*) 'array: ', A
!sorting array
        do 11 i = 1, N-1
           do 22 j = i+1, N
              if(A(i).GT.A(j)) then
                      temp = A(i)
                      A(i) = A(j)
                      A(j) = temp
              endif
22         continue
11       continue
        write(*,*) 'Sorted array: ', A
!loop to find number in array, keeps going til finds match 
        do while (s)
           write(*,'(a)') 'Enter a number: '
           read(*,*) num
           do 12 k = 1, N
              if (A(k).EQ.num) then
                      write(*,*) 'Match found! ', num
                      s= .false.
              endif
12         continue
        enddo


        stop
        end                                                                                ~                                                                                   ~                                                                                   ~              