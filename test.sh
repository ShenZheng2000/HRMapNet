# NOTE: all these are PRETRAIN and test.

# => test
# bash ./tools/dist_test_map.sh \
#     ./projects/configs/hrmapnet/hrmapnet_maptrv2_av2_r50_30ep.py \
#     ./pretrained/hrmapnet_maptrv2_av2_ep30.pth 8

# bash ./tools/dist_test_map.sh \
#     ./projects/configs/hrmapnet/hrmapnet_maptrv2_av2_r50_30ep_geosplit.py \
#     ./pretrained/hrmapnet_maptrv2_av2_ep30.pth 8

# bash tools/dist_test_map.sh \
#     projects/configs/hrmapnet/hrmapnet_maptrv2_av2_mc_r50_30ep_geosplit.py \
#     work_dirs/hrmapnet_maptrv2_av2_r50_30ep_geosplit/epoch_30.pth 8