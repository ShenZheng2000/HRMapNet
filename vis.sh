# NOTE: single-gpu is very slow. 
# original split
python tools/maptrv2/av2_vis_pred.py \
    projects/configs/hrmapnet/hrmapnet_maptrv2_av2_r50_30ep.py \
    work_dirs/hrmapnet_maptrv2_av2_r50_30ep/epoch_30.pth \
    --show-dir work_dirs/hrmapnet_maptrv2_av2_r50_30ep/vis_pred

# # geo-split
# python tools/maptrv2/av2_vis_pred.py \
#     projects/configs/hrmapnet/hrmapnet_maptrv2_av2_r50_30ep_geosplit.py \
#     work_dirs/hrmapnet_maptrv2_av2_r50_30ep_geosplit/epoch_30.pth \
#     --show-dir work_dirs/hrmapnet_maptrv2_av2_r50_30ep_geosplit/vis_pred

# (optional) merge into videos => /path/to/MapTR/work_dirs/experiment/
# python tools/maptr/generate_video.py /path/to/visualization/directory