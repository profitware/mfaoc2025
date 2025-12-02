/* REXX */                                        
                                                  
counter = 0                                       
current = 50                                      
do while input_string <> ''                       
  pull input_string                               
  a = strip(input_string)                         
  if a = '' then leave                            
  sign = substr(a, 1, 1)                          
  number = substr(a, 2)                           
  snum = 1                                        
  if sign = 'L' then snum = -1                    
  addme = snum * number                           
  current = current + addme                       
  if current // 100 = 0 then counter = counter + 1
end                                               
say counter                                       

