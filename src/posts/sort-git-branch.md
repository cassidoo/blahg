---
layout: ../layouts/BlogPost.astro
title: Sorting Git branches
slug: sort-git-branch
description: >-
  If you're tired of your git branches being alphabetically sorted, you can
  change that!
tags:
  - technical
added: 2024-02-15T15:46:32.808Z
---

Normally when you run `git branch` on a repository, you get your list of branches in alphabetical order, which can be very annoying if you have a lot of them (unless you have a very rigid naming system by ticket number or something).

You can change that now!

In your repo, if you do:

```shell
git branch --sort=-committerdate
```

This will sort all of your branches by the date of their last commit!

You can sort by:

* `authordate`
* `committerdate`
* `creatordate`
* `objectsize`
* `taggerdate`

Plus, you can also do this globally if you want to always do it by one of these, like so:

```shell
git config --global branch.sort -committerdate
```

Or, you could set an alias:

```shell
git config --global alias.brcd "branch --sort=-committerdate"
```

Now go on and git committing!
