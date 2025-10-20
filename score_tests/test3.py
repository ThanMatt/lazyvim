#!/usr/bin/env python3
"""
Test 3: Formatting Challenge
Fix indentation and spacing issues
"""

import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))

from vim_scorer import VimScorer


def main():
    instructions = """
TASKS:
Fix the Python code formatting:
1. Fix indentation (4 spaces for each level)
2. Add proper spacing around operators (= and +)
3. Remove extra spaces in function definitions
4. Ensure there's a blank line between each function

TIP: Visual mode can help with indentation!
"""

    test_dir = Path(__file__).parent

    scorer = VimScorer(
        test_name="Test 3: Formatting Challenge",
        start_file=test_dir / "test3_start.py",
        solution_file=test_dir / "test3_solution.py",
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
