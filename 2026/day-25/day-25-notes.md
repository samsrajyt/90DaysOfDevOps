## 1. GitFlow Components
**GitFlow is the most complex because it uses "long-lived" and "short-lived" branches for specific duties.**

**Main (Master)**: *The source of truth. Every commit here is production-ready and usually tagged with a version number (e.g., v1.0).*

**Develop**: *The integration branch for features. This is where the "current state" of the next release lives.*

**Feature Branches**: *These branch off from develop. Developers work on a specific task here and merge it back into develop when finished.*

**Release Branches**: **When develop has enough features for a release, you sprout a release branch. Only bug fixes and documentation happen here—no new features. Once stable, it merges into both main and develop.*

**Hotfix Branches**: *The "Emergency Room." If a bug is found in production (main), you branch directly from main, fix it, and merge it back into both main and develop immediately.*



```
[main]         [develop]       [feature]       [release]       [hotfix]
   |               |               |               |               |
   ● <-------------o (git checkout -b develop)     |               |
   |               |               |               |               |
   |               ● <-------------o (git checkout -b feature/login)
   |               |               |               |               |
   |               |               ● (Commit)      |               |
   |               |               |               |               |
   |               |               ● (Complete)    |               |
   |               |              /                |               |
   |               ● <-----------/ (git merge --no-ff feature/login)
   |               |                               |               |
   |               |               [release/1.0] --/ (git checkout -b release/1.0)
   |               |               |               |               |
   |               |               |               ● (Bug Fix)     |               
   |               |               |               |               |
   |               ● <-----------------------------o (Merge to develop)
   |              /                |               |               |
   ● <-----------/ (Merge to main & tag v1.0)      |               |
   |                                                               |
   |               [hotfix/1.0.1] ---------------------------------/ (git checkout -b hotfix/1.0.1 main)
   |               |                               |               |
   |               |                               |               ● (Emergency Fix)
   |               |                              /                |
   ● <-------------------------------------------/ (Merge to main) |
   |              /                                                |
   ● <-----------/ (Merge to develop)                              |
   |
   ▼
(Ready for next cycle)
```

• When to use: Large projects with scheduled release cycles and multiple versions in production.

• Pros: Organized, clear structure for releases, separates work-in-progress from stable code.

• Cons: Complex, slow, involves many merges, can lead to merge conflicts.

## 2. GitHub Flow Components
**GitHub Flow simplifies things by removing the "Develop" and "Release" layers.**

**Main:** *Just like GitFlow, this is production-ready code. However, in GitHub Flow, main is updated much more frequently.*

**Feature/Topic Branches:** *Anything that isn't a quick fix gets its own descriptive branch (e.g., add-login-button).*

**Pull Requests (PRs):** *This is a critical "component" of the strategy. It’s the gatekeeper where code is reviewed, discussed, and tested before it touches main.*

**Merge/Deploy:** *Once the PR is approved, it’s merged into main and usually deployed to production immediately.*

```
[ START ]
    |
    ▼
[ Main Branch ]
    |
    +-- (Feature Branch A)
    |      |
    |      ▼
    |   [ Pull Request & Review ]
    |      |
    + <----+ (Merge)
    |
    ▼
[ Main Branch ] (Deployed)

```

• When to use: Web applications, Continuous Delivery (CD), and smaller teams.

• Pros: Simple, fast, encourages feedback, easy to maintain.

• Cons: `Main` can become unstable if testing is weak; not ideal for managing multiple versions.

## 3. Trunk-Based Development Components
**This strategy focuses on the "Trunk" to avoid the pain of long-lived branches.**

**The Trunk (Main):** _The central line where all developers merge their code. The goal is to keep the trunk in a "green" (passing all tests) state at all times._

**Short-lived Feature Branches:** _These usually last no more than a few hours or a day. If a feature takes longer, it is still merged into the trunk, but hidden behind a Feature Flag._

**Feature Flags (Toggles):** _A crucial technical component. It allows you to merge "unfinished" code into the trunk without it being visible to users. You simply "turn on" the feature once the code is fully ready._

**Automated CI/CD:** _Since everyone is committing to the same line, you need a robust "Component" of automated testing that runs every time someone pushes code to ensure nothing breaks._


```
       [ THE TRUNK ]
             |
Developer 1  ● (Merge)
             |
Developer 2  ● (Merge)
             |
Developer 3  ● (Merge)
             |
             ▼
      [ Continuous CI/CD ]

```
• When to use: High-performing DevOps teams, CI/CD environments.

• Pros: Maximum speed, reduces merge conflicts, encourages modular code.

• Cons: Requires high senior expertise, automated testing must be perfect, can be stressful for juniors.




### Which strategy would you use for a startup shipping fast?
    **Trunk Based**
### Which strategy would you use for a large team with scheduled releases?
    **Git Flow**
### Which one does your favorite open-source project use? (check any repo on GitHub)
    **Github Flow**
---
### Task 5: Git Commands Reference Update


