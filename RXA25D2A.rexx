/* REXX */                                               
                                                         
numeric digits 40                                        
pull str                                                 
                                                         
/*r = '11-22,95-115,222220-222224'*/                     
total = 0                                                
                                                         
do while str <> ''                                       
  parse var str range ',' str                            
  if range = '' then iterate                             
  parse var range rmin '-' rmax                          
  /* say 'min='rmin '; max='rmax '; len='length(rmin) */ 
  min_even_len = (length(rmin) - (length(rmin) % 2)) * 2 
  if min_even_len > length(rmax) then iterate            
  start = max(10 ** (min_even_len - 1), rmin)            
  /* say 'min_even_len='min_even_len '; start='start */  
  half = substr(start, 1, min_even_len / 2)           
  candidate = 0                                       
  do while candidate <= rmax                          
    /* say 'half='half */                             
    candidate = half''half + 0                        
    if candidate <= rmax & candidate >= rmin then do  
      /* say 'candidate='candidate */                 
      total = total + candidate                       
    end                                               
    half = half + 1                                   
  end                                                 
end                                                   
                                                      
say total                                             
