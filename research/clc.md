---
title: Automated real-time detection of closed-loop communication in spoken dialogue
layout: page
reference-section-title: "References"
---

Good teamwork processes enable teams to perform beyond the sum of their parts
[@Roberts.ea:2021]. Closed loop communication (CLC) has been proposed in the team science
literature as one of the coordinating mechanisms for effective teamwork [2],
and has been demonstrated to improve team outcomes in a variety of domains.
Currently, CLC in spoken dialogue is identified via retrospective analyses
involving manual transcription and annotation. However, given the potentially
catastrophic consequences of poor team communication – especially in complex,
fast-paced, and high stakes environments such as operating theaters [3] – we
argue that there is an urgent need for AI technologies that can detect and
repair breakdowns in CLC as they happen. To address this need, we propose to
develop an AI system for detecting the presence or absence of CLC in spoken
dialogue within teams of humans collaborating on shared tasks.

Currently, most dialogue systems that understand and respond to human speech in
real time (e.g., Siri, Alexa, Google Assistant) are limited to conversing with
a single human at a time. On the other hand, there are numerous analyses of
multi-participant spoken dialogue in the academic literature – however, these
analyses are primarily performed offline rather than in real-time.

The dialogue system we are building in the
[ToMCAT](https://ml4ai.github.io/tomcat) project addresses both of these
limitations. However, since the system was developed in the context of
experiments involving teams of remote participants performing collaborative
tasks in a Minecraft-based environment, audio is currently streamed via the web
browser, with an interface specialized for these particular experiments. In
order to test our dialogue system in more general contexts, especially ones
that involve more ambulatory participants, we need a new `frontend'.

References
----------
