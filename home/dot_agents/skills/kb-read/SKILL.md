---
name: kb-read
description: Search and answer from the user's local knowledge base when prior project or reusable knowledge may be relevant. Read-only; do not use it to save or alter knowledge.
---

# Read the knowledge base

Resolve the current user's home directory portably, set the knowledge-base root to its `kb` child, and read `workflow.md`. Follow its **Read** operation.

Start with `wiki/index.md` and the relevant directory index. Search filenames and content before opening concept pages, then follow only links needed to answer the request. Do not load the entire wiki or mutate any file, Git state, or log. Consult a preserved raw source only when a relevant page points to it or the answer requires checking that source.

Answer with standard Markdown links to the supporting local files and distinguish sourced facts, conflicts, and uncertainty.
