#!/bin/bash -l
#
# 
# If you need any help, please email rc-help@rit.edu
#

#SBATCH -J caffe_gi_launcher                        #name
#SBATCH -o pmmcaffe_eval_%J.output         #normal output
#SBATCH -e pmmcaffe_eval_%J.output         #error output
##SBATCH --mail-user=<insert your address here>
##SBATCH --mail-type=ALL
#SBATCH -t 0-00:10                   #time to run D-HH:MM
#SBATCH -p work                      #partition
#SBATCH -c 1                         #num cpu
##SBATCH --gres=gpu:1                 #use gpu(s)
#SBATCH --mem-per-cpu=2048           #memory (MB)
#SBATCH --qos=free                   #quality of service
#SBATCH --export=ALL                 #variables
##SBATCH -O                           #overcommit resources

#
# Your job script goes below this line.  
#
echo "(${HOSTNAME}) Starting job"
#module unload opencv/2.4.11
#module load use.own
#module load caffe/2016-06-24 
#module unload python/2.7.10
#module load anaconda

######### PARAMS: $1 is slurm id, $2 is sequence number, $3 is iteration number

#source activate env

# enter your commands here
cd ~/eval_kitti/devkit/cpp/results/
mkdir -p ${1}_${3}/data
mkdir -p ${1}_${3}_${2}/data
cp ~/flowcaffe/${1}/out_dist_${2}_${3}_out_rot_${2}_${3}.txt_mat.txt ${1}_${3}/data/${2}.txt
cp ~/flowcaffe/${1}/out_dist_${2}_${3}_out_rot_${2}_${3}.txt_mat.txt ${1}_${3}_${2}/data/${2}.txt

if [ `ls ${1}_${3}/data/ | wc -l` -ge 3 ]; then
  cd ..
  ./evaluate_odometry ${1}_${3}
fi

./evaluate_odometry_${2} ${1}_${3}_${2}


#cat model_train.prototxt | sed 's/batch_size: .*/batch_size: 1/g' | sed "s?train.txt?/home/pmm5983/kitti_flow_data/${2}.txt?" | sed "s?train_exp.txt?/home/pmm5983/kitti_flow_data/${2}.txt?" > model_${2}_test.prototxt
#extract_features flow_kitti_d_iter_${3}.caffemodel model_${2}_test.prototxt out_dist,out_rot out_dist_${2}_${3},out_rot_${2}_${3} `wc -l /home/pmm5983/kitti_flow_data/${2}.txt | awk '{print $1}'` lmdb GPU

#which python
#~/.conda/envs/env/bin/python ../get_infotxts.py out_dist_${2}_$3 out_rot_${2}_$3
#source deactivate

#caffe train --solver=solver4.prototxt
#caffe test -model /home/pmm5983/caffe_kitti/myConvNet3.prototxt -weights /home/pmm5983/caffe_kitti/training_3_iter_100000.caffemodel -gpu 0 -iterations 4660
#extract_features /home/pmm5983/caffe/models/bvlc_alexnet/bvlc_alexnet.caffemodel /home/pmm5983/caffe/models/bvlc_alexnet/features.prototxt pool5 alexnet_out_personal_contexts 24000 lmdb GPU
#extract_features /home/pmm5983/caffe/models/bvlc_googlenet/bvlc_googlenet.caffemodel /home/pmm5983/caffe/models/bvlc_googlenet/features.prototxt "pool5/7x7_s1" googlenet_out_personal_contexts 24000 lmdb GPU
#python read_db.py net_out

echo "(${HOSTNAME}) Done" 
#echo "Job ${SLURM_JOB_ID} (Caffe Feature Extraction) Finished" | mail -s "Job Finished" -r pmm5983@rit.edu pmm5983@rit.edu
