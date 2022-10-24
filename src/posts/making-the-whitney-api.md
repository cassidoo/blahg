---
layout: "../layouts/BlogPost.astro"
title: "Making the Whitney Houston API"
slug: whitney-houston-api
description: "I made a Whitney Houston API. Because why not."
added: "Jul 26 2015"
tags: [technical]
---

I'm a Whitney Houston fan. Anyone who's known me for more than a [moment in time](https://www.youtube.com/watch?v=c84ogrNEds0) would know that (see, making references already, agh I'm so funny).

Anyway, I took a nap the other day and I dreamt that I made a Whitney Houston API. So obviously I had to make one.

But, I had never made an API from scratch before. [I had nothing](https://www.youtube.com/watch?v=FxYw0XPEoKE). But I had to try.

First, I had to get all of the songs she ever recorded. Wikipedia came to save the day. I scraped [the article of all of her songs](https://en.wikipedia.org/wiki/List_of_songs_recorded_by_Whitney_Houston) with a Python script, and then got to work on parsing it. Let me tell you, it was not fun. The HTML in Wikipedia tables is a pain in the BUTT to deal with. Sure, I _could_ do it, but I wouldn't wish that mess on anyone. So, I said to myself, [it's not right, but it's okay](https://www.youtube.com/watch?v=6J538b-OLRU), I'll get through this.
Once I filtered out a lot of crap (like stripping out the links and the special characters) and broke it down into something readable, it looked more like this:

```
    "Could I Have This Kiss Forever"
    Whitney Houston and Enrique Iglesias
    Diane Warren
    Whitney: The Greatest Hits and Enrique
    2000
    |-
```

So, it had the title of each song, the artists who sang (most of these were just Whitney), the writer(s), the albums on which the song appeared, and the year it was released. And the weird `|-` delimiter between them.

The next stop was to convert all of this to JSON. I was all, "[I look to you](https://www.youtube.com/watch?v=5Pze_mdbOK8)" to [JSON API](http://jsonapi.org/) and Stack Overflow at this point so I could make sure I was formatting everything properly. Some kind folks helped me refactor my original script I wrote into this efficient one here:

```py
    from itertools import groupby
    import json
    names = ["title", "artist","writer","album", "year"]

    with open("test.csv") as f, open("out.json","w") as out:
        grouped = groupby(map(str.rstrip,f), key=lambda x: x.startswith("|-"))
            for k,v in grouped:
                    if not k:
                                json.dump(dict(zip(names,v)),out)
                                            out.write("\n")
```

Thanks so much to [Padraic Cunningham](http://stackoverflow.com/users/2141635/padraic-cunningham) for the assistance with this one. I really wanted to make a reference to the song, [Same Script, Different Cast](https://www.youtube.com/watch?v=5FQgxxJ0Jrg) just because of the excellent pun but the show must go on.

Anyway.

I finally had some clean JSON that I could work with!

At this point, I was doing a TON of research into how to actually make an API just from JSON. I didn't want anything fancy like a database or anything, because I figured just a GET would do for this project. After asking plenty of questions here and there and starting and restarting and asking myself [why does it hurt so bad](https://www.youtube.com/watch?v=_EHoj-Oe-Ws) to just do something simple, I found [Instant API](https://github.com/jbradforddillon/instant-api-py)! It was a great solution, and seemed pretty extensible.

After tweaking and adding some functionality of my own (like an `/all/album` route for example, for each of the groups), I had it! My first API. Sure, it's not perfect, and I'd like to add in functionality for lyrics and other queries, but for now, I'm [celebrating](https://www.youtube.com/watch?v=zgsIGEm3f7w)! [I learned from the best](https://www.youtube.com/watch?v=YFVnVuTcz9I) people on Stack Overflow and in various Facebook groups, so thanks to all of those who helped me understand all of this!

[Here's a link to the Whitney Houston API](https://github.com/cassidoo/whitney-api). Again, it's still a work in progress, but it's been fun so far!
