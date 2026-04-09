## Challenge Tasks

### Task 1: Understand `workflow_call`
Before writing any code, research and answer in your notes:
1. What is a **reusable workflow**?
- a single YAML file that can be called by other workflows, allowing you to centralize common processes like CI/CD, eliminate redundant code, and enforce best practices across multiple repositories or projects
2. What is the `workflow_call` trigger?
- A trigger which starts the pipeline when called from another workflow.It tells GitHub this file is "callable.
  
3. How is calling a reusable workflow different from using a regular action (`uses:`)?
   - Actions: Usually perform a single discrete task (e.g., uploading an artifact).
   - Reusable Workflows: Can orchestrate an entire deployment process across different environments.

4. Where must a reusable workflow file live?
-  .github/workflows
---

### Task 2: Create Your First Reusable Workflow
Create `.github/workflows/reusable-build.yml`:
1. Set the trigger to `workflow_call`
2. Add an `inputs:` section with:
   - `app_name` (string, required)
   - `environment` (string, required, default: `staging`)
3. Add a `secrets:` section with:
   - `docker_token` (required)
4. Create a job that:
   - Checks out the code
   - Prints `Building <app_name> for <environment>`
   - Prints `Docker token is set: true` (never print the actual secret)

**Verify:** This file alone won't run — it needs a caller. That's next.

---

### Task 3: Create a Caller Workflow
Create `.github/workflows/call-build.yml`:
1. Trigger on push to `main`
2. Add a job that uses your reusable workflow:
   ```yaml
   jobs:
     build:
       uses: ./.github/workflows/reusable-build.yml
       with:
         app_name: "my-web-app"
         environment: "production"
       secrets:
         docker_token: ${{ secrets.DOCKER_TOKEN }}
   ```
3. Push to `main` and watch it run

**Verify:** In the Actions tab, do you see the caller triggering the reusable workflow? Click into the job — can you see the inputs printed?
  * **Yes iam able to see the inputs printed.**

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-46/images/Screenshot%202026-04-03%20015430.png)
---

### Task 4: Add Outputs to the Reusable Workflow
Extend `reusable-build.yml`:
1. Add an `outputs:` section that exposes a `build_version` value
2. Inside the job, generate a version string (e.g., `v1.0-<short-sha>`) and set it as output
3. In your caller workflow, add a second job that:
   - Depends on the build job (`needs:`)
   - Reads and prints the `build_version` output
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-46/images/Screenshot%202026-04-03%20170713.png)


**Verify:** Does the second job print the version from the reusable workflow?

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-46/images/Screenshot%202026-04-03%20170728.png)

---

### Task 5: Create a Composite Action
Create a **custom composite action** in your repo at `.github/actions/setup-and-greet/action.yml`:
1. Define inputs: `name` and `language` (default: `en`)
2. Add steps that:
   - Print a greeting in the specified language
   - Print the current date and runner OS
   - Set an output called `greeted` with value `true`
3. Use the composite action in a new workflow with `uses: ./.github/actions/setup-and-greet`

**Verify:** Does your custom action run and print the greeting?

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-46/images/Screenshot%202026-04-06%20175433.png)

---

### Task 6: Reusable Workflow vs Composite Action
Fill this in your notes:

| | Reusable Workflow | Composite Action |
|---|---|---|
| Triggered by | `workflow_call` | `uses:` in a step |
| Can contain jobs? | Yes  | No |
| Can contain multiple steps? | Yes | Yes |
| Lives where? | .github/workflows | /.github/actions/name/action.yml |
| Can accept secrets directly? | Yes(Inherited or explicitly passed)  | Yes(Partially (Passed as inputs/env, not a secrets: block)) |
| Best for | Standardizing entire CI/CD pipelines across multiple repos. | Wrapping repeated sequences of steps into a single, clean command. |
| Runner Context | Can define its own runs-on | Inherits the runner from the caller's job |
---
