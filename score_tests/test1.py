#!/usr/bin/env python3
"""
Test 1: Basic Editing
Delete line, change text, copy/paste, add new line
"""

import sys
from pathlib import Path

# Add current directory to path to import vim_scorer
sys.path.insert(0, str(Path(__file__).parent))

from vim_scorer import VimScorer


def main():
    instructions = """
TASKS:
1. Delete line 3 (Fix the leaky faucet)
2. Change "Call mom" to "Call parents"
3. Copy line 5 (Do laundry) and paste it after itself
4. Add a new item "7. Clean room" at the end

TIP: Work efficiently! Fewer keystrokes = better score
"""

    test_dir = Path(__file__).parent

    scorer = VimScorer(
        test_name="Test 1: Basic Editing",
        start_file=test_dir / "test1_start.txt",
        solution_file=test_dir / "test1_solution.txt",
        instructions=instructions
    )

    result = scorer.run(show_diff=True)

    if result:
        print(f"\nYour result has been recorded!")
        return 0
    else:
        print("\nTest failed or was aborted.")
        return 1


if __name__ == "__main__":
    sys.exit(main())
