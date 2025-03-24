# QEresearch
This repository provides the data, materials, and script of statistical analyses used in the study titled "Introducing Quality Estimation to Machine Translation Post-editing Workflow: An Empirical Study on Its Usefulness". Thirty-one first-year Master in Translation and Interpreting (MTI) students (6 males, 25 females) participated in the post-editing experiments in October 2022. 

# Materials
ST_MT_QE. xlsx: This file contains the materials used in the experiment. The source texts (STs) were translated by Baidu Translate, a mainstream NMT engine. The Quality Estimation (QE) scores were provided by YiCAT, a Chinese online CAT platform employed in the realistic translation scenario (https://www.yicat.vip). Both MT outputs and QE scores were obtained in October 2022. 

# Data
data.xlsx: This dataset includes segment-level information regarding 
  - Part: Participant ID
  - Task: Task ID (Task 1: without QE; Task2: with QE)
  - Segment: Segment ID
  - Speed: post-editing time (normalised by the number of words in the ST segments)
  - Expertise: expertise level of each participant (Expertise=2: students with CATTI Level 2, a higher level; Expertise=3: students with CATTI Level 3, a lower level)
  - MTQuality: MT quality (MTQuality=2: medium-quality MT; MTQuality=3: high-quality MT). Quality scores were determined by the mode of scores from three evaluators. Integer scores were used to facilitate future comparisons with QE scores, which are also integers.
Note: It should be noted that in YiCAT, the time spent on a segment would not be recorded if no edits were made to the segment. To ensure that the post-editing time for each segment was captured, participants were instructed to type ‘1’ at the end of a segment if they believed the MT output required no editing. This additional step was also emphasised during the training session conducted before each post-editing experiment. Despite this instruction, some participants omitted this step for some segments, resulting in 46 invalid data points. These were excluded from the analysis, resulting in a valid data rate of 96.91%.

data2.xlsx: Similar to data.xlsx, but with one segment of low-quality MT excluded (see section 3.4 for further details).

# Script
Script of statistical analyeses.R: This script contains the statistical analyses performed in the study.
