# Vim Scoring Tests

An automated testing system to practice vim and track your progress!

## How It Works

Each test:
1. Shows you instructions for editing tasks
2. Prompts you to press ENTER to start
3. Opens the file in vim/nvim and starts timing
4. Tracks how long you're in vim and how many keystrokes you use
5. When you save and quit, compares your result to the expected solution
6. Gives you a score based on:
   - **Accuracy** (100% if perfect, lower if there are differences)
   - **Time** (penalty for taking too long)
   - **Keystrokes** (penalty for excessive keystrokes)

## Running Tests

### Run a single test:
```bash
python3 test1.py
python3 test2.py
python3 test3.py
```

### Run all tests in sequence:
```bash
python3 run_all_tests.py
```

## Available Tests

- **test1.py** - Basic Editing (delete, change, copy/paste, add)
- **test2.py** - Code Editing (search/replace, comments, rename, delete)
- **test3.py** - Formatting Challenge (indentation and spacing)

## Scoring System

Your final score is calculated as:

1. **Accuracy Score** (0-100%)
   - 100% if your file exactly matches the solution
   - Decreases based on the number of differences

2. **Time Penalty**
   - No penalty if under 60 seconds
   - -1% for every 10 seconds over 1 minute

3. **Keystroke Penalty**
   - No penalty if under 50 keystrokes
   - -0.1% for every keystroke over 50

### Score Ratings:
- 95-100: EXCELLENT - Vim Master! 🏆
- 85-94: GREAT JOB - Very well done! ⭐
- 70-84: GOOD - Keep practicing! 👍
- 50-69: OKAY - Room for improvement 📝
- 0-49: Keep practicing! You'll get better! 💪

## Tips for Better Scores

1. **Learn the efficient commands:**
   - `dd` to delete a line
   - `yy` to yank (copy) a line
   - `p` to paste
   - `:%s/old/new/g` to replace all occurrences
   - `ciw` to change a word
   - `G` to go to end of file
   - `gg` to go to start of file

2. **Plan before you start** - Read all tasks and think about the most efficient order

3. **Use counts** - `3dd` deletes 3 lines, `5j` moves down 5 lines

4. **Practice regularly** - Muscle memory is key!

## Creating Your Own Tests

To create a new test:

1. Create a start file (e.g., `test4_start.txt`)
2. Create a solution file (e.g., `test4_solution.txt`)
3. Create a test script (e.g., `test4.py`) using this template:

```python
#!/usr/bin/env python3
import sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).parent))
from vim_scorer import VimScorer

def main():
    instructions = """
TASKS:
1. Your task here
2. Another task
"""

    test_dir = Path(__file__).parent

    scorer = VimScorer(
        test_name="Test 4: Your Test Name",
        start_file=test_dir / "test4_start.txt",
        solution_file=test_dir / "test4_solution.txt",
        instructions=instructions
    )

    result = scorer.run(show_diff=True)
    return 0 if result else 1

if __name__ == "__main__":
    sys.exit(main())
```

4. Make it executable: `chmod +x test4.py`

Happy vimming! 🎯
