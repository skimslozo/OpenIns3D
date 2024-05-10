git clone git@github.com:Pointcept/OpenIns3D.git
cd ./OpenIns3d
conda install pytorch==1.13.1 torchvision==0.14.1 torchaudio==0.13.1 pytorch-cuda=11.6 -c pytorch -c nvidia
conda install -c fvcore -c iopath -c conda-forge fvcore iopath
conda install pytorch3d -c pytorch3d
conda install lightning -c conda-forge
conda install -c "nvidia/label/cuda-11.6.1" libcusolver-dev
export TORCH_CUDA_ARCH_LIST="5.0;6.0;7.0;7.5;8.0;8.6" # had to remove 9.0, still do not understand where TORCH_CUDA_ARCH_LIST comes from / is determined by?
python -m pip install 'git+https://github.com/facebookresearch/detectron2.git'
conda install nltk

cd third_party/pointnet2
python setup.py install
cd ../

git clone --recursive "https://github.com/NVIDIA/MinkowskiEngine" # clone the repo to third_party
cd MinkowskiEngine
git checkout 02fc608bea4c0549b0a7b00ca1bf15dee4a0b228
conda install -c conda-forge blas openblas
pip install ninja # Speeds up the compilation
python setup.py install --force_cuda --blas=openblas
cd ../../
git clone https://github.com/NVlabs/ODISE.git
cd ODISE
pip install -e .


cd ODISE
# mkdir -p /teamspace/studios/this_studio/OpenIns3D/ODISE/third_party/Mask2Former/build/temp.linux-x86_64-cpython-310 # I do not think this is actually needed, but rather produced error bc the previous build failed
pip install -e . #(or also try python -m pip install -e .)
cd ..
pip install torch_scatter gdown==v4.6.3 loguru open3d plyfile pyviz3d python-dotenv omegaconf==2.1.1 iopath==0.1.8
