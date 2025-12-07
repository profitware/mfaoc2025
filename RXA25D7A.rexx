/* REXX */                     
                               
total = 0                      
numeric digits 40              
                               
drop output.                   
row = 0                        
initial_idx = 0                
prev_line = ''                 
say '--- INPUT ---'            
say ' '                        
do while str <> ''             
  pull str                     
  if strip(str) = '' then leave
  str = strip(str)             
  say str                      
  row = row + 1                                                      
  new_line = ''                                                      
  do i = 1 to length(str)                                            
    old_symbol = substr(str, i, 1)                                   
    if old_symbol = 'S' & row = 1 then do                            
      initial_idx = i                                                
      new_symbol = 'S'                                               
    end                                                              
    else if row = 2 & i = initial_idx then do                        
      new_symbol = '|'                                               
    end                                                              
    else if substr(prev_line, i, 1) = '|' & old_symbol \= '^' then do
      new_symbol = '|'                                               
    end                                                              
    else if old_symbol = '^' then do                                 
      new_line = substr(new_line, 1, length(new_line) - 1)           
      new_line = new_line||'|^'                                      
      new_symbol = '|'                     
      if substr(prev_line, i, 1) = '|' then
        total = total + 1                  
      i = i + 1                            
    end                                    
    else do                                
      new_symbol = old_symbol              
    end                                    
    new_line = new_line||new_symbol        
  end                                      
  output.row = new_line                    
  prev_line = new_line                     
end                                        
output.0 = row                             
                                           
say ' '                                    
say '--- OUTPUT ---'                       
say ' '               
do row = 1 to output.0
  say output.row      
end                   
say ' '               
say 'total='total     
