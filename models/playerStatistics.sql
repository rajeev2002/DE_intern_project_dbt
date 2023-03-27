with transformed_bustabit as(
    select * from {{ref('transformed_bustabit')}}
)
,
final as (
select username,avg(cashedout) as averageCashedout, avg(bet) as averageBet,sum(profit) as profit,sum(gameWon) as gameWon,
sum(gameLost) as gameLost,sum(losses) as losses from transformed_bustabit group by username )

select * from final