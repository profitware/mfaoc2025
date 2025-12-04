/* REXX */                     
                               
numeric digits 40              
total = 0                      
                               
drop lines.                    
i = 1                          
do while str <> ''             
  pull str                     
  if strip(str) = '' then leave
  str = strip(str)             
  lines.i = str                
  i = i + 1                    
end                            
lines.0 = i - 1                
                               
call iterateLines              
                                                                   
exit 0                                                             
                                                                   
iterateLines:                                                      
  drop replaced_line.                                              
  do row = 1 to lines.0                                            
    str = lines.row                                                
    replaced_line.row = str                                        
    is_top = row = 1                                               
    is_bottom = row = lines.0                                      
    do col = 1 to length(str)                                      
      char = substr(str, col, 1)                                   
      if char = '@' then do                                        
        /* say row' 'col' 'char */                                 
        adjacent_rolls = 0                                         
        is_c = (is_top | is_bottom) & (col = 1 | col = length(str))
        if \is_c then do                                           
          if \is_top then do                                       
            p = row - 1                                            
            adjacent_rolls = adjacent_rolls + calc(lines.p, col, 0)
          end                                                      
          if \is_bottom then do                                    
            n = row + 1                                            
            adjacent_rolls = adjacent_rolls + calc(lines.n, col, 0)
          end                                                      
          adjacent_rolls = adjacent_rolls + calc(lines.row, col, 1)
        end                                                        
        if is_c | adjacent_rolls < 4 then do                       
          replaced_line.row = replace(replaced_line.row, col)      
          total = total + 1                                        
        end                                                        
      end                                                          
    end                                                            
  end                                                              
  replaced_line.0 = lines.0                                        
  call outputLines                                                   
  say 'total='total                                                  
  return                                                             
                                                                     
calc:                                                                
  parse arg line, col, current                                       
  count = 0                                                          
  if col \= 1 then                                                   
    if substr(line, col - 1, 1) = '@' then count = count + 1         
  if col \= length(line) then                                        
    if substr(line, col + 1, 1) = '@' then count = count + 1         
  if current \= 1 & substr(line, col, 1) = '@' then count = count + 1
  return count                                                       
                                                                     
replace:                                                             
  parse arg str, col                                                 
  pre = substr(str, 1, col - 1)                                      
  post = substr(str, col + 1, length(str))
  return pre'x'post                       
                                          
outputLines:                              
  do i = 1 to replaced_line.0             
    say replaced_line.i                   
  end                                     
  return                                  
