_base_ = [
    'hrmapnet_maptrv2_av2_r50_30ep.py',
]


# NOTE: add data_root here and use it as pose_root
data_root = 'data/argoverse2_mc_geosplit/sensor/' # NOTE: change to geosplit data

# img_norm_cfg = dict(
#     mean=[123.675, 116.28, 103.53], std=[58.395, 57.12, 57.375], to_rgb=True)
# map_classes = ['divider', 'ped_crossing', 'boundary']

# test_pipeline = [
#     dict(type='CustomLoadMultiViewImageFromFiles', to_float32=True, padding=True),
#     # dict(type='RandomScaleImageMultiViewImage', scales=[0.3]), # NOTE: increase scale to 0.6!!!!!!!!!
#     dict(type='NormalizeMultiviewImage', **img_norm_cfg),

#     dict(
#         type='MultiScaleFlipAug3D',
#         img_scale=(2048, 2048),  # 2048*0.3, 2048*0.3
#         pts_scale_ratio=1,
#         flip=False,
#         transforms=[
#             dict(type='PadMultiViewImage', size_divisor=32),
#             dict(
#                 type='DefaultFormatBundle3D',
#                 with_gt=False,
#                 with_label=False,
#                 class_names=map_classes),
#             dict(type='CustomCollect3D', keys=['img'])
#         ])
# ]


data = dict(
    # NOTE:  reduce batch size to avoid  oom error
    samples_per_gpu=3,
    train=dict(
        data_root=data_root,
        ann_file=data_root + 'av2_map_infos_train.pkl',
        ),
    val=dict(
        data_root=data_root,
        ann_file=data_root + 'av2_map_infos_val.pkl',
        map_ann_file=data_root + 'av2_gt_map_anns_val_2hz.json',
        # pipeline=test_pipeline,
    ),
    test=dict(
        data_root=data_root,
        ann_file=data_root + 'av2_map_infos_val.pkl',
        map_ann_file=data_root + 'av2_gt_map_anns_val_2hz.json',
        # pipeline=test_pipeline,
    )
)

# NOTE: for HRMapNet only, no need for maptrv2
map_cfg = dict(
    pose_root=data_root,
)

model = dict(
    global_map_cfg=map_cfg,
)

# evaluation = dict(interval=5, pipeline=test_pipeline, metric='chamfer')