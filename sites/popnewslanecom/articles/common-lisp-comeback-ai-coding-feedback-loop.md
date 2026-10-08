---
title: 'Common Lisp Is Back, and AI Coding Might Be Why'
description: >-
  A blog post arguing Common Lisp is now the best programming language hit
  Hacker News. Here's the case, why AI changes the math, and what to make of it.
type: standard
status: published
publishDate: '2026-09-29'
author: David Hayes
tags:
  - Everyday Tech Discoveries
  - Common Lisp
  - Programming Languages
  - AI Coding
  - Software Development
slug: common-lisp-comeback-ai-coding-feedback-loop
reviewer_notes: ''
source_url: 'https://www.vivienhenz.com/common-lisp'
source_item_id: 6ac4c1fbce7701ccb2411e13
source_title: Why Common Lisp is now the best programming language
generated_by: claude
featuredImage: /assets/images/common-lisp-comeback-ai-coding-feedback-loop.webp
quality_score: 79
score_breakdown:
  seo_quality: 72
  tone_match: 85
  content_length: 97
  factual_accuracy: 80
  keyword_relevance: 60
quality_note: >-
  A friendly, well-structured and appropriately hedged explainer with a clear
  H2/H3 hierarchy and a fitting length; the title is a bit short of the ideal
  range and the description is slightly long, and the niche programming topic
  only loosely matches the site's pop culture and life hack themes. Claims are
  attributed to the source post, with a few unverifiable details such as the
  exact Hacker News stats and the claim of no separate compile step.
reading_time: 4
topics:
  - Everyday Tech Discoveries
image_alt: >-
  Photorealistic workstation showing a Lisp coding environment beside an
  AI-assisted development pane.
---
A blog post titled "Why Common Lisp is now the best programming language" landed on the Hacker News front page this week, collecting 159 points and 218 comments, per the listing. Its author, Vivienhenz, makes a bold claim about one of computing's oldest languages: in the age of AI-generated code, Common Lisp has become a standout choice.

Yes, that Lisp. The one your programming-obsessed friend keeps mentioning, usually right after saying "parentheses" with a reverent hush. Let's look at the argument, because it's more interesting than the headline suggests.

## The Core Argument: Writing Code Is No Longer the Slow Part

According to the post, the key shift is where the bottleneck sits. When AI tools can generate code quickly, writing it stops being the slow step. Testing it becomes the slow step.

That changes what you'd want from a language. If you're checking machine-written code all day, the question becomes: how fast can you try something, see what broke, and fix it?

This is where the post says Common Lisp shines. It points to a near-instant feedback loop built from a few features:

- **Live, image-based development**, where you work inside a running program rather than constantly restarting it
- **An integrated debugger**
- **No separate compile step** getting in the way

The post frames this as a major competitive advantage when code arrives faster than anyone can verify it.

## Why the Debugger Is the Fun Part

Most of us know the usual routine when software fails: it crashes, you read a log, you change something, you run it again. The post highlights Common Lisp's graceful error handling as a different experience, with the debugger acting as an alternative to crash logs and restarts.

Think of it like a video game that drops you into a pause menu at the moment of failure instead of sending you back to the title screen. You can inspect what happened, adjust, and keep going. (That's our analogy, not the author's, but it captures the spirit of the pitch.)

It's hard not to wonder whether this is the real hook for AI-assisted work. If a model produces code that's 90 percent right, recovering from the other 10 percent quickly matters a lot more than how elegantly the first draft was typed.

## Macros, Conciseness, and the Token Meter

The post also leans on two older Lisp selling points that suddenly look fresh.

### Macros and domain-specific languages

Common Lisp's macros let developers build small custom languages tailored to a particular problem, known as domain-specific languages. The post argues these features align well with how LLMs work best.

### Shorter code, smaller bills

The post also touches on conciseness. The logic is straightforward: AI tools generally work with text in chunks called tokens, and fewer tokens means less to generate and read. If a language says more with less, there's a plausible cost angle. That's the post's thrust as summarized here; we haven't seen hard numbers, so treat the savings as an argument rather than a measured result.

## The Obscurity Question

The obvious objection to any Lisp evangelism is that hardly anyone uses it. Hiring is harder, learning resources are thinner, and your teammates may squint at the parentheses.

The post's implicit counterpoint, as summarized, is that language obscurity matters less when an LLM can help you learn and write it. Whether that holds up is exactly the sort of thing that likely fueled a comment section of 218 replies. Programmers famously enjoy debating language choices with the energy of sports fans, and this topic is basically a rivalry game.

## Our Take: A Fun Reassessment, Not a Verdict

A few grains of salt are in order. "Best programming language" is the kind of title designed to start arguments, and it worked. The post is one author's case, and we're relying on a summary of it rather than independent testing. Nothing here proves Common Lisp will surge in popularity.

But the underlying idea is genuinely neat, and it's the part worth carrying away. For decades, languages competed on how pleasant they were to write. If AI takes over a chunk of the typing, the contest may shift to how pleasant a language is to *check*, correct, and iterate on. Old features designed around fast feedback could suddenly look ahead of their time.

There's a pop-culture rhythm to it. Every so often, something written off as a relic gets rediscovered because the world changed around it, like a vinyl record in a streaming era. Whether Common Lisp gets its own revival tour is anyone's guess, but it's earned a surprisingly loud encore on the Hacker News front page.

If you're curious, the lesson works even if you never write a line of Lisp: when the machine drafts quickly, the winning tools are the ones that make fixing mistakes feel effortless.
