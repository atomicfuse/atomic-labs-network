---
title: 'Good-Enough AI: What IBM''s CEO Says About Open Models'
description: >-
  IBM's CEO says open weight AI models are now cheap and strong enough to run on
  your own hardware. Here's what that means and how to judge it for yourself.
type: standard
status: published
publishDate: '2026-10-26T06:03:13.379Z'
author: Andrew Reed
tags:
  - AI
  - open weight models
  - on-premises AI
  - IBM
slug: good-enough-ai-open-weight-models-on-premises
reviewer_notes: ''
source_url: >-
  https://www.theregister.com/systems/2026/10/22/ibm-ceo-says-open-weight-models-are-now-irresistibly-good-and-cheap-on-prem/5304640
source_item_id: 6adede57571b7d0a4db2d967
source_title: IBM CEO says open weight models are now good and cheap on-prem
generated_by: claude
featuredImage: /assets/images/good-enough-ai-open-weight-models-on-premises.webp
quality_score: 76
score_breakdown:
  seo_quality: 68
  tone_match: 72
  content_length: 90
  factual_accuracy: 82
  keyword_relevance: 70
quality_note: >-
  A clear, well-structured, practical explainer that hedges the CEO's unverified
  90% claim and has a strong step-by-step test, though the title runs long (~57
  chars is fine but the meta description is ~160 chars and borderline), the
  content leans enterprise rather than everyday-user, and it lacks
  device/software specifics and a hands-on local-setup guide.
reading_time: 4
topics:
  - Gadget Workflow Hacks
  - apps
image_alt: Laptop connected to a compact local AI workstation on an office desk
---
IBM CEO Arvind Krishna says open weight AI models have become good enough, and cheap enough, to run on a company's own hardware. The Register reported his comments this week. By the end of this article you'll understand what that claim means, why "good enough" can beat "best available," and what questions to ask before you move any AI work off the big cloud services.

## What Krishna actually said

Per The Register, Krishna argues that open weight models now deliver roughly 90% of the performance of frontier models at a fraction of the token cost. Token cost is the per-use fee AI providers charge, usually by the amount of text processed.

The Register also ties the comment to IBM's business outlook across infrastructure, mainframes, Red Hat, and cloud. That context matters. IBM sells the kind of gear and software companies would need to run AI in their own data centers, so Krishna has a clear interest in this trend. Treat the 90% figure as a CEO's claim, not a benchmark result. The summary we have doesn't say how it was measured.

## Open weight vs. frontier: the plain-English version

- **Frontier models** are the top-tier systems from the largest AI labs. You typically reach them over the internet and pay per use.
- **Open weight models** are models whose trained settings (the "weights") are published so you can download and run them yourself.

Running a model yourself is called on-premises, or "on-prem." That can mean a server in your office or a data center you control, rather than someone else's cloud.

## Why 90% of the quality can be the better deal

Here's the practical logic, and it applies to a small business or a household just as much as a large company. Most daily tasks don't need the very best model. Summarizing a meeting, drafting a routine email, sorting support messages, or pulling names out of documents are jobs where a slightly weaker model usually produces an answer you'd accept.

If the cheaper option gets you most of the way there at a fraction of the cost, the math changes. You'd reserve the expensive model for the hard problems and let the cheaper one handle volume. That's my analysis, not Krishna's, but it follows directly from the tradeoff he describes.

## Four questions to ask before switching

Krishna's argument is aimed at enterprises, but the tradeoffs are the same ones any tech buyer faces. The Register's framing points to cost, data control, infrastructure, and vendor dependence.

### 1. How much would you actually save?

List what you use AI for. Mark each task as "routine" or "needs the best." Only the routine pile is a candidate for a cheaper model. Check your current bill or usage so you know what you're comparing against.

### 2. Does your data need to stay put?

Some information shouldn't leave your own systems: client records, financial files, internal documents. Running a model on hardware you control keeps that data in-house. If none of your work is sensitive, this factor matters less.

### 3. Can you run and maintain it?

On-prem means you take on setup, updates, and hardware. That's real work. If nobody on your team wants that job, a managed service may cost more per token but less overall. This is the hidden price of "cheap."

### 4. How locked in are you?

If your workflow is built around one provider's tools, switching later is painful. Open weight models can reduce that dependence because you hold the model itself. Even so, test an alternative before you need one.

## A simple way to test "good enough"

You don't need a data center to check the claim for your own work. Try this:

1. Pick five real tasks you do regularly, such as summarizing a report or drafting a reply.
2. Run each through your current AI tool and save the results.
3. Run the same five through an open weight model, using whatever hosted or local tool you prefer.
4. Compare side by side. Ask only one question: would I send this as is, or with a quick edit?

If the cheaper model passes most of them, you've found your own version of Krishna's 90%. If it fails on the tasks that matter most, you've learned that for you, the frontier price is worth paying.

## What to watch next

The Register's report suggests the gap between open and closed models is narrowing while companies reassess cloud spending. That's a direction, not a finished fact, and one executive's view. Expect other vendors, especially ones selling cloud services, to push back.

The takeaway: before you pay for the most powerful AI by default, sort your tasks into routine and demanding, and run a five-task side-by-side test. Pay premium rates only where the results prove you need to.
