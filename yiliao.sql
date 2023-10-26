select
     city,
     cast((max(city_user_cnt) / max(sum_user_cnt)) as decimal(4,4)) as ratio,
     max(city_user_cnt) ,
     max(sum_user_cnt)

from
(
     select
          city,
          count(1) over(partition by city) as city_user_cnt,
          count(1) over(partition by 1) as sum_user_cnt
     from
     (
          select
               user_id,
               city,
               event_time,
               row_number() over(partition by user_id order by event_time desc) as rn
          from dwd_log_app_enter_page_di 
          where ds >= '20230101'
          and ds < '20230901'
          and event_name = 'enter_page'
          and page_id regexp 'HHOnlineInquiryChatController'
          and city is not null
          union all 
          select
               distinct_id as user_id,
               city,
               event_time,
               row_number() over(partition by distinct_id order by event_time desc) as rn
          from dwd_log_app_app_screen_view_di 
          where ds >= '20230101'
          and ds < '20230901'
          and city is not null
          and screen_name regexp 'HHOnlineInquiryChatController'
     )t1 where rn = 1
)t group by city

limit 100;