This is the repository of the Advanced Object-Oriented Programming lectures done by S. Costiou, S. Jordan Montano, and Stéphane Ducasse at IMT Lille.

These lectures are based on the excellent MOOC: [The Advanced Object-Oriented Design and Development with Pharo](https://advanced-design-mooc.pharo.org) and the [lecture materials](https://github.com/UnivLille-Meta/Miage23) given by S. Ducasse and G. Polito at the University of Lille.

- Contact:  steven.costiou@inria.fr / sebastian.jordan@inria.fr / stephane.ducasse@inria.fr
- Discord channel: https://discord.gg/XTcC7xA9
- Students are strongly encouraged to ask for help on the discord server of Pharo: https://discord.gg/QewZMZa - this is also part of the lectures
- Zoom: Meeting ID: 928 4079 9245

## Complete Program


- **[S01 - S03] - 03/10/24 - 14h-17h (remote).** Introduction to Pharo and unit testing.
- **[S04 - S06] - 10/10/24 - 14h-17h (remote).** Debugging with Pharo.
- **[S07 - S08] - 14/10/24 - 13h-18h.** Messages and double dispatch.
- **[S09 - S10] - 15/10/24 - 8h30-11h45.** Deeper in double dispatch.
- **[S11] - 15/10/24 - 13h-18h.** Design patterns.
- **[S12 - S13] - 16/10/24 - 8h30-11h45.** Data and objects.
- **[S14] - 16/10/24 - 13h-18h.** Introduction to the graded project.
- **[S15] - 17/10/24 - 8h30-11h45.** Pharo Graphics: introduction to Bloc.
- **[S16] - 18/10/24 - 8h30-11h45.** Deeper in Bloc.
- **[S17] - 15/10/24 - 13h-18h.** Project?



## Course Material

All slides, videos, and tutorials are available in (or linked from) this repository.

- Pdfs and videos are hosted under https://advanced-design-mooc.pharo.org
- Exercises are here http://rmod-pharo-mooc.lille.inria.fr/AdvancedDesignMooc/2024-04-01-CompanionExercise.pdf

## Course Contract

This course proposes a series of theoretical lectures and practical exercises.
Modules are divided into weeks, each in a different folder, and you will find the theory and practice in that folder.
To pass this course you will need to:
 - pass the exams (see **[NEED AN AGENDA]**)
 - do at minimum **all** the homework in the exercises (file *Exercises.md* in each folder)
 - watch all the videos of the lectures not done during the lectures (yes there are videos for 99% of the support)
 - write (short) weekly reports to tell us about your activity. Remember, focus on the important things, and show us that you are learning.

### Each week

During the lectures:
- Do the exercises
- Ask questions if needed, we are there for that!
- Work on your projects

At home:
- Prepare the following lecture: Watch the lectures (videos, slides)
- Ideally, come with questions
- Write your report

### Make a group

Some of the activities during the course require group organization.
For example, this is the case for the practical project.

Make group of max 2 persons and come to us, you will be assigned a unique group identifier.
Each group will have a directory inside the [Groups](Groups) folder.
Put inside your group folder
 - a file with your full names and emails
 - all your activity and reports
 
Make recurrent pull requests to update it.

For example, imagine that Angela Davis and Ambroise Croizat are together in a group called G03.
They create a directory RevolutionX.

```
Groups
    - GG03
        - members.md (names and emails)
        - report-week01.md (one section for Angela, one for Ambroise)
        - report-week02.md (one section for Angela, one for Ambroise)
```

### Grading
**[TO BE DEFINED]**

You are going to be graded on
- Exam 1 (individually)
- Exam 2 (individually)
- Weekly Reports (individually)
- Practical Project (in group)
- **Bonus:** Getting contact with the community to ask questions and help (discord, mailing lists).

Your final grade will be a weighted average of all these grades.

## FAQ

### Solving SSH problems in Git/Github

Make sure you have correct configured you authentication setup
- If you want to use SSH authentication
    - set up your SSH keys with a recent encryption, check github's instructions
- upload your public keys to github
    - If you want to use HTTPS authentication (or not do the SSH setup)
    - change Icebergs setting, "Metacello Integration" with the value HTTPS
    ![imagen](https://user-images.githubusercontent.com/708322/197169064-c6bf0bd2-762c-4bbe-b48c-daedb2d3aeef.png)
	- create an access token to be able to push (and make sure of giving it permissions by ticking the check boxes)

### Configuring Pharo with startup action. 

You can define in your preference folder a file finishing by `.st`.
This will be automatically executed each time you start the system.
You can place SSH or HTTPS Github configurations

Here is a sample, it hides the logo to help you know if the actions have been executed. 
You can execute this file explicitly by using the System>run startup script menu item. 

```
StartupPreferencesLoader default executeAtomicItems: {
	StartupAction 
		name: 'Logo' 
		code: [ PolymorphSystemSettings showDesktopLogo: false] .
	StartupAction 
		name: 'Git Settings' 
		code: [ 
			Iceberg enableMetacelloIntegration: true.
			IceCredentialsProvider sshCredentials
					username: 'git';
					publicKey: '/Users/XXX/.ssh/id_rsa.pub';
					privateKey: '/Users/XX/.ssh/id_rsa'.
			IceCredentialStore current
					storeCredential: (IcePlaintextCredentials new
					username: 'GHUSER';
					password: 'PassWord';
					host: 'github.com';
					yourself).		


			IceCredentialStore current
				storeCredential: (IceTokenCredentials new
					username: 'GHUSER';
					token: 'YOUR TOKEN';
					yourself) 
				forHostname: 'github.com'.
			]. 
}.

```

