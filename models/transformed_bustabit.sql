{% if execute %}
  ALTER TABLE bustabitdb.public.cleaned_bustabit
  ADD COLUMN losses double, gameWon int ,gameLost int;

  UPDATE bustabitdb.public.cleaned_bustabit
    SET losses = CASE   
    WHEN profit =0 THEN bet  
    ELSE 0  
    END ; 

    UPDATE bustabitdb.public.cleaned_bustabit
    SET gameWon = CASE   
    WHEN profit=0 THEN 0  
    ELSE 1  
    END ;

    UPDATE bustabitdb.public.cleaned_bustabit  
    SET gameLost = CASE   
    WHEN profit=0 THEN 1  
    ELSE 0  
    END ;
{% endif %}
select * from bustabitdb.public.cleaned_bustabit