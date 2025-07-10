# => train hrmapnet on original split
# bash ./tools/dist_train.sh \
#     ./projects/configs/hrmapnet/hrmapnet_maptrv2_av2_r50_30ep.py \
#     8 \
#     --work-dir work_dirs/hrmapnet_maptrv2_av2_r50_30ep_debug

# # # # # # => train hrmapnet on geosplit
# bash ./tools/dist_train.sh \
#     ./projects/configs/hrmapnet/hrmapnet_maptrv2_av2_r50_30ep_geosplit.py \
#     8 \
#     --work-dir work_dirs/hrmapnet_maptrv2_av2_r50_30ep_geosplit

# # train with larger scope (60m: [-30, 30] for vertical directions)
# bash ./tools/dist_train.sh \
#     ./projects/configs/hrmapnet/hrmapnet_maptrv2_av2_r50_30ep_x30_y30_geosplit.py \
#     8 \
#     --work-dir work_dirs/hrmapnet_maptrv2_av2_r50_30ep_x30_y30_geosplit

bash ./tools/dist_train.sh \
    ./projects/configs/hrmapnet/hrmapnet_maptrv2_av2_r50_30ep_x15_y60_geosplit.py \
    8 \
    --work-dir work_dirs/hrmapnet_maptrv2_av2_r50_30ep_x15_y60_geosplit