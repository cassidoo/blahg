---
layout: "../layouts/BlogPost.astro"
title: "HTML+CSS Tutorial, Part 2"
slug: html-css-part-2
description: "This is part 2 of a two-part tutorial for beginners as an introduction to HTML and CSS."
added: "Feb 10 2014"
tags: [technical, advice]
---

### What

This is Part 2 of this tutorial, where we start from the very beginning of HTML and CSS. You don't need to know anything about HTML and CSS or anything about code to start.

[You can find Part 1 here.](http://cassidoo.github.io/html/css/tutorial/2014/02/10/html-css-tutorial/)

I'll included some tutorial files for you to play with and check out here: [HTML+CSS Tutorial Files](https://github.com/cassidoo/HTML-CSS-Tutorial/archive/master.zip)

### When

Now. Or whenever. I'm not planning on taking this down anytime soon. But you are only limited by your own schedule. Or set free by it. Whatever.

### Where

On a computer. Here.
I have this tutorial hosted on [my GitHub account](https://github.com/cassidoo/HTML-CSS-Tutorial) if you'd like to look at it there, or if you'd like to suggest improvements!

### Why

Because this stuff is important. Whether you're a business person formatting your emails, an aspiring web designer wanting to get your feet wet, or just someone who is interested and hasn't tried any sort of coding, scripting, or programming before, **HTML and CSS are an essential part** of your learning curve.

## Table of Contents

- HTML (this half is in a separate post, for your readability, because I care)
  - Editors
  - Tag Structure
  - Text Structure
  - Links
  - Other tags
    - Images
    - Line Breaks
    - Tables
  - Making Things Gorgeous The Wrong Way
    - Colors
    - Width and Height
    - Borders
    - Text Styles
  - The `<head>` tag
  - Putting it all together so far
- CSS
  - Classes and IDs and other Segregation
    - Classes
    - IDs
    - Other Segregation
      - The `<span>` tag
      - The `<div>` tag
        - Background color
        - Floating
        - Positioning
        - Margins and Padding
        - Z-Index
  - The `<link>` Tag, Comments, and other Developer Joys
    - The `<link>` tag
    - Commenting
      - HTML Comments
      - CSS Comments
    - Other Developer Joys
      - Forms
      - HTML5 and CSS3
      - How To Meet Ladies/Laddies (Get it? HTML Jokes are the best...)
- Final Project!
- And now, the end is near

## CSS is magical, and now you're gonna learn it.

So far, we've been making things pretty the wrong way. So, we're going to learn it the right way. So excited.

Right now, I'm going to show you how to write CSS just straight in your HTML documents. That's still kind of wrong, but it'll give you the basics. After that, we'll move into the big leagues and have separate files for everything. Pumped.

Open up your **3 - Styles** folder again and open style2.html in your favorite editor. This site is pretty barebones. Let's take out the barebones part and just make it pretty.

We're going to be working in the `<head>` tag again. Underneath the `<title>` tag, stick in the following:

    <style>
    	body
    	{ }

    	h1
    	{ }

    	p
    	{ }

    	ol
    	{ }
    </style>

Congratulations. You have some empty CSS. Now, what the heck is CSS anyway? Well, CSS stands for _Cascading Style Sheets_. Gee whiz, that word _style_ is everywhere. And it's true. The `style` attribute is for styling _inline_ HTML (just that line of code), the `<style>` tag is for holding CSS, and CSS _defines_ the styles! Let that sink in. Nice. Stylish. Just like you.

Now, you'll notice some familiar keywords in there, in particular, `body`, `h1`, `p`, and `ol`. That's right, they're the tags we know and love! But, in CSS, these are called _selectors_. The selector tells us what tag you're about to style. So, whatever code you put in between the curly braces `{}` after the `body` selector will affect everything in the `<body>` tags. Whatever you put in the braces after the `p` selector will affect what's in the `<p>` tags.
Whatever code you have in those curly braces will only affect that tag, so if you try editing the font colors for the `h1` selector, it won't affect whatever is in the `p` selector's tags. Each portion of code `selector { code }` in CSS is called a _declaration_. Make sense? Good. If not, keep reading and hopefully it will become more clear as we go on.

The code that we're going to be putting in each declaration is the same syntax as the code that we normally put in the `style` attribute. How convenient. So, change your code above to the following:

    <style>
    	body
    	{
    		font-family: Arial;
    	}

    	h1
    	{
    		color: red;
    		text-align: center;
    	}

    	p
    	{
    		font-weight: bolder;
    	}

    	img
    	{
    		width: 400px;
    		border: 5px solid #333333;
    	}

    	ol
    	{
    		color: #333333;
    	}
    </style>

Recognize that? It's exactly the same! For each selector, there is a _property_ of that selector, and each property has a _value_, just like how we wrote it in the `style` attributes!

You will always have your CSS in the syntax, `selector { property: value; property: value; }`. I've only shown you some properties so far, but don't worry. There are plenty more to come.

Try playing around with the CSS we have right now. Edit the colors, add some borders, change the font styles. Don't forget your semicolons!

###Classes and IDs and other Segregation

So, you have some of the CSS basics down already. You're so smart. It's really a simple language, once you know the basic syntax. So, now we'll get into more fancy stuff. What if you want to edit several tags differently?

#### Classes

Let's say that we have 8 `<p>` tags on our HTML page (hint: open style3.html in the **3 - Styles** folder).  
If we want to style each of these tags differently, we can use _classes_. A class is actually an HTML attribute that you can name whatever you want.  
Check out style3.html to see the classes I added to the `<p>` tags on the page. When you add a class, the user doesn't see it.  
But, you can style specific classes to do what you want, instead of having all `<p>` tags be the same.

How about we style one of the classes specifically? It's simple. Just take the class name you made up (I'll use the `poemtitle` class for my example) and add a period `.` in front of it to select it in CSS, like so:

    .poemtitle
    {

    }

And there you have it! Even though you might have different styles for your paragraphs, you can style the ones of class `poemtitle` individually.  
For this example, let's make all paragraphs with the font family Arial, the `poemtitle`s font weight `bolder`, the `author`s the color `#555555`, and the `poem`s in `italic`.  
Try doing it on your own if you can (just put your code in the given `<style>` tags), but you're welcome to cheat:

    p
    {
    	font-family: Arial;
    }
    .poemtitle
    {
    	font-weight: bolder;
    }
    .author
    {
    	color: #555555;
    }
    .poem
    {
    	font-style: italic;
    }

Gosh you're good at this. Go eat a cookie.

[Pausing here for cookie break]

#### IDs

Now, let's talk about IDs. They are very similar to classes. The only real difference between classes and IDs is that you can only have one of each ID. So, for example, if you have a special paragraph that you only want to style once, then you can stick in there the `id` attribute like so:

    <p id="special">This is so special that I want it uniquely styled forever.</p>

When you want to style your IDs, you put a hashtag `#` before it in your CSS, like so:

    #special
    {

    }

Remember: You can only use an ID once. IDs are more helpful when you're controlling the element with JavaScript, not styling, but that's something for another day.

#### Other Segregation

Let's say that you want to separate individual text in your paragraphs or sections on your page. Let's introduce 2 new tags: `<span>` and `<div>`.

##### The `<span>` tag

The `<span>` tag is pretty invisible unless you style it. It's used to group _inline-elements_ (so like a word in a paragraph), and it doesn't actually do anything unless you style or manipulate it with something else.

So, let's say you have a paragraph and you really want to emphasize some text within a paragraph without a line break or anything. In comes `<span>`. For example:

    <p>"My grandmother started walking <span>five miles a day</span> when she was sixty. She's ninety-seven now, and <span>we don't know where the heck she is.</span>" </p>
    <p>~ Ellen DeGeneres </p>

In the above quote, you might want to style the `<span>` tags differently than the rest of the paragraph. Maybe you want those words bold, or italics, or in red. Now you can.

Add some `<span>` tags around your favorite lines of the poems in style3.html of the **3 - Styles** folder. Then, put the following CSS in your `<style>` tags:

    p span
    {
    	font-style: italic;
    }

Wait a minute. Hold up. `p span`?? WHY THE SPACE? Calm yourself, I'll tell you. This is called _nesting_ CSS. When you have a space in your selector like this, it means that, in this case, the style will only affect `<span>` tags within `<p>` tags. So, if you put `<span>` tags around a word in your `<h1>` tags, your CSS will not affect it. You can still have a plain `span` selector, or nest it in one of your classes too:

    span
    {
    	font-weight: bold;
    }
    .author span
    {
    	color: #999999;
    }

Make sense? I hope so. To sum up: `<span>` tags separate specific parts of paragraphs or other inline sections of a page. They do nothing otherwise. You can nest CSS if you want. Boom. Next.

##### The `<div>` tag

Alrighty. Go enjoy a beach vacation and then come back to this.

Welcome back.

The `<div>` tag is very similar to the `<span>` tag, in that it separates a section of something but doesn't do much else. However, the difference with `<div>` tags is that they are _block level_ elements, not just within a line of text.

The `<div>` tag might end up being the tag that you use most often. It is what lets you easily make website layouts (with help from CSS of course), and so, let's play with it!

Open up the **5 - Layout** folder, and use your editor to open `homepage.html`.

    <!doctype html>
    <html>
    	<head>
    		<title> My Website </title>
    		<style>

    		</style>
    	</head>
    	<body>
    		<div class="header"></div>
    		<div class="menu"></div>
    		<div class="content"></div>
    		<div class="footer"></div>
    	</body>
    </html>

Besides the `<div>` tags, everything here should look familiar. Each of the `<divs>` have a `class`, which means we should style those, right? Right.

Within those `<style>` tags, let's add some pizzazz.  
First, let's throw in what we'll be styling: the `<html>` (it is unusual to style this, but I'll explain why we are later), `<body>`, and each of the 4 classes:

    html
    {

    }
    body
    {

    }
    .header
    {

    }
    .menu
    {

    }
    .content
    {

    }
    .footer
    {

    }

This should be straightforward for you so far. The first thing we'll do is create our layout by making each `<div>` a different size.

    html
    {
    	height: 100%;
    }
    body
    {
    	height: 100%;
    }
    .header
    {
    	width: 100%;
    	height: 60px;
    }
    .menu
    {
    	height: 100%;
    	width: 15%;
    }
    .content
    {
    	height: 200px;
    }
    .footer
    {
    	height: 60px;
    	width: 100%;
    }

Whoa ho ho, slow down there. What the heck is with these `%` signs?? Well, what this means is that if, for example, a tag's `width` is `75%`, then it's width on the page will be 75% of it's _containing element._
So when you see that the `.menu` class has a `width: 15%;`, it takes up 15% of its containing element's width, which is the `<body>` tag.

Typically, the `height` property defaults to `0%` and the `width` property defaults to `100%`.  
This is why we had to style the `height` properties of both `<html>` and `<body>`.
If we had just made our `.menu` selector have a height of `100%`, we know that 100% of zero is just zero, so we wouldn't have a menu showing up!  
When we made the `<body>` tag have `height: 100%`, it also would still be zero, because our `<html>` tag also had a height of 0 without the CSS helping it out.
Now, if we had just said `height: 50px;` for `.menu`, we wouldn't need the `height` fixes for `<html>` and `<body>`, because it's given a set value, not a value dependent on others.  
Makes sense? I hope so. You're hot.

Okay, so if you open `homepage.html` in the browser, you see nothing. That's okay. Let's change that by learning a few new CSS properties!

###### Background color

One property that you will learn to know and love is `background-color`.  
It does exactly what you would expect it to: it sets the background color of the element it is styling!  
You can fill it in with HEX colors or RGB colors, just like we learned earlier, and the default color is white.

Let's add some backgrounds.

    html
    {
    	height: 100%;
    }
    body
    {
    	height: 100%;
    }
    .header
    {
    	background-color: #99B5DD;
    	width: 100%;
    	height: 60px;
    }
    .menu
    {
    	background-color: #DE90B1;
    	height: 100%;
    	width: 15%;
    }
    .content
    {
    	height: 200px;
    }
    .footer
    {
    	background-color: #0F215D;
    	height: 60px;
    	width: 100%;
    }

Save in your editor and now refresh in that browser! WOW. COLOR. Now, our site definitely isn't perfect yet.  
Let's throw some MORE new CSS properties at you!

###### Floating

One property that you will probably use fairly often is `float`. This is one of those properties that you will learn to both love and hate.
It's kind of magical.
So, let's say that you want to have a picture in a paragraph. When you see a picture in a news article or even a paper you're writing, the picture is either on the left or the right.  
It's the same in CSS! If you wanted to put a picture in a paragraph, you'd make the `<img>` tag inside a `<p>` tag have the properties `float: left;` or `float: right;`.
So, what does this have to do with `<div>` tags? Why could you potentially hate it?

I'll tell you.

With CSS float, a given element can be pushed to the left or right, allowing other elements to wrap around it.  
An element with `float` affecting it will move as far to the left or right as it can.  
Usually this means all the way to the left or right of the containing element.

Pretty simple, right? Right. Now, here's the cause for hate: sometimes, `float` just doesn't stop.  
It has the potential to mess up your layouts and have things move around other things, and really just give you a headache.
How do you stop that?

With the `clear` property! On the element(s) after any floated elements, make sure that they have `clear: both;` on them (we say `both` because it turns off both `left` and `right` floating).  
Let's add `float: left;` to the `.menu` and `.content` sections, and `clear: both;` to the `.footer`:

    html
    {
    	height: 100%;
    }
    body
    {
    	height: 100%;
    }
    .header
    {
    	background-color: #99B5DD;
    	width: 100%;
    	height: 60px;
    }
    .menu
    {
    	background-color: #DE90B1;
    	height: 100%;
    	width: 15%;
    	float: left;
    }
    .content
    {
    	height: 200px;
    	float: left;
    }
    .footer
    {
    	background-color: #0F215D;
    	height: 60px;
    	width: 100%;
    	clear: both;
    }

Now if you refresh your browser, things are starting to look a bit more sexy. Like you.

Let's add more delight to this! So let's think, what if you're on your website, but you want to see the footer.  
You scroll down. What if, though, you want to see the header again? You'd have to scroll back up.

That's exhausting.

Your poor finger.

Let's make it so that your header and footer are always on the top and bottom of your screen, and only your content moves!

Incoming, the `position` property.

###### Positioning

The `position` property is pretty much exactly what one would expect a positioning property to do: It positions things.

It can have several states, but we'll focus on the 3 states you'll probably use most: `absolute`, `relative`, and `fixed` (the default state is `static`, but you will rarely need to work with this).

- In `absolute` positioning, the selected element will be placed in an exact location on the page, and moves with the page. So, in our example, the header could be placed at the top of the page and the footer at the bottom, but when you scroll, they will move with the page and they won't stay where they are supposed to. Some people like this, some don't. In our case, we won't use this.
- In `relative` positioning, the selected element will be placed _relative_ (fancy that) to its default position. I'll show you an example of this later.
- Now, `fixed` positioning is just like `absolute` positioning, except that once an element is placed in an exact location on the page, it is stuck there. A similar example is like a watermark on a video. It stays the same there, no matter what the content is.

How do we actually position things after you use `position`? You can use `top`, `bottom`, `left`, and `right` to place it.
So, for example, if you want a header bar to be at the top of the page (but it's okay if it scrolls with the page), you'll have `position: absolute;` and `top: 0px;` because you want it to be 0 pixels from the top.
If you have an image on your page that's sitting on the left of your document, but it's way too far left, you can do `position: relative;` and `left: 5px` to scoot it 5 pixels to the right (because you're adding space to the left).
Another more complicated example could be if, say, you want a 50px by 50px image to stay in the bottom right corner of your page as you scroll, you could do `position: fixed;` and `right: 50px;` and `bottom: 50px`. You'll understand it more as we use it!

So, let's get rid of our `float` on `.menu` and `.content`, and the `clear` on the footer. Let's position everything using `position` instead, like so:

    html
    {
    	height: 100%;
    }
    body
    {
    	height: 100%;
    }
    .header
    {
    	background-color: #99B5DD;
    	position: fixed;
    	top: 0px;
    	width: 100%;
    	height: 60px;
    }
    .menu
    {
    	background-color: #DE90B1;
    	height: 100%;
    	width: 15%;
    	position: fixed;
    	left: 0px;
    	top: 60px;
    }
    .content
    {
    	height: 200px;
    	position: absolute;
    	top: 60px;
    	left: 15%;
    }
    .footer
    {
    	background-color: #0F215D;
    	position: fixed;
    	bottom: 0px;
    	height: 60px;
    	width: 100%;
    }

We are starting to look really hot now.  
If you refresh your page in the browser though, you'll notice that there's a little space to the left of our header and footer.  
Why the heck is that happening?

I'll tell you.

###### Margins and Padding

![Alt](https://raw2.github.com/cassidoo/HTML-CSS-Tutorial/master/cpbm.jpg)

I made the diagram above to show you what the heck you'll be working with.

First, let's look at the CSS property `margin`. Like you can see above, `margin` is the space _outside_ the content's border.  
Think of it as the 1 inch margins when you write a paper, or the margins of the pages of a book.

The HTML `<body>` tag actually has a natural margin, which is why our header and footer have the space on their sides. S
o, let's add `margin: 0px;` to our `<body>` (that's all we'll change right now though):

    body
    {
    	height: 100%;
    	margin: 0px;
    }

Now, let's talk about `padding`. Padding is the space _inside_ the content's border. Now, if you look at our `.content` currently, it is uncomfortably close to our `.menu`. These things are not meant to be touching. I would insert a joke here but you can figure out what the punchline would be.

Anyway.

Let's add some padding into our `.content` and `.header` so that our text has some breathing room. Our CSS should look like this now:

    html
    {
    	height: 100%;
    }
    body
    {
    	height: 100%;
    	margin: 0px;
    }
    .header
    {
    	background-color: #99B5DD;
    	position: fixed;
    	top: 0px;
    	width: 100%;
    	height: 60px;
    	padding: 10px;
    }
    .menu
    {
    	background-color: #DE90B1;
    	height: 100%;
    	width: 15%;
    	position: fixed;
    	left: 0px;
    	top: 60px;
    	padding: 10px;
    }
    .content
    {
    	height: 200px;
    	position: absolute;
    	top: 60px;
    	left: 15%;
    }
    .footer
    {
    	background-color: #0F215D;
    	position: fixed;
    	bottom: 0px;
    	height: 60px;
    	width: 100%;
    }

Oh darn! Did you see how our header expanded? If you did this right, our header is now starting to overlap the menu and content. Crap.

There is a way to fix this.

So, instead of adding space to margins and padding on all four sides, you can add them just to the top, bottom, left, and/or right. There's a few ways to do this:

- `margin: 5px 10px 15px 0px;`
  - top margin is 5px
  - right margin is 10px
  - bottom margin is 15px
  - left margin is 0px
- `margin: 15px 0px 5px;`
  - top margin is 15px
  - right and left margins are 0px
  - bottom margin is 5px
- `margin: 5px 10px;`
  - top and bottom margins are 5px
  - right and left margins are 10px
- `margin: 15px;`
  - all four margins are 15px

The same goes for `padding`, you can also do `padding: 5px 10px 15px 0px;`, etc. for all of the properties above. We're going to make some changes to both the `.header` and the `.menu` here:

    html
    {
    	height: 100%;
    }
    body
    {
    	height: 100%;
    	margin: 0px;
    }
    .header
    {
    	background-color: #99B5DD;
    	position: fixed;
    	top: 0px;
    	width: 100%;
    	height: 60px;
    	padding: 0px 10px;
    }
    .menu
    {
    	background-color: #DE90B1;
    	height: 100%;
    	width: 15%;
    	position: fixed;
    	left: 0px;
    	top: 60px;
    	padding: 10px 0px 0px;
    }
    .content
    {
    	height: 200px;
    	position: absolute;
    	top: 60px;
    	left: 15%;
    	padding: 10px;
    }
    .footer
    {
    	background-color: #0F215D;
    	position: fixed;
    	bottom: 0px;
    	height: 60px;
    	width: 100%;
    }

Now, with all that you've learned so far, you should probably make this a really great, functional website.  
I'll teach you just one more thing, and then I'll set you free like a bird or something.

###### Z-Index

The property `z-index` isn't one that you'll run into super often, but it's something that will help you in the long run.

Now, if you think of your screen as a stack of layers, like a stack of paper on the screen.  
Layer 1 is the lowest layer, and the higher the number, the higher the layer.

The numbers in `z-index` are the same. If an element has `z-index: 0;`, then it is a bottom layer.  
If you have an element with a `z-index: 5;`, it's going to be on the 5th layer.

When you create a page and you don't add `z-index` to anything, the layers are just in order.  
So in our example, the `.header` was created first, so it's on the lowest layer, and the `.footer` was created last so it is on the top layer.

We don't want that. What if your `.content` had a ton of information and you had to scroll the page?  
The content would overlap on top of the header (because we just HAD to make our header `fixed`).

So, let's add some `z-index` magic to our page! A couple things to note first:

- `z-index` only works when you have already set the `position` of an element.
- You can assign any number you want to `z-index`, as long as it is an integer (no decimals), and as long as the highest number is the highest level, and the lowest number is the lowest level.

Okay, I'm going to add some `z-index` properties to the page, and I'm also going to add some text changes that you have seen before (`text-align`, `font-family`) and one that you haven't seen before (`font-size`... you get one guess to figure out what this does):

    html
    {
    	height: 100%;
    }
    body
    {
    	font-family: Arial;
    	height: 100%;
    	margin: 0px;
    }
    .header
    {
    	background-color: #99B5DD;
    	position: fixed;
    	top: 0px;
    	width: 100%;
    	height: 60px;
    	padding: 0px 10px;
    	font-size: 50px;
    	z-index: 10;
    }
    .menu
    {
    	background-color: #DE90B1;
    	height: 100%;
    	width: 15%;
    	position: fixed;
    	left: 0px;
    	top: 60px;
    	padding: 10px 0px 0px;
    	text-align: center;
    	z-index: 5;
    }
    .content
    {
    	height: 200px;
    	position: absolute;
    	top: 60px;
    	left: 15%;
    	padding: 10px;
    	z-index: 0;
    }
    .footer
    {
    	background-color: #0F215D;
    	position: fixed;
    	bottom: 0px;
    	height: 60px;
    	width: 100%;
    	z-index: 10;
    }

And there you have it! Look at your website in your browser and feel proud of yourself. Eat some cake. Do a dance.

Now you can see how flexible `<div>` tags really are. You can style them pretty much any different way you want without breaking a sweat.

So, you have this delightful homepage set up now, try adding some content and play with the CSS a bit to make it your own! Add colors, change sizes, the works.
When you click on the links to the other pages, About and Contact, you'll notice that they have no style right now (unlike you). Change that! Try making your own layout for each of those pages. If you're really digging what we've made here, that's cool too. You can copy over the styles to each page.

But hey, that's a LOT of reusing code. Plus what if someone is trying to read your code, and they don't get what you're doing (because they aren't as smart as you are)? Is there a better way?

Duh.

### The `<link>` Tag, Comments, and other Developer Joys

Let's just say you want to reuse your styles across your website on every page. It makes sense.  
It'd be kind of annoying to have drastic changes on every page.

#### The `<link>` tag

That's where the `<link>` tag comes in! The `<link>` tag is an empty tag (like <br> and <img>), so it has no end tag, and it's used to link to external stylesheets!

What the heck is an external stylesheet? Well, put simply, it's CSS, in its own file.

You write the `<link>` tag like this:

    <link rel="stylesheet" type="text/css" href="main.css">

Let's take a look at those attributes. The `rel` attribute is for _relationship_.  
It specifies the relationship between the current document and the linked document, which will almost always be `stylesheet`.  
I've never actually seen it in action with anything other than `stylesheet`, but if you really want to know other values you can look it up.
The `type` attribute will also pretty much always be `text/css`. If it's ever anything else when you want to use it with CSS, I will be quite surprised.
And finally, `href`. You remember this one, I hope! It's just like our `<a>` tag. It is the URL of the stylesheet.

Let's check out this `<link>` tag in action. Open up the **6 - Linking** folder and open home.html, and paste the `<link>` line above on the line below the `<title>` tags in the `<head>`. Voila! That's it. Refresh your browser and check out the magic. It should look just like what we made in the previous section!  
Now, if you open the main.css file in your editor, you'll see that it's all the CSS you recognize and love, but there's no `<style>` tags. Those tags aren't needed when you are using a CSS file!

#### Commenting

Let's just say that you want to show off your code to someone, but they're not exactly sure what you're doing.

You can add comments!

_Comments_ in your code are blocks of text that will not be read by the computer. Every computer language has them.

##### HTML Comments

In HTML, a comment looks like this:

    <!-- This is an HTML comment! -->

As you can see, it almost looks like a regular tag, with an opening `<!--` and an ending `-->`. You can put this pretty much anywhere in your HTML files and it won't affect your work!

Look inside the **7 - Project** folder, and open index.html. You'll see a few comments there. Notice how you can put them all on one line, or in a multi-line block! As long as you have a beginning `<!--` and end `-->`, you have total freedom with comments.

##### CSS Comments

Don't worry, you can comment your CSS too!

A comment in CSS is similar to HTML in that it has a beginning and end part, but it looks a little different:

    /* This is a comment in CSS! */

Just like in the HTML comments, you have a beginning `/*` and an end `*/`.  
If you open up main.css in the **7 - Project** folder, you can see the comments I wrote in there!  
And again, you can have single-line comments, and multi-line ones too.

Comments are great for keeping track of what you're doing, especially if a project you're working on spans over a period of time.  
You can make notes for yourself to check later, or you could just tell someone who is reading your code that they are attractive.

#### Other Developer Joys

There's so many things that could go in this section for such a generic title. So, what am I going to tell you?  
Well, I'm going to tell you what I _haven't_ taught you so far.

##### Forms

A common thing you'll see on websites are forms, like textboxes, buttons, and checkboxes.
I didn't teach you these because you can't do things with them unless you know a bit more than beginner knowledge, which isn't the purpose of this tutorial.

If you're really dying to see a button, here you go:

    <button type="button">Click Me!</button>

And there you have it, a button on your website! If you actually want to know how to make the button or form do something, you'll need to know some JavaScript.
Until you do, here's more information on buttons: [W3Schools - HTML Forms](http://www.w3schools.com/tags/tag_form.asp)

##### HTML5 and CSS3

If you've read anything about the internet and developing for it, you've probably heard some key words thrown around, and a couple of those key words are HTML5 and CSS3.
What are those, actually? Well, HTML5 is the latest standard for HTML. The previous HTML version came out in 1999, which is quite a while ago. Unless you're time traveling right now and you printed this out to read as you go.

Anyway. HTML5 was designed to deliver rich content without the need for additional plugins (for example, Shockwave Flash, Silverlight, etc.), and can handle everything from animation to graphics, music to movies, and can also be used to build complex web applications.
Not to mention the fact that it works on every device, from tablets to phones to your standard computer.

CSS3 has a bunch of new features too. From new selectors to fancy text effects to 2D/3D tranformations, there's just so much to learn!

If you want to read more about HTML5 and CSS3, check out some of the links below. If you feel like you've mastered the materials you learned here, you're probably ready to start diving in further!

- [W3Schools - HTML5](http://www.w3schools.com/html/html5_intro.asp)
- [W3Schools - CSS3](http://www.w3schools.com/css/css3_intro.asp)
- [HTML5 Rocks](http://www.html5rocks.com/)
- [Dive Into HTML5](http://diveintohtml5.info/)

##### How To Meet Ladies/Laddies (Get it? HTML Jokes are the best...)

Honestly I have nothing to put here I just like the joke that HTML stands for that.

I hope your HTML is spin and <span>. Heh.

## Final Project!

Alrighty! So you've looked at the **7 - Project** folder a bit, but I haven't told you what that folder is for yet.

Well guess what.

It's a project. [confetti]

With all that you've learned so far, make something! I want you to make a website about the most attractive person in the room.

You.

Put a photo up of yourself, add a biography, talk about your skills (be sure to include HTML and CSS among them) and experiences, make it the online version of you.

Use `<div>` tags and CSS to make a really awesome layout. Style everything in the text from `<h1>` to `<p>`.

Include lists `<ul>` and links `<a>`! Make it sparkly.

I made your homepage for you, and your main CSS document. But don't let that limit you! Add as much as you want, and experiment!

The best way to learn is by doing. Do as much as you can until you think you have everything down pat.

And if you need help you can always come back and visit. :)

## And now, the end is near

Actually, now the end is here.

You've learned pretty much all that I can teach you. Congratulations, really. I'm not even going to joke around here.
You've accomplished something that will help you for years to come!

Show off your website to your friends, and be proud of what you've done!

And with that, I'm signing off.

Thanks for reading, you beautiful specimen, you.
