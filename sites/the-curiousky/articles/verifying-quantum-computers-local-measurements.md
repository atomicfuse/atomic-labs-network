---
title: Why Checking a Quantum Computer Is Harder Than Building One
description: >-
  Quantum devices are hard to verify as qubits grow. Here is how researchers say
  a small, local check could reveal global quantum properties in a fixed number
  of...
type: standard
status: published
publishDate: '2026-11-24T11:24:34.047Z'
author: Elena Mitchell
tags:
  - Space Exploration
  - quantum physics
  - qubits
  - quantum measurements
  - state tomography
slug: verifying-quantum-computers-local-measurements
reviewer_notes: ''
source_url: 'https://phys.org/news/2026-11-local-reveal-global-quantum-properties.html'
source_item_id: 6b051e84444c59acb194f206
source_title: >-
  Local measurements reveal global quantum properties in a constant number of
  experimental runs
generated_by: claude
featuredImage: /assets/images/verifying-quantum-computers-local-measurements.webp
quality_score: 59
score_breakdown:
  seo_quality: 62
  tone_match: 50
  content_length: 90
  factual_accuracy: 82
  keyword_relevance: 12
quality_note: >-
  The article is clearly written, carefully hedged, and reasonably structured
  with H2/H3 headings, but it is a quantum computing piece that falls outside
  the site's sky-watching scope (tagged 'Space Exploration' with no real
  connection). The title is about 58 characters, while the description runs a
  bit long at roughly 170, and the 752-word count falls slightly under the 800
  target.
reading_time: 4
topics:
  - Celestial Phenomena
image_alt: >-
  Cryogenic quantum computer with local measurement probes highlighted in a
  research laboratory.
---
This is a bit off our usual sky-watching path, but it rests on a familiar idea: you often can't see everything at once, so you learn to read the clues. By the end of this article, you'll understand why testing a big quantum computer is such a headache, and how a newly reported approach tries to fix it by looking at only a small piece of the machine.

## The new result in plain terms

Researchers have introduced a protocol for certifying global quantum properties using only local measurements on a small subsystem, according to a report from Phys. The properties include fidelity, entanglement, circuit complexity, and what physicists call "magic." The key finding, per the report, is that these can be verified with a constant number of experimental runs, rather than a cost that grows rapidly as you add qubits.

That last part is the headline. "Constant" means the number of experiments doesn't balloon as the device gets bigger.

## Why more qubits means harder checking

A qubit is the basic unit of a quantum computer. Adding qubits makes a device more powerful, but Phys notes that it also makes the device harder to verify. Describing a general quantum state takes an exponential number of parameters. Exponential growth is the kind that outruns any shortcut: each extra qubit multiplies the work rather than adding to it.

The standard way to pin down a quantum state completely is called state tomography. Reconstructing a state in full this way becomes impractical as systems grow, per the report.

### An everyday comparison

Think of trying to confirm the weather across an entire continent by sending an observer to every square mile. It works for a small town. It collapses for a continent. Full tomography is that observer-everywhere approach, applied to a quantum state.

## The idea: local fingerprints

The approach described by Phys flips the strategy. Instead of mapping the whole system, you measure a small subsystem and read off signatures that reveal how the whole device is behaving. Think of it as a fingerprint: you don't need the whole person to tell who left it.

That comparison is our shorthand, not the researchers' wording. What the report supports is the substance: local measurements on a small part of the system can certify properties of the entire quantum state.

## What gets certified

The report names four properties that can be checked this way.

### Fidelity

Fidelity is how closely the state a device actually produces matches the state it was meant to produce. It's the most basic quality score for a quantum machine.

### Entanglement

Entanglement is the linking of qubits so that they behave as a connected whole. It's a key resource in quantum computing, so confirming it is present matters.

### Circuit complexity

This measures how involved the sequence of operations behind a state is. Certifying it helps show a device has done something genuinely sophisticated.

### Magic

In quantum computing, "magic" is a technical term, not a metaphor. The report material I have doesn't spell out its full role, so I'll stay with what the report establishes: it is one of the global properties this method can certify.

## Why it matters for real hardware

Phys frames the timing around scale: as quantum computers grow toward hundreds or thousands of qubits, verifying that they actually work becomes a major bottleneck. A method whose cost doesn't climb with qubit count offers a more practical path for testing noisy, real-world quantum devices without full state tomography.

The word "noisy" matters. Real machines are imperfect, and a verification method that only works on ideal states wouldn't help much. The report presents this protocol as relevant to testing real devices.

It's reasonable to read this as a sign that building quantum hardware depends as much on proving it works as on adding qubits. That interpretation is ours, but it follows from the bottleneck the report describes.

## What we don't know yet

The summary available to us doesn't include details on which devices have been tested, how precise the certification is, or what assumptions the protocol requires. Those are fair questions to ask before treating this as a finished solution. Check the original reporting on Phys for the specifics.

## The takeaway

When a system is too big to inspect in full, look for the small measurement that speaks for the whole. The next time you hear a claim about a bigger quantum computer, ask the follow-up question: how do they know it works?
