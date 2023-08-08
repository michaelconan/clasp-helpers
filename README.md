# clasp-helpers

Helper scripts to manage Google Apps Script projects across multiple version / environments.

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
