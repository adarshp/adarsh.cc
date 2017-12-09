---
layout: post
title: "Setting up a Jekyll site (yet another tutorial)"
date: "2016-03-07"
tags: howto
---

**Update May 9, 2017:**: I have switched again, this time to [GatsbyJS](https://github.com/gatsbyjs/gatsby), and the hosting to [Netlify](https://www.netlify.com)

**Update Nov 1, 2016:**: I have switched to [Hakyll](https://jaspervdj.be/hakyll/) to manage this website, but the tutorial below should still work :).

You will find many such tutorials on the web, but this one is specifically geared for physics grad students at the University of Arizona.

First, install [Jekyll](https://jekyllrb.com). If you have Ruby set up on your
computer, this should be as simple as doing:

```bash
gem install jekyll
```

Then make a new website with it:

```bash
jekyll new mywebsite
```
Then change to the website directory and serve it locally to live-preview changes - go to `http://localhost:4000` on your browser.

```bash
cd mywebsite
jekyll serve
```

In the `_posts` directory, you can type up your blog entries in markdown, with the following format: `year-month-date-title.md`. For example, this entry is titled: `2016-03-07-setting-up-a-jekyll-site-yet-another-tutorial.md`.

What if you don't have the time to blog? Well, neither do I, but following the advice of [Matt Might](http://matt.might.net/articles/how-to-blog-as-an-academic/), I can perform 'low-cost academic blogging' by putting up the following on my website:

* Teaching materials
* If a colleague asks me about something that I think might be useful for the outside world to know (and won't lead to me being scooped!) - I 'reply all' by putting up a post on that topic.
* When I give a presentation, I upload the slides and a summary.
* When I submit a paper to the arXiv, I would upload a summary and a link to the preprint.
* Calculations in Quantum Field Theory can be pretty involved, and if I think that I can save some other poor grad student the pain of calculating some Feynman diagrams or somesuch, I would put up my notes.

These are just a few examples, you can of course put whatever you want :)

Also, if you don't want to deal with blog posts and dates and such, and just want to have pages, it turns out that you can do so by just creating new directories with markdown files in them. For example, if you are teaching Physics 141 and want to have a webpage for it, you can just make a directory called `teaching`, and place a markdown file called `phys141.md` in it. Jekyll will automatically parse it into appropriate pages.

There are a few quirks in deploying your webpage to the UA physics server, bohr (you have to change the base url in a certain way, etc) - you can do so by changing a couple of variables in the `_config.yml` file:

```bash
url: http://www.physics.arizona.edu/~username

# fixes finicky URLs with bohr
baseurl: /~username

# If you want pages on your website in addition to blog posts
gems: [jekyll-paginate]

# Makes the links look pretty
permalink: pretty

# Enables incremental rebuilding - so you don't have to regenerate the # whole site when you just add a single post (significantly speeds things up)

incremental: true
```

If you're a UA physics grad student trying to set up a website on bohr, you can do so by doing the following:

```bash
ssh username@physics.arizona.edu
(enter your password)
makehome
```

This makes a public_html folder that you can put your website in, and you can access it with `physics.arizona.edu/~username`.

You can deploy your jekyll website to this `public_html` folder  with a simple script.

```bash
#!/bin/sh

sudo jekyll serve --detach
rsync -crz --delete _site/ username@physics.arizona.edu:public_html/
ps aux|grep jekyll|awk '{print $2}'|tail -n 1|xargs sudo kill -9

``` 

The first line generates your website and detaches the jekyll server. The second pushes your website to bohr. The third line kills the jekyll process for you automatically (so you don't have to manually kill the process with `kill -9 PID`)

**Tip 1** You can automate the creation of blog posts with scripts in the language of your choice. I use the shell script posted [here](http://nateeagle.com/2011/09/21/easier-post-creation-for-jekyll-with-bash/), but a quick Google search should reveal other methods, some are Python scripts, some are Vim packages, whatever floats your boat :)

**Tip 2** One of the strong suits of static site generators like Jekyll is that they work well with version control. So I would suggest putting this website as a Github repository, and writing a script to commit and push changes whenever you add new stuff! In fact, the [source code](https://github.com/adarshp/website) for this website is on Github as well, you may want to check it out to help set up your website.
