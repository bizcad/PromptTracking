# From Zero to Agentic Workflows with VS Code and AI
## A Practical Building-Block Guide for Healthcare Research

---

⚠️ **IMPORTANT CAVEATS BEFORE YOU START**

1. **Python & PowerShell Knowledge Required**: This guide assumes you have a basic understanding of Python and PowerShell and possibly markdown. If you're completely new to these, you might want to familiarize yourself with them first.

2. **Alpha Tester Workflow**: This workflow was produced for an alpha tester who is new to VS Code, so some steps may be simplified or assume minimal prior knowledge.

3. **Not Fully Tested**: This guide has not been tested. It was produced by an AI model and may contain errors or omissions. Use it as a starting point and verify each step.

---

## Part 1: Understanding the Landscape

### What You're About to Use

You're stepping into a powerful ecosystem that combines:
- **VS Code** - A lightweight, extensible code editor (the industry standard)
- **GitHub Copilot** - AI-powered code completion that works inside VS Code
- **Claude** - Advanced AI reasoning (via extensions or side-by-side browsers)
- **Python** - Your familiar language, now with AI superpowers
- **ProjectTracking** - Session logging to capture your AI conversations and insights

### The Workflow You'll Build

1. Write Python code in VS Code
2. Use Copilot to accelerate development (GitHub's AI model)
3. Use Claude in a browser tab for complex reasoning and research discussions
4. Use ProjectTracking to log important decisions, discoveries, and code snippets
5. Search your logs later to find solutions and patterns

This is exactly what agentic development looks like - human guidance + AI assistance + documentation.

---

---

## Table of Contents

- **Introduction** - What you're about to learn
- **Chapter 1** - Set up your project directory
- **Chapter 2** - Install PowerShell (latest version)
- **Chapter 3** - Install and configure VS Code
- **Chapter 4** - Install PromptTracking (your session logger)
- **Chapter 5** - Install essential extensions
- **Chapter 6** - Set up Python for your project
- **Chapter 7** - Configure GitHub Copilot
- **Chapter 8** - Add Claude to Copilot Chat
- **Chapter 9** - Run a smoke test (your first logged workflow)
- **Chapter 10** - Learn the Research-to-Code workflow
- **Chapter 11** - Your first agentic project
- **Appendix A** - The philosophy behind this approach
- **Appendix B** - Keyboard shortcuts and tips
- **Appendix C** - Troubleshooting
- **Appendix D** - Resources and communities

---

## Introduction

### What You're About to Learn

You're stepping into a powerful ecosystem that combines:
- **VS Code** - A lightweight, extensible code editor (the industry standard)
- **GitHub Copilot** - AI-powered code completion that works inside VS Code
- **Claude** - Advanced AI reasoning (integrated into VS Code via Copilot Chat)
- **Python** - Your familiar language, now with AI superpowers
- **Perplexity** - Web-enabled AI research (in your browser)
- **ProjectTracking** - Session logging to capture your entire workflow
- **PowerShell** - Your command-line tool for everything

### What You'll Build

By the end of this guide, you'll have:
1. A working development environment for Python + AI
2. A searchable log of every decision, prompt, and code snippet
3. A proven workflow for research → architecture → implementation
4. The ability to apply this to any healthcare AI project

### Your Learning Path (with checklist)

This guide is structured as **building blocks**. Each chapter builds on the previous one. Don't skip ahead.

**Week 1: Foundation (Chapters 1-6)**
- [ ] Chapter 1: Create project directory
- [ ] Chapter 2: Install PowerShell
- [ ] Chapter 3: Install VS Code and test it
- [ ] Chapter 4: Install PromptTracking
- [ ] Chapter 5: Install extensions (one at a time, test each)
- [ ] Chapter 6: Set up Python virtual environment

**Week 2: AI Integration (Chapters 7-9)**
- [ ] Chapter 7: Set up GitHub Copilot
- [ ] Chapter 8: Configure Claude in Copilot Chat
- [ ] Chapter 9: Run your first smoke test (log a hello world)

**Week 3: Real Workflows (Chapters 10-11)**
- [ ] Chapter 10: Understand the Research-to-Code pattern
- [ ] Chapter 11: Build your first real project
- [ ] Chapter 11: Iterate and log everything

---

## Chapter 1: Set Up Your Project Directory

### What You're Doing

Creating a folder structure for your healthcare AI projects. This is where everything lives.

### Steps

1. **Open PowerShell**
   - Press `Windows Key + X`
   - Select "Windows PowerShell" or "Terminal"

2. **Create your projects folder**
   ```powershell
   mkdir C:\repos
   cd C:\repos
   ```

3. **Create your first project**
   ```powershell
   mkdir MedicalProject
   cd MedicalProject
   dir  # Shows empty folder - good!
   ```

4. **Verify you're in the right place**
   ```powershell
   pwd  # Should show: C:\repos\MedicalProject
   ```

### Checklist

- [ ] PowerShell is open
- [ ] Created `C:\repos` directory
- [ ] Created `C:\repos\MedicalProject` directory
- [ ] `dir` shows empty folder
- [ ] `pwd` confirms you're in the right location

---

## Chapter 2: Install PowerShell (Latest Version)

### What You're Doing

Upgrading to the latest PowerShell for better compatibility and features.

### Steps

1. **Check your current version**
   ```powershell
   $PSVersionTable.PSVersion
   ```
   - If you see 7.x or higher, you're done - skip to Chapter 3
   - If you see 5.1, you need to upgrade

2. **Download PowerShell 7**
   - Go to [https://github.com/PowerShell/PowerShell/releases](https://github.com/PowerShell/PowerShell/releases)
   - Download "PowerShell-7.x.x-win-x64.msi" (Windows 64-bit)

3. **Install it**
   - Run the MSI installer
   - Accept defaults
   - Click "Install"
   - Restart your computer (or just open a new PowerShell window)

4. **Verify installation**
   ```powershell
   $PSVersionTable.PSVersion  # Should show 7.x.x
   ```

### Checklist

- [ ] Checked your current PowerShell version
- [ ] Downloaded PowerShell 7 (if needed)
- [ ] Installed it
- [ ] New PowerShell shows version 7.x or higher

---

## Chapter 3: Install and Configure VS Code

### What You're Doing

Installing the code editor where you'll spend most of your time. We'll test it with a simple file.

### Steps

1. **Download VS Code**
   - Go to [https://code.visualstudio.com](https://code.visualstudio.com)
   - Click the Windows download button
   - Run the installer

2. **Installation Settings**
   - When asked "Add to PATH", **click Yes**
   - Accept all other defaults
   - Click "Install"

3. **Launch VS Code**
   - Click "Finish"
   - Wait for it to open

4. **Open your project in VS Code**
   ```powershell
   # Still in PowerShell, in C:\repos\MedicalProject
   code .
   ```
   - VS Code opens with your empty project folder

5. **Create and edit your first file**
   - In VS Code, press `Ctrl+N` to create a new file
   - Type:
     ```
     # My Healthcare AI Project
     
     This is where I'll build medication interaction checkers.
     ```
   - Press `Ctrl+S` to save
   - Name it `README.md`
   - You'll see it in the Explorer on the left

### Checklist

- [ ] Downloaded and installed VS Code
- [ ] Added to PATH during installation
- [ ] Opened VS Code from PowerShell using `code .`
- [ ] Created and saved a `README.md` file
- [ ] Can see the file in VS Code's Explorer panel

---

## Chapter 4: Install PromptTracking (Your Session Logger)

### What You're Doing

Installing the session logging system that will capture every prompt, response, and code decision you make.

### Steps

1. **Navigate to your project** (in PowerShell)
   ```powershell
   cd C:\repos\MedicalProject
   ```

2. **Clone PromptTracking**
   ```powershell
   git clone https://github.com/bizcad/PromptTracking.git PromptTracking
   ```
   - If you get "git not found", install Git from [https://git-scm.com](https://git-scm.com)

3. **Load it in PowerShell**
   ```powershell
   . .\PromptTracking\load-session-logging.ps1
   ```
   - You'll see a message confirming it loaded

4. **Test the logging commands**
   ```powershell
   Show-LogHelp  # Shows all available logging commands
   ```

5. **Test logging your first note**
   ```powershell
   logt "Created my first healthcare AI project"
   ```
   - Check the PromptTracking folder - you'll see a new markdown file with today's date

### Understanding the Logging Commands

```powershell
logt  # Log a thought/note
logp  # Log a prompt (copy to clipboard first, then run logp)
logr  # Log a response (copy to clipboard first, then run logr)
logc  # Log code from clipboard
logn  # Log a note with "Note:" header
```

### Checklist

- [ ] Cloned PromptTracking into your project
- [ ] Ran `load-session-logging.ps1`
- [ ] Ran `Show-LogHelp` successfully
- [ ] Logged your first note with `logt`
- [ ] Can see the session log file in `PromptTracking` folder

---

## Chapter 5: Install Essential Extensions

### What You're Doing

Adding powerful tools to VS Code that make your life easier. We'll install one at a time and test each.

### Steps

1. **Open the Extensions panel in VS Code**
   - Press `Ctrl+Shift+X`
   - Or click the Extensions icon on the left (4 squares)

2. **Install Python (by Microsoft)**
   - Search: "Python"
   - Find the official one by Microsoft
   - Click "Install"
   - Wait for installation to complete

3. **Install Pylint** (code quality)
   - Search: "Pylint"
   - Click "Install"

4. **Install Markdown Preview Enhanced**
   - Search: "Markdown Preview Enhanced"
   - Click "Install"
   - Why: When Claude returns markdown, this makes it beautiful

5. **Install Git Graph** (visual git history)
   - Search: "Git Graph"
   - Click "Install"

6. **Install Better Comments** (colored comments)
   - Search: "Better Comments"
   - Click "Install"

7. **Install Peacock** (workspace coloring)
   - Search: "Peacock"
   - Click "Install"
   - Why: Helpful when you have multiple projects open

### Test Each Extension

After installing each one, reload VS Code:
- Press `Ctrl+Shift+P`
- Type "Reload Window"
- Press Enter

### Checklist

- [ ] Opened Extensions panel (`Ctrl+Shift+X`)
- [ ] Installed Python (Microsoft)
- [ ] Installed Pylint
- [ ] Installed Markdown Preview Enhanced
- [ ] Installed Git Graph
- [ ] Installed Better Comments
- [ ] Installed Peacock
- [ ] Reloaded VS Code after installing each extension
- [ ] All extensions show "Uninstall" button (meaning they're active)

---

## Chapter 6: Set Up Python for Your Project

### What You're Doing

Creating an isolated Python environment for your project. This keeps your packages organized and project-specific.

### Steps

1. **Install Python** (if not already done)
   - Go to [https://python.org](https://python.org)
   - Download Python 3.11 or newer
   - Run installer
   - **Important**: Check "Add Python to PATH"
   - Click "Install"

2. **Create a virtual environment in your project**
   ```powershell
   cd C:\repos\MedicalProject
   python -m venv venv
   ```
   - Wait for it to complete (may take a minute)
   - You'll see a new `venv` folder in your project

3. **Activate the virtual environment**
   ```powershell
   .\venv\Scripts\Activate.ps1
   ```
   - Your prompt should now show `(venv)` at the start
   - Example: `(venv) PS C:\repos\MedicalProject>`

4. **Install common packages**
   ```powershell
   pip install pandas numpy requests
   ```

5. **Open your project in VS Code** (with venv active)
   ```powershell
   code .
   ```
   - VS Code will detect your venv automatically

### Checklist

- [ ] Python 3.11+ installed and in PATH
- [ ] Created virtual environment (`venv` folder exists)
- [ ] Activated venv (`(venv)` shows in prompt)
- [ ] Installed pandas, numpy, requests
- [ ] Opened project in VS Code
- [ ] VS Code shows Python version from venv in bottom-right

---

## Chapter 7: Configure GitHub Copilot

### What You're Doing

Setting up inline AI code suggestions. Copilot helps you write code faster while you type.

### Steps

1. **Get a GitHub account** (if you don't have one)
   - Go to [https://github.com/signup](https://github.com/signup)
   - Complete signup

2. **Subscribe to Copilot**
   - Go to [https://github.com/settings/copilot](https://github.com/settings/copilot)
   - Click "Enable Copilot"
   - Choose plan: $20/month ($200/year if billed annually)
   - Or free if you're a verified student
   - Complete payment

3. **Install Copilot extension in VS Code**
   - Press `Ctrl+Shift+X`
   - Search: "GitHub Copilot" (official one by GitHub)
   - Click "Install"

4. **Sign in to GitHub**
   - VS Code will ask you to sign in with GitHub
   - Click "Sign in"
   - A browser window opens
   - Authorize VS Code to use your GitHub account
   - Close the browser, return to VS Code

5. **Test Copilot**
   - Create a new file: `test_copilot.py`
   - Type:
     ```python
     def calculate_bmi(weight_kg, height_m):
         # Press Ctrl+Space or wait - Copilot will suggest the rest
     ```
   - Copilot will suggest code completions
   - Press `Tab` to accept, `Escape` to dismiss

### Checklist

- [ ] GitHub account created
- [ ] Copilot subscription activated
- [ ] Copilot extension installed in VS Code
- [ ] Signed into GitHub from VS Code
- [ ] Created test_copilot.py file
- [ ] Copilot suggests code completions
- [ ] Can accept (Tab) and dismiss (Escape) suggestions

---

## Chapter 8: Add Claude to Copilot Chat

### What You're Doing

Installing Copilot Chat and configuring it to use Claude for deeper reasoning. This is where your advanced thinking happens.

### Steps

1. **Install Copilot Chat extension**
   - Press `Ctrl+Shift+X`
   - Search: "GitHub Copilot Chat"
   - Click "Install"
   - Reload VS Code when prompted

2. **Open Copilot Chat**
   - Press `Ctrl+Shift+I`
   - A chat panel appears on the right side of VS Code

3. **Switch to Claude model**
   - At the top of the chat panel, look for the model selector
   - Click the dropdown (it might show "GPT-4" or "Claude")
   - Select **Claude** (Claude Haiku 4.5 or Claude 3.5 Sonnet)

4. **Enable Agent Mode**
   - Look for a toggle labeled "Agent" or "Agentic" near the chat input
   - Click to enable it
   - Agent mode lets Claude see your entire codebase

5. **Test Claude Chat**
   - Type in the chat:
     ```
     What's a good way to structure a medication validation function in Python?
     ```
   - Claude will respond with detailed architecture suggestions
   - Copy the response to clipboard
   - In PowerShell: `logr` (logs Claude's response)

### Checklist

- [ ] Copilot Chat extension installed
- [ ] `Ctrl+Shift+I` opens the chat panel
- [ ] Claude model is selected in the dropdown
- [ ] Agent mode is enabled
- [ ] Can ask Claude a question and get detailed responses
- [ ] Can copy response and use `logr` to save it

---

## Chapter 9: Run Your Smoke Test

### What You're Doing

Running your first complete workflow: creating code, logging it, and reviewing what you've done. This tests all your tools together.

### Steps

1. **Make sure everything is ready**
   ```powershell
   cd C:\repos\MedicalProject
   .\venv\Scripts\Activate.ps1
   . .\PromptTracking\load-session-logging.ps1
   code .
   ```

2. **Create a simple Python file**
   - In VS Code, press `Ctrl+N`
   - Type:
     ```python
     def hello_with_markdown():
         """Return a markdown-formatted greeting."""
         return """
     # Hello, Healthcare AI!
     
     This is **bold** and *italic* and `code`.
     
     - Bullet point 1
     - Bullet point 2
     """
     
     if __name__ == "__main__":
         print(hello_with_markdown())
     ```
   - Save as `hello.py`

3. **Run the code**
   - Press `Ctrl+F5` (or Ctrl+`)` to open terminal, then `python hello.py`)
   - See the markdown output in the terminal

4. **Now let's log it**
   - Select all the code and copy it
   - In PowerShell: `logc` (logs the code from clipboard)
   - You'll see it in your session log with code formatting

5. **Ask Claude to improve it**
   - Open Copilot Chat (`Ctrl+Shift+I`)
   - Type: `"How could I improve this hello world function for a healthcare project?"`
   - Copy Claude's response
   - In PowerShell: `logr` (logs Claude's response)

6. **Review what you've logged**
   - Open the PromptTracking folder in file explorer
   - Open today's markdown file
   - You'll see:
     - The code you logged with `logc`
     - Claude's response logged with `logr`
     - A searchable record of your entire workflow

### Checklist

- [ ] Virtual environment activated
- [ ] PromptTracking loaded
- [ ] Created hello.py with markdown function
- [ ] Code runs successfully (`Ctrl+F5`)
- [ ] Logged code with `logc`
- [ ] Asked Claude a question in Copilot Chat
- [ ] Logged Claude's response with `logr`
- [ ] Can see both in your session log file

---

## Chapter 10: Learn the Research-to-Code Workflow

### What You're Doing

Understanding the pattern that makes you effective: research → architecture → implementation → logging.

---

### Why Log Everything

You might think logging is optional - it's not. Here's why it matters:

#### 1. LLMs Have Memory Limitations

**The Prompt Size Problem:**
- Every conversation with an AI has a maximum context size (how much text it can read at once)
- Claude can read ~200k tokens (roughly 500 pages of text)
- Copilot has smaller limits in certain contexts
- Your healthcare research project will grow to exceed these limits within weeks

**What this means:**
- When you ask Claude about "the medication validation system you helped me design 3 weeks ago," it can't remember
- You have to re-explain everything each time
- This wastes tokens, time, and increases error rates

**How logging fixes this:**
- Your session logs are a searchable reference
- You can copy relevant past conversations into new prompts
- Models get full context on what you've already tried and decided
- This dramatically improves suggestion quality

#### 2. Models Forget Details (Intentionally)

When you have a long conversation, LLMs have to summarize it mentally:
- They read your 50-message conversation
- They internally compress it to understand key points
- They inevitably lose details: edge cases, specific requirements, rejected approaches
- They make suggestions based on incomplete information

**How logging fixes this:**
- Your logs preserve exact wording and technical details
- When you paste a relevant log entry into a new conversation, models see the full context
- You can say: "Here's what Claude suggested last time we solved this. Here's the new problem."
- Models can build on previous solutions instead of starting from scratch

#### 3. You Forget Things Too

You're human. After 2 weeks, you forget:
- Why you chose database X over database Y
- What error you got when you tried approach A
- Which Python library you tested and rejected
- What the medication interaction guidelines actually said

**How logging fixes this:**
```powershell
# 3 weeks later, you need to remember
Select-String "interaction" .\PromptTracking\*.md
# Boom - you can see your entire research journey on medication interactions
# You remember why you made each decision
```

#### 4. Documentation About "How We Got Here"

Healthcare research needs reproducibility and explanation:
- Regulatory reviewers need to see your reasoning
- Future you needs to understand past you's decisions
- Collaborators need to know what's been tried
- Publications need methodology explanations

Your logs are living documentation of:
- What you researched (Perplexity queries)
- How you designed it (Claude architecture prompts)
- What you built (Copilot code)
- What worked and what didn't
- Why you made each choice

---

### Using Different Models for Better Results

You have three AI tools available: Perplexity, Claude, and Copilot. They think differently.

#### Different Skills, Different Blind Spots

**Perplexity:**
- Excellent at web research and synthesis
- Good at finding current guidelines and standards
- Weaker at code architecture and deep reasoning
- Best for: "What's the current best practice?"

**Claude:**
- Excellent at abstract reasoning and explanation
- Good at architecture and design decisions
- Good at understanding complex requirements
- Weaker at code implementation details
- Best for: "How should I structure this?"

**Copilot:**
- Excellent at practical code implementation
- Good at recognizing patterns and boilerplate
- Weaker at reasoning "why" or explaining trade-offs
- Best for: "Write the actual function now"

#### Why This Matters: The Details That Each Catches

When you use only one model:
```
Perplexity says: "Use this medical database API"
[You find out later the API is deprecated]

Claude says: "Structure it with this pattern"
[Copilot implements it, but misses performance optimization]

Copilot writes: "Here's your function"
[It works but violates healthcare data standards]
```

When you use all three strategically:
```
Perplexity says: "Use this medical database API"
Claude asks: "Is this API production-ready and HIPAA-compliant?"
Perplexity verifies: "Current status: Yes, actively maintained"
Claude designs: "Here's the secure architecture"
Copilot implements: "Here's the optimized code"
You verify: "This meets all requirements"
```

#### Verification Through Diversity

Different models sometimes disagree:
```
Claude says: "Use a dictionary for this"
Copilot says: "Use a database"
```

This disagreement is valuable! It means:
- You need to think about which is actually better
- You should ask Perplexity: "What's the industry standard here?"
- You learn more by resolving the disagreement than accepting one answer
- Your final decision is better informed

#### Capturing Everything: Why Logging Every Output Matters

When you use multiple models, it's easy to lose track:
```
# BAD - only remember Copilot's code
def validate_medication(drug1, drug2):
    # Copilot's code, but you forgot Claude's architectural warnings

# GOOD - logged both perspectives
# [logp] Architecture prompt
# [logr] Claude's response explaining HIPAA compliance needs
# [logr] Perplexity's research on regulatory requirements  
# [logc] Copilot's final implementation
# You can see all perspectives and why you chose this approach
```

Your logs become a record of:
- What each model recommended
- Why you chose one approach over another
- What considerations each model raised
- How your thinking evolved

---

### Structured Prompting and Why It Works

AI models respond much better to structured prompts than rambling ones.

#### Why Structured Prompts Work Better

Think of an AI model like a code compiler. A compiler needs clear, unambiguous instructions:

**Bad code:**
```python
def thing(x):
    do stuff with x
    return result
```

**Good code:**
```python
def validate_medication_interaction(drug1: str, drug2: str) -> bool:
    """Check if two medications have dangerous interactions.
    
    Args:
        drug1: First medication name
        drug2: Second medication name
        
    Returns:
        True if interaction exists, False otherwise
    """
```

The good code is clearer because it has structure.

**The same applies to prompts:**

**Bad prompt:**
```
I'm building something for healthcare. Can you help me think about how to check if medications interact?
```

**Good (structured) prompt:**
```
Context: I'm building a medication interaction checker for healthcare research.

Medical Requirements:
- Must check interactions between 2-4 medications
- Must be HIPAA-compliant (no patient data stored)
- Must reference current FDA guidelines

Technical Requirements:
- Python 3.11+
- Must be testable
- Must handle missing medication data gracefully

Question: What's the best architecture for this system?

Constraints:
- Starting with a simple in-memory solution
- Will expand to a database later
- Limited to 500 common medications initially
```

**Why the structured prompt gets better results:**
- Model knows exactly what you need (no guessing)
- Model understands your constraints (won't suggest things you can't do)
- Model sees medical AND technical requirements (better balance)
- Model can explain tradeoffs from your specific situation
- You get a better answer in 1 prompt instead of 5 back-and-forths

#### The Anatomy of a Good Prompt

Use this structure every time:

```
CONTEXT:
[What you're building, why it matters]

REQUIREMENTS:
[What it needs to do - be specific]

CURRENT STATE:
[What you've tried, what works, what doesn't]

QUESTION:
[Exactly what you're asking for]

CONSTRAINTS:
[Budget, time, skills, existing code, regulations]

FORMAT YOU WANT:
[Bullet points? Code? Explanation? All of above?]
```

#### Example: Structured vs. Unstructured

**Unstructured (bad):**
```
How do I structure a medication database?
```

Response: Generic advice that may not fit your project

---

**Structured (good):**
```
CONTEXT:
Building a medication validator for healthcare research. Starting simple, may scale later.

REQUIREMENTS:
- Store medication names and known interactions
- Support lookups by medication name
- Return list of interacting medications
- Must not store patient data

CURRENT STATE:
Using Python with pandas. Started with CSV files but need better performance.
Tested SQLite but it felt like overkill at this stage.
Have about 500 medications in initial dataset.

QUESTION:
What's the best data structure/approach to store medications and their interactions for this stage? 
Should I move to a database now or stay in-memory?

CONSTRAINTS:
- No external APIs or services (budget limited)
- Needs to be testable
- Will eventually add to a web app
- Want to keep it simple for now

FORMAT:
Show me the pros/cons of each approach, then your recommendation with a code skeleton.
```

Response: Specific advice tailored to your exact situation, with code examples

---

**Notice the difference?** The structured prompt gets:
- Specific recommendations (not generic advice)
- Consideration of your constraints
- Code tailored to your needs
- Better rationale for the suggestions

#### Why Logging + Structured Prompting = Superpowers

When you combine these:

1. **You log a structured prompt:**
   ```powershell
   logp  # Your detailed, well-structured architecture question
   ```

2. **Model gives you a great answer:**
   ```powershell
   logr  # The response with specific recommendations
   ```

3. **3 weeks later, you need similar advice:**
   ```powershell
   # Search your logs
   Select-String "medication" .\PromptTracking\*.md
   # Find your old structured prompt and Claude's response
   # Copy both into a new conversation with your new problem
   # Claude sees your previous reasoning and gives better follow-up advice
   ```

4. **You've built a knowledge base:**
   - Every structured prompt is a template for future prompts
   - Every response is a reference for similar problems
   - You're training yourself to ask better questions
   - Each project builds on what you learned

---

### The Five-Phase Workflow

This is the most powerful pattern for healthcare research projects:

#### Phase 1: Research (Perplexity)
- **Tool**: Perplexity in your browser
- **Goal**: Find current medical guidelines, protocols, research
- **Action**: 
  ```powershell
  # Keep Perplexity open in Edge
  # Ask: "What are current guidelines for medication interaction checking?"
  # Copy findings to clipboard
  logr  # Log the findings
  ```

#### Phase 2: Architecture (Claude Chat in VS Code)
- **Tool**: Claude via Copilot Chat
- **Goal**: Turn research into code structure
- **Action**:
  ```powershell
  # Draft your architecture prompt based on research
  # Copy prompt to clipboard 
  logp  # Log your architecture prompt
  
  # In VS Code, Ctrl+Shift+I
  # Paste research findings: "Based on these medical guidelines, what's the best Python architecture?"
  # Copy Claude's response
  logr  # Log Claude's architecture advice
  ```

#### Phase 3: Implementation (Copilot inline)
- **Tool**: GitHub Copilot (inline suggestions as you type)
- **Goal**: Write actual code based on architecture
- **Action**:
  ```
  # In VS Code, start typing the function skeleton
  # Copilot suggests implementation details
  # Accept good suggestions with Tab
  # After completing: logc  (log your code)
  ```

#### Phase 4: Testing & Iteration (Claude + Copilot)
- **Tool**: Both Claude Chat and Copilot
- **Goal**: Find and fix problems
- **Action**:
  ```
  # Run your code, find bugs
  # Paste error to Claude Chat
  # Claude explains the issue
  logr  # Log the explanation
  # Copilot suggests fix while you type
  # Test again, log with logc when fixed
  ```

#### Phase 5: Documentation (Session Log)
- **Tool**: ProjectTracking logs
- **Goal**: Build searchable knowledge base
- **Action**:
  ```powershell
  logt "Function complete and tested"
  # Later: Select-String "medication" .\PromptTracking\*.md
  # Find everything you've learned about medication validation
  ```

### Why This Works

- **Perplexity** = Domain knowledge (what to build)
- **Claude** = Architecture (how to structure it)
- **Copilot** = Implementation (code details)
- **ProjectTracking** = Memory (find patterns later)

### Checklist

- [ ] Understand the five phases
- [ ] Know which tool to use for each phase
- [ ] Understand why we log at each phase
- [ ] Can explain the workflow to someone else
- [ ] Ready to apply it to a real project

---

## Chapter 11: Your First Agentic Project

### What You're Doing

Building a real healthcare AI project from scratch using everything you've learned.

### Project: Medication Interaction Validator

Let's build something useful for healthcare research.

#### Step 1: Set up your project structure
```powershell
cd C:\repos
mkdir MedicationValidator
cd MedicationValidator
python -m venv venv
.\venv\Scripts\Activate.ps1
code .
```

#### Step 2: Research phase
- Open Perplexity in Edge (side by side with VS Code)
- Ask: "What are the current clinical guidelines for checking medication interactions? What databases or APIs are commonly used?"
- Copy findings to clipboard
- In PowerShell: `logr` (saves your research)

#### Step 3: Architecture phase
- Copy your research findings
- In VS Code, open Copilot Chat (`Ctrl+Shift+I`)
- Ask: "Based on these medication interaction guidelines, what's the best Python architecture for a validator? Should I use a database, API, or built-in data structure?"
- Claude suggests architecture
- Copy the suggestion to clipboard
- In PowerShell: `logp` (save your prompt), then `logr` (save Claude's response)

#### Step 4: Create your Python file
In VS Code:
```python
# Start typing based on Claude's suggestions
class MedicationValidator:
    def __init__(self):
        """Initialize with known medication interactions."""
        # Copilot will help you complete this
```

- Let Copilot help fill in the details
- Save as `validator.py`
- Copy code to clipboard
- In PowerShell: `logc`

#### Step 5: Test and iterate
```powershell
# Run your code
python -m validator

# If there are bugs:
# - Copy error message
# - Paste to Claude Chat
# - Claude explains the issue
# - Copilot suggests fix while you type
# - Test again
# - Log the fix with logc
```

#### Step 6: Build a simple test
Create `test_validator.py`:
```python
from validator import MedicationValidator

validator = MedicationValidator()
# Copilot will help complete this...
```

#### Step 7: Document your journey
```powershell
# Log key decisions
logt "Decided to use in-memory dictionary for initial version"
logt "Added validation for common drug interactions"
logt "Created test suite with 10 test cases"

# Search what you've built
Select-String "medication" .\PromptTracking\*.md
```

### Checklist

- [ ] Created project directory
- [ ] Set up virtual environment
- [ ] Used Perplexity for research - logged with `logr`
- [ ] Used Claude for architecture - logged with `logp` and `logr`
- [ ] Created validator.py based on architecture - logged with `logc`
- [ ] Tested and iterated - logged fixes with `logc`
- [ ] Created test file - logged with `logc`
- [ ] Logged key decisions with `logt`
- [ ] Can search your logs to find patterns

### Extending This Project

Once the basic validator works:
- Add a database (Claude Chat: "How do I connect to a SQLite database?")
- Add a REST API (Claude Chat: "What's the simplest way to serve this as an API?")
- Add error handling (Copilot inline suggestions)
- Create documentation (Claude Chat: "How should I document this for healthcare researchers?")

---

## Appendix A: The Philosophy

Here's why this setup is powerful for your healthcare research:

### 1. Amplified Thinking
Claude helps you reason through complex problems. Instead of getting stuck, you have a thinking partner.

### 2. Accelerated Coding
Copilot removes boilerplate. You focus on logic and decision-making, not syntax.

### 3. Searchable Knowledge
ProjectTracking captures everything. Later, you search your logs to find what worked.

### 4. Reproducible Research
Every decision is logged. Every solution is findable. You can trace how you arrived at your conclusions.

### 5. Collaborative Partnership
You + AI + your notes = a thinking system. You're the agent directing the process. The AI handles pattern recognition and code generation.

### The Feedback Loop
```
Write code → Use AI → Log results → Search logs → Learn patterns → Write better code
```

This is how AI-assisted development works.

---

## Appendix B: Keyboard Shortcuts and Tips

### Shortcuts You'll Use Daily

| Shortcut | What it does |
|----------|-------------|
| `Ctrl+P` | Quick file open (type filename) |
| `Ctrl+Shift+P` | Command palette (search any VS Code feature) |
| `Ctrl+/` | Toggle comment on selected code |
| `Alt+Up/Down` | Move line up/down |
| `Ctrl+D` | Select next occurrence (great for rename) |
| `Ctrl+Shift+L` | Select all occurrences |
| `F5` | Run your Python file |
| `Ctrl+`` | Open/close terminal |
| `Ctrl+Shift+I` | Open Copilot Chat |
| `Ctrl+Shift+V` | Open Markdown preview |

### Best Practices

#### Copilot Tips
- Write clear function names: `validate_medication_dosage` not `func1`
- Add comments explaining what you want
- Copilot reads context and makes better suggestions
- If suggestion sucks, press Escape and try again

#### Claude Chat Tips
- Paste your code AND the error message
- Ask "why" questions - Claude excels at explaining
- Use Claude for architecture, Copilot for implementation
- Always log Claude's responses

#### PromptTracking Tips
- Log immediately after getting an AI response (don't wait)
- Include context in your notes: `logt "Bug found: interactions list empty from CSV"`
- Search your logs regularly: `Select-String "interaction" .\PromptTracking\*.md`

#### Healthcare Data Safety
- Never paste real patient data into Copilot or Claude
- Use fake/sample data for testing
- Keep sensitive data local
- Your ProjectTracking logs are local and private

### Terminal in VS Code

You don't need to switch to PowerShell:
- Press `Ctrl+`` to open the terminal inside VS Code
- It's the same PowerShell you know
- Use it for pip installs, running scripts, loading PromptTracking

---

## Appendix C: Troubleshooting

### "Python not recognized in terminal"
```powershell
# Check if Python is in PATH
python --version

# If not, reinstall Python and check "Add Python to PATH"
```

### "Virtual environment won't activate"
```powershell
# Make sure you're in the right directory
pwd  # Should show your project folder

# If activation fails:
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# Then try: .\venv\Scripts\Activate.ps1
```

### "Copilot suggestions not showing"
- Make sure GitHub Copilot extension is installed
- Make sure you're signed in (top-right corner shows your GitHub avatar)
- Sometimes it needs a reload: `Ctrl+Shift+P` → "Reload Window"

### "My code runs but has yellow squiggles"
- That's Pylint warning you about style issues
- They're not errors, just suggestions
- You can ignore them if your code works

### "Can't find my Python venv"
```powershell
# You should always activate it first
.\venv\Scripts\Activate.ps1
# Then your Python is from that venv
```

### "PromptTracking commands not working"
```powershell
# Make sure you've loaded it in this PowerShell session
. .\PromptTracking\load-session-logging.ps1

# Check that you have the right path
pwd  # Should show your project folder
dir PromptTracking  # Should show the folder exists
```

### "Claude not available in Copilot Chat"
- Make sure Copilot Chat extension is installed
- Reload VS Code: `Ctrl+Shift+P` → "Reload Window"
- Check that you have Copilot subscription active
- Check the model dropdown - click to see available models

---

## Appendix D: Resources and Communities

### Official Documentation
- [VS Code Docs](https://code.visualstudio.com/docs)
- [Python in VS Code](https://code.visualstudio.com/docs/languages/python)
- [GitHub Copilot Docs](https://docs.github.com/en/copilot)
- [PowerShell Docs](https://learn.microsoft.com/en-us/powershell/)

### Your Tools
- **Perplexity** - [https://perplexity.ai](https://perplexity.ai) - Use for AI research questions
- **Claude** - [https://claude.ai](https://claude.ai) - Deep reasoning and explanations
- **GitHub Copilot** - Inside VS Code - Code suggestions while you type
- **ProjectTracking** - [https://github.com/bizcad/PromptTracking](https://github.com/bizcad/PromptTracking) - Your session logger

### Communities
- VS Code Discord
- Python Discord
- GitHub Discussions (for Copilot questions)
- Reddit: r/learnprogramming, r/Python, r/healthtech

### Bookmark These

```
Personal bookmarks to keep handy:
- Perplexity: https://perplexity.ai
- Claude: https://claude.ai
- GitHub: https://github.com
- Python: https://docs.python.org/3/
- Your project: C:\repos\MedicalProject
```

---

## Final Words

You've got everything you need. The learning curve is real but gentle - give yourself permission to fumble for a week, then it clicks.

When you get stuck:
1. Google the error (seriously, Google)
2. Ask Copilot inline: `Ctrl+Space`
3. Ask Claude in Copilot Chat: `Ctrl+Shift+I`
4. Log what you learned in ProjectTracking

And please - send feedback on this guide. If something is confusing or you found a better way, let me know.

You're going to build cool stuff. Let's go! 🚀

---

**Created for healthcare AI research. Happy coding!**
