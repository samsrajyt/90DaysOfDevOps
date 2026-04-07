

## Challenge Tasks

### Task 1: Pull Request Event Types
Create `.github/workflows/pr-lifecycle.yml` that triggers on `pull_request` with **specific activity types**:
1. Trigger on: `opened`, `synchronize`, `reopened`, `closed`
2. Add steps that:
   - Print which event type fired: `${{ github.event.action }}`
   - Print the PR title: `${{ github.event.pull_request.title }}`
   - Print the PR author: `${{ github.event.pull_request.user.login }}`
   - Print the source branch and target branch
3. Add a conditional step that only runs when the PR is **merged** (closed + merged = true)

Test it: create a PR, push an update to it, then merge it. Watch the workflow fire each time with a different event type.

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-47/images/Screenshot%202026-04-06%20193403.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-47/images/Screenshot%202026-04-06%20193537.png)

---

### Task 2: PR Validation Workflow
Create `.github/workflows/pr-checks.yml` — a real-world PR gate:
1. Trigger on `pull_request` to `main`
2. Add a job `file-size-check` that:
   - Checks out the code
   - Fails if any file in the PR is larger than 1 MB
3. Add a job `branch-name-check` that:
   - Reads the branch name from `${{ github.head_ref }}`
   - Fails if it doesn't follow the pattern `feature/*`, `fix/*`, or `docs/*`
4. Add a job `pr-body-check` that:
   - Reads the PR body: `${{ github.event.pull_request.body }}`
   - Warns (but doesn't fail) if the PR description is empty

**Verify:** Open a PR from a badly named branch — does the check fail?
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-47/images/Screenshot%202026-04-07%20012132.png)



---

### Task 3: Scheduled Workflows (Cron Deep Dive)
Create `.github/workflows/scheduled-tasks.yml`:
1. Add a `schedule` trigger with cron: `'30 2 * * 1'` (every Monday at 2:30 AM UTC)
2. Add **another** cron entry: `'0 */6 * * *'` (every 6 hours)
3. In the job, print which schedule triggered using `${{ github.event.schedule }}`
4. Add a step that acts as a **health check** — curl a URL and check the response code

**Important:** Also add `workflow_dispatch` so you can test it manually without waiting for the schedule.

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-47/images/Screenshot%202026-04-07%20143008.png)

Write in your notes:
- The cron expression for: every weekday at 9 AM IST
  0 3 * * 1-5
- The cron expression for: first day of every month at midnight
  0 0 1 * *
- Why GitHub says scheduled workflows may be delayed or skipped on inactive repos
  Scheduled workflows run on shared runners , sometimes be delayed by high traffic on the platform.
  GitHub may delay/skip schedules on inactive repositories to save resources.
  
---

### Task 4: Path & Branch Filters
Create `.github/workflows/smart-triggers.yml`:
1. Trigger on push but **only** when files in `src/` or `app/` change:
   ```yaml
   on:
     push:
       paths:
         - 'src/**'
         - 'app/**'
   ```
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-47/images/Screenshot%202026-04-07%20150826.png)

   
2. Add `paths-ignore` in a second workflow that skips runs when only docs change:
   ```yaml
   paths-ignore:
     - '*.md'
     - 'docs/**'
   ```
3. Add branch filters to only trigger on `main` and `release/*` branches
4. Test it: push a change to a `.md` file — does the workflow skip?
![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-47/images/Screenshot%202026-04-07%20150334.png)


Write in your notes: When would you use `paths` vs `paths-ignore`?

   - Use `paths` when you want the workflow to triggered only if specific files or folders change.

   - Use `paths-ignore` when the workflow  to be triggered for all changes except change in certain files like doc or .md files.


---

### Task 5: `workflow_run` — Chain Workflows Together
Create two workflows:
1. `.github/workflows/tests.yml` — runs tests on every push
2. `.github/workflows/deploy-after-tests.yml` — triggers **only after** `tests.yml` completes successfully:
   ```yaml
   on:
     workflow_run:
       workflows: ["Run Tests"]
       types: [completed]
   ```
   ![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-47/images/Screenshot%202026-04-07%20154249.png)
3. In the deploy workflow, add a conditional:
   - Only proceed if the triggering workflow **succeeded** (`${{ github.event.workflow_run.conclusion == 'success' }}`)
   - Print a warning and exit if it failed

    ![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-47/images/Screenshot%202026-04-07%20154215.png)
   
**Verify:** Push a commit — does the test workflow run first, then trigger the deploy workflow?
- Yes.

---

### Task 6: `repository_dispatch` — External Event Triggers
1. Create `.github/workflows/ ` with trigger `repository_dispatch`
2. Set it to respond to event type: `deploy-request`
3. Print the client payload: `${{ github.event.client_payload.environment }}`
4. Trigger it using `curl` or `gh`:
   ```bash
   gh api repos/<owner>/<repo>/dispatches \
     -f event_type=deploy-request \
     -f client_payload='{"environment":"production"}'
   ```

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-47/images/Screenshot%202026-04-07%20161041.png)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-47/images/Screenshot%202026-04-07%20160819.png)

Write in your notes: When would an external system (like a Slack bot or monitoring tool) trigger a pipeline?
Whenever we need an approval from the management to trigger a pipeline which is last step to moving to prodcution.


