#!/usr/bin/env python3
"""
Main Test Runner
Run all vim tests and show aggregate results
"""

import sys
import subprocess
from pathlib import Path


def run_test(test_script):
    """Run a single test script and capture results"""
    try:
        result = subprocess.run(
            [sys.executable, str(test_script)],
            capture_output=False,
            text=True
        )
        return result.returncode == 0
    except Exception as e:
        print(f"Error running {test_script.name}: {e}")
        return False


def main():
    test_dir = Path(__file__).parent

    # Find all test scripts
    test_scripts = sorted(test_dir.glob("test*.py"))

    if not test_scripts:
        print("No test scripts found!")
        return 1

    print("=" * 60)
    print("VIM TESTING SUITE")
    print("=" * 60)
    print(f"Found {len(test_scripts)} tests\n")

    for i, script in enumerate(test_scripts, 1):
        print(f"\n{'=' * 60}")
        print(f"Test {i}/{len(test_scripts)}: {script.stem}")
        print(f"{'=' * 60}\n")

        success = run_test(script)

        if not success:
            print(f"\n⚠️  Test {script.stem} was not completed successfully")
            choice = input("\nContinue to next test? (y/n): ")
            if choice.lower() != 'y':
                print("Testing session ended.")
                break

    print("\n" + "=" * 60)
    print("ALL TESTS COMPLETED!")
    print("=" * 60)
    print("\nGreat job practicing vim! Keep it up! 🚀\n")

    return 0


if __name__ == "__main__":
    sys.exit(main())
