### FastAPI

Always create new features by creating a new folder in the `/features` folder. Each feature usually has:

- feature_controller.py
- feature_repository.py
- feature_schema.py
- feature_service.py

The controller has a router which has to be imported and used in main.py.

#### DB

Always create a folder called `migrations` that includes numbered SQL files. They are tracked in a migrations table and run through in order on backend startup or on command. Changes to the DB always go through this migration.
