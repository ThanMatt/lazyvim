#!/usr/bin/env python3
"""
Vim Test Scorer Utility
Tracks time, keystrokes, and compares results against expected output
"""

import os
import sys
import time
import difflib
import subprocess
import tempfile
import shutil
from pathlib import Path


class VimScorer:
    def __init__(self, test_name, start_file, solution_file, instructions):
        self.test_name = test_name
        self.start_file = Path(start_file)
        self.solution_file = Path(solution_file)
        self.instructions = instructions
        self.time_taken = 0
        self.keystroke_count = 0
        self.temp_file = None

    def show_instructions(self):
        """Display test instructions to the user"""
        print("=" * 60)
        print(f"VIM TEST: {self.test_name}")
        print("=" * 60)
        print(self.instructions)
        print("=" * 60)
        print("\nPress ENTER to start the test (timer will begin)...")
        print("When done, save and quit vim (:wq or ZZ)")
        input()

    def prepare_test_file(self):
        """Create a temporary copy of the start file for the user to edit"""
        # Create temp file in the same directory as start file
        temp_dir = self.start_file.parent
        self.temp_file = temp_dir / f"test_{self.start_file.name}"
        shutil.copy2(self.start_file, self.temp_file)
        return self.temp_file

    def run_vim_with_tracking(self):
        """Launch vim and track time and keystrokes"""
        # Create a log file for tracking keystrokes
        log_file = tempfile.NamedTemporaryFile(mode='w', delete=False, suffix='.log')
        log_path = log_file.name
        log_file.close()

        # Determine which vim to use
        vim_cmd = 'nvim' if shutil.which('nvim') else 'vi'

        print(f"\nStarting {vim_cmd}...")
        print("Timer starting NOW!\n")

        start_time = time.time()

        # Run vim with script logging to track keystrokes
        # -w flag logs all keystrokes
        try:
            subprocess.run([vim_cmd, '-w', log_path, str(self.temp_file)])
        except Exception as e:
            print(f"Error running vim: {e}")
            return False

        end_time = time.time()
        self.time_taken = end_time - start_time

        # Count keystrokes from log file
        try:
            with open(log_path, 'rb') as f:
                self.keystroke_count = len(f.read())
        except Exception as e:
            print(f"Warning: Could not count keystrokes: {e}")
            self.keystroke_count = 0

        # Clean up log file
        try:
            os.unlink(log_path)
        except:
            pass

        return True

    def calculate_accuracy(self):
        """Compare user's file against solution and calculate accuracy score"""
        try:
            with open(self.temp_file, 'r') as f:
                user_content = f.readlines()
        except Exception as e:
            print(f"Error reading user file: {e}")
            return 0, []

        try:
            with open(self.solution_file, 'r') as f:
                solution_content = f.readlines()
        except Exception as e:
            print(f"Error reading solution file: {e}")
            return 0, []

        # Calculate diff
        differ = difflib.Differ()
        diff = list(differ.compare(solution_content, user_content))

        # Count differences
        additions = sum(1 for line in diff if line.startswith('+ '))
        deletions = sum(1 for line in diff if line.startswith('- '))
        total_changes = additions + deletions

        # Calculate accuracy (100% if identical, decreases with more changes)
        total_lines = max(len(solution_content), len(user_content), 1)
        accuracy = max(0, 100 - (total_changes / total_lines * 100))

        return accuracy, diff

    def calculate_score(self, accuracy, time_penalty=True, keystroke_penalty=True):
        """Calculate overall score based on accuracy, time, and keystrokes"""
        score = accuracy

        # Apply time penalty (optional)
        if time_penalty and self.time_taken > 60:
            # Reduce score by 1% for every 10 seconds over 1 minute
            time_over = self.time_taken - 60
            penalty = (time_over / 10) * 1
            score = max(0, score - penalty)

        # Apply keystroke penalty (optional)
        if keystroke_penalty and self.keystroke_count > 50:
            # Reduce score by 0.1% for every keystroke over 50
            keystroke_over = self.keystroke_count - 50
            penalty = keystroke_over * 0.1
            score = max(0, score - penalty)

        return round(score, 2)

    def show_diff(self, diff):
        """Display the diff between user's file and solution"""
        print("\n" + "=" * 60)
        print("DIFFERENCES (if any):")
        print("=" * 60)

        has_diff = False
        for line in diff:
            if line.startswith('+ ') or line.startswith('- ') or line.startswith('? '):
                print(line.rstrip())
                has_diff = True

        if not has_diff:
            print("✓ Perfect match! No differences found.")

        print("=" * 60)

    def show_results(self, accuracy, score):
        """Display final results"""
        print("\n" + "=" * 60)
        print("TEST RESULTS")
        print("=" * 60)
        print(f"Test Name:      {self.test_name}")
        print(f"Time Taken:     {self.time_taken:.2f} seconds")
        print(f"Keystrokes:     {self.keystroke_count}")
        print(f"Accuracy:       {accuracy:.2f}%")
        print(f"Final Score:    {score:.2f}/100")
        print("=" * 60)

        # Performance rating
        if score >= 95:
            print("🏆 EXCELLENT! You're a vim master!")
        elif score >= 85:
            print("⭐ GREAT JOB! Very well done!")
        elif score >= 70:
            print("👍 GOOD! Keep practicing!")
        elif score >= 50:
            print("📝 OKAY. Room for improvement.")
        else:
            print("💪 KEEP PRACTICING! You'll get better!")
        print()

    def cleanup(self):
        """Remove temporary test file"""
        try:
            if self.temp_file and self.temp_file.exists():
                self.temp_file.unlink()
        except Exception as e:
            print(f"Warning: Could not clean up temp file: {e}")

    def run(self, show_diff=True):
        """Run the complete test workflow"""
        try:
            # Show instructions
            self.show_instructions()

            # Prepare test file
            self.prepare_test_file()

            # Run vim with tracking
            if not self.run_vim_with_tracking():
                print("Test aborted.")
                return None

            # Calculate accuracy
            accuracy, diff = self.calculate_accuracy()

            # Calculate final score
            score = self.calculate_score(accuracy)

            # Show diff if requested
            if show_diff:
                self.show_diff(diff)

            # Show results
            self.show_results(accuracy, score)

            return {
                'test_name': self.test_name,
                'time': self.time_taken,
                'keystrokes': self.keystroke_count,
                'accuracy': accuracy,
                'score': score
            }

        finally:
            # Always cleanup
            self.cleanup()


if __name__ == "__main__":
    print("This is a utility module. Import it in your test scripts.")
    print("Example usage:")
    print("""
from vim_scorer import VimScorer

scorer = VimScorer(
    test_name="Test 1",
    start_file="start.txt",
    solution_file="solution.txt",
    instructions="Delete line 3 and add a new line at the end."
)

result = scorer.run()
""")
