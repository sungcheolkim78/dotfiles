pip3 install --upgrade pip

pip3 install \
    wheel \
    setuptools \
    numpy \
    networkx \
    scipy \
    json5==0.9.6 \
    matplotlib \
    pandas \
    seaborn \
    git+https://github.com/h2oai/datatable \
    seaborn \
    ipython \
    jupyterhub \
    jupyterlab \
    pandas \
    pillow

pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116
