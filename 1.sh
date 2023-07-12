python3 ods/mongo/bi_live_like_collection_share_collect/s_mongo_bi_live_like_collection_share_collect.py --env test --bizdate 20221118  > /root/zsy/logs/bi_live.log
python3 ods/mongo/platform_topic_management_topic_category/s_mongo_platform_topic_management_topic_category.py --env test --bizdate 20221118  > /root/zsy/logs/datax_topic_category.log
./utils/hive_sql_executor_test_with_beeline.py ods/hbase/dw_topic_visit_log/s_hbase_dw_topic_visit_log_delta.sql --date 20221118  > /root/zjw/logs/s_hbase_dw_topic_visit_log_delta.log

./utils/hive_sql_executor_test_with_beeline.py dwd/dwd_feed_feed_info_df.sql --date 20221118  --extra_args "{'db':'tmp'}" > /root/zsy/logs/dwd_feed.log
./utils/hive_sql_executor_test_with_beeline.py dwd/dwd_user_user_info_df.sql --date 20221118  --extra_args "{'db':'tmp'}"  > /root/zsy/logs/dwd_user.log

./utils/hive_sql_executor_test_with_beeline.py ads/sns/dashboard/topic/ads_dashboard_topic_base_index_by_day_1d.sql --date 20221118  > /root/zsy/logs/ads_topic_by_day.log
./utils/hive_sql_executor_test_with_beeline.py ads/sns/dashboard/topic/ads_dashboard_topic_detail_index_by_topic_1d.sql --date 20221118 > /root/zsy/logs/ads_topic_by_topic.log


cpp.s_mysql_meow_mutual_help_um_t_user_login_record
cpp.s_mysql_meow_mutual_help_um_um_user_login_record



select  * from ext_hbase_dw_topic_visit_log where event_timestamp > 1668700800 limit 10;

select  * from ads_dashboard_topic_detail_index_by_topic_1d where ds = '20221118' limit 10;


select  * from dwd_feed_feed_info_df where ds = '20221118' and  date_format(substr(create_time,1,10),'yyyyMMdd') = '20221118'
limit 10;



select  id,max(category_name),collect_set(category_name) from s_mongo_platform_topic_management_topic_category group by id limit 10;



