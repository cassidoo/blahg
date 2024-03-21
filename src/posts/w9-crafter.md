---
layout: ../layouts/BlogPost.astro
title: Building W-9 Crafter
slug: w9-crafter
description: >-
  I built an app for generating Form W-9s for U.S. contrators and freelancers,
  here's how!
tags:
  - learning
  - technical
added: 2024-03-21T21:25:57.226Z
---

Helllloooo! I just shipped an app called [W-9 Crafter](https://cass.run/w9) that generates Form W-9s for you in a single click.

I first "pitched" this app in Discord way back in 2021 when I was complaining about how I have to make W-9s for all of my various contracting clients and newsletter sponsors, and the form information is always the same except for the date.

I stewed on that for a while, and then learned that the Form W-9s in the U.S. were being updated March 2024, and figured it was prime time to actually build a generator for Form W-9s!

## The initial prototype

I first started building the app in the browser, using PDF.js and Download.js to take a PDF and edit it, and then download it to your computer.

![W-9 Crafter initial web app](/assets/w9screenshot1.png)

At first, I built something that would have you actually fill out an HTML form, populating the entire document, but realized all I *really* needed to generate every time was a new date on an existing form. Scope creep be darned!

## Electron time

After that, I wanted it to generate the same form every single time I opened the app and clicked a button, just with a different date, so I decided to pull out [Electron](https://www.electronjs.org/) to be able to get the document path that I wanted to edit.

Normally, when you upload a file via the HTML `<input>` tag, you can't get the file path, for very obvious security reasons. But, in Electron, it exposes `file.path` variable, so I was able to save that to local storage! So whenever you opened the app, it would edit the same form at the same location every single time. Woo hoo!

![W-9 Crafter app](/assets/screenshot-windows-2.png)

I thought I could be done there, but alas, Electron is *huge*. When I bundled the entire application, it was 300MB. That's almost the entire storage a 1st generation iPod Shuffle could hold! Waaaay too big for a small app like this.

## Incoming: Tauri!

[Tauri](https://tauri.app/) seemed like the "thing" I should switch to because everybody loves Rust (heh), and because it ships significantly smaller apps.

I want to take a pause to do a quick shout out to [Jacob Bolda](https://www.jacobbolda.com/) and [Alex Riviere](https://alex.party/) (and other great Twitch viewers) for helping me convert the app on the stream! You saved my bacon!

Tauri was a really interesting thing to try out for this app in particular. They had just released version 2 of the framework, which made my application much easier to build, but with the con of the documentation not being fully up-to-date yet. There were some hiccups I ran into (for example permissions around opening files and writing new files) but nothing too bad.

The one thing that *was* particularly weird is that the default for Tauri saving files is that it overwrites an existing file instead of generating a new one when they have the same name (for example it *doesn't* do `blah.png` and then `blah (1).png`), which was challenging to figure out. I ended up making [a little file checker](https://gist.github.com/cassidoo/c780a0045acb6b2c5b0b51b99ebda8b0) to solve that.

![W-9 Crafter app](/assets/screenshot-windows-1.png)

I will say... I found the Electron developer experience to be significantly smoother (all of my actual Electron code was less than 10 lines of code) than Tauri. Tauri though has more configuration, permissions, and is more "close to the metal" than Electron. I did like feeling a bit more in control of the outcome of the application and all that it did.

In the end, the app ended up being a teeny tiny 12MB instead of 300!! Absolutely worth it.

## Gimme the app, Cassidy!

Okay! Stop shouting!

You can get W-9 Crafter from [cass.run/w9](https://cass.run/w9), and use discount code `BLAHG20` to get 20% off because I like you. Generally. Currently. We're working on our relationship.

This is my first time ever selling an app that I've made. I admit I don't know a lot about pricing, and I haven't shipped something solo like this before. It's been a cool learning experience making a [Product Hunt listing](https://www.producthunt.com/posts/w-9-crafter), a [small demo video](https://youtu.be/er1KSIZCHdA), and allll the social posts ([Twitter](https://twitter.com/cassidoo/status/1770900985382138291), [LinkedIn](https://www.linkedin.com/feed/update/urn:li:activity:7176671512903528448/), [etc](https://youtu.be/dQw4w9WgXcQ)).

Thanks for following along!
