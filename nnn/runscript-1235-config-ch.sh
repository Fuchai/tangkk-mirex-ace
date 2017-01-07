# use "script [option] [file] ... exit" to keep a log of terminal outputs and all the interactions
# such as: script runlog-1235.txt -c "THEANO_FLAGS="device=cuda0" python mlp.py ../data/cv/ JK-1235-ch ../data/cv/C-ch.mat 800,800"

script log/log-mlp-JKU-1235-500,500,ch.txt -c "THEANO_FLAGS="device=cuda0" python mlp.py ../data/cv/ JKU-1235-ch ../data/cv/C-ch.mat 500,500"
script log/log-mlp-JKU-1235-500,500,500,ch.txt -c "THEANO_FLAGS="device=cuda0" python mlp.py ../data/cv/ JKU-1235-ch ../data/cv/C-ch.mat 500,500,500"
script log/log-mlp-JKU-1235-500,500,500,500,ch.txt -c "THEANO_FLAGS="device=cuda0" python mlp.py ../data/cv/ JKU-1235-ch ../data/cv/C-ch.mat 500,500,500,500"

script log/log-mlp-JKU-1235-800,800,ch.txt -c "THEANO_FLAGS="device=cuda0" python mlp.py ../data/cv/ JKU-1235-ch ../data/cv/C-ch.mat 800,800"
script log/log-mlp-JKU-1235-800,800,800,ch.txt -c "THEANO_FLAGS="device=cuda0" python mlp.py ../data/cv/ JKU-1235-ch ../data/cv/C-ch.mat 800,800,800"
script log/log-mlp-JKU-1235-800,800,800,800,ch.txt -c "THEANO_FLAGS="device=cuda0" python mlp.py ../data/cv/ JKU-1235-ch ../data/cv/C-ch.mat 800,800,800,800"

script log/log-mlp-JKU-1235-1000,1000,ch.txt -c "THEANO_FLAGS="device=cuda0" python mlp.py ../data/cv/ JKU-1235-ch ../data/cv/C-ch.mat 1000,1000"
script log/log-mlp-JKU-1235-1000,1000,1000,ch.txt -c "THEANO_FLAGS="device=cuda0" python mlp.py ../data/cv/ JKU-1235-ch ../data/cv/C-ch.mat 1000,1000,1000"
script log/log-mlp-JKU-1235-1000,1000,1000,1000,ch.txt -c "THEANO_FLAGS="device=cuda0" python mlp.py ../data/cv/ JKU-1235-ch ../data/cv/C-ch.mat 1000,1000,1000,1000"



script log/log-dbn-JKU-1235-500,500,ch.txt -c "THEANO_FLAGS="device=cuda0" python dbn.py ../data/cv/ JKU-1235-ch ../data/cv/C-ch.mat 500,500 grbm"
script log/log-dbn-JKU-1235-500,500,500,ch.txt -c "THEANO_FLAGS="device=cuda0" python dbn.py ../data/cv/ JKU-1235-ch ../data/cv/C-ch.mat 500,500,500 grbm"
script log/log-dbn-JKU-1235-500,500,500,500,ch.txt -c "THEANO_FLAGS="device=cuda0" python dbn.py ../data/cv/ JKU-1235-ch ../data/cv/C-ch.mat 500,500,500,500 grbm"

script log/log-dbn-JKU-1235-800,800,ch.txt -c "THEANO_FLAGS="device=cuda0" python dbn.py ../data/cv/ JKU-1235-ch ../data/cv/C-ch.mat 800,800 grbm"
script log/log-dbn-JKU-1235-800,800,800,ch.txt -c "THEANO_FLAGS="device=cuda0" python dbn.py ../data/cv/ JKU-1235-ch ../data/cv/C-ch.mat 800,800,800 grbm"
script log/log-dbn-JKU-1235-800,800,800,800,ch.txt -c "THEANO_FLAGS="device=cuda0" python dbn.py ../data/cv/ JKU-1235-ch ../data/cv/C-ch.mat 800,800,800,800 grbm"

script log/log-dbn-JKU-1235-1000,1000,ch.txt -c "THEANO_FLAGS="device=cuda0" python dbn.py ../data/cv/ JKU-1235-ch ../data/cv/C-ch.mat 1000,1000 grbm"
script log/log-dbn-JKU-1235-1000,1000,1000,ch.txt -c "THEANO_FLAGS="device=cuda0" python dbn.py ../data/cv/ JKU-1235-ch ../data/cv/C-ch.mat 1000,1000,1000 grbm"
script log/log-dbn-JKU-1235-1000,1000,1000,1000,ch.txt -c "THEANO_FLAGS="device=cuda0" python dbn.py ../data/cv/ JKU-1235-ch ../data/cv/C-ch.mat 1000,1000,1000,1000 grbm"