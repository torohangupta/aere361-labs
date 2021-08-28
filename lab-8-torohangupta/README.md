[![Work in Repl.it](https://classroom.github.com/assets/work-in-replit-14baed9a392b3a25080506f3b7b6d57f295ec2978f6f33ec97e36a161684cbe9.svg)](https://classroom.github.com/online_ide?assignment_repo_id=4530521&assignment_repo_type=AssignmentRepo)
# Lab Assignment 8
# Debugging with GDB, Valgrind and Unit Testing

## Statement of Academic Integrity

In compliance with the ISU Academic Misconduct Policy expectations, I will not give or receive unauthorized aid in the completion of this lab.  This includes violating the "empty hands" policy for discussing/working on the lab, uploading material to online share sources (e.g. Chegg. Com and others), and using unauthorized sources to inform my work. I understand that if I am aware of cheating on this assignment, I have an obligation to inform the Professor. I also understand that the Professor will take action consistent with the ISU Academic Misconduct Policy if s/he detects acts of academic dishonesty as well as with expectations stated in the course syllabus.

- [x] By checking this box, I agree to the above statement.

| Assignment Dates | |
| --- | --- |
|**Assigned on**: | April 4th, 2021 |
|**Due on**: | April 12th @ 23:59|
|**Accepted on**: | |


## Grading Rubric

|Deliverable | Maximum Points |
|---|---|
| Exercise 1 | 5 |
| Exercise 2 | 5 |
| Exercise 3 | 10 |
| Exercise 5 | 20 |
| Report | 50 + 30 |
| Total Score | 120 |


# Git Reminder

**Always create a branch as a first step!** Creating a branch is one of the most essential best practices for working in a repository.  It lets you easily collaborate with larger groups, organize your work, and work in isolation.

**develop**: It is standard practice to do active development on a branch called "develop", as follows:

On Repl.IT, recall we did this in Lab 1. If on a Linux machine and using the git CLI, then it is:

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
For this lab we will jump into programming with C. You can use Repl.IT, or now that you have used the HPC, you can use that. You have five exercises to complete. We have created a test script to test each one. You can also run a test on all seven if you feel you are done and want to run all of them. These are all controlled using a Makefile. We haven't talked about Makefiles yet, but we will. For now, read through the following on how to use it.

## Compiling your programs
If all you want to do is compile your program, then you have some options. First, you can always directly run gcc to compile your program. This is done by typing in gcc, followed by the source code, then ```-o``` and the name of the executable file. Recall that if you do not specify a name, gcc will name it ```a.out```. Here is an example:

```
gcc ex1.c -o ex1
```
If you wish to compile a different file, then just substitute the file name and output name. For now, this simple use of GCC will serve our needs. Later however, we will explore more advanced options used with GCC.

Right now, typing that in is not a big deal. But, as we will learn, this tends to get longer and you may need to compile several programs. This is where Makefiles can be used. We will discuss Makefiles later, but for now, we have created a Makefile for you. This Makefile is also used by the autograder. You can also use this as well to compile your program. For example, to compile ex1, we would type in the following:
```
make ex1
```
This will compile the ```ex1.c``` source code and generate an executable called ```ex1```. For ex2, 3 and 4, just replace the 1 with the exercise you are working with. We can also use this Makefile to call our test scripts as well. To do a test on ex1, do the following:

```
make test_ex1
```
This will actually do two things. First, it will compile ex1 and generate our executable. Second, it will then run our test script using that executable. To keep things clean, our test script also removes the executable once it is done.

# Wrapping up
When you have completed every task with a check-box below, make sure all your work is committed to git and pushed to GitHub. Don't forget to do a pull request and do not close or merge your pull request. Finally, make sure that both the Autograder and the command that compiles your LaTeX document passed. If not, double check your work.

## Task List:
- [x] Read the lab write-up
- [x] Clone this repo (you can either use Repl.IT or the HPC)
- [x] Complete all 4 exercises
- [x] Make sure you have cleaned your repo (NO BINARIES)
- [x] Push your changes to the develop branch
- [x] Complete your lab writeup
- [x] Don't forget to answer the questions in the Lab writeup
- [x] Open a new Pull Request (and leave it open for the grader to find)
- [x] Check that both the AutoGrader and the LaTeX builder completed with no errors (unless you like losing points)
