---
layout: ../layouts/BlogPost.astro
title: Jumblie Build Log
slug: jumblie-build-log
description: 'I built Jumblie, a jumbled word search game. Here''s how!'
tags:
  - learning
  - technical
added: 2023-11-28T18:50:37.893Z
---

I built a word game called [Jumblie](https://jumblie.com) that I'm very excited about, and I'm gonna tell you how I did it! This is gonna be long, so buckle up.

## Why I built it

A friend of mine, [Jason](https://www.learnwithjason.dev/), is starting a video series where he gives 4 developers 1 idea (aptly named **[4 Web Devs, 1 App Idea](https://youtu.be/zR8dUhLPK80?si=8GLivmrZ6B_ILRuk)**, wow), and he asked us to build something that could use a leaderboard.

When I see "leaderboard" I think "game" which meant I had to come up with a very fun game worth playing, and build it in less than a couple weeks.

## How I came up with it

Not to be a mega-shill for my own company, but we have an app called [Brainstory](https://www.brainstory.ai/) that I'm really into. You can use it to brainstorm ideas, and I needed to think hard about what sort of game I wanted to make!

I came to Brainstory saying "sooo I want to make a game" and slowly but surely it walked me through some of my thoughts around complexity and themes, and I came up with the concept of a jumbled word search game!

I knew I wanted to:

* Make a daily puzzle that changes each day
* Have 4, 5, 6, and 7 letter words, jumbled together
* Make it play kind of like the [New York Times Connections](https://www.nytimes.com/games/connections) game
* Have it be mobile and desktop friendly

## What I did next

Obviously I bought the domain name first. Duh.

## But actually though, what I did next: gathered words

Okay so I knew I wanted to jumble the 4 random words together, but I didn't have piles of words to pull from. So, I literally googled "lists of words with 4 letters" (and 5 letters, and 6, and so on), and scraped the lists just in the developer console of the browser, and pasted those into text files.

Then, I wrote Python, which is not something I should ever be allowed to do, and used it to pull out words at random into a JSON array of arrays of 4, 5, 6, and 7 letter words:

```python
import json
import random

def read_words(filename):
    with open(filename, 'r') as file:
        return file.read().splitlines()

def create_game_data():
    words_4 = read_words('4words.txt')
    words_5 = read_words('5words.txt')
    words_6 = read_words('6words.txt')
    words_7 = read_words('7words.txt')

    game_data = []

    for _ in range(min(len(words_4), len(words_5), len(words_6), len(words_7))):
        game_data.append([
            random.choice(words_4),
            random.choice(words_5),
            random.choice(words_6),
            random.choice(words_7)
        ])

    return game_data

def write_json(data, filename):
    with open(filename, 'w') as file:
        json.dump(data, file, indent=4)

def main():
    game_data = create_game_data()
    write_json(game_data, 'wordlist.json')
```

The output was very simple:

```js
[
	["vote", "serve", "trucks", "upscale"],
	["fast", "point", "wooden", "general"],
	["heal", "wound", "forest", "wrestle"],
	// ...
];
```

But as you can imagine, when I made my first prototype of the game, it was... impossible to win.

![First Jumblie version](/assets/jumbliev1.png)

It was just too hard! I had my braintrust (a.k.a. my cousin group chat) play it and one of my poor cousins had 81 guesses with no success. Noah, if you're reading this, I'm still so sorry.

Back to the drawing board, I had to come up with a way to make this game significantly easier. My sister had recommended I come up with a theme for each of the groups of words, which meant I had to do some sorting.

## Enter... large language models

I work at an AI company, I should probably think to use AI more in general.

I first thought that I'd keep all of my words that I had already scraped from the internet, and just ask the LLM to sort them all.

I prompted:

```
I have a JavaScript array of objects. Each object has a property words that has an array of 4 words (each with 4 letters, then 5 letters, then 6 letters, then 7 letters).

For example:

[
{ words: ["gods", "truck", "anodes", "bifocal"] },
{ words: ["heal", "wound", "forest", "wrestle"] },
{ words: ["shop", "bound", "august", "numbers"] }
]

I want you to rearrange all of the words across the arrays by theme (while still having each one with 4 letters, then 5 letters, then 6 letters, then 7 letters), and add a theme property to each element, providing a theme for the 4 words.

(and then I pasted my mega array)
```

But, this... was not a good output. I really learned that generating a new dataset is significantly easier than working with an existing one when you're using LLMs. LLMs are good at making stuff up.

I talked to my coworker Kevin (thanks Kevin) who gave me some tips on messing with prompting and formatting. There were quite a few things I learned, for example LLMs have general semantic knowledge of words, but not really the actual length of words. I got some amusing outputs where the LLM actually knew that it was wrong:

```json
{
	lengths: [4, 5, 6, 7],
	words: ["pear", "apple", "banana", "cherries"],
	theme: "Fruits",
	isValid: false
 },
```

Also, as outputs get longer, the LLMs get more and more inaccurate. I would get responses that were good for like the first 50 or so words, but if I wanted something closer to 1000, it would offer worse and worse output. There were times where it would give me the theme "finance" and the words would be like "microeconomics" and "macroeconomics" for the shortest words, or I would ask it for themes and it would start with something like "ocean" and end up with "Space Battle Royale Candyland Confectionary" (which was honestly very funny but incredibly hard to work with).

Eventually, I had a prompt that would allow for multiple kinds of words per theme, and I wrote a script on top of that to choose words from the output:

```
Give me a list of themes. For each theme, generate a list of words that fit that theme, broken up by length. The lengths should always be between 4 and 7 letters. Never include other word lengths! For example:

{
    space: {
        4: ["mars", "moon", "star", ...],
        5: ["comet", "earth", "venus", ...],
        6: ["galaxy",  "nebula", ...],
        7: ["jupiter", "mercury", ...]
    },
    ...
}
```

It wasn't the best output, but I was able to get a solid 150 or so themes and word combos (and I decided to also let it occasionally go up to 9 letters because the poor bot couldn't handle the restrictions), which would take me far enough that I could actually implement the game.

## Actually building the game

Some might say I over-engineered this game already, but I prefer the term "thoroughly thought-out". I decided to also continue this line of thorough thinking by building the app without any frameworks, just pure HTML, CSS, and JavaScript. Probably not the best move in hindsight. We live and we learn.

Anyway! Jumblie was about as basic as it could get at first, where it would take the letters from the day's words, jumble them up, and plop them on the screen as clickable buttons, with the theme displayed on the screen as well.

![Jumblie with a theme and some more styles](/assets/jumbliev2-theme.png)

After this, it... just worked. I added a scoring setup so that based on the word you guessed, it would be assigned to a color, and you could copy the score just like with games like Wordle and Connections:

> Jumblie #12🟠🔴🔵🟢5 guesses

I went from this to adding features like keyboard support (which was painful, because events when you click buttons versus when you type are treated differently in the browser), a shuffling option (which was also painful, because I had to refactor how letters were differentiated on the screen), handling duplicate guesses (which was again painful because when you don't use a framework, you gotta do some really funky imperative programming where you select the div, select the word in the div, compare it with the current guess, etc), and a timer (which was actually not that painful, phew).

## Remember why you built this, Cassidy?

But, I still needed a leaderboard! I... ran out of time to build a real one against your friends. But the best competition is against yourself, I say! Right? Eh. Anyway.

I set up local storage to:

* Save your best times while playing
* Save your longest streak while playing the game
* Save your current streak

You know what's fun? Time zones. My word, time zones. A very common ask from folks was asking for pausing functionality and autosaving if you exit the game, and my word, setting up time zones with this scoring and the personal leaderboards made me lose far too much sleep and happiness. But, once I finally, finally fixed all of them (she said, foolishly), the personal leaderboard setup was complete!

## Freeeeedom!

Since "finalizing" the game, I've been so happy with how much people play it! I added [Fathom Analytics](https://usefathom.com/ref/CDEUHI) out of curiosity to see how it was doing (which was a learning experience in itself, because ad blockers made certain game functionality not work unless I "rearranged" where the analytics stuff lived), and as of writing, there's around 800-1000 people who play it daily!

I've since added features like:

* Ability to add the game to your home screen
* [A puzzle archive](https://jumblie.com/archive/)
* [A way for users to suggest new puzzles](https://jumblie.com/suggest/) (because I am NOT going to deal with AI again for that)

I've gotten some other requests for things like internationalization (which would take a fairly large refactor I admit), actual shared leaderboards with friends, and a mobile app! I'm thinking about how I'll implement those, but until then, I'm super happy where Jumblie is at right now.

Some of my favorite feedback is from folks who are not in my circles at all. Some folks have messaged me saying that this is their family group chat's favorite game now, some others have said that it gives them the right level of difficulty beyond Wordle, and I've even gotten some fun traction from [fans of the show Devil's Plan](https://middleclass.sg/trending/jumblie-the-devils-plan/), because there was a similar game on the show!

Phew, anyway, if you'd like to play it, **check out [Jumblie here](https://jumblie.com) and please do share it with your friends!**

Until next time!
