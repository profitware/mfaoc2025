/* REXX */                         
                                   
numeric digits 40                  
                                   
total = 0                          
                                   
drop rmin.                         
drop rmax.                         
                                   
i = 0                              
do while range <> ''               
  pull range                       
  if range = '' then leave         
  i = i + 1                        
  parse var range rmin.i '-' rmax.i
end                                

rmin.0 = i                                                     
rmax.0 = i                                                     
                                                               
do while ingridient <> ''                                      
  pull ingridient                                              
  if ingridient = '' then leave                                
  is_good = 0                                                  
  do j = 1 to rmin.0                                           
    /* say 'ingridient='ingridient 'min='rmin.j 'max='rmax.j */
    if ingridient >= rmin.j & ingridient <= rmax.j then do     
      is_good = 1                                              
      leave                                                    
    end                                                        
  end                                                          
  if is_good then total = total + 1                            
end                                                            
                                                               
say 'total='total                                              
