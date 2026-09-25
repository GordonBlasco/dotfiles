---
name: kb-maintain
description: Check the local knowledge base for broken links, index drift, duplicate concepts, stale claims, or contradictions when the user explicitly requests KB maintenance. Report by default; repair only when asked.
---

# Maintain the knowledge base

Resolve the current user's home directory portably, set the knowledge-base root to its `kb` child, and read `workflow.md`. Follow its **Maintain** operation.

Inspect only the scope needed for the requested check. Default to a read-only report with file links and concrete findings. Mutate the KB only when the user explicitly asks for repairs; then serialize the work, preserve unrelated changes, update affected indexes and `wiki/log.md`, make one focused commit containing only the repair, and never push. Report contradictions rather than silently choosing a winner.
