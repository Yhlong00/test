FROM runpod/worker-comfyui:5.5.1-base

RUN comfy node install --exit-on-fail rgthree-comfy
RUN comfy node install --exit-on-fail comfyui-florence2
RUN comfy node install --exit-on-fail comfyui-inspire-pack
RUN comfy node install --exit-on-fail comfyui-impact-pack
RUN comfy node install --exit-on-fail comfyui-save-file-extended
RUN comfy node install --exit-on-fail comfyui-art-venture
# RUN comfy node install --exit-on-fail derfuu_comfyui_moddednodes
# RUN comfy node install --exit-on-fail comfyui_essentials
# RUN comfy node install --exit-on-fail comfyui_layerstyle
# RUN comfy node install --exit-on-fail comfyui_fizznodes
# RUN comfy node install --exit-on-fail comfyui_controlnet_aux
# RUN comfy node install --exit-on-fail comfyui-custom-scripts
# RUN comfy node install --exit-on-fail comfyui-inpaint-nodes
# RUN comfy node install --exit-on-fail efficiency-nodes-comfyui
# RUN comfy node install --exit-on-fail comfy-mtb

# Comfyroll not in registry, install via git clone
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*
WORKDIR /comfyui/custom_nodes
RUN git clone https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes.git

# download models into comfyui
# WORKDIR /comfyui
# RUN comfy model download --url https://huggingface.co/RunDiffusion/Juggernaut-XL-v9/blob/main/Juggernaut-XL_v9_RunDiffusionPhoto_v2.safetensors --relative-path models/checkpoints --filename Juggernaut-XL_v9_RunDiffusionPhoto_v2.safetensors
# RUN comfy model download --url https://huggingface.co/lllyasviel/fooocus_inpaint/blob/main/fooocus_inpaint_head.pth --relative-path models/inpaint --filename fooocus_inpaint_head.pth
# RUN comfy model download --url https://huggingface.co/lllyasviel/fooocus_inpaint/blob/8fcfd208b8e76537f23ae061dc3e3d26714ee4ec/inpaint_v26.fooocus.patch --relative-path models/inpaint --filename inpaint_v26.fooocus.patch
