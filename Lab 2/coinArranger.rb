#CECS 342 Sec 5


def coin()
  c = "HHHHHTTTTT"
  #get frist move
  puts "Move #1"
  m_1 = select(c)
  m_11 = m_1+1
  #find where to move to
  selection = move(c)
  #splits string
  coins = c.split""
  #temp vars
  temp_1 = coins.at(m_1)
  temp_2 = coins.at(m_11)
  #if move to right end
  if selection == -1
    coins.append(temp_1)
    coins.append(temp_2)
    coins.delete_at(m_1)
    coins.delete_at(m_1)
    coins.insert(m_1,'-')
    coins.insert(m_11,'-')
  #if move to left end
  else
    m_1 = m_1+2
    m_11 = m_11+2
    coins.insert(0,temp_1)
    coins.insert(1,temp_2)
    coins.delete_at(m_1)
    coins.delete_at(m_11)
    coins.insert(m_1, '-')
    coins.insert(m_11, '-')
  end
  #join together and print
  c = coins.join ''
  #get which piece would live to move for second turn
  puts ''
  puts "Move #2"
  m_2 = select(c)
  m_22 = m_2 +1
  #split up string
  coins = c.split ''
  #if user selected piece to move that wasnt allowed
  while true
    if coins[m_22] == '-'or coins[m_2] == '-'
      puts "Sorry cant make that choice"
     #user makes a new choice
      m_2 = select(c)
      m_22 = m_2 +1
    else
      break
  end
  end
  #find place where to move peice to
  m_1 = move(c)
  m_11 = m_1+1
  #if piece isnt moved to correct space, try again
  while true
    if coins[m_1] != '-'
      puts 'sorry cant move there'
      m_1 = move(c)
      m_11 = m_1 +1
    elsif coins[m_1] == '-' and coins[m_11] != '-'
      puts 'sorry cant move there'
      m_1 = move(c)
      m_11 = m_1+1
    else
      break
    end
  end
  #insert new piece into old place and have og place become free for next peice to move there
  temp_3 = coins.at(m_2)
  temp4 = coins.at(m_22)
  coins.delete_at(m_1)
  coins.delete_at(m_1)
  coins.insert(m_1, temp_3)
  coins.insert(m_11, temp4)
  coins.delete_at(m_2)
  coins.delete_at(m_2)
  coins.insert(m_2, '-')
  coins.insert(m_22,'-')
  c = coins.join ''
  #which piece to move for 3rd move
  puts ''
  puts "Move #3"
  m3 = select(c)
  m33 = m3+1
  coins = c.split ''
  #make sue coin is valid coin to move
  while true
    if coins[m3] == '-' or coins[m33] == '-'
      puts "sorry cant make that choice"
      #if cant move coin ask for new coin to move
      m3 = select(c)
      m33 = m3 +1
    else
      break
    end
  end
  #where to move coins to
  m_2 = move(c)
  m_22 = m_2 +1
  #make sure user moves coin to right spot
  while true
    if coins[m_2] !=  '-'
      puts 'sorry cant make that choice'
      m_2 = move(c)
      m_22 = m_2 +1
    elsif coins[m_2] == '-' and coins[m_22] != '-'
      puts 'sorry cant make that choice '
      m_2 = move(c)
      m_22 = m_2+1
    else
      break
    end
  end
  #move coin to new spot, keep track of where moved from
  temp5 = coins.at(m3)
  temp6 = coins.at(m33)
  coins.delete_at(m_2)
  coins.delete_at(m_2)
  coins.insert(m_2, temp5)
  coins.insert(m_22, temp6)
  coins.delete_at(m3)
  coins.delete_at(m3)
  coins.insert(m3,'-')
  coins.insert(m33,'-')
  c = coins.join ''
  #move coin for 4th turn
  puts ''
  puts "Move #4"
  m4 = select(c)
  m44 = m4+1
  coins = c.split ''
  #make sure coin is valid to move
  while true
    if coins[m4] == '-' or coins[m44] == '-'
      puts 'sorry cant make that choice'
      #if not ask for it again
      m4 = select(c)
      m44 = m4+1
    else
      break
    end
  end
  #user input on where to move coin to
  m3 = move(c)
  m33 = m3+1
  #make sure coin is moved to correct spot
  while true
    if coins[m3] != '-'
      puts 'sorry cant make that choice'
      #if not ask again
      m3 = move(c)
      m33 = m3+1
    elsif coins[m3] == '-' and coins[m33] != '-'
      puts 'sorry cant make that choice'
      m3 = move(c)
      m33 = m3+1
    else
      break
    end
  end
  #move coin to correct spot, keep track of where moved coin from
  temp7 = coins.at(m4)
  temp8 = coins.at(m44)
  coins.delete_at(m3)
  coins.delete_at(m3)
  coins.insert(m3,temp7)
  coins.insert(m33,temp8)
  coins.delete_at(m4)
  coins.delete_at(m4)
  coins.insert(m4, '-')
  coins.insert(m44,'-')
  c = coins.join ''
  #move coin for 5th turn (final turn)
  puts ''
  puts "Move #5 (final move)"
  m5 = select(c)
  m55 = m5+1
  coins = c.split ''
  #make sure coin is valid to move
  while true
    if coins[m5] =='-' or coins[m55] == '-'
      puts 'sorry cant make that choice'
     #if not ask for it again
     m5 = select(c)
     m55 = m55+1
    else
      break
    end
  end
  #get user input of where to move coin to
  m4 = move(c)
  m44 = m4 + 1
  #if correct spot to move coin to
  while true
    if coins[m4] != '-'
      puts 'sorry cant make that choice'
      #if not ask for it again
      m4 = move(c)
      m44 = m4+1
    elsif coins[m4] == '-' and coins[m44] != '-'
      puts 'sorry cant make that choice'
      m4 = move(c)
      m44 = m4+1
    else
      break
    end
  end
  #move coin to correct spot
  temp9 = coins.at(m5)
  temp10 = coins.at(m55)
  coins.delete_at(m4)
  coins.delete_at(m4)
  coins.insert(m4,temp9)
  coins.insert(m44,temp10)
  coins.delete_at(m5)
  coins.delete_at(m5)
  #final solution
  c = coins.join ''
 # puts c
  puts "Final Solution: #{c}"

end

#method for user to select which coin they would like to move
def select(c)
  puts c
  move = 0
  temp = true
  try = '^'
  puts 'which piece would you like to move'
  #loop to keep going until user makes selection
  while temp
      #allows user to move r/l with pointer being uder the piece
      puts c
      puts try
      puts 'move left, move right or stop? (L/R/S)'
      answer = gets.chomp
      #if user moves right
      if answer == 'R' or answer == 'r'
        #need to add a space so points under right place
          move = move + 1
          t = try.split ''
          t.insert(0,' ')
          try = t.join ''
      #if user moves left
      elsif answer == 'L' or answer == 'l'
        #subtract a space to make curser under right place
        move = move - 1
        t = try.split ''
        t.delete_at(0)
        try = t.join ''
      #if click s (done)
      else
        #save the placement of which coin they want to move
        return move
        break
      end
      end
end

#allows user input to see where they want to move coin to
def move(c)
  s = c.split ''
  is =false
  m = 0
  #see if there are - in string ie not the first move
  for i in s
    if i == '-'
      is = true
      break
    end
    end
  #if there are - in string
  if is == true
    #tell user to move to left most -
    try = '^'
    puts 'move piece to L most - open'
    #move r/l til get to left most -
    while true
      puts c
      puts try
      puts 'move right, mov left, stop (L/R/S)'
      answer = gets.chomp
      #if user moves right so curser is in right placement
      if answer == 'R' or answer == 'r'
        m = m+1
        t = try.split ''
        t.insert(0,' ')
        try = t.join ''
        #if user moves l so curser is in right placement
      elsif answer == 'L' or answer == 'l'
        m = m-1
        t = try.split ''
        t.delete_at(0)
        try = t.join ''
      #if user seleccts stop
      else
        #return space of where to move coins to
        return m
        break
      end
    end
  #if its the first omove
  else
    #move to right or left end
    puts 'move to right or left end? (R/L)'
    ans = gets.chomp
    #right end
    if ans == "R" or ans == "r"
      m = -1
    #left end
    else
      m = -2
    end
  end
end

coin()