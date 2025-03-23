
model_name="qwen2vl-7B"
dataset_name="hm"
mode="qlora_classifier"

current_date=$(date +"%Y-%m-%d")
Name="${mode}${additional_args}"
export WANDB_PROJECT="LLAMAFACTORY_hateful"
#export WANDB_NAME=$Name
export RUN_NAME=$Name
export DATE=$current_date
export WANDB_RUN_GROUP="Finetuning_${model_name}_${dataset_name}_${current_date}"
which python

envsubst < my_configs/hateful/${dataset_name}/${model_name}_${mode}${additional_args}.yaml > my_configs/hateful/${dataset_name}/${model_name}_${mode}${additional_args}_temp.yaml

llamafactory-cli train my_configs/hateful/${dataset_name}/${model_name}_${mode}${additional_args}_temp.yaml

rm my_configs/hateful/${dataset_name}/${model_name}_${mode}${additional_args}_temp.yaml