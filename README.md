# clasp-helpers

Helper scripts to manage Google Apps Script projects across multiple version / environments.

## Background
All critical code projects (including Apps Script) should maintain separate environments or versions to enable developers to test fixes and enhancements in an environment that does not risk the integrity of the production application. In Google Apps Script, this generally takes the form of a separate Apps Script project / template where changes can be tested.

These scripts help automate replication of code across multiple projects.

_NOTE:_ These scripts only replicate source code for the project. Authorization, triggers, and properties must be replicated manually.

## Setup
Requires the use of clasp and standard structure of `.clasp.json` files for each script version.

```
├── src/
│   ├── clasp/
│   │   ├── .dev.clasp.json
│   │   ├── .prod.clasp.json
│   │   ├── .*.clasp.json
│   ├── Code.js
│   ├── appsscript.json
```

Usage: Run by direct reference to file, or include in rc / profile file

_Example:_
- File Location: `~/.my_funcs/clasp_helpers.sh`
- `.zshrc` file (or `.bashrc`):
  ```shell
  # Other env setups...

  # Load functions into shell
  source ~/.my_funcs/clasp_helpers.sh
  ```
