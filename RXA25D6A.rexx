/* REXX */                
                          
numeric digits 40         
                          
total = 0                 
                          
drop rmul.                
drop rsum.                
                          
last_line = 0             
row = 0                   
do while val <> ''        
  pull input              
  if input = '' then leave
  row = row + 1           
  i = 0                   
  do while val <> ''      
    parse var input val input                 
    if val = '' then leave                    
    i = i + 1                                 
    if val \= '*' & val \= '+' then do        
      if row = 1 then do                      
        rsum.i = val                          
        rmul.i = val                          
      end                                     
      else do                                 
        rsum.i = rsum.i + val                 
        rmul.i = rmul.i * val                 
      end                                     
    end                                       
    else do                                   
      if val = '+' then total = total + rsum.i
      if val = '*' then total = total + rmul.i
      last_line = 1                           
    end                                       
  end                        
  val = 'val'                
  if last_line = 1 then leave
end                          
                             
say 'total='total            
