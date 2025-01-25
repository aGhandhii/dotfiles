pushd .
cd $HOME/.vim/pack/plugins
for i in */*/.git; do ( echo $i; cd $i/..; git pull; ); done
popd
