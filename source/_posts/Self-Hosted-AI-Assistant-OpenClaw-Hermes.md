---
title: "I Built My Own Self-Hosted AI Assistant (No OpenAI Subscription Needed)"
subtitle: "How I set up OpenClaw + Hermes to run a private, always-on AI system on my own server"
description: "A practical walkthrough of building a self-hosted AI assistant using OpenClaw and Hermes — no cloud subscriptions, no vendor lock-in, full control over your data."
cover: /images/posts/self-hosted-ai-openclaw-v2.jpg
categories:
  - Self Hosting
  - AI
tags:
  - AI
  - self hosting
  - Linux
  - automation
  - Claude Code
  - privacy
date: 2026-09-06 19:45:00
featured: true
version: "v1.0"
---

![Self Hosted AI](/images/posts/self-hosted-ai-openclaw-v2.jpg)

---

## Why I Stopped Renting My AI and Started Hosting It

Every "AI assistant" you use today — ChatGPT, Gemini, whatever bot is trending this month — lives on someone else's server, under someone else's terms of service, with your conversations sitting on someone else's disk. For a lot of casual use, that's fine. But if you actually want an assistant that remembers things across sessions, can act on your behalf (send messages, run automations, manage your projects), and doesn't quietly change behavior after a policy update — you want it running on hardware you control.

That's exactly why I set up **OpenClaw** running on **Hermes** on my own Linux box. No monthly "Pro" tier, no rate limits I don't control, no black box. Just a system I configured, that I can inspect, extend, and fully own.

This post walks through what that setup actually looks like, why I chose this stack, and what you need if you want to build something similar.

---

## What Is Hermes?

Hermes is the runtime — think of it as the engine that lets an AI agent actually *do things* instead of just replying with text in a chat window. It gives the assistant:

- **Tools** — browser control, terminal access, file read/write, web search, code execution
- **Memory** — persistent facts and context that carry across sessions, not wiped every time you close the tab
- **Skills** — reusable, documented procedures for recurring tasks (deploying a server, managing a Discord community, editing a video, whatever you do often)
- **Integrations** — Telegram, Discord, cron jobs, and other delivery channels so the assistant can reach you outside of a chat window

In short: Hermes turns a language model from "a thing you type questions into" into "an agent that lives on your infrastructure and does work."

## What Is OpenClaw?

OpenClaw is the framework/persona layer sitting on top of Hermes — it's what gives the assistant a consistent identity, personality, and operating rules across every session, instead of starting from a blank slate every time you open a new chat. It's the difference between talking to a stateless chatbot and working with something that actually remembers who you are and how you like things done.

---

## The Actual Setup

Here's the practical side — what running this actually takes:

**Hardware**: You don't need a beast of a machine. My box runs on a modest 2-CPU, ~8GB RAM VPS. No GPU required, because the model inference itself happens via API calls to a hosted model (Claude, in my case) — the server just runs the *agent*, not the model weights. That's an important distinction: self-hosting the *agent* is lightweight; self-hosting the *model* is a completely different (and much heavier) project.

**Core stack**:
- Linux server (any modern distro works)
- Hermes runtime installed and configured
- API key for your model of choice (Anthropic, OpenAI, or a local model if you want to go fully offline)
- `.env` file holding your bot tokens (Telegram, Discord) — never committed to git
- Cron jobs for scheduled tasks (briefings, monitoring, reports)

**Integrations I run**:
- **Telegram bot** — direct messages and notifications land straight in my phone via the Bot API (`sendPhoto`, `sendMessage`), no polling needed
- **Discord** — full server management (channels, roles, onboarding, AutoMod) via raw REST calls using a bot token, tied to my YouTube community server
- **Skills system** — instead of re-explaining how I want something done every single time, I write it once as a skill file and the assistant loads it automatically when relevant

## What This Actually Buys You

1. **Privacy** — conversations, memory, and automations stay on infrastructure you control. No third party mining your chat history for training data.
2. **Persistence** — memory survives across sessions. It doesn't forget your preferences, your projects, or your running context every time you start a new conversation.
3. **Automation** — cron-triggered briefings, monitoring, and notifications running independently of you being actively in a chat.
4. **No lock-in** — swap the underlying model provider without rebuilding your entire workflow. The agent layer stays yours.
5. **Extensibility** — every tool, skill, and integration is something you can read, edit, and fix yourself. When something breaks, you're not waiting on a support ticket.

---

## Is This For Everyone?

Honestly — no. If you just want quick answers to questions, a hosted chatbot is easier and requires zero setup. This approach makes sense if you:

- Automate things regularly (deployments, monitoring, content workflows)
- Care about where your data lives
- Like understanding and controlling your own tools instead of trusting a black box
- Already run Linux servers and are comfortable in a terminal

If that's you, self-hosting your AI agent stack is one of the more satisfying things you can build right now — it's the same shift we already made with self-hosted NAS systems, home automation, and Pi servers, just applied to AI.

---

## What's Next

I'll be covering the deeper technical bits in follow-up posts and on the [YouTube channel](https://youtube.com/@mistrysiddh) — setting up specific integrations, writing custom skills, and the security considerations that come with giving an AI agent terminal and browser access on your own machine (spoiler: sandboxing and permission boundaries matter a lot).

If you're building something similar or have questions about the setup, drop them in the comments.
