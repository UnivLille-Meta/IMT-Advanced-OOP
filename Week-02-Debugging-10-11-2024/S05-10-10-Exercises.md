**Teacher**: [Steven Costiou](https://kloum.io/costiou)

**Date** Thursday 10th october, 2024. 14h - 17h.

## Exercises

You are going to practice debugging through examples and challenges, and then you will build your first Pharo application.

For the debugging exercises, you need to load the following code:
```Smalltalk
Metacello new
	baseline: 'DebuggingChallenges';
	repository: 'github://StevenCostiou/Pharo-Debugging-Challenges:main';
	load.
```

## Exercice 05-10-1: 

Browse the test class `OCDPersonRegistryTest` and execute the `testPersonsAge` test.
This test fails because a specific person object is expected to have an age that is superior to zero -- like all persons!.

Use the debugger to understand and explain why.


## Exercice 05-10-2:

Browse the test class `OCDPersonRegistryTest` and execute the `testRegisterPersons` test.
This test fails because a specific person object has not been registered by a person register, while it should have.

Use the debugger to understand and explain why.


## Exercice 05-10-3:

Solve the [Ammolite bug](/additional-resources/debugging/Ammolite/Ammolite.md).


## Exercice 05-10-4:

Follow the [flags exercise](/additional-resources/flags/CountriesExamples.md), in which you will manipulate all aspects of Pharo, including visualizations, HTTP clients, and [Spec](https://github.com/pharo-spec/Spec) the Pharo GUI framework.