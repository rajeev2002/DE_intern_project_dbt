with transformed_bustabit as(
    select *,to_date(playdate) as date from {{ref('transformed_bustabit')}}
)
,
final as(
select date,count(distinct Id) as games ,count(distinct username) as users from transformed_bustabit group by date
)
select * from final