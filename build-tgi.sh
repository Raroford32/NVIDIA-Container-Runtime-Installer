model=mlabonne/Hermes-3-Llama-3.1-70B-lorablated
volume=/home/ubuntu/llm_model/hub 
token=<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>

docker run -d  --name test-tgi-server \
    --gpus all \
    --shm-size 1500g \
    -e HUGGING_FACE_HUB_TOKEN=$token \
    -e CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 \
    -p 9891:80 \
    -p 9892:29500 \
    -v $volume:/data \
    ghcr.io/huggingface/text-generation-inference:2.1 \
    --cuda-memory-fraction 1 \
    --model-id $model \
    --max-batch-size 1 \
    --max-input-tokens 200000 \
    --max-batch-prefill-tokens 200050 \
    --max-total-tokens 250000 \
    --max-concurrent-requests 1 \
    --max-best-of 1
