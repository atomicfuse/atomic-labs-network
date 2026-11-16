---
title: 'uBlock Origin Flaw Fixed: What Everyday Users Should Do'
description: >-
  A now-fixed uBlock Origin bug let a malicious site abuse the element picker.
  Here's what happened in plain terms and how to keep your extensions safer.
type: standard
status: published
publishDate: '2026-11-16T10:40:35.178Z'
author: Andrew Reed
tags:
  - Digital Security Simplified
  - uBlock Origin
  - browser extensions
  - Firefox
  - XSS
slug: ublock-origin-element-picker-update-what-to-do
reviewer_notes: ''
source_url: 'https://iter.ca/post/ubo-uxss/'
source_item_id: 6afaac4d444c59acb194eb6b
source_title: Universal XSS in uBlock Origin from website-driven element picker
generated_by: claude
featuredImage: /assets/images/msmax-general-article.webp
quality_score: 83
score_breakdown:
  seo_quality: 80
  tone_match: 75
  content_length: 100
  factual_accuracy: 82
  keyword_relevance: 78
quality_note: >-
  A well-structured, clearly written security explainer of 970 words with a good
  H2/H3 hierarchy, hedged claims, and practical steps, though the title is short
  (about 54 chars is fine, but the description runs long), the audience and tone
  are undefined, and AI and smart-home coverage is only tangential.
reading_time: 4
topics:
  - Digital Security Simplified
  - apps
---
If you use uBlock Origin on Firefox, you can relax a little: a serious bug in the extension has been fixed. Still, the way it worked is a useful lesson in how to keep your browser extensions safer. By the end of this article you'll know what happened, why a harmless-looking feature caused it, and a few habits that protect you from the next one.

The details come from security researcher Iter, who published a write-up (titled "Universal XSS in uBlock Origin from website-driven element picker") that drew heavy discussion on Hacker News. Everything below is based on that report.

## What happened, in plain English

Per Iter's write-up, the flaw affected uBlock Origin's Firefox MV2 extension (the Manifest V2 version). A malicious website could abuse the extension's **element picker** to add arbitrary trusted filters. Those filters could then inject JavaScript into *other* websites.

That's what "universal XSS" means. XSS (cross-site scripting) is when an attacker gets their code to run inside a page they don't own. "Universal" means it wasn't limited to one site. The bad filter could run code on other sites you visit.

The report describes the attack as a one-click UI deception flow: the visitor is tricked into clicking something on the page, and that click does the damage. The bug is now fixed.

## What the element picker is, and why it matters

The element picker is the feature that lets you click an annoying thing on a page, such as a banner or a pop-up, and tell uBlock Origin to hide it permanently. It's one of the extension's friendliest tools. You point, you click, the clutter vanishes.

That convenience is also why it's sensitive. The picker turns a click on a web page into a new rule the extension will obey. When a website can influence that process, the line between "the page" and "the extension" gets blurry.

## Why "trusted filters" are powerful

Filters are the rules ad blockers follow. Most just hide or block things. According to the report, the filters involved here were *trusted* ones, a category that can inject JavaScript into pages. Trusted status exists for legitimate reasons, but it means a trusted filter carries much more power than an ordinary one.

So the weak point wasn't a single bad line of blocking logic. It was that a website could get its own filter into the trusted category. Once that happened, the extension itself did the injecting, on any site.

## The role of the deceptive click

This attack needed you to click. That detail points to a general rule: many attacks don't break the software, they trick the person. The write-up describes a UI deception flow, where what you think you're clicking isn't what the click actually does.

This is why extension developers add protections around interface elements, such as making it hard for a web page to overlay, disguise, or drive the extension's own controls. A feature that's safe when you use it deliberately can become risky if a page can steer where and when you click.

## What you should do now

The report describes a fixed issue, so there's no emergency. But a few steps are worth doing anyway.

### 1. Update your extensions

Firefox normally updates extensions automatically. To check:

1. Open Firefox and press **Ctrl+Shift+A** (Windows/Linux) or **Cmd+Shift+A** (Mac) to open Add-ons and themes.
2. Click the gear icon and choose **Check for Updates**.
3. Open uBlock Origin's entry and confirm it's on the latest version.

To make sure automatic updates are on, the same gear menu has an **Update Add-ons Automatically** option. I haven't confirmed which specific uBlock Origin version contains the fix, so check the extension's release notes or Iter's write-up for that detail.

### 2. Be cautious about clicks that seem odd

If a page asks you to click something strange, or a button appears in an unexpected place, stop and close the tab. The attack described relied on you clicking where the page wanted.

### 3. Review your custom filters

If you've ever added custom filters, take a look at them. In uBlock Origin, open the dashboard (click the extension icon, then the gear or settings icon) and go to **My filters**. Anything you don't recognize deserves a second look. I can't say from the report whether this particular bug would leave visible traces there, so treat this as general hygiene, not a confirmed check.

### 4. Trim your extension list

Every extension can see and change what you do on sites. Remove the ones you don't use. Fewer extensions means fewer places for a bug like this to live.

## Why extensions are a big target

Extensions sit between you and every site you visit. That's what makes them useful, and it's why a flaw in one can have a wide reach. Iter's flaw is a clear example: a problem in one extension feature could, in principle, affect your experience on unrelated sites.

This isn't a reason to ditch uBlock Origin. Fixed bugs in a widely scrutinized extension are a sign that the review process is working. It's a reason to keep extensions updated and to install only what you need from sources you trust.

## One more thing: AI in security research

The discussion around this report also touches on how security researchers increasingly use AI tools to find and prototype complex vulnerabilities. I can't tell you from the material available how much AI was involved in this specific case, so I won't guess. The broader point stands: finding bugs is getting faster, which makes quick updates on your side matter more.

## The takeaway

Open your browser's add-ons page today, check for updates, and remove any extension you don't actively use. It takes two minutes, and it's the best defense against the next bug of this kind.
