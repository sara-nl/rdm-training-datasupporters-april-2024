# Analysis and compute flows

**Authors**
- Maithili Kalamkar Stam (SURF)
- Alice Stuart Lee (SURF)
- Giacomo Cannizzaro (SURF)
- Steven Voges (SURF)

## Premise
We talked a little about RDM principles and then we focused on findability principles in the earlier module. Now that the researchers have the data, the next step they do is analyze it. We will do a walk through the analysis of a dataset to give you a feel of the compute environments offered at SURF. You don't have to necessarily know the details of the compute infrastructure, but this information can be handy as a data professional.

In this module, we will cover:

1. A researcher will compute/analyse their data at one of the SURF compute infrastructures either on their own or in a collaboration
2. The results / intermediate output / data + software should leave the compute infrastructure. Together we will look into where the data goes and how

## 1. Prerequisites

- SURF Snellius account username/password
- SURF Research Drive account username/password

## 2. Login to Snellius

We will use the Snellius (Dutch National Supercomputer hosted by SURF) login node as our user interface where Research Drive can be mounted where your input dataset is located

Login to the Snellius with your appropriate credentials:

```sh
ssh scurXXXX@snellius.surf.nl
```

## 3. Download data from Research Drive to Snellius

We start with the second step of the Research Data Life Cycle: consolidate data that needs to be processed. The most efficient way to move data from Research Drive to Snellius is through a client called rclone. Rclone is already installed on Snellius login node and you need to configure it for Research Drive. We refer to [this guide](https://wiki.surfnet.nl/display/RDRIVE/Access+Research+Drive+via+Rclone) in our documentation to configure rclone. The portal can be found [here](https://demo.data.surfsara.nl) where we will create the password to proceed.

The final config should look something like this:

```
[RD]
type = webdav
url = https://demo.data.surfsara.nl/remote.php/webdav/
vendor = owncloud
user = demoXX
pass = XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

Once you have configured rclone you can inspect the remote location:

(fix below paths)
```
scurXXXX@login3:~$ rclone ls RD:
 3308028  Training (Projectfolder)/Hands-on.pdf
 15747551 Training (Projectfolder)/ResearchDriveTraining-Onboarding.pdf
   104077 UvA-HPC (Projectfolder)/UvA HPC Course Material/alice-in-wonderland.txt
```
Data needs to be copied to your home folder on Snellius:

```sh
rclone copy "RD:UvA-HPC (Projectfolder)/UvA HPC Course Material" input
```

> **_Food for thought:_**
> * Are you sure you have the permission to 'just use' this dataset (just because you can download something does not mean you can just use it) or did you do something illegal? Do researchers you support ask you for support on this? 
> * What is your institute policy on the data researchers acquire and then store on your systems or other systems outside e.g., SURF? Do you actively inform the researchers about this policy at the start of a project? We had a lot of experience IN THE PAST where a request could not be granted or did not proceed after tHE grant approval because the researcher did not have the permission to use the data altogether or bring it to SURF (e.g., policy that data cannot leave the premises, sensitive data)
> * Do you encounter questions from users about data management and data consolidation? Do you play a role in preparing datasets for researchers?
> * Note that researchers have to bear in mind that different systems have different performances, different setups so when they have a lot of data it is difficult to keep good track of what all happened to the data. Do they come to you with these questions?

## 4. Run analysis on Snellius
It is time for the next step: analysing the data. To analyse the data, you also need some software or a script. For this project you need a job script that can perform a word count on the acquired data. To get the job script, run the following command: 

```sh
(fix this) wget https://raw.githubusercontent.com/sara-nl/.../jobscript.sh
```

The jobscript starts a short job that runs analysis on all files in the defined input directory and writes the result in the output directory. In this analysis we are going to search for aliens!

To submit the job run the following command:

```
(check this) sbatch jobscript.sh
```

> **_Food for thought:_**
>
> * Do you know about several SURF's compute infrastructures? Do you really need to know in the role of a data professional? If yes why, if no why? 
> * Do you or the researchers think a lot about data management steps during the compute workflow?
When is it important and when not? Do you typically talk about this with the researchers?
> * Expand this problem to the data in various research areas (weather data, DNA profiles, medical data, etc.) where millions of files containing petabytes of data are scattered across several systems. What would you recommend to a researcher to think about during the compute stage of data?

## 5. Handling the results and the Output
The compute grant at SURF is about to end so you need to move the data elsewhere, hopefully you had that planned in the DMP. Upload your result to your _own_ projectfolder on Research Drive:

```
(copy the full output folder) rclone copy result/result-XXXXXXXXX.txt "RD:Demo XX (Projectfolder)"
```
There is a good chance you found aliens in this dataset. This is HUGE! We think this should be independently cross-checked by another researcher!

> **_Food for thought:_**
> * You downloaded an existing dataset and ran some analysis on it. Would you be able to do it one year from now?
> * If someone wants to reproduce your results, would they be able to do so? Think input data, software, data analysis pipelines, etc. Are researchers even allowed to have access to your output data?
> * You recall how the 'finding of the dataset' went wrong when we searched for datasets with aliens? How can you ensure your dataset can be found in a much easier way?
