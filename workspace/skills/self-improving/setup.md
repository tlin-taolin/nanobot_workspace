# Setup — Self-Improving Agent

## First-Time Setup

### 1. Create Memory Structure

```bash
mkdir -p data/{projects,domains,archive}
```

### 2. Initialize Core Files

Create `./data/memory.md` using `templates/memory.template.md`:

```markdown
Copy the structure from `templates/memory.template.md` into `./data/memory.md`.
```

Memory file baseline:
```markdown
# Memory (HOT Tier)

## Preferences

## Patterns

## Rules
```

Create `./data/corrections.md` using `templates/corrections.template.md`:
```markdown
# Corrections Log

| Date | What I Got Wrong | Correct Answer | Status |
|------|-----------------|----------------|--------|
```

Create `./data/index.md`:
```markdown
# Memory Index

| File | Lines | Last Updated |
|------|-------|--------------|
| memory.md | 0 | — |
| corrections.md | 0 | — |
```

### 3. Choose Operating Mode

Add to your AGENTS.md or workspace config:

```markdown
## Self-Improving Mode

Current mode: Passive

Available modes:
- Passive: Only learn from explicit corrections
- Active: Suggest patterns after 3x repetition
- Strict: Require confirmation for every entry
```

### 4. Add SOUL.md Steering

Add this section to your `SOUL.md`:

```markdown
**Self-Improving**
Compounding execution quality is part of the job.
Before non-trivial work, load `./skills/self-improving/data/memory.md` and only the smallest relevant domain or project files.
After corrections, failed attempts, or reusable lessons, write one concise entry to the correct self-improving file immediately.
Prefer learned rules when relevant, but keep self-inferred rules revisable.
Do not skip retrieval just because the task feels familiar.
```

### 5. Refine AGENTS.md Memory Section (Non-Destructive)

Update `AGENTS.md` by complementing the existing `## Memory` section. Do not replace the whole section and do not remove existing lines.

If your `## Memory` block differs from the default template, insert the same additions in equivalent places so existing information is preserved.

Add this line in the continuity list (next to Daily notes and Long-term):

```markdown
- **Self-improving:** `./skills/self-improving/data/` (via `self-improving` skill) — execution-improvement memory (preferences, workflows, style patterns, what improved/worsened outcomes)
```

Right after the sentence "Capture what matters...", add:

```markdown
Use `memory/YYYY-MM-DD.md` and `MEMORY.md` for factual continuity (events, context, decisions).
Use `./skills/self-improving/data/` for compounding execution quality across tasks.
For compounding quality, read `./skills/self-improving/data/memory.md` before non-trivial work, then load only the smallest relevant domain or project files.
If in doubt, store factual history in `memory/YYYY-MM-DD.md` / `MEMORY.md`, and store reusable performance lessons in `./skills/self-improving/data/` (tentative until human validation).
```

Before the "Write It Down" subsection, add:

```markdown
Before any non-trivial task:
- Read `./skills/self-improving/data/memory.md`
- List available files first:
  ```bash
  for d in ./skills/self-improving/data/domains ./skills/self-improving/data/projects; do
    [ -d "$d" ] && find "$d" -maxdepth 1 -type f -name "*.md"
  done | sort
  ```
- Read up to 3 matching files from `./skills/self-improving/data/domains/`
- If a project is clearly active, also read `./skills/self-improving/data/projects/<project>.md`
- Do not read unrelated domains "just in case"

If inferring a new rule, keep it tentative until human validation.
```

Inside the "Write It Down" bullets, refine the behavior (non-destructive):
- Keep existing intent, but route execution-improvement content to `./skills/self-improving/data/`.
- If the exact bullets exist, replace only these lines; if wording differs, apply equivalent edits without removing unrelated guidance.

Use this target wording:

```markdown
- When someone says "remember this" → if it's factual context/event, update `memory/YYYY-MM-DD.md`; if it's a correction, preference, workflow/style choice, or performance lesson, log it in `./skills/self-improving/data/`
- Explicit user correction → append to `./skills/self-improving/data/corrections.md` immediately
- Reusable global rule or preference → append to `./skills/self-improving/data/memory.md`
- Domain-specific lesson → append to `./skills/self-improving/data/domains/<domain>.md`
- Project-only override → append to `./skills/self-improving/data/projects/<project>.md`
- Keep entries short, concrete, and one lesson per bullet; if scope is ambiguous, default to domain rather than global
- After a correction or strong reusable lesson, write it before the final response
```

## Verification

Run "memory stats" to confirm setup:

```
📊 Self-Improving Memory

🔥 HOT (always loaded):
   memory.md: 0 entries

🌡️ WARM (load on demand):
   projects/: 0 files
   domains/: 0 files

❄️ COLD (archived):
   archive/: 0 files

⚙️ Mode: Passive
```

## Optional: Heartbeat Integration

Add to `HEARTBEAT.md` for automatic maintenance:

```markdown
## Self-Improving Check

- [ ] Review corrections.md for patterns ready to graduate
- [ ] Check memory.md line count (should be ≤100)
- [ ] Archive patterns unused >90 days
```
