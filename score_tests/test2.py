#!/usr/bin/env python3
"""
Test 2: Code Editing
Replace text, add comments, rename functions, delete functions
"""

import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))

from vim_scorer import VimScorer


def main():
    instructions = """
TASKS:
1. Add a comment "// Math functions" above the first function
2. Replace all instances of "var" with "let"
3. Delete the entire calculatePerimeter function (including blank line)
4. Change the function name "displayMessage" to "showMessage"

TIP: Use search and replace commands for efficiency!
"""

    test_dir = Path(__file__).parent

    scorer = VimScorer(
        test_name="Test 2: Code Editing",
        start_file=test_dir / "test2_start.js",
        solution_file=test_dir / "test2_solution.js",
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
