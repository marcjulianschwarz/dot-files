## Python Rules

- Make types as strict as possible, do not use `Any` and never use comments to disable type checking rules
- Use `make lint` to check for type and lint errors
- Use the patterns of Facade, Factory and Dependency Injection
- Always type `dict` types strictly by giving key and value types
- Always use `|` for union types, `| None = None` for optional types and `list[x]` for list types
- Always catch return values if they exist with `_ = fn()` if you don't want to use the value but still want to call the function
- Run tests with `make test` when asked by the user
- Use `uv add` to add new dependencies
