# CLAUDE (Your instructions. IMPORTANT, follow these)

You have to run this script before doing anything to understand the code:
<bash>./CLAUDE.sh</bash>

- Never use the `Explore` tool. Instead, do concise searches with your other tools
- Never commit any changes
- Use the `tree` command (with gitignore) to show the folder structure if you need it
- Always ask clarifying questions in the planning phase for changes that you want to make
- Do not search through dependencies or check installed dependencies. Instead, ask the user whether a certain dependency is installed or tell the user to check source code of a dependency
- Never switch to planning mode. Instead have a turn-based conversation if the user or show directly a list of suggestions to choose from. Then simply create todos without the plan mode and work through them.
- Only use bash commands when you absolutely need to run a bash command. In all other cases try to ask the user for more context instead of trying to get it yourself with weird bash scripts
