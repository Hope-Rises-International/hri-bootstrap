#!/bin/zsh
#
# HRI Claude Code — STEP 1 of 3: minimal install (public, no secrets)
#
# This installs only what you need to launch Nimbalyst and sign in to GitHub.
# The rest of the setup (Google, Salesforce/Drive access, deploy tools, your
# memory, and the connection tests) happens INSIDE Nimbalyst in Step 3.
#
# Run it with:
#   curl -fsSL https://raw.githubusercontent.com/Hope-Rises-International/hri-bootstrap/main/install.sh -o /tmp/hri.sh && zsh /tmp/hri.sh
#
set -e
WORKDIR="$HOME/claude-work"
if [[ -d /opt/homebrew ]]; then BREW="/opt/homebrew"; else BREW="/usr/local"; fi

echo "================================================"
echo "  HRI Claude Code — Step 1 of 3 (minimal install)"
echo "================================================"

# 1. Homebrew (package manager)
if ! command -v brew >/dev/null 2>&1; then
  echo "Installing Homebrew (it may ask for your Mac password)..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$('"$BREW"'/bin/brew shellenv)"' >> "$HOME/.zprofile"
fi
eval "$("$BREW"/bin/brew shellenv)"

# 2. Core tools: Node, GitHub CLI, Claude Code
brew install node gh || true
npm install -g @anthropic-ai/claude-code

# 3. GitHub sign-in (a browser will open)
if ! gh auth status >/dev/null 2>&1; then
  echo ""
  echo ">> A browser will open. Choose:  GitHub.com  ->  HTTPS  ->  Login with a web browser."
  gh auth login --hostname github.com --git-protocol https --web
fi

# Confirm org membership (informational)
if gh api /user/orgs --jq '.[].login' 2>/dev/null | grep -qi "Hope-Rises-International"; then
  echo "GitHub: signed in as $(gh api /user --jq .login), member of Hope-Rises-International."
else
  echo "!! You are not yet showing as a member of Hope-Rises-International."
  echo "   Accept the org invite in your email, then you're fine to continue."
fi

mkdir -p "$WORKDIR"

echo ""
echo "================================================"
echo "  Step 1 complete."
echo ""
echo "  NEXT:"
echo "   2) Install Nimbalyst:  https://nimbalyst.com/download/"
echo "      - Open the download, drag Nimbalyst into Applications."
echo "      - Launch it, sign in with your HRI Claude account."
echo "      - File -> Open Folder -> $WORKDIR"
echo ""
echo "   3) In Nimbalyst, open a new Claude session and paste the"
echo "      'Step 3' instruction Bill gave you. Claude finishes the setup."
echo "================================================"
