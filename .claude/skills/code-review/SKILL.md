---
name: code-review
description: Code review for all uncommitted changes (staging status is irrelevant). Checks CLAUDE.md compliance, identifies bugs, security issues, style problems, and simplification opportunities.
license: MIT
---

# Code Review Skill

Review all uncommitted changes as code destined for commit. Staging status is irrelevant—both staged and unstaged changes are reviewed equally. Findings are presented in a comprehensive report grouped by severity.

## Review Process

1. **Get the diff** - Run `git diff HEAD` to capture all uncommitted changes. Staging status is irrelevant; all changes are treated as code intended for commit.
2. **Locate CLAUDE.md** - Check for project rules in this order:
   - Project root (`./CLAUDE.md`)
   - Global fallback (`~/.claude/CLAUDE.md`)
   - If neither exists, proceed with standard review (skip rule compliance checks)
3. **Analyze changes** - Review the diff for issues in each category
4. **Present findings** - Present all findings in a single report grouped by severity

**Note:** The review evaluates changes in the context of the entire project, not as isolated patches. This means considering how changes interact with existing code, patterns, and architecture.

## Categories (Priority Order)

Review changes in this order of priority:

### Critical
- **Security vulnerabilities** - Injection flaws, auth bypasses, exposed secrets, unsafe deserialization
- **Data leaks** - Logging sensitive data, exposing PII, insecure storage

### Critical / Warning
- **Bugs and logic errors** - Null pointer risks, off-by-one errors, race conditions, unhandled exceptions
- **Edge cases** - Missing validation, boundary conditions, empty/null inputs

### Warning
- **CLAUDE.md rule violations** - Deviations from project-specific guidelines (if CLAUDE.md exists)
- **Code style issues** - Inconsistent naming, formatting problems, unclear structure

### Info
- **Simplification opportunities** - Redundant code, overly complex logic, unnecessary abstractions
- **Minor improvements** - Better variable names, clearer comments, small refactors

## Finding Format

Present each finding using this format:

```
## [SEVERITY] Category: Brief Title

**File:** `path/to/file.ts:42`

**Issue:**
Clear description of what's wrong and why it was flagged.

**Code:**
```diff
- problematic code here
+ suggested fix here
```

**Why it matters:**
Brief explanation of the impact or risk.
```

## Report Structure

Present all findings in a single comprehensive report:

1. **Group by severity** - Critical issues first, then Warnings, then Info
2. **Section headers** - Each severity level gets its own section with count
3. **Summary at end** - Include total counts by severity and files affected

```
## Critical Issues (N found)
[All critical findings]

## Warnings (N found)
[All warning findings]

## Info (N found)
[All info findings]

---

## Summary
- X Critical issues
- Y Warnings
- Z Info items
Total: N findings across M files
```

## CLAUDE.md Integration

When a CLAUDE.md file is found, extract guidelines and check the diff against them. Common rule types to look for:

- Naming conventions
- File organization patterns
- Required error handling approaches
- Forbidden patterns or anti-patterns
- Testing requirements
- Documentation standards

If a change violates a CLAUDE.md rule, cite the specific rule in the finding.

## Example Session

```
Starting code review of local changes...

Found CLAUDE.md at project root.
Analyzing diff (3 files changed, +45 -12 lines)...

---

## Critical Issues (1 found)

### Security: Hardcoded API Key

**File:** `src/api/client.ts:15`

**Issue:**
API key is hardcoded directly in the source code.

**Code:**
```diff
- const API_KEY = "sk-live-abc123xyz";
+ const API_KEY = process.env.API_KEY;
```

**Why it matters:**
Hardcoded secrets get committed to version control and can be extracted from builds. Use environment variables instead.

## Warnings (1 found)

### CLAUDE.md Violation: Missing error handling

**File:** `src/api/client.ts:28`

**Issue:**
Async function lacks try/catch block. CLAUDE.md requires all async operations to have error handling.

**Code:**
```diff
- async function fetchData() {
-   const response = await fetch(url);
-   return response.json();
- }
+ async function fetchData() {
+   try {
+     const response = await fetch(url);
+     return response.json();
+   } catch (error) {
+     console.error('Failed to fetch data:', error);
+     throw error;
+   }
+ }
```

**Why it matters:**
Unhandled promise rejections can crash the application or leave it in an inconsistent state.

## Info (0 found)

No informational findings.

---

## Summary
- 1 Critical issue
- 1 Warning
- 0 Info items
Total: 2 findings across 1 file
```

## Starting the Review

When invoked, begin with:

```
Starting code review of local changes...

[Checking for CLAUDE.md: found at X / using global / none found]
[Analyzing diff: N files changed, +X -Y lines]

---
```

Then present all findings grouped by severity, followed by the summary.
