{{alter_column('cleaned_bustabit',["losses","gameWon","gameLost"])}}
select * from {{ref('cleaned_bustabit')}}