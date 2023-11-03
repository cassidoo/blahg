---
layout: ../layouts/BlogPost.astro
title: Adding co-authors to TinaCMS's Git commits
slug: tina-co-author
description: You can add co-authors to the TinaCMS bot now more easily
tags:
  - meta
  - technical
added: 2023-11-03T02:39:34.905Z
---

One of the things that bugged me since [starting using TinaCMS](https://blog.cassidoo.co/post/trying-tinacms/) was that the bot for the CMS did the GitHub commit for me, and I didn't get that juicy green square on my profile when I blogged. I thought a nice workaround would be to configure [Git commit co-authors](https://dev.to/cassidoo/co-authoring-git-commits-3gin), but they didn't have a way to customize the commit message yet.

BUT after doing some poking in the TinaCMS Discord group about it, that's not an issue anymore!

You can now go to your [TinaCMS settings](https://app.tina.io/account/settings) to add yourself!

![](/assets/tinacmscoauthor.png)

You'll need to add your GitHub username, but for your email, if you want to keep that private, you need to get that from GitHub. [Go to your email settings](https://github.com/settings/emails), and then scroll to the "Keep my email addresses private" to find the email address that GitHub made for you to keep your personal email private.

![](/assets/primaryemailcoauthor.png)

And now, HA, this post was written by me AND committed by me, using TinaCMS. Woo hoo!
