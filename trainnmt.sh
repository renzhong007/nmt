DATA_DIR=datas/
MODEL_DIR=models/

if [ ! -d "$DATA_DIR" ] ; then
mkdir $DATA_DIR
else
echo "$DATA_DIR is exist"
fi

if [ ! -d "$MODEL_DIR" ] ; then
mkdir $MODEL_DIR
else
echo "$MODEL_DIR is exist"
fi

python3 -m nmt.nmt \
    --encoder_type=bi \
    --attention=luong \
	--src=mo --tgt=ch \
	--vocab_prefix=$DATA_DIR/vocab \
	--train_prefix=$DATA_DIR/train.clean \
	--dev_prefix=$DATA_DIR/valid.clean \
	--test_prefix=$DATA_DIR/test.clean \
	--out_dir=$MODEL_DIR \
	--num_train_steps=100000 \
	--steps_per_stats=500 \
	--num_layers=2 \
	--num_units=512 \
	--dropout=0.1 \
	--gpuMF=0.4 \
	--metrics=bleu

