# QEresearch
This repository provides the data, materials, and script of statistical analyses applied in the research titled "Introducing Quality Estimation to Machine Translation Post-editing Workflow: An Empirical Study on Its Usefulness". 

Thirty-one first-year Master in Translation and Interpreting (MTI) students (6 males, 25 females) participated in the post-editing experiments in October 2022. 

ST_MT_QE. xlsx contains the materials used in the experiment. The STs were translated by Baidu Translate, a mainstream NMT engine. The QE scores were provided by YiCAT, a Chinese online CAT platform employed in the realistic translation scenario (https://www.yicat.vip). Both the MT outputs and QE scores were obtained in October 2022. 

data.xlsx contains segment-level information regarding 
  - Part: The participant ID
  - Task: The Task ID (Task 1: without QE; Task2: with QE)
  - Segment: The segment ID
  - Speed: the post-editing time (normalised by the number of words in the ST segments)
  - Expertise: expertise level of each participant (Expertise=2: students with CATTI Level 2, a higher level), Expertise=3: students with CATTI Level 3, a lower level)
  - MTQuality: MT quality (MTQuality=2: medium-quality MT, MTQuality=3: high-quality MT; three evaluators were involved, and the scores were the modes of the scores given by them,The average scores were not chosen because they were mostly non-integer, and we want to keep the quality scores integeral for further comparisions between the actual quality scores abd QE scores, which are integers)
It should be noted that in YiCAT, the time spent on a segment would not be recorded if no edits were made to the segment. To ensure that the post-editing time for each segment was captured, participants were instructed to type ‘1’ at the end of a segment if they believed the MT output required no editing. This additional step was also emphasised during the training session conducted before each post-editing experiment. Despite these, some participants forgot to do this step for some segments, resulting in 46 invalid data points. These data were excluded in the analysis, the valid data rate was 96.91%.

data2.xlsx is basically the same as data.xlsx, except that one segment with low-quality MT was excluded (see section 3.4 for further illustration).

Script of statistical analyeses.R is the script of statistical analyses
