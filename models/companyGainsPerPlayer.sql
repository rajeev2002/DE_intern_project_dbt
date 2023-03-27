with playerStatistics as(
    select * from {{ref('playerStatistics')}}
)

select username, (losses-profit) as gains from playerStatistics