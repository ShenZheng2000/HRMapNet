# _base_ = [
#     'hrmapnet_maptrv2_av2_r50_30ep_geosplit.py',
# ]

# # ─── shared constants ────────────────────────────────────────────────────────
# _dim_        = 256
# _num_levels_ = 1

# # ─── new spatial scope ───────────────────────────────────────────────────────
# # point_cloud_range = [-30.0, -15.0, -5.0, 30.0, 15.0, 3.0]
# point_cloud_range = [-30.0, -30.0, -5.0, 30.0, 30.0, 3.0] # NOTE: expand the range to [-30, 30] for both x and y dimensions

# bev_h_ = 100
# # bev_w_ = 200
# bev_w_ = 100 # NOTE: reduce bev_w to 100 (so h/w = 1.0)

# # voxel_size = [0.15, 0.15, 8.0]
# voxel_size = [0.3, 0.3, 8.0] # NOTE: voxel_size = point_cloud_range (one side) / bev_h or w

# grid_size = [512, 512, 1] # NOTE: keep the same as the original config (more like placeholder)

# # post_center_range=[-35, -20, -35, -20, 35, 20, 35, 20]  # (x_min, y_min, x_min, y_min, x_max, y_max, x_max, y_max)
# post_center_range = [-35.0, -35.0, -35.0, -35.0, 35.0, 35.0, 35.0, 35.0] # 5m border for each dimension


# # ─── dataset tweaks ──────────────────────────────────────────────────────────
# data = dict(
#     train=dict(pc_range=point_cloud_range, bev_size=(bev_h_, bev_w_)),
#     val=dict(  pc_range=point_cloud_range, bev_size=(bev_h_, bev_w_)),
#     test=dict( pc_range=point_cloud_range, bev_size=(bev_h_, bev_w_)),
# )

# # ─── map-level settings ──────────────────────────────────────────────────────
# map_cfg = dict(pc_range=point_cloud_range, bev_h=bev_h_, bev_w=bev_w_)

# # ─── model-level overrides ───────────────────────────────────────────────────
# model = dict(
#     global_map_cfg=map_cfg,
#     pts_bbox_head=dict(
#         bev_h=bev_h_,
#         bev_w=bev_w_,
#         bbox_coder=dict(
#             pc_range=point_cloud_range,
#             post_center_range=post_center_range,
#             bev_h=bev_h_,
#             bev_w=bev_w_,
#             voxel_size=voxel_size,
#         ),
#         positional_encoding=dict(
#             row_num_embed=bev_h_,    # ← fixed
#             col_num_embed=bev_w_,    # ← fixed
#         ),
#         transformer=dict(
#             map_encoder=dict(
#                 pc_range=point_cloud_range,
#                 transformerlayers=dict(
#                     attn_cfgs=[
#                         dict(
#                             type='TemporalSelfAttention',
#                             embed_dims=_dim_,
#                             num_levels=_num_levels_,
#                         ),
#                         dict(
#                             type='SpatialCrossAttention',
#                             pc_range=point_cloud_range,
#                             num_cams=7,
#                             deformable_attention=dict(
#                                 type='MSDeformableAttention3D',
#                                 embed_dims=_dim_,
#                                 num_points=8,
#                                 num_levels=_num_levels_,
#                             ),
#                             embed_dims=_dim_,
#                         )
#                     ]
#                 ),
#             ),
#             encoder=dict(
#                 pc_range=point_cloud_range,
#                 voxel_size=voxel_size,
#                 ),
#         ),
#     ),
#     train_cfg=dict(
#         pts=dict(
#             point_cloud_range=point_cloud_range,
#             grid_size=grid_size,   # ← added
#             voxel_size=voxel_size,
#         )
#     ),
# )