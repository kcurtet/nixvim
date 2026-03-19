# Nix CI Templates

Reusable CI workflow templates for Nix-based projects.

## Templates

| Template | Description | When to use |
|----------|-------------|---------------|
| `nix-ci.yml` | Full-featured CI with matrix builds, Cachix, optional jobs | Most projects, need multi-system support |
| `nix-ci-minimal.yml` | Single-system, minimal checks | Small projects, quick feedback |

## Quick Start

### 1. Copy template to your project

```bash
# Full template
cp templates/nix-ci.yml .github/workflows/ci.yml

# Or minimal template
cp templates/nix-ci-minimal.yml .github/workflows/ci.yml
```

### 2. Customize for your project

Edit `.github/workflows/ci.yml`:

- **Triggers**: Adjust `on.push.branches` and `on.pull_request.branches`
- **Matrix**: Enable/disable systems in `jobs.build.matrix.include`
- **Commands**: Adapt run steps to your project (tests, linting, etc.)

### 3. (Optional) Enable Cachix caching

1. Create a cache at https://cachix.org
2. Add `CACHIX_AUTH_TOKEN` to your GitHub repository secrets
3. Change `skipPush: true` → `skipPush: false`
4. Replace `mycache` with your cache name

### 4. Commit and push

```bash
git add .github/workflows/ci.yml
git commit -m "ci: add GitHub Actions workflow"
git push
```

## Common Adaptations

### Python project (uv + pytest)

```yaml
- name: Run tests
  run: |
    nix develop --command uv run pytest

- name: Type check
  run: |
    nix develop --command uv run mypy src/
```

### Rust project (cargo test)

```yaml
- name: Run tests
  run: |
    nix develop --command cargo test

- name: Clippy
  run: |
    nix develop --command cargo clippy
```

### Nix package (multi-attr)

```yaml
- name: Build all packages
  run: |
    for attr in $(nix flake show --json | jq -r '.packages."x86_64-linux" | keys[]'); do
      nix build .#packages.x86_64-linux.$attr
    done
```

### Run flake checks

```yaml
- name: Run checks
  run: |
    nix build .#checks.x86_64-linux.unit-tests
    nix build .#checks.x86_64-linux.lint
```

## Troubleshooting

### CI fails with "unrecognised flag"

Make sure you're using `run:` steps, not `workflow/nix-shell-action` which can have compatibility issues.

### Node.js 20 deprecation warning

Add this env variable:
```yaml
env:
  FORCE_JAVASCRIPT_ACTIONS_TO_NODE24: true
```

### Slow builds

Enable Cachix caching (see section 3 above) to cache Nix store across CI runs.

### Tests pass locally but fail in CI

Ensure your tests don't rely on:
- Local environment variables
- Specific file paths (use relative paths)
- Network resources not available in CI

## Resources

- [Nix flake reference](https://nixos.wiki/wiki/Flakes)
- [Cachix documentation](https://cachix.org)
- [GitHub Actions Nix install action](https://github.com/cachix/install-nix-action)
- [GitHub Actions Cachix action](https://github.com/cachix/cachix-action)
