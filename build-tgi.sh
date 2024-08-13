model=taide/Llama3-TAIDE-LX-8B-Chat-Alpha1
volume=/home/$who/llm_model/hub 
token=<YOUR_TOKEN>

docker run -d  --name test-tgi-server \
    --gpus all \
    --shm-size 1g \
    -e HUGGING_FACE_HUB_TOKEN=$token \
    -e CUDA_VISIBLE_DEVICES=0 \
    -p 9891:80 \
    -p 9892:29500 \
    -v $volume:/data \
    ghcr.io/huggingface/text-generation-inference:2.1 \
    --cuda-memory-fraction 1 \
    --model-id $model \
    --max-batch-size 10 \
    --max-input-tokens 8000 \
    --max-batch-prefill-tokens 8050 \
    --max-total-tokens 8120 \
    --max-concurrent-requests 500 \
    --max-best-of 1



