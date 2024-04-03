# Archiving and presentation workflow

**Authors**
- Maithili Kalamkar Stam (SURF)
- Alice Stuart-Lee (SURF)
- Giacomo Cannizzaro (SURF)
- Steven Voges (SURF)

## Premise
We are at the last step of your research data lifecycle: the analysis is done, the results have been published, now you want to preserve your data. Of course, always keeping in mind our FAIR desires. 

In this module, we will cover:

1. The significance of preservation in the context of FAIR and Open Science policies
2. Long-term storage of data, Data Repositories
3. Persistent Identifiers

## Prerequisites

- A dataset that you need to preserve and that you want to make findable.

## 1. Long term preservation

There are many reasons to preserve data, on top of requirements from funding agencies, University/Institute policies, more importantly, we should preserve Data to make our research more Open and repeatable. 
This is especially crucial when talking about non-repeatable observations. Think Astronomy, Climate science, things that cannot be reproduced in a lab.
Moreover, Archiving datasets is also bound to make research cheaper, repeating observations and/or experiments is a waste of resources.

Metadata here?


**How to choose storage?**
> * length of storage
> * Volume of data
> * Need of access

> Does the data archive ensure that the data remain findable through the use of persistent identifiers? 
> Does the data archive describe the data in a standard manner, with accepted metadata standards?

 -- Show pyramid of storage types

Just archiving or publishing? depends on uniqueness, cost involved in reproducing, and rules you have to abide by.

https://tools.uu.nl/storagefinder/

Some solutions, like our Data ARchive, just for long-term conservation. Other are also public-facing and accessible

More interesting are data repositories for FAIR and RDM purposes.

## 2. Data Repositories

There is a myriad of Repositories available, often domain-specific (either by design or by choice), so it is always best to see what the community is doing, there may be some unwritten best practice. This will of course depend on how much data-mature the field/community is and on the security/privacy required. E.G. medical data vs atmosferic data are very different. Depends on the funding bodies, depends on financing bodies

https://www.re3data.org/
https://fairsharing.org/
https://research-software-directory.org/

for humanities: https://ddrs-dev.dariah.eu/ddrs/ to choose

Preparing data should follow the specific guidelines of the archive chosen, but general good practices are FA(IR) standardised formats readable with open source software


https://www.openaire.eu/find-trustworthy-data-repository
Zenodo is a catch all solution, from CERN

SURF has a repository whose backend infrastructure is the tape library, makes it well-suited for very large datasets (10sTb--Pb)

There is no solution fit all
Many principles and rules to follow, the FAIR ones are the most important but they can be summarised in a very simple way, just trying to put yourselves in other people's shoes, imagining to e a researcher/supporter/data steward in 5 years that needs to find a dataset and how to use it

In a repository (but also in storing) this is good good practic to attach software versions, scripts you used, information on the computing environment. This needs to be thought in terms of "Reproduction package" rather than just a dataset.
In theory, data as raw as you can possibly work with, but needs to be taken into account that certain data will be preserved by the observatory. Anecdotal evidence: astronomy

> * Show re3data
> * https://research-software-directory.org/ -> giving credit to research software engineers

## 3. Persistent Identifiers

FAIR

Findable! 
You did all your research, you published your beautiful results in a journal, you have your data in a repository ready to be re-used and verified, but you see your citations are low, views of the dataset are at 3 since last week and your h-index is stagnating. Why?

Your results are not being appreciated? That is not necessarily the case, sometimes they are just not being found. On top of channel of distribution (blog posts, press releases etc), there is a key piece of technology that is crucial to making your research findable, especially on the long term: persistent identifiers.

A PID is a relatively simple technology, through which an identifier (agnostic of meaning and typically an alphanumeric code structured as a prefix and a suffix, in its most common form) is attached to an object, without ever changing the identifier itself. 

There are a million and a half PIDs, with a few extremely established players (DOIs). 
Given the PID landscape, choosing one can be a hassle  -> https://www.pidwijzer.nl/

>  Some repositories have PIDs built in (e.g. SURF has DOI for dataset, handle for each data entry)
>  Publishers also
>  Metadata schema and how flexible/personalised you want it

In its simplest terms a PID is like a URL, that points to a "landing page" where the metadata of the object and the object itself are kept. This is what needs to be updated, as the PID itself won't ever change. 
Tombstoning policies

PIDs can be incredibly effective at permanently linking research together, connecting input and output etc. Funding!


> Demo RAiD







```
Archiving? surf data archive, other resources
In-house solutions, many Universities have storage solutions. 
```
