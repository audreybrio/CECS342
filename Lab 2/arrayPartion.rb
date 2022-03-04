#CECS 342 Sec 5

def arrayP(n,x)
  test = 0
  copy = n.clone
  t = Array.new
  #looping through arrray one time
  for i in 0..n.size-1
   # if test is larger than value
   if x > n[i]
     #create temp var
        temp = n[i]
       # delete instance of it
        n.delete_at(i)
        #add it to beginning
        n.unshift(temp)
   else
     #add vars arger then test to new array
     t.append(n[i])
   end
  end
#find the test value
  if t.size >= 1
     test = n.index(t[0]) - 1
     if test == -1
       cool = "Everything is greater than the test value"
     else
       cool = ''
     end
  else
    test = n.size-1
  end

#prining things
  puts "Original list: #{copy}"
  puts "New list #{n}"
  puts "Partition index: #{test} " "#{cool}"

end

arrayP([34,2,44,36,43,15,27,28,12,13,14,14,3,5,55],28)


