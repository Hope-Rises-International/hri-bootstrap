# HRI Claude Code — Bootstrap (Step 1)

This is the public, **secret-free** entry point for setting up a new HRI Claude Code machine. It installs the minimum (Homebrew, Node, GitHub CLI, Claude Code) and signs you in to GitHub. The rest of the setup happens inside Nimbalyst.

## Step 1 — run this one command in Terminal

Open **Terminal** (`Cmd + Space` → type `Terminal` → Enter) and paste:

```
curl -fsSL https://raw.githubusercontent.com/Hope-Rises-International/hri-bootstrap/main/install.sh -o /tmp/hri.sh && zsh /tmp/hri.sh
```

A browser opens for your GitHub sign-in — complete it and come back to Terminal.

## Step 2 — install Nimbalyst

Download from **https://nimbalyst.com/download/**, drag it into Applications, launch it, sign in with your **HRI Claude account**, then **File → Open Folder → `~/claude-work`**.

## Step 3 — finish setup inside Nimbalyst

Open a new Claude session in Nimbalyst and paste the **Step 3 instruction** Bill gives you. Claude Code completes the install (Google sign-in, Drive/Salesforce access, deploy tools, your memory) and runs the connection tests.

---
*Prerequisite: your GitHub account must be a member of `Hope-Rises-International` (Bill sends the invite). Everything sensitive lives in the private onboarding repo, pulled only after you've signed in to GitHub.*
