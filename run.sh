# (optionally) pip install nuscenes-devkit
# pip install numpy==1.23.0
# pip install "av2<0.2.0"
# pip install networkx==2.3 
# pip install yapf==0.40.1
# pip install setuptools==59.5.0

# NOTE: use this (hrmapnet39) for av2 pkl generation

# test
# bash ./tools/dist_test_map.sh \
#     ./projects/configs/hrmapnet/hrmapnet_maptrv2_av2_r50_30ep.py \
#     ./pretrained/hrmapnet_maptrv2_av2_ep30.pth 1

# bash ./tools/dist_test_map.sh \
#     ./projects/configs/hrmapnet/hrmapnet_maptrv2_av2_r50_30ep_geosplit.py \
#     ./pretrained/hrmapnet_maptrv2_av2_ep30.pth 1

# bash ./tools/dist_train.sh ./projects/configs/hrmapnet/hrmapnet_maptrv2_av2_r50_30ep.py 1