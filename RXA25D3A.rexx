/* REXX */                              
                                        
numeric digits 40                       
total = 0                               
                                        
do while str <> ''                      
  pull str                              
  if strip(str) = '' then leave         
  str = strip(str)                      
  say str                               
  revstr = reverse(str)                 
  say revstr                            
  first_max = -1                        
  first_max_idx = -1                    
  do i = 1 to length(str) - 1           
    current_digit = substr(str, i, 1)   
    if current_digit > first_max then do
      first_max = current_digit                      
      first_max_idx = i                              
    end                                              
  end                                                
  second_max = -1                                    
  second_max_idx = -1                                
  do i = 1 to length(str) - first_max_idx            
    current_digit = substr(revstr, i, 1)             
    if current_digit > second_max then do            
      second_max = current_digit                     
      second_max_idx = i                             
    end                                              
  end                                                
  current_joltage = (first_max''second_max + 0)      
  say current_joltage '; len='length(revstr)         
  say '   fidx='first_max_idx '; sidx='second_max_idx
  total = total + current_joltage                    
end                                                  
         
say total
