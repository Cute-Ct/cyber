sudo install -o 1000 -g 1000 -d /opt/cyber

cp -r build/rcfiles /opt/cyber/

sudo apt install cmake

sudo bash ./build/installers/install_minimal_environment.sh cn
sudo bash ./build/installers/install_cyber_deps.sh

sudo bash ./build/installers/install_llvm_clang.sh
sudo bash ./build/installers/install_qa_tools.sh
#bash ./build/installers/install_visualizer_deps.sh
sudo bash ./build/installers/install_bazel.sh
#bash ./build/installers/post_install.sh cyber

