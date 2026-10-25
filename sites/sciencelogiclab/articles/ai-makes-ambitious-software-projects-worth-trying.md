---
title: Why AI Makes Big Software Projects Worth Trying Again
description: >-
  Dan Luu argues AI coding tools changed what's worth attempting. Here's how to
  rethink which projects are too big, and why testing separates real work from
  junk.
type: standard
status: published
publishDate: '2026-10-25T11:13:27.387Z'
author: Emma Kim
tags:
  - Future Science Now
  - AI coding
  - software development
  - programming
  - software quality
slug: ai-makes-ambitious-software-projects-worth-trying
reviewer_notes: ''
source_url: 'https://danluu.com/ambitious/'
source_item_id: 6add8cd8571b7d0a4db2d867
source_title: We should be more ambitious with the software we build
generated_by: claude
featuredImage: /assets/images/sciencelogiclab-general-article.webp
quality_score: 59
score_breakdown:
  seo_quality: 62
  tone_match: 62
  content_length: 60
  factual_accuracy: 72
  keyword_relevance: 40
quality_note: >-
  A clear, well-structured and practical article with good headings, but it is
  short at 669 words (below the 800-word target), has a long title and
  description, and only loosely fits the science-and-discovery brief since it is
  a software-industry opinion piece summarizing one blogger's post with vague,
  hedged example descriptions.
reading_time: 3
topics:
  - Unseen World Explained
  - Why We Ask
  - Fact Or Fiction
  - Future Science Now
---
Most of us carry around a mental list of projects that are too big to try. Rewrite that slow tool. Build a better version of something everyone tolerates. Dan Luu, in a post titled "We should be more ambitious with the software we build," argues that list is out of date. By the end of this article you'll know his core claim, the examples he uses, and a simple way to audit your own "too big" list.

## The claim: the cost of trying has dropped

Luu's argument, as summarized from his post, is that AI-assisted development has changed the cost model for ambitious software. Rewrites, tooling experiments, and performance work that once demanded a funded team can now be reached by a small group or one person.

The problem, he suggests, is mindset. Developers still judge project scope the way they did before AI coding agents existed. If your sense of "how long this takes" was calibrated years ago, you may be rejecting projects that are now cheap to attempt.

That gap between what people think is too hard and what is actually achievable is the opportunity. Think of it as a pricing error: the cost fell, but the price tag in your head didn't.

## What ambitious looks like in practice

Luu points to several examples, per his post:

- **pgrust**, a project in the territory of rebuilding database software, the kind of undertaking most people would once have dismissed outright.
- **Faster regex, ripgrep, and Rust build experiments**, which target tools developers use constantly.
- **Filesystem tooling**, another area where everyday slowness is often accepted as normal.
- **Board-game AI**, a project where progress can be measured by how well the program plays.

His point is that projects like these can now reach "works for me" much faster, and in some cases serious quality.

## Why performance tooling is a natural target

Slow builds, slow searches, and slow file operations are irritations most developers live with. They rarely get fixed because fixing them is a big job with an uncertain payoff.

Performance work also has a built-in referee: you can measure it. Either the new version is faster or it isn't. That makes it a good fit for AI help, because you don't have to trust the output on faith. You run the benchmark.

## Vibeslop versus serious engineering

Luu's post lands amid widespread skepticism toward AI-generated "vibeslop," meaning code produced quickly, never checked, and shipped on good feelings. The skepticism is understandable.

The difference between junk and infrastructure, the post argues, is rigor. Rigorous testing and benchmarking turn raw AI speed into something you can rely on. A rewrite that passes a thorough test suite and beats the original on benchmarks is a real result, regardless of who or what typed the code.

This is a useful rule of thumb for judging any AI-assisted project, including your own: what evidence says it works?

## A quick audit for your own "too big" list

You can turn Luu's idea into a ten-minute exercise.

1. **Write down three annoyances.** Pick tools or systems you use daily that feel slower or clunkier than they should.
2. **Ask what the old estimate was.** Note how long you assumed a fix would take, and why you never started.
3. **Ask what would change at one-tenth the cost.** If the price dropped dramatically, would you try it?
4. **Define the test first.** Decide how you'd know the new version is correct and faster before you build anything.
5. **Aim for "works for me."** A personal-use prototype is a legitimate first milestone, and it tells you whether the bigger version is worth pursuing.

Step four matters most. Without a way to verify results, you're making vibeslop. With one, you're doing engineering.

## The takeaway

Pick one project you wrote off as too big, write the test that would prove it works, and spend an afternoon seeing how far you get. Your old estimate may be the most outdated part of the plan.
