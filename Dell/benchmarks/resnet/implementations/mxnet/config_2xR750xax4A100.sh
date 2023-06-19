source $(dirname ${BASH_SOURCE[0]})/config_R750xax4A100-SXM-80GB_common.sh
export MXNET_DETERMINISTIC=1

## DL params
export OPTIMIZER="sgdwfastlars"
#export BATCHSIZE="204"
export BATCHSIZE="408"
export KVSTORE="horovod"
#export LR="10.5"
export LR="12.5"
export WARMUP_EPOCHS="2"
export EVAL_OFFSET="2" # Targeting epoch no. 35
export EVAL_PERIOD="4"
export WD="5.0e-05"
export MOM="0.9"
export LARSETA="0.001"
export LABELSMOOTHING="0.1"
export LRSCHED="pow2"
export NUMEPOCHS=${NUMEPOCHS:-"37"}

export NETWORK="resnet-v1b-stats-fl"
export MXNET_CUDNN_NHWC_BN_ADD_HEURISTIC_BWD=0
export MXNET_CUDNN_NHWC_BN_ADD_HEURISTIC_FWD=0

export DALI_THREADS="6" #6
export DALI_PREFETCH_QUEUE="5" #5
export DALI_NVJPEG_MEMPADDING="256"
export DALI_HW_DECODER_LOAD="0"
export DALI_CACHE_SIZE="0"
export DALI_ROI_DECODE="1"

#for DALI eval
export DALI_EVAL_THREADS="5"
export DALI_EVAL_PREFETCH_QUEUE="15"
export DALI_EVAL_HW_DECODER_LOAD="0"

#DALI buffer presizing hints
export DALI_PREALLOCATE_WIDTH="5980"
export DALI_PREALLOCATE_HEIGHT="6430"
export DALI_DECODER_BUFFER_HINT="1315942" #1196311*1.1
export DALI_CROP_BUFFER_HINT="165581" #150528*1.1
export DALI_TMP_BUFFER_HINT="355568328" #871491*batch_size
export DALI_NORMALIZE_BUFFER_HINT="441549" #401408*1.1

export HOROVOD_CYCLE_TIME=0.1
export HOROVOD_FUSION_THRESHOLD=67108864
export HOROVOD_NUM_NCCL_STREAMS=2
export MXNET_HOROVOD_NUM_GROUPS=1
export MXNET_EXEC_BULK_EXEC_MAX_NODE_TRAIN_FWD=999
export MXNET_EXEC_BULK_EXEC_MAX_NODE_TRAIN_BWD=999

## System run parms
export DGXNNODES=2
export DGXSYSTEM=$(basename $(readlink -f ${BASH_SOURCE[0]}) | sed 's/^config_//' | sed 's/\.sh$//' )
export WALLTIME=00:40:00

#export NCCL_SOCKET_IFNAME=
export OMPI_MCA_btl_openib_if_include=mlx5_0:1
export UCX_NET_DEVICES=mlx5_0:1

export NCCL_MAX_RINGS=4
#Single rail
export OMPI_MCA_btl_openib_if_include=hfi1_0:1
export UCX_NET_DEVICES=hfi1_0:1
#Dual rails
#export OMPI_MCA_btl_openib_if_include=hfi1_0:1,hfi1_1:1
#export UCX_NET_DEVICES=hfi1_0:1,hfi1_1:1
