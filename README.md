# clasp-helpers

Helper scripts to manage Google Apps Script projects across multiple version / environments.

## Background

All critical code projects (including Apps Script) should maintain separate environments or versions to enable developers to test fixes and enhancements in an environment that does not risk the integrity of the production application. In Google Apps Script, this generally takes the form of a separate Apps Script project / template where changes can be tested.

These scripts help automate replication of code across multiple projects.

_NOTE:_ These scripts only replicate source code for the project. Authorization, triggers, and properties must be replicated manually.

## Profile Switching

Projects often require the use of multiple accounts for development across different workspace organizations or user accounts. Login and logout is inefficient. Helper scripts allow easy switching between `clasprc` files for different account profiles.

```
├── ~/
│   ├── .clasprc/
│   │   ├── domain1.clasprc.json
│   │   ├── domain2.clasprc.json
```

- `clasp_profile [profile]` - updates primary ~/.clasprc.json file

## Project Setup

Requires the use of clasp and standard structure of `.clasp.json` files for each script version. Additionally supports multiple `appsscript.json` files to support different dependencies / libraries across environments.

```
├── src/
│   ├── clasp/
│   │   ├── .dev.clasp.json
│   │   ├── .prod.clasp.json
│   │   ├── .*.clasp.json
│   │   ├── dev.appsscript.json
│   │   ├── prod.appsscript.json
│   │   ├── *.appsscript.json
│   ├── Code.js
│   ├── appsscript.json
```

## Usage

Run by direct reference to file, or include in rc / profile file

_Example:_

- File Location: `~/.my_funcs/clasp_helpers.sh`
- `.zshrc` file (or `.bashrc`):

  ```shell
  # Other env setups...

  # Load functions into shell
  source ~/.my_funcs/clasp_helpers.sh
  ```

## Available Functions

- `clasp_pull [env]` - updates environment files and runs `clasp pull`
- `clasp_push [env]` - updates environment files and runs `clasp push`
- `clasp_env [env]` - updates environment files only

## Example Workflow

1. Developer makes fix/enhancement to `dev` Apps Script project
2. Developer runs `clasp_pull dev` to pull latest changes from dev script
3. Developer commits changes to working branch, pushes to remote repository, completes code review and merges to main branch
4. Developer checks out main branch and pulls latest changes
5. Developer runs `clasp_push prod` to push reviewed, merged changes to `prod` Apps Script project
