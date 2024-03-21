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
> * What is your institute policy on the data researchers acquire and then store on your systems or other systems outside e.g., SURF? Do you actively inform the researchers about this policy at the start of a project? (In the past, we had a lot of experience where a request could not be granted or did not proceed after teh grant because the researcher did not have the permission to use the data or bring it to SURF (e.g., policy that data cannot leave the premises)
> * Do you encounter questions from users about data management at data consolidation? Do you play a role in preparing datasets for researchers?


TBC
> * What if you did not have the permission to access the data? How would you go about it?
> * Note that researchers have to bear in mind that different systems have different performances, different setups so when they have a lot of data it is difficult to keep good track of what all happened to the data. Do they come to you with these questions?


> **_Food for thought:_**
>
> * Do you know about several SURF's compute infrastructures? Do you really need to know in the role of a data professional? If yes why, if no why? 
> * Do you or the researchers think a lot about data management steps during the compute workflow?
When is it important and when not? Do you typically talk about this with the researchers?
> * Expand this problem to the data in various research areas (weather data, DNA profiles, medical data, etc.) where millions of files containing petabytes of data are scattered across several systems. What would you recommend to a researcher to think about during the compute stage of data?






## 4. Run analysis on Snellius
Once you have acquired the data (steps 1 and 2 of the premise, first step of the Research Data Life Cycle), it is time for the next step: analysing the data. To analyse the data, you also need some software or a script. For this project you need a job script that can perform a word count on the acquired data. To get the job script, run the following command: 

```sh
wget https://raw.githubusercontent.com/maithili-k/uva-rdm-jan-2024/main/2-data-creation-and-analysis/jobscript.sh
```

The jobscript starts a short job that runs a wordcount on all files in the defined input directory (default is `/home/lcurXXXX/input/`) and writes the result in the output directory (default is `/home/lcurXXXX/result/`) in a results file that contains the ID of the SLURM job.

To submit the job run the following command:

```
sbatch jobscript.sh
```

Once the job is finished you can inspect the result:

```
cat result/result-XXXXXXXXX.txt
````

> **_Food for thought:_**
> * When looking at the results, what do you notice? How would you change the jobscript to get rid of the noise? Would you use bash or change to a completely different implementation?
> * Downloading and uploading results is a manual process in our current workflow. Is it possible to do this as part of the job? Why would or wouldn't you do this?

## 5. Share the results
Research is mostly a collaborative effort. This means that once you have run your analysis you need to share the results with other collaborators. Start by uploding your result to your _own_ projectfolder on Research Drive:

Tip! Double check your project folder's name using the rclone lsd command

```
rclone copy result/result-XXXXXXXXX.txt "RD:Demo XX (Projectfolder)"
```

Share the result file, or maybe even the source, with the demo account sitting next to you. You can use the [Research Drive documentation](https://wiki.surfnet.nl/display/RDRIVE/How+to+share+a+folder+or+file) to find information on how to do that.

> **_Food for thought:_**
> * If someone wants to reproduce the results you just shared in the previous step, what information do they need? How do you make sure that they _can_ reproduce your work?
> * How can you ensure they have the right licence to use your results?

## Reflection
You downloaded an existing dataset, ran some analysis on it and shared the result with a collaborator. Would you be able to do it one year from now? Or would a fellow student colleague of yours be able to? What would your instructions to them look like? Think of where the data would be, how would you find it, get access to it, what the software version is, where the analysis would be run, etc. This is a very common problem. We will try to address this in the next module and introduce to you the best practices and steps you can already take to ensure you are ready to tackle "data management".

