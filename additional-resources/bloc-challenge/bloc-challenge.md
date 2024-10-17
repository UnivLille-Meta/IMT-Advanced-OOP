## Objectives

Here is a video named [boum](boum.mov).

* Level 1 - Reproduce it with Bloc 
* Level 2 - Put two asteroids that moves towards each other, and explode when colliding
* Level 3 - Asteroids everywhere, moving randomly, exploding and/or bouncing when colliding

## Level 1

### Loading and parsing resources

You will use the following resources:
- [The asteroid sprite](https://github.com/ycorre/molecular/blob/master/res/action/characters/o001Sp.png)
- [The explosion sprite](https://github.com/ycorre/molecular/blob/master/res/action/characters/expl001Sp_Fire_fixed.png)
- [The sprite configuration](sprite-config) where `size` represents the number of images in a sprite row and `numberOfImages` the total number of images to parse.

To load an image, you need to execute the code `Form fromFileNamed: 'absolute path on your disk'`.
You will obtain a `Form` image representing the full sprite, that you will need to cut out to obtain each sprite frame.

### Executing code in separate processes

You will easily observe that if you run a Bloc animation, your image will freeze until the animation ends.
To avoid that, you should run your animations in separate processes.
You do that as follows:

```Smalltalk
[
    `...Your running code...`
    30 milliSecond wait.
] fork
```
`Your running code` is the code that you want to execute in your process.
Typically, it will be an update loop of your animation containing coordinates updates, sprite frame update, etc.

`30 milliSecond wait.` waits for 30 milliseconds during which the rest of the system can execute its own code. That way Pharo does not freeze during the animation.

The `fork` instruction spawns the new process, and starts its execution concurrently to the rest of the system.

### Modeling the animation application

You should create a model for:
- the sprites
- the animation
- the application (basically, a class with a "run" method that starts the animation)

## Level 2

Now, in addition, you need to:
- build a collision engine that checks, at every loop pass, checks if the asteroids collide
- condition the explosion of asteroids to the detection of a collision

## Level 3
### More resources
Use multiple kind of asteroids and explosions, use everything you want from [here](https://github.com/ycorre/molecular/tree/master/res/action/characters).
You will have to dig up the configuration of each sprite from [Level1.json](https://github.com/ycorre/molecular/blob/master/conf/Level1.json) and [Level2.json](https://github.com/ycorre/molecular/blob/master/conf/Level2.json).