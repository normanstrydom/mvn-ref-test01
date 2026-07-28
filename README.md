# mvn-ref-test01

##  Code setup

### Local development - Initial project setup

This is the initial code generation for subsequent work and testing.

Do not generate unit tests - main code and functions only.

*   JAVA_HOME=F:\java\openlogic-openjdk-17.0.18+8-windows-x64
*   MVN_HOME=F:\java\apache-maven-3.9.13
*   2 maven projects
    *   mvn-ref-test01 - location F:\git-work\mvn-ref-test01
    *   mvn-ref-test02 - location F:\git-work\mvn-ref-test02
*   mvn-ref-test01 - a library project consisting of parent project and submodules,
    *   mathfcns
    *   stringfcns
    *   bom for importing by projects using mvn-ref-test01
*   mvn-ref-test02 - a console application that references mvn-ref-test01
*   package names - com.devtest.test01 and com.devtest.test02
*   create project poms, required sub-modules and sample soucrce

### Current release process

In our current environment we use maven's release when doing production releases.  The release creates a tag where the ersion number has SNAPSHOT replaced with Final and the Final tag is built for the released artifect.  After the creation of the Final released artifact, the branch's version numbers are incrimented and pushed back to the branch.  After successful deployment, the released branch with the incrimented version number (SNAPSHOT) is pulled into master and subsequently into the development branch. We then update our working branches from development.

A similar process is needed where we use github's actions.  Add section for proposed process using github actions to this readme.md.

### Proposed GitHub Actions release process

Goal: reproduce the current Maven release flow (create a Final release artifact, tag the repo, then bump branch versions to the next SNAPSHOT) using GitHub Actions while keeping manual control and auditability.

Summary of the proposed flow:

- **CI workflow** (`.github/workflows/ci.yml`): runs on PRs and branch pushes, builds the project (`mvn clean package`), and validates the repository. This ensures a clean build before any release.
- **Release workflow** (`.github/workflows/release.yml`): triggered manually (`workflow_dispatch`) or on a protected release branch. The release workflow performs the controlled steps below.

Release workflow steps (recommended):

1. Checkout code and set GitHub Action inputs (`releaseVersion`, `nextSnapshotVersion`, optional `sign`/`deploy`).
2. Set up JDK and Maven using the official actions (`actions/setup-java`) and configure credentials.
3. Option A (Maven Release plugin): run `mvn -B release:prepare release:perform` with the supplied release version — this creates the tag, builds the released artifact and performs the deploy (if credentials available).
     - OR -
     Option B (explicit steps):
     - `mvn -B versions:set -DnewVersion=${{ inputs.releaseVersion }}`
     - `mvn -B clean deploy` (or `package` + attach/upload artifacts)
     - `git tag -a v${{ inputs.releaseVersion }} -m "Release ${{ inputs.releaseVersion }}"` and push the tag
     - `mvn -B versions:set -DnewVersion=${{ inputs.nextSnapshotVersion }}-SNAPSHOT && git commit -am "Bump to ${ { inputs.nextSnapshotVersion } }-SNAPSHOT" && git push`
4. Create a GitHub Release via `actions/create-release` (optional) and attach artifacts.

Secrets and credentials:

- Use `GITHUB_TOKEN` for tagging and pushing when permitted. If your repo policy prevents that, use a deploy key or bot account token stored in `secrets.REPO_WRITE_TOKEN`.
- For deploying to a Maven repository, provide `MAVEN_USERNAME`, `MAVEN_PASSWORD` or a base64 `settings.xml` file in `secrets.MAVEN_SETTINGS_XML` and write it to `~/.m2/settings.xml` during the workflow.
- If artifacts are GPG-signed, provide the GPG key and passphrase in secrets and import them in the workflow before `mvn deploy`.

Governance and safety:

- Run the release workflow as `workflow_dispatch` requiring environment protection and required reviewers if you need manual approvals.
- Optionally require the CI workflow to pass before the Release workflow can be executed.

Example minimal `release.yml` inputs (pseudo):

```yaml
on:
    workflow_dispatch:
        inputs:
            releaseVersion:
                description: 'Release version (no SNAPSHOT)'
                required: true
            nextSnapshotVersion:
                description: 'Next development snapshot (without -SNAPSHOT)'
                required: true
jobs:
    release:
        runs-on: ubuntu-latest
        steps:
            - uses: actions/checkout@v4
            - uses: actions/setup-java@v4
                with:
                    distribution: 'temurin'
                    java-version: '17'
            - name: Run release steps
                run: |
                    mvn -B versions:set -DnewVersion=${{ inputs.releaseVersion }}
                    mvn -B clean deploy
                    git tag -a v${{ inputs.releaseVersion }} -m "Release ${{ inputs.releaseVersion }}"
                    git push origin --tags
                    mvn -B versions:set -DnewVersion=${{ inputs.nextSnapshotVersion }}-SNAPSHOT
                    git commit -am "Bump to ${{ inputs.nextSnapshotVersion }}-SNAPSHOT"
                    git push
```

Next steps I can take:

- Create example workflow files under `.github/workflows/` (`ci.yml`, `release.yml`) and a `docs/release.md` with detailed instructions and required secrets.  Would you like me to create the workflows now?

 