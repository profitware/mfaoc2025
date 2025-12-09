/* REXX */                      
                                
total = 0                       
numeric digits 20               
                                
row = 0                         
drop input.                     
say '--- INPUT ---'             
say ' '                         
do while str <> ''              
  pull str                      
  if strip(str) = '' then leave 
  str = strip(str)              
  row = row + 1                 
  input.row = str               
  say str                       
end                                         
input.0 = row                               
                                            
say ''                                      
say '--- OUTPUT ---'                        
max_dim = 0                                 
do j = 1 to input.0                         
  do i = 1 to input.0                       
    parse var input.i xi ',' yi             
    parse var input.j xj ',' yj             
    sq = abs(xi - xj + 1) * abs(yi - yj + 1)
    say input.i' * 'input.j' sq 'sq         
    max_dim = max(max_dim, sq)              
  end                                       
end                                         
                                            
say 'max_dim='max_dim                       
