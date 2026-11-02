---
title: Why Five Small AI Models Can Beat One Big One at Coding
description: >-
  A GitHub project called Memdoor reports that five smaller Qwen models, working
  as a team, outscored Fable 5 on coding problems. Here's what that means for
  you.
type: standard
status: published
publishDate: '2026-11-02T07:06:24.200Z'
author: Andrew Reed
tags:
  - AI
  - multi-agent workflows
  - Qwen
  - code generation
  - LiveCodeBench
slug: five-small-ai-models-team-coding-benchmark
reviewer_notes: ''
source_url: 'https://github.com/guregodevo/memdoor/tree/main/examples/workflows/team-solve'
source_item_id: 6ae6c7591123ffa4dd38f8d3
source_title: 'Memdoor: A team of 5 Qwen3.8-27B models beats Fable 5 on LiveCodeBench Hard'
generated_by: claude
featuredImage: /assets/images/five-small-ai-models-team-coding-benchmark.webp
quality_score: 74
score_breakdown:
  seo_quality: 72
  tone_match: 78
  content_length: 95
  factual_accuracy: 55
  keyword_relevance: 70
quality_note: >-
  A practical, well-structured article with clear H2/H3 headings and a useful
  step-by-step takeaway, but the title is slightly short of the ideal range and
  the meta description is a bit long. Factual accuracy takes a hit because it
  relies on unverifiable product names and versions (Qwen 3.8-27B, Fable 5, the
  Hacker News counts) that look possibly fabricated, though the article hedges
  them as self-reported, and it fits the AI topic well without being strongly
  security or smart-home related.
reading_time: 4
topics:
  - App Mastery Guides
  - apps
image_alt: >-
  Five compact laptops surround a larger laptop displaying code and software
  test results.
---
A project on GitHub called Memdoor is making the rounds on Hacker News with a simple claim: five smaller AI models working as a team can beat a single, more expensive one at hard programming problems. You don't need to write code to take something useful from it. The idea behind it, splitting a job among specialists and making them work from shared notes, is one you can borrow for your own AI use.

## What was reported

Per the project's GitHub page, Memdoor is a multi-agent workflow system. In its "team-solve" example, five Qwen 3.8-27B models coordinate through a shared file system. On LiveCodeBench Hard problems, the team reportedly reached a mean score of 9.8 out of 10 across five test runs. Fable 5, the single model it was compared against, scored 8.0 out of 10 over the same number of runs.

These are the project's own numbers, and the Hacker News thread (142 points, 77 comments at the time of writing) is where people are debating them. Treat the result as a promising demonstration, not a settled verdict. Five runs is a small sample, and I can't verify the setup from here.

## Why a team can beat a single model

The project's design points to a few reasons, and each one applies outside coding.

### Shared files instead of chat

Rather than chatting back and forth, the agents reportedly communicate by reading and writing files. That has a practical effect: ideas, attempts, and results are written down in one place. My read is that this forces discipline. A model can't wander off or forget what was tried if the record sits in front of everyone.

### A manager who knows when to stop patching

The project describes a "manager" role that catches bugs rather than simply continuing to patch a flawed approach. Anyone who has watched a chatbot stack fix on top of fix will recognize the problem. Giving one agent the job of asking "is this approach even working?" is a cheap fix for it.

### Transparency

The project says every run is logged, costs are tracked, and prompts are published. That makes the claim checkable, which is more than many benchmark announcements offer.

## Try the idea yourself in any chatbot

You can mimic the structure with the AI app you already use. This works in any current chatbot on a phone or computer.

### Step 1: Split the roles

Open three separate conversations. Name them in your first message: "You are the Drafter," "You are the Checker," and "You are the Manager."

### Step 2: Keep a shared notes document

Open a plain text note or document. Paste the task at the top. Every time one conversation produces something, paste it into the note under a label such as "Draft 1."

### Step 3: Make the Checker work from the note

Paste the whole note into the Checker conversation and ask it to list specific problems. Paste its answer back into the note.

### Step 4: Let the Manager decide

Give the Manager the full note and ask one question: "Should we keep fixing this draft or start over with a different approach? Explain why." This is the step that stops endless patching.

### Step 5: Repeat once, then stop

One or two rounds is plenty. More rounds mostly burn time.

This is a rough home version of the pattern, not Memdoor itself, and I'm not claiming it will match the benchmark gains. It does give you a written trail and a built-in second opinion.

## Why the cost angle matters

The project's pitch is that smaller models, well organized, can compete with bigger and pricier ones. If that holds up, it matters for anyone paying per use or running tools on their own hardware. Memdoor reportedly runs through OpenRouter, a local Ollama install, or your own vLLM server with one command. Those are developer-oriented tools, so if you've never touched them, the project is probably not your starting point. The takeaway for everyone else is that how you structure the work can matter as much as which model you pick.

## What to be skeptical about

- **Small test count.** Five runs can swing on luck.
- **Self-reported results.** Independent reproduction is what counts, and the open logs make that possible.
- **One benchmark.** LiveCodeBench Hard measures coding problems, not everyday writing, research, or planning.
- **Team overhead.** Five models mean five times the calls. The project tracks cost, so check those figures before assuming it's cheaper.

If you do write code, the repository is public on GitHub under the name memdoor, in the examples/workflows/team-solve folder. Read the logs before you trust the headline.

## The takeaway

Next time an AI answer goes sideways, don't just ask again. Give one conversation the job of drafting, another the job of criticizing, and keep the notes in one place.
