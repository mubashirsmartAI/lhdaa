# Removing Secrets from Git History

## Problem
GitHub detected secrets in your repository:
1. Google Cloud Service Account credentials in:
   - `public/firebase/firebase_credentials.json`
   - `public/voltaic-e59be-c73103aa2b73.json`
2. Twilio Account SID (likely in SQL dump files)

## Solution Steps

### Option 1: Remove Files from History (Recommended)

Run these commands to remove the files from all commits:

```bash
# Remove Firebase credentials from all commits
git filter-branch --force --index-filter "git rm --cached --ignore-unmatch public/firebase/firebase_credentials.json" --prune-empty --tag-name-filter cat -- --all

# Remove Voltaic credentials from all commits
git filter-branch --force --index-filter "git rm --cached --ignore-unmatch public/voltaic-e59be-c73103aa2b73.json" --prune-empty --tag-name-filter cat -- --all

# Clean up backup refs
git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d

# Force garbage collection
git reflog expire --expire=now --all
git gc --prune=now --aggressive
```

### Option 2: Use BFG Repo-Cleaner (Faster, but requires Java)

1. Download BFG: https://rtyley.github.io/bfg-repo-cleaner/
2. Run:
```bash
java -jar bfg.jar --delete-files firebase_credentials.json
java -jar bfg.jar --delete-files voltaic-e59be-c73103aa2b73.json
git reflog expire --expire=now --all && git gc --prune=now --aggressive
```

### Option 3: Use GitHub's Secret Scanning Unblock (Quick Fix)

If you need to push immediately, you can temporarily allow the secrets:
1. Visit: https://github.com/mubashirsmartAI/lhdaa/security/secret-scanning/unblock-secret/36Eokcst6FXFWmepyqM9cEGunk1
2. Visit: https://github.com/mubashirsmartAI/lhdaa/security/secret-scanning/unblock-secret/36EokeBvkejAcBjbINbJNYLxfTH
3. Click "Allow secret" (but this is NOT recommended for security)

### After Removing from History

```bash
# Force push (WARNING: This rewrites remote history)
git push origin --force --all
git push origin --force --tags
```

## Important Notes

⚠️ **WARNING**: 
- Force pushing rewrites history and can break things for collaborators
- If others have cloned the repo, they'll need to re-clone
- Consider creating a new branch or repository if this is too risky
- **Rotate/revoke the exposed secrets immediately** - they're compromised!

## Next Steps

1. **Rotate all exposed credentials:**
   - Generate new Google Cloud Service Account keys
   - Generate new Twilio Account SID and Auth Token
   - Update your `.env` file and any configuration

2. **Verify secrets are removed:**
   ```bash
   git log --all --full-history -- public/firebase/firebase_credentials.json
   git log --all --full-history -- public/voltaic-e59be-c73103aa2b73.json
   ```

3. **Ensure .gitignore is updated** (already done)

