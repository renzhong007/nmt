@echo off
set DATA_DIR="datas/"
set MODEL_DIR="models/"

python -m nmt.nmt --src=vi --tgt=en --vocab_prefix=%DATA_DIR%/vocab --train_prefix=%DATA_DIR%/train --dev_prefix=%DATA_DIR%/tst2012 --test_prefix=%DATA_DIR%/tst2013 --out_dir=%MODEL_DIR% --num_train_steps=10000 --steps_per_stats=100 --num_layers=2 --num_units=128 --dropout=0.2 --metrics=bleu