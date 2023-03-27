with transformed_bustabit as(
    select *,to_date(playdate) as date from {{ref('transformed_bustabit')}}
)
,
final as(
select date, sum(
CASE 
When profit=0 then bet
ELSE -1*profit 
END) 
as profit from transformed_bustabit group by date
)
select * from final