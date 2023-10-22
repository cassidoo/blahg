---
layout: ../layouts/BlogPost.astro
title: Thirteen Potions Build Log
slug: thirteen-potions
description: 'I made a game called Thirteen Potions for js13kgames, here''s how I did it!'
tags:
  - events
  - technical
  - learning
added: 2023-10-22T05:13:41.638Z
---

I built a game that I call [Thirteen Potions](https://cassidoo.itch.io/thirteen-potions), and I'm gonna tell you how and why I did it!

## Backstory

I've always wanted to participate in a game jam, but for one reason or another, I've never taken the leap and done one. So, this year, I decided to force myself to actually do one that I've been following for a while, [js13kGames](https://js13kgames.com/)!

js13kGames is a month-long competition that's been running since 2012, and the challenge of it is that you have to make a game in 13 kilobytes or less of JavaScript, based on a theme. That is... a very small size, but I felt like the restrictions would be good for me to not over-engineer anything and just go for it.

This year's theme was **13th Century** and I noodled on some ideas that involved knights of some kind, and thought some kind of small time-based game would be good. Thirteen Potions is a game where you are a knight, and you have to get 13 potions in the map as fast as you can, using your arrow keys!

That being said, ugh, spoiler alert, I messed up a ton: I didn't realize that the game engine that I would ultimately pick counted towards the final game size, so my game was disqualified in the end. BUT, I still had fun and finished it, so that's a win enough for me!

## Technologies and tools

I used the [Phaser framework](https://phaser.io/) to build the game! I didn't pick it for any particular reason, I just saw that they were offering prizes at the end of the game jam so I thought it'd be a good choice. In hindsight, once again, I should have read the fine print and realized that Phaser is very large for this kind of game jam, but MOVING ON.

I also used [Aseprite](https://www.aseprite.org/) for editing pixel art, which I initially got from [Kenney](https://www.kenney.nl/)!

To make the map, I used the [Tiled](https://www.mapeditor.org/) map editor.

The rest of the app is built with just JavaScript on a single `index.html` page. The code is \~\~probably\~\~ definitely not as cute as it could be, but I was just trying to make it work, so I didn't do any sort of optimizations.

## Setting up the game

I didn't really know how Phaser (or game development with an engine) worked at all, so I copied from some getting started guides.

```javascript
let config = {
	type: Phaser.AUTO,
	width: 720,
	height: 480,
	parent: "game-container",
	pixelArt: true,
	scene: {
		preload: preload,
		create: create,
		update: update,
	},
	physics: {
		default: "arcade",
		arcade: {
			gravity: { y: 0 }, // Top down game, so no gravity
		},
	},
};
let game = new Phaser.Game(config);

function preload() {
	// Runs once, loads up assets like images and audio
}

function create() {
	// Runs once, after all assets in preload are loaded
}

function update() {
	// Runs once per frame for the duration of the scene
}
```

After doing some "hello world" level stuff in here, I realized I had to get some graphics on the screen.

## Making the map

When I first messed with Phaser, I just used a 2D array to plop in my tiles, but that was *very* tedious. That's when I discovered the [Tiled](https://www.mapeditor.org/) map editor! I was able to "paint" with my tilemap to create a map with various layers. I made a ground layer, a wall layer, an enemy layer, and a potion layer.

![Tilemap](/assets/tilemap.png)

Tiled lets me export the map as JSON, and lets me also say which tiles should have collisions enabled, which is the spawn point, and also any other custom properties I might want, which was cool.

I admit I struggled with collisions and had to ask for a bunch of help online for it. I initially had the ground and the walls all on one layer and tried a `collides: true` property to make that work, but I found that separating them out into different layers worked a lot better (and more efficiently):

```javascript
const groundLayer = map.createLayer("Ground", tileset, 0, 0);
const wallLayer = map.createLayer("Walls", tileset, 0, 0);
wallLayer.setCollisionByExclusion([-1]);
```

## Making the main character

I loved the tilemap I got from [Kenney](https://www.kenney.nl/) because it had everything I could need for my map (and more). That being said, I needed to edit the knight a bit so that I could have a walking animation and multiple perspectives.

I'd never used [Aseprite](https://www.aseprite.org/) before, but it was luckily pretty straightforward to copy and paste and slightly edit the knight into a little spritesheet!

![Knight spritesheet](/assets/knights.png)

I really liked how easy Phaser made it to add the knight to the screen. I just had to:

1. Get my spawn point from the map
2. Add the player to the "physics" part of Phaser
3. Have the player collide with the wall layer and the edges of the map
4. Make the player animate when you hit the directional arrows

```javascript
const spawnPoint = map.findObject(
	"Things",
	(obj) => obj.name === "Spawn"
);

player = this.physics.add
	.sprite(spawnPoint.x, spawnPoint.y, "knight")
	.setInteractive(this.input.makePixelPerfect(0));
this.physics.add.collider(player, wallLayer);
player.setCollideWorldBounds(true);

this.anims.create({
	key: "right",
	frames: this.anims.generateFrameNumbers("knight", {
		start: 0,
		end: 1,
	}),
	frameRate: 10,
	repeat: -1,
});

// ...(more directional buttons)
```

Now the player was able to move, but I wasn't able to see where they were going!

## Setting up the camera

Making the camera and the canvas size line up was weirdly hard (I reeeeally didn't understand how they were supposed to go together at first), but once it worked, the code was way smaller than I expected. Literally all of the final camera code was only four lines!

```javascript
let camera = this.cameras.main;
camera.zoom = 4;
camera.setBounds(0, 0, 720, 480);
camera.startFollow(player);
```

After making a camera, I zoomed in on the player a bit, set the boundaries as the map size, and then followed the player!

## Enemies and potions

Now that I had the player moving in the map the way I wanted, I was able to add in the potions and the enemies. Because I already had layers for them, it was a matter of:

1. Getting their layer from the tilemap
2. Creating a static group of potions in the "physics" part of Phaser
3. Creating an object per potion in the layer and adding it to the static group at the proper height and location

```javascript
let PotionLayer = map.getObjectLayer("Things")["objects"].slice(1);

let potions = this.physics.add.staticGroup();
PotionLayer.forEach((object) => {
	let obj = potions.create(object.x, object.y - 16, "potion");
	obj.setScale(object.width / 16, object.height / 16);
	obj.setOrigin(0);
	obj.body.width = object.width;
	obj.body.height = object.height;
});
```

Once I did this, making the player collide with each potion was a one-liner!

```javascript
this.physics.add.overlap(player, potions, collectPotion, null, this);
```

The `player` colliding with the `potions` results in the `collectPotion` callback. That callback removed the potion from the game, and increased the score.

```js
function collectPotion(player, potion) {
	potion.destroy(potion.x, potion.y);
	potionScore++;
	text.setText(`Potions left: ${13 - potionScore}`);
	return false;
}
```

(The `text` part I won't get into, long story short it's just the text on the screen, where one thing of text is the potions left, and the other is the timer.)

Doing this for the enemies (some spooooooky ghosts) was the exact same thing, only the callback function for that collision slowed the player down and made them red for a couple seconds (as enemies do):

```javascript
function zappy() {
	speed = 50;
	player.alpha = 0.6;
	player.tint = 0xff0000;
	setTimeout(() => {
		speed = 100;
		player.alpha = 1;
		player.clearTint();
	}, 2000);
	return false;
}
```

## That's all, folks

And after that... the game was pretty much done. I didn't get deep into the `update` function (which was mostly just "if you press this button, the sprite should be facing that direction") or the text showing how much time you've spent in the game, but you can find all of that code and more [in the GitHub repository for Thirteen Potions](https://github.com/cassidoo/thirteen-potions).

Hopefully next year, I can make a game that actually is 13 kilobytes, but until then, I was very grateful for [the feedback from the game jam itself](https://dev.js13kgames.com/2023/games/thirteen-potions), and all of the folks [who played it online](https://cassidoo.itch.io/thirteen-potions)! The most humbling thing is the fact that there's now two people who have beat my best time in my own game (52 seconds, heyo). Which is also awesome.

Anyway, thank you for reading and playing!
