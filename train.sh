# => train hrmapnet on original split
# bash ./tools/dist_train.sh \
#     ./projects/configs/hrmapnet/hrmapnet_maptrv2_av2_r50_30ep.py \
#     8 \
#     --work-dir work_dirs/hrmapnet_maptrv2_av2_r50_30ep_debug

# # # # # # # => train hrmapnet on geosplit
# bash ./tools/dist_train.sh \
#     ./projects/configs/hrmapnet/hrmapnet_maptrv2_av2_r50_30ep_geosplit.py \
#     8 \
#     --work-dir work_dirs/hrmapnet_maptrv2_av2_r50_30ep_geosplit

# # train with larger scope
# bash ./tools/dist_train.sh \
#     ./projects/configs/hrmapnet/hrmapnet_maptrv2_av2_r50_30ep_x30_y30_geosplit.py \
#     8 \
#     --work-dir work_dirs/hrmapnet_maptrv2_av2_r50_30ep_x30_y30_geosplit

# bash ./tools/dist_train.sh \
#     ./projects/configs/hrmapnet/hrmapnet_maptrv2_av2_r50_30ep_x15_y60_geosplit.py \
#     8 \
#     --work-dir work_dirs/hrmapnet_maptrv2_av2_r50_30ep_x15_y60_geosplit

# # train and test on map change dataset \
# (created from: /home/shenzheng_google_com/Projects/Inf_Perception/Scripts/Group/make_resplit_symlinks.py)
# Leave one GPU for now.
# bash ./tools/dist_train.sh \
#     ./projects/configs/hrmapnet/hrmapnet_maptrv2_av2_mc_r50_30ep_geosplit.py \
#     7 \
#     --work-dir work_dirs/hrmapnet_maptrv2_av2_mc_r50_30ep_geosplit