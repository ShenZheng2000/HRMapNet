# => train hrmapnet on original split
bash ./tools/dist_train.sh \
    ./projects/configs/hrmapnet/hrmapnet_maptrv2_av2_r50_30ep.py \
    4 \
    --work-dir work_dirs/hrmapnet_maptrv2_av2_r50_30ep

# # => train hrmapnet on geosplit (TODO: empty prediction bugs, need to fix later)
# bash ./tools/dist_train.sh \
#     ./projects/configs/hrmapnet/hrmapnet_maptrv2_av2_r50_30ep_geosplit.py \
#     4 \
#     --work-dir work_dirs/hrmapnet_maptrv2_av2_r50_30ep_geosplit