## Challenge Tasks

### Task 1: Key-Value Pairs
Create `person.yaml` that describes yourself with:
- `name`
- `role`
- `experience_years`
- `learning` (a boolean)

**Verify:** Run `cat person.yaml` — does it look clean? No tabs?

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-38/images/Screenshot%202026-03-27%20171404.png)



---

### Task 2: Lists
Add to `person.yaml`:
- `tools` — a list of 5 DevOps tools you know or are learning
- `hobbies` — a list using the inline format `[item1, item2]`

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-38/images/Screenshot%202026-03-27%20171651.png)


Write in your notes: What are the two ways to write a list in YAML?

1. Using `-`
2. Using the inline format `[item1, item2]`

---

### Task 3: Nested Objects
Create `server.yaml` that describes a server:
- `server` with nested keys: `name`, `ip`, `port`
- `database` with nested keys: `host`, `name`, `credentials` (nested further: `user`, `password`)

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-38/images/Screenshot%202026-03-27%20173449.png)

**Verify:** Try adding a tab instead of spaces — what happens when you validate it?
When adding tab ,it is resulting in two spaces and when i validated in yamllint its in the correct format .

---

### Task 4: Multi-line Strings
In `server.yaml`, add a `startup_script` field using:
1. The `|` block style (preserves newlines)
2. The `>` fold style (folds into one line)


![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-38/images/Screenshot%202026-03-27%20193445.png)

Write in your notes: When would you use `|` vs `>`?

* `|` Block style - this style can be used when you want to use specific commands or shell scripts which needs the line breaks and new lines 

  - **Best for:** Keeping original formatting, including line breaks and blank lines, without any changes.

* `>` fold style - this style can be used when you want to use comments or want to use queries that can written in multiple lines for better readability , YAML will consider this multiple line as a single line.

  - **Best for:** Long descriptions where text should wrap as a continuous line while keeping paragraph breaks.

---

### Task 5: Validate Your YAML
1. Install `yamllint` or use an online validator
2. Validate both your YAML files


![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-38/images/Screenshot%202026-03-27%20194003.png)

3. Intentionally break the indentation — what error do you get?

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-38/images/Screenshot%202026-03-27%20194925.png)

4. Fix it and validate again

![](https://github.com/samsrajyt/90DaysOfDevOps/blob/master/2026/day-38/images/Screenshot%202026-03-27%20194614.png)

---

### Task 6: Spot the Difference
Read both blocks and write what's wrong with the second one:

```yaml
# Block 1 - correct
name: devops
tools:
  - docker
  - kubernetes
```

```yaml
# Block 2 - broken
name: devops
tools:
- docker
  - kubernetes
```

---

**In Block 2 the indentation is not correct .**
