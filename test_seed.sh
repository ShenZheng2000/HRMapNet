# NOTE: experiment for various seed
run_seed_eval () {
    local CONFIG=$1          # *.py config
    local CKPT=$2            # *.pth checkpoint
    local GPUS=${3:-8}       # default 8 GPUs

    # ⇣  Pick well-spaced seeds to maximise RNG diversity
    local SEEDS=(0 42 123 999 2025 9999)

    for S in "${SEEDS[@]}"; do
        echo -e "\n▶ seed=${S}  ─ $(date)\n"

        bash tools/dist_test_map.sh \
             "${CONFIG}" "${CKPT}" "${GPUS}" \
             --seed "${S}" \
             2>&1                 # ← capture stderr, too
    done
}

# ---------- run the sweep on one or more configs -----------------
run_seed_eval \
  projects/configs/hrmapnet/hrmapnet_maptrv2_av2_r50_30ep.py \
  work_dirs/hrmapnet_maptrv2_av2_r50_30ep/epoch_30.pth \
  8

run_seed_eval \
  projects/configs/hrmapnet/hrmapnet_maptrv2_av2_r50_30ep_geosplit.py \
  work_dirs/hrmapnet_maptrv2_av2_r50_30ep_geosplit/epoch_30.pth \
  8

# bash test_seed.sh | tee work_dirs/seed_7_7.log
# TODO: after all these, try the same thing for maptrv2