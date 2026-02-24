## Python Rules

- Make types as strict as possible, do not use `Any` and never user comments to disable type checking rules
- Use `make lint` to check for type and lint errors
- Use the patterns of Facade, Factory and Dependency Injection
- Always type `dict` types strictly by giving key and value types
- Always use `|` for union types, `| None = None` for optional types and `list[x]` for list types
- Always catch return types with `_ = fn()` if you don't want to use the value but still want to call the function

### FastAPI

Always create new features by creating a new folder in the `/features` folder. Each feature usually has:

- feature_controller.py
- feature_repository.py
- feature_schema.py
- feature_service.py

The controller has a router which has to be imported and used in main.py.

### DB

Always create a folder called `migrations` that includes numbered SQL files. They are tracked in a migrations table and run through in order on backend startup or on command. Changes to the DB always go through this migration.
