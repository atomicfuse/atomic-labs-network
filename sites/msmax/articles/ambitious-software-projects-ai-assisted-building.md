---
title: What Would You Build If Software Got 10x Cheaper to Try?
description: >-
  Dan Luu argues AI coding tools changed what's worth attempting. Here's how to
  find the one annoying tool in your own routine worth rebuilding or improving.
type: standard
status: published
publishDate: '2026-10-25T15:18:07.718Z'
author: Andrew Reed
tags:
  - AI
  - software development
  - AI coding agents
  - productivity
  - testing
slug: ambitious-software-projects-ai-assisted-building
reviewer_notes: ''
source_url: 'https://danluu.com/ambitious/'
source_item_id: 6add8cd8571b7d0a4db2d867
source_title: We should be more ambitious with the software we build
generated_by: claude
featuredImage: /assets/images/ambitious-software-projects-ai-assisted-building.webp
quality_score: 72
score_breakdown:
  seo_quality: 62
  tone_match: 70
  content_length: 95
  factual_accuracy: 72
  keyword_relevance: 62
quality_note: >-
  A well-structured, practical piece with clear H2/H3 headings and a useful
  step-by-step framework, but the title (~51 chars) is more of a hook than a
  keyword target, the meta description runs slightly long (~165 chars), the tone
  is undefined so a generic match is the best available, it leans on a single
  external source with specifics (pgrust, HN stats) that cannot be verified, and
  it only partly covers site topics (AI, productivity) while skewing toward
  developer-level content over everyday-user guidance.
reading_time: 4
topics:
  - App Mastery Guides
  - apps
image_alt: >-
  Laptop displaying code tests beside a notebook mapping an everyday workflow
  for a software rebuild.
---
Most of us carry a mental list of software we wish existed, or wished ran faster, and quietly dismissed as "too big to bother with." Programmer Dan Luu, writing on danluu.com under the title "We should be more ambitious with the software we build," argues that list deserves a second look. AI-assisted development, he says, has changed what a small team or a single person can reasonably attempt. By the end of this piece, you'll have a simple way to sort your own "too big" ideas into ones worth trying this month.

A note on scope: this is about the mindset behind the argument, not a step-by-step coding tutorial. You don't need to be a professional developer to use the thinking, but some of the examples below are developer-level projects.

## The core idea: the cost of trying has dropped

Per Luu's article, AI coding agents have changed the cost model for ambitious software projects. Rewrites, tooling experiments and performance work that once looked impractical can now reach a "works for me" state much faster, and in some cases reach serious quality.

The examples Luu points to include:

- **pgrust**, a project in the rewrite-something-big category
- Faster regex, ripgrep and Rust build experiments
- Filesystem tooling
- Board-game AI

The common thread is that these are the kinds of projects many developers would have written off as weeks or months of effort for one person. Luu's point is that many of us are still estimating scope with a pre-agent mindset.

## Why that matters even if you don't write code

You may not be rebuilding a database. But the same shift applies to everyday tech frustrations: a slow script, a clunky workflow, a tool that almost does what you need. If trying a fix costs a fraction of what it used to, more of those annoyances become worth attacking.

That's the practical question worth asking yourself: **what would you rebuild or fix if the cost dropped tenfold?** That framing is our own take on Luu's argument, not a number from his article, but it's a useful test.

## A simple way to sort your "too big" list

Try this once, in about fifteen minutes.

### Step 1: Write down five annoyances

Think about the tools you use weekly. Which ones are slow, brittle or missing a feature? Examples: a spreadsheet macro that takes minutes to run, a file-renaming chore you do by hand, a build or export step that makes you wait.

### Step 2: Mark which ones you dismissed for effort, not for value

Cross out anything that's genuinely not valuable. Keep the ones where the only objection was "that would take forever." Those are the candidates where, according to Luu's argument, your estimate may be out of date.

### Step 3: Pick the smallest one and aim for "works for me"

Luu's examples emphasize reaching a "works for me" state quickly. That's a sensible bar: not a polished product, just something that solves your own problem. Prototype it with whatever AI assistant you already use, and give yourself a fixed window, such as one weekend.

### Step 4: Decide up front how you'll know it works

This is the step that matters most, and it's next.

## Testing is what separates real projects from junk

The article lands amid widespread skepticism toward low-quality AI-generated output, sometimes called "vibeslop." Luu's case is that rigorous testing and benchmarking are what turn AI leverage into real progress rather than noise.

You can borrow that discipline at any skill level:

- **Compare against a known-good result.** If you're replacing a manual process, run both on the same input and check that the outputs match.
- **Measure before and after.** If your goal is speed, time the old way first. A number beats a feeling.
- **Test on messy real data,** not just the clean example the AI handed you.
- **Keep your original.** Don't delete the old tool or file until the new one has survived real use.

The performance-focused examples in Luu's piece, such as regex and build-time experiments, are naturally suited to this because speed is measurable. That's likely why they're ripe for ambitious attempts: you can prove whether you won.

## Where to be careful

Skepticism about AI-generated work isn't unfounded, and Luu's argument isn't "trust the output." It's closer to "attempt more, and verify harder." Some practical guardrails:

- Don't run unreviewed code on files you can't replace. Work on copies.
- Be cautious with anything touching passwords, financial data or system settings.
- If you can't explain roughly what the tool does, treat it as a prototype, not something to rely on.

## The mindset shift

The change Luu describes is moving from "that's too big" to "let me prototype it and see." Prototyping is cheap now; judging the result honestly is where the real work lives.

The Hacker News discussion of the piece drew 280 points and 238 comments at the time of capture, which suggests the question of how ambitious to be is far from settled. You don't have to agree with every claim to benefit from the exercise.

## Your next move

Pick the one annoyance on your list you dismissed purely because of effort, set a one-weekend limit, write down how you'll test it before you start, and try it.
