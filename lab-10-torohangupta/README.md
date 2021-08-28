# Lab Assignment 10
# HPC Computing with MPI and OpenMP

## Statement of Academic Integrity

In compliance with the ISU Academic Misconduct Policy expectations, I will not give or receive unauthorized aid in the completion of this lab.  This includes violating the "empty hands" policy for discussing/working on the lab, uploading material to online share sources (e.g. Chegg. Com and others), and using unauthorized sources to inform my work. I understand that if I am aware of cheating on this assignment, I have an obligation to inform the Professor. I also understand that the Professor will take action consistent with the ISU Academic Misconduct Policy if s/he detects acts of academic dishonesty as well as with expectations stated in the course syllabus.

- [x] By checking this box, I agree to the above statement.

| Assignment Dates | |
| --- | --- |
|**Assigned on**: | April 21st, 2021 |
|**Due on**: | April 30th @ 23:59|
|**Accepted on**: | |


## Grading Rubric

|Deliverable | Maximum Points |
|---|---|
| Hello MPI World| 5 |
| Breaker, Breaker Processor 9 | 10 |
| Quad Function | 10 |
| FFT Function | 10 |
| Report | 50 + 20 |
| Total Score | 105 |


# Git Reminder

**Always create a branch as a first step!** Creating a branch is one of the most essential best practices for working in a repository.  It lets you easily collaborate with larger groups, organize your work, and work in isolation.

**develop**: It is standard practice to do active development on a branch called "develop", as follows:

This will be done on the HPC, so you will need to use the git CLI. Those commands are:

    git branch develop
    git checkout develop
    git push origin develop

This creates a new branch from your current working branch, switches to that branch, and then pushes the new branch to the remote repository (GitHub).

To save your changes, always make sure you are on your development branch. Again, in Repl.IT
this is through the GitHub integration link. If you are using the CLI then:

    git checkout develop

    <work on your assignment>

    git add <new or changed files>
    git commit -m "A descriptive note of what you changed"
    git push origin develop

When you are done, open a PR requesting your develop branch be merged to master.
The time and date of your pull request from develop into master will determine your submission time. See the lab manual for details.

# About this Lab
For this lab we will be doing more on the HPC. We will show you how to use both the MPI and OpenMP libraries so that you can move tasks to multiple processors instead of just running on one. This lab will have a very basic hello world and we show you some examples of using these in some numerical functions.

## Compiling your programs
For this lab we will use the Intel Compiler called MPIICC. It works very much like GCC and uses some of the same flags as GCC. Please refer to the lab writeup for additional details.

# Wrapping up
When you have completed every task with a check-box below, make sure all your work is committed to git and pushed to GitHub. Don't forget to do a pull request and do not close or merge your pull request. Please note that there is not an autograder for this lab. There is however an automatic GitHub Action to compile your LaTeX document as in past labs. That will trigger on your pull request.

## Task List:
- [x] Read the lab write-up
- [x] Clone this repo (you can either use Repl.IT or the HPC)
- [x] Complete all 4 exercises
- [x] Make sure you have cleaned your repo (NO BINARIES)
- [x] Push your changes to the develop branch
- [x] Complete your lab writeup
- [x] Don't forget to answer the questions in the Lab writeup
- [x] Open a new Pull Request (and leave it open for the grader to find)
