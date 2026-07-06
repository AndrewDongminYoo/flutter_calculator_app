# iOS Calculator Parity — Gap Analysis & Improvement Plan

Comparison of the current app (see `doc/images/`) against the stock iPhone Calculator (Apple), grounded in the current source.
Each gap cites the responsible code so the plan is actionable rather than aesthetic.

## Verdict

The visual language is already close: dark background, circular buttons, orange operators, SF Pro Display, right-aligned auto-sizing display.
The gaps are mostly **behavioral and structural**, not color.
Two of them (the bottom-left placeholder button and the missing wide `0`) are immediately visible and break the iconic iPhone keypad layout.
A few others are real defects (raw exception text leaking to the UI, broken `%`).

## Gap table

Severity: **P1** breaks parity or is a defect, **P2** noticeable divergence, **P3** polish.

| # | Gap | iPhone behavior | Current behavior | Evidence | Sev |
|---|-----|-----------------|------------------|----------|-----|
| 1 | Wide `0` key | `0` spans two columns, left-aligned digit | `0` is a single circle | `calculator_screen.dart:250-254` | P1 |
| 2 | Placeholder key | No extra key; `0` fills the slot | Dead 🧮 button occupies the freed cell (`onPressed: {}`) | `calculator_screen.dart:245-249`, `button_type.dart` `calculator('')` | P1 |
| 3 | Error text | Shows `Error` | Shows raw `UnsupportedError` (Dart type name) | `calculator_bloc.dart:86` (`e.runtimeType.toString()`) | P1 |
| 4 | `%` operator | Applies percent to current operand | No-op `replaceAll('%','%')` → local eval throws → `UnsupportedError` | `calculator_bloc.dart:66`; screenshot 3 | P1 |
| 5 | Operator selected state | Pressed operator inverts (white bg, orange glyph) until next input | Operators are static orange, no pending-op indicator | `calculator_screen.dart:152-156` etc.; no `selectedOperator` in state | P2 |
| 6 | Thousands separators | `44,253,432` | `44253432` (raw string) | `calculator_screen.dart:106` renders `state.result` verbatim | P2 |
| 7 | Live-input display | Big number reflects what you are typing | Big number stays `0` while typing; input grows in the small gray line | `calculator_screen.dart:84-118` (equation = small, result = large) | P2 |
| 8 | Clear key semantics | Empty → `AC`; after entry → `C` (clears current entry only) | `result=='0'` → ⌫ delete icon; else `AC` (delete-based, not AC/C) | `calculator_screen.dart:132-140` | P2 |
| 9 | Top-left menu icon | Not present in the standard keypad | Non-functional orange list icon | `calculator_screen.dart:70-78` (`onPressed: {}`) | P2 |
| 10 | Sign flip scope | Flips only the current operand | Prefixes `-` to the whole equation string (`12+3` → `-12+3`) | `calculator_bloc.dart:39-50` | P3 |
| 11 | Press feedback | Button dims on touch + haptic tick | Default Material ripple, no haptic | `calculator_button.dart:26-38` | P3 |
| 12 | Function-key gray | iOS `#A5A5A5` (light gray) | `#5C5C60` (darker) | `calculator_screen.dart:133,144,149` | P3 |

## Two buckets — defects vs intentional divergence

Not every difference is a bug.
Separate them before implementing so we do not silently revert deliberate product choices.

### Defects to fix (no product decision needed)

- #3 raw exception name in the UI.
- #4 `%` produces an error instead of a percentage.
- #10 sign flip corrupts multi-operand expressions.
- #1 / #2 the keypad layout deviates from every calculator convention (wide `0`), and the placeholder key is dead weight.

### Intentional divergences (need a product call before "fixing")

- #7 the **two-line formula display** (small equation line + large result) is a deliberate "tape" model, not the iPhone single-number model.
  Converging to iPhone means the large display must show live input.
  Keeping the tape is a legitimate, arguably better, choice.
- #9 the **menu icon** is presumably reserved for history/scientific.
  iPhone has no such icon in the classic keypad (its menu lives elsewhere).
  Decide: wire it up, or remove it.
- #2 the **🧮 placeholder** is reserved for a future scientific mode (per the enum comment).
  If scientific mode is not on the roadmap, delete it and restore the wide `0`.

## Phased plan

Ordered by impact-to-effort.
Each phase is independently shippable and verifiable.

### Phase 1 — Defect fixes (small, high value)

1. Map evaluation failures to a user-facing `Error` string (l10n key), instead of `e.runtimeType.toString()`.
   → verify: enter `1/0` and an unsupported expression; display reads `Error`, not `UnsupportedError`.
2. Implement `%` semantics.
   Decide unary (`n%` → `n/100`) vs contextual (`a + b%` → `a + a*b/100`); unary is simpler and covers the common case.
   → verify: `50 %` → `0.5`; no exception.
3. Fix `FlipSign` to flip only the trailing operand, not the whole string.
   → verify: `12+3` then `+/-` → `12+-3` (or `12-3`), not `-12+3`.

### Phase 2 — Keypad layout parity

4. Make `0` span two columns (left-aligned text, pill shape) and remove the 🧮 placeholder.
   Requires the button to support a `flex: 2` / wide variant instead of the current fixed `AspectRatio(1)` circle.
   → verify: bottom row is `[  0  ][.][=]` matching iPhone; screenshot diff.
5. Decide the fate of the top-left menu icon (#9) and the scientific placeholder (#2) per the product call above.

### Phase 3 — iPhone signature interactions

6. Add a `selectedOperator` field to `CalculatorState`; highlight the active operator (white bg / orange glyph) until the next digit clears it.
   → verify: press `+`; the `+` key inverts; pressing a digit restores it.
7. Implement `AC` ↔ `C` toggle semantics (empty vs mid-entry), replacing the delete-icon toggle — or keep delete as an intentional enhancement (product call).
   → verify: fresh state shows `AC`; after a digit shows `C`; `C` clears entry, `AC` clears all.

### Phase 4 — Display + polish

8. Format the result with grouping separators via `intl` `NumberFormat` (already a dependency), preserving the existing trailing-zero trim.
   → verify: `12345 x 1000 =` shows `12,345,000`.
9. If converging on the iPhone single-line model (#7), drive the large display from live input; otherwise keep the tape and skip.
10. Add iOS-style press dim + `HapticFeedback.lightImpact()` on tap; align function-key gray to `#A5A5A5`.
    → verify: manual on device — buttons dim and tick on press.

## Cross-cutting notes

- Colors currently in code: operator `#FFA00A`, digit `#2B2B2D`, function `#5C5C60`.
  iOS reference: operator `#FF9F0A`, digit `#333333`, function `#A5A5A5`.
  Differences are minor; align only if pixel parity is a goal.
- The display currently uses `AutoSizeText` (good — matches iPhone's shrink-to-fit).
- Tests live in `test/presentation/pages/calculator_screen_test.dart` and the bloc tests; layout and semantics changes above will require updating those expectations.

## Open decisions (blocking Phase 2-4 scope)

1. **Single-line (iPhone) vs two-line (tape) display** — converge or keep?
2. **Menu icon** — wire up (history?) or remove?
3. **Scientific placeholder** — on the roadmap, or delete and restore wide `0`?
4. **Clear key** — adopt iPhone `AC`/`C`, or keep the delete-key model as a deliberate enhancement?
