---
title: Rethink What's Too Big to Build With AI Coding Tools
description: >-
  Dan Luu argues AI coding agents changed which software projects are worth
  trying. Here's how to apply that thinking to your own annoying tools and
  workflows.
type: standard
status: published
publishDate: '2026-10-25T15:34:17.145Z'
author: Andrew Reed
tags:
  - AI
  - AI coding agents
  - software projects
  - testing
  - productivity
slug: rethink-whats-too-big-to-build-with-ai-coding-tools
reviewer_notes: ''
source_url: 'https://danluu.com/ambitious/'
source_item_id: 6add8cd8571b7d0a4db2d867
source_title: We should be more ambitious with the software we build
generated_by: claude
featuredImage: /assets/images/rethink-whats-too-big-to-build-with-ai-coding-tools.webp
quality_score: 76
score_breakdown:
  seo_quality: 72
  tone_match: 70
  content_length: 95
  factual_accuracy: 82
  keyword_relevance: 62
quality_note: >-
  A well-structured, practical, appropriately hedged article with clear H2 steps
  and a good word count (880), but the title is a bit long (~58 chars is fine,
  though not keyword-rich), the meta description is slightly over 160 chars, and
  the subject (AI coding for developers) only partly aligns with the site's
  everyday-user topics, with no device or software versions specified.
reading_time: 4
topics:
  - App Mastery Guides
  - apps
image_alt: >-
  Developer reviewing code, tests, and performance benchmarks on a laptop at a
  tidy desk.
---
You probably have a list of software you wish existed, or wish were faster, that you dismissed as "too much work." A recent essay by Dan Luu, titled "We should be more ambitious with the software we build," argues that list deserves a second look. Its claim: AI-assisted development has changed the cost of ambitious projects, and many of us are still judging scope with a pre-agent mindset.

This piece pulls out the practical part: how to decide what's now worth attempting, and how to keep the result from turning into junk.

## What Luu is actually arguing

Per Luu's essay, AI-assisted development has made once-impractical rewrites, tooling experiments, and performance work feasible for small teams or even individuals. The examples he uses include pgrust, experiments with faster regex, ripgrep and Rust builds, filesystem tooling, and board-game AI. According to the essay, projects like these can reach "works for me" status, or even serious quality, much faster than they used to.

I'm relying on the summary of the piece here, so read the original at danluu.com/ambitious for the specifics and numbers behind each example. The thread running through them is a mismatch: what developers believe is too hard versus what is now achievable.

## Step 1: Re-audit your "too big" list

This is the most useful habit to borrow, and you don't need to be a professional programmer to try it.

1. Write down five tools, scripts, or apps that annoy you. Slow file searches, a clunky spreadsheet process, a tool that almost does what you need.
2. Next to each, note why you never tackled it. Usually the answer is "it would take weeks."
3. Ask the question the essay's framing invites: what would you rebuild if the cost dropped tenfold?
4. Pick the one where the answer excites you most.

That tenfold figure is a thought experiment, not a measured result from Luu's piece. The point is to stop using your old estimates automatically.

## Step 2: Aim for "works for me" first

The essay describes projects reaching "works for me" quality quickly. That's a smart first target. A personal tool that handles your own files, your own data, and your own workflow doesn't need to handle every edge case on earth.

Set a small, concrete goal: "search my notes folder in under a second" beats "build a better search engine." You can always raise the bar later if the thing proves useful.

## Step 3: Pick performance problems first

One of the essay's angles is that performance tooling is ripe for ambitious work. The examples around regex, ripgrep, and Rust builds all concern making existing things faster. These are good candidates for a practical reason: you can tell whether you succeeded.

If you can say "this took 40 seconds before and takes 10 now," you have an objective result rather than a vibe. Look for the waits in your day: builds, searches, exports, syncs. Those are your targets.

## Step 4: Use testing to separate real from "vibeslop"

The essay lands amid widespread skepticism about AI-generated "vibeslop," and the skepticism is reasonable. Its answer, as summarized, is that rigorous testing and benchmarking turn AI leverage into real progress rather than junk.

You can apply that without being an expert:

- **Keep a reference.** If you're replacing or speeding up something, keep the original around and compare outputs on the same inputs.
- **Test with your real data.** Run the new tool on actual files, not just tidy examples.
- **Measure before and after.** Write down timings so claims like "faster" mean something.
- **Don't trust code because it ran once.** Run it on odd cases: empty files, huge files, strange characters.

If an AI tool hands you something that looks finished, treat that as a draft that hasn't been checked yet. The checking is what makes it engineering.

## Step 5: Start with a prototype, not a plan

The mindset shift in the essay is from "too big" to "prototype it." Rather than spending a week deciding whether a project is feasible, spend an afternoon building a rough version and see where it breaks. The cost of finding out has dropped, so finding out is often cheaper than deliberating.

A reasonable rule: if you'd be willing to lose an afternoon on it, try it. If the prototype hits a wall, you've learned exactly where the hard part is, which is more than a planning session would tell you.

## Where to be cautious

The essay is an argument, and reasonable people disagree with it. The Hacker News thread on it drew a few hundred comments, which suggests the topic is contested. Some caution is sensible:

- A prototype that works for you isn't a product others can depend on.
- Replacing critical systems (anything holding important data) deserves far more testing than a personal utility.
- Speed of creation doesn't remove the work of maintaining something afterward.

These are my own observations, not claims from Luu's piece.

## The takeaway

Pick one irritating tool from your list today, define a "works for me" goal you can measure, and build a rough version with a comparison test beside it. If the numbers beat the old way, you've found a project that was never as big as you assumed.
