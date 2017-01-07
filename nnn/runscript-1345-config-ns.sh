# use "script [option] [file] ... exit" to keep a log of terminal outputs and all the interactions
# suns as: script runlog-1345.txt -c "THEANO_FLAGS="device=cuda2" python mlp.py ../data/cv/ JK-1345-ns ../data/cv/C-ns.mat 800,800"

script log/log-mlp-JKU-1345-500,500,ns.txt -c "THEANO_FLAGS="device=cuda2" python mlp.py ../data/cv/ JKU-1345-ns ../data/cv/C-ns.mat 500,500"
script log/log-mlp-JKU-1345-500,500,500,ns.txt -c "THEANO_FLAGS="device=cuda2" python mlp.py ../data/cv/ JKU-1345-ns ../data/cv/C-ns.mat 500,500,500"
script log/log-mlp-JKU-1345-500,500,500,500,ns.txt -c "THEANO_FLAGS="device=cuda2" python mlp.py ../data/cv/ JKU-1345-ns ../data/cv/C-ns.mat 500,500,500,500"

script log/log-mlp-JKU-1345-800,800,ns.txt -c "THEANO_FLAGS="device=cuda2" python mlp.py ../data/cv/ JKU-1345-ns ../data/cv/C-ns.mat 800,800"
script log/log-mlp-JKU-1345-800,800,800,ns.txt -c "THEANO_FLAGS="device=cuda2" python mlp.py ../data/cv/ JKU-1345-ns ../data/cv/C-ns.mat 800,800,800"
script log/log-mlp-JKU-1345-800,800,800,800,ns.txt -c "THEANO_FLAGS="device=cuda2" python mlp.py ../data/cv/ JKU-1345-ns ../data/cv/C-ns.mat 800,800,800,800"

script log/log-mlp-JKU-1345-1000,1000,ns.txt -c "THEANO_FLAGS="device=cuda2" python mlp.py ../data/cv/ JKU-1345-ns ../data/cv/C-ns.mat 1000,1000"
script log/log-mlp-JKU-1345-1000,1000,1000,ns.txt -c "THEANO_FLAGS="device=cuda2" python mlp.py ../data/cv/ JKU-1345-ns ../data/cv/C-ns.mat 1000,1000,1000"
script log/log-mlp-JKU-1345-1000,1000,1000,1000,ns.txt -c "THEANO_FLAGS="device=cuda2" python mlp.py ../data/cv/ JKU-1345-ns ../data/cv/C-ns.mat 1000,1000,1000,1000"



script log/log-dbn-JKU-1345-500,500,ns.txt -c "THEANO_FLAGS="device=cuda2" python dbn.py ../data/cv/ JKU-1345-ns ../data/cv/C-ns.mat 500,500 grbm"
script log/log-dbn-JKU-1345-500,500,500,ns.txt -c "THEANO_FLAGS="device=cuda2" python dbn.py ../data/cv/ JKU-1345-ns ../data/cv/C-ns.mat 500,500,500 grbm"
script log/log-dbn-JKU-1345-500,500,500,500,ns.txt -c "THEANO_FLAGS="device=cuda2" python dbn.py ../data/cv/ JKU-1345-ns ../data/cv/C-ns.mat 500,500,500,500 grbm"

script log/log-dbn-JKU-1345-800,800,ns.txt -c "THEANO_FLAGS="device=cuda2" python dbn.py ../data/cv/ JKU-1345-ns ../data/cv/C-ns.mat 800,800 grbm"
script log/log-dbn-JKU-1345-800,800,800,ns.txt -c "THEANO_FLAGS="device=cuda2" python dbn.py ../data/cv/ JKU-1345-ns ../data/cv/C-ns.mat 800,800,800 grbm"
script log/log-dbn-JKU-1345-800,800,800,800,ns.txt -c "THEANO_FLAGS="device=cuda2" python dbn.py ../data/cv/ JKU-1345-ns ../data/cv/C-ns.mat 800,800,800,800 grbm"

script log/log-dbn-JKU-1345-1000,1000,ns.txt -c "THEANO_FLAGS="device=cuda2" python dbn.py ../data/cv/ JKU-1345-ns ../data/cv/C-ns.mat 1000,1000 grbm"
script log/log-dbn-JKU-1345-1000,1000,1000,ns.txt -c "THEANO_FLAGS="device=cuda2" python dbn.py ../data/cv/ JKU-1345-ns ../data/cv/C-ns.mat 1000,1000,1000 grbm"
script log/log-dbn-JKU-1345-1000,1000,1000,1000,ns.txt -c "THEANO_FLAGS="device=cuda2" python dbn.py ../data/cv/ JKU-1345-ns ../data/cv/C-ns.mat 1000,1000,1000,1000 grbm"