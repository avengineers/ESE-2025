## A CI Journey

or

Less Pipelines, More Happy Developers!

<hr>

ESE Kongress 2025 in Sindelfingen

![RMT Logo](images/RMT-Logo_TransparentBG.png)

<!-- .element: style="float: left; height: 180px" -->

![Marquardt Logo](images/Marquardt-100-Years-Keyvisual-white-gold.png)

<!-- .element: style="float: right; height: 180px" -->

Note:

Hello everyone and welcome to my talk about CI/CD. Today I'd like to take you on a journey that I started more than 10 years ago. A journey that has led me through many different projects and companies. A journey that taught me that it's not just about automation, but also about the joy of developing software. (Anecdote: Back to the Future)

---

### Who are we?

<div>
<img src="images/karsten.png">

[Karsten](https://www.linkedin.com/in/karnangue/)

</div> <!-- .element: style="float: left; width: 30%" -->

<div>
<img src="images/alexandru.png">

[Alexandru](https://www.maxiniuc.com/)

</div> <!-- .element: style="float: right; width: 30%;" -->

Note:

Okay, so who are we actually?

Alexandru has nearly 20 years of experience in the automotive industry, specializing in safety-critical embedded software for braking systems.

He's passionate about build systems and Software Product Line Engineering.

He currently works as a Senior Platform Engineer in the Rhine-Main Team at Marquardt GmbH.

I myself have been working as a software developer for over 25 years.

From Ada, Embedded C, C++, Perl, Tcl, Python, to developing dev tools and Jenkins pipelines - I've seen and done a lot.

Currently, I work as a Platform Engineer in the Rhine-Main team at Marquardt GmbH.

There it's all about Software Product Lines, internal developer platforms, automation, and CI/CD.

He has extensive experience developing CI methods, tools, and pipelines.

He currently works as a platform architect in the Rhine-Main Team at Marquardt GmbH, focusing on internal development platforms and Software Product Line Engineering.

---

### Where do we come from?

Back to 2005 <!-- .element: class="fragment" data-fragment-index="1" -->

![18 years back](images/back_to_the_past.png) <!-- .element width="50%" class="fragment" data-fragment-index="1" -->

Note:

Where do we actually come from?

_click_

For that, we need to go back a bit into the past, specifically to the year 2005.

That's when I started as a newcomer in the automotive industry.

--

### The Automotive Industry

- Exciting products <!-- .element: class="fragment" -->
- Constantly new requirements <!-- .element: class="fragment" -->
- Well-paid jobs <!-- .element: class="fragment" -->
- Paradise for SW developers <!-- .element: class="fragment" -->

Note:

What was it like back then in the automotive industry?

Actually, pretty much the same as today.

_click_

Exciting products: brake control units, ESP, ABS, ACC, ...

_click_

Constantly new requirements, as many customers want to stand out from the competition.

_click_

The jobs were well paid.

_click_

Actually paradise for SW developers.

--

### The Job

- SW development for brake control units <!-- .element: class="fragment" -->
- Embedded C? We had that at university! <!-- .element: class="fragment" -->
- It's your code, but don't you dare change anything! <!-- .element: class="fragment" -->
- Always remember: don't break the build! <!-- .element: class="fragment" -->
- Nothing is too difficult for an engineer! <!-- .element: class="fragment" -->

Note:

And the job?

_click_

Sure, we're coding Embedded C for brake control units.

_click_

No problem, we had that at university.

_click_

Here came the first damper.

You got responsibility for a part of the code, but ideally you shouldn't change it.

_click_

Why? Don't break the build!

_click_

Sounded difficult, but we had learned at university: Nothing is too difficult for an engineer!

--

### Development Workflow

- No unit tests <!-- .element: class="fragment" -->
- No CI, only nightly builds <!-- .element: class="fragment" -->
- Many integration tests, mainly vehicle trials <!-- .element: class="fragment" -->
- Code reuse across all projects <!-- .element: class="fragment" -->
- Hundreds of developers worldwide working on one codebase in RCS <!-- .element: class="fragment" -->

Note:

The starting point?

_click_

Oops, no unit tests.

Not a single line of test code in the repository.

Sure, where do you test brakes? In the car.

_click_

Well, some SIL and HIL was done.

_click_

But most of it was tested in driving tests.

So many features were tested at some point, somewhere in some project.

Hence the motto: better not change anything.

_click_

But how is that supposed to work when the code is shared across all projects,

all customers come around the corner with new requirements..

_click_

and several hundred developers worldwide are working on one codebase?

--

<!-- .slide: data-visibility="hidden" -->

### The Tools

- MKS / PTC Integrity or "RCS on Steroids" <!-- .element: class="fragment" -->
- GNU Make / MSYS in Java GUI on Windows 2000 <!-- .element: class="fragment" -->
- Build Server on ESX / VMWare <!-- .element: class="fragment" -->
  - Remote Builds <!-- .element: class="fragment" -->
  - Nightly Builds <!-- .element: class="fragment" -->

Note:

- Users could trigger remote builds via GUI
- Nightly builds ran automatically

--

### Continuous What?

![](images/kind_im_brunnen.jpg) <!-- .element: width="40%" class="fragment" data-fragment-index="1" -->

Continuous "Child in the Well" <!-- .element: class="fragment" data-fragment-index="1" -->

Note:

When someone asks me today what Continuous Integration is, I like to remember that time.

About what Continuous Integration is absolutely NOT.

At some point, I came up with a fitting name for the situation back then:

_click_

Continuous "Child in the Well".

What does that mean exactly?

1. Highest quality criterion: SW linkable.
2. Some project is always red (compile or link errors)
3. No test automation
4. No unit tests
5. Developers are evil, they build bugs into the code.

And how did you feel as a developer?

_click_

---

### We need to change something!

But what? <!-- .element: class="fragment" -->

Note:

Well, we need to change something! But what?

_click_

This is where our CI journey really begins.

Namely with the development of our Automotive Software Factory.

The name came later, but there were plenty of ideas.

--

Changes until noon, then bug fixing and vehicle tests

![](images/sad-developer.png) <!-- .element: width="80%"  class="fragment" data-fragment-index="1" -->

Note:

One idea was ...

You can imagine how thrilled the developers were.

_click_

Especially considering the question of what noon means at an international corporation working worldwide.

This idea didn't really work.

What else can you do?

--

### First Goal: Unit Tests

- With our own framework based on CUnit <!-- .element: class="fragment" -->
- Automatic generation of mockups <!-- .element: class="fragment" -->
- XML2Makefile code generation <!-- .element: class="fragment" -->
- Test Driven Development (TDD) <!-- .element: class="fragment" -->
- Nightly tests on Jenkins (and Hudson!) <!-- .element: class="fragment" -->

Note:

Sure, if you don't have unit tests, that's always a good start.

However, it wasn't that easy to make our code testable.

_click_

We built our own framework based on CUnit.

_click_

The automatic generation of mockups was a big success back then.

Writing mockups manually (especially in the era of Autosar) was simply too time-consuming and a major hurdle for developers.

_click_

We tried from the beginning to establish Test Driven Development based on requirements.

_click_

And of course, if you have unit tests, you want to run them automatically.

--

### Continuous Integration sounds nice too.

- Gerrit and Jenkins for tools <!-- .element: class="fragment" -->
- Feature-based testing via commit comments <!-- .element: class="fragment" -->
- SW development still on RCS. <!-- .element: class="fragment" -->
- CI with RCS? Yes, we can! <!-- .element: class="fragment" -->

Note:

Well, we have a Jenkins and some unit tests.

Let's do CI!

_click_

...

--

## No git? <!-- .element: class="r-fit-text" -->

## No mercy! <!-- .element: class="r-fit-text fragment" style="color:red" -->

Note:

What? No Git? You're doing CI with RCS?

_click_

Sorry, but there's no mercy then!

You're on your own!

And that's how it was. We never got away from nightly builds.

Our CI solution ran in parallel to nightly builds.

--

### Our Dream: The Software Factory

![](images/sw-factory.png) <!-- .element height="50%" width="50%" -->

--

### Jenkins School of Witchcraft and Wizardry

![](images/jenkins-magic.png) <!-- .element height="50%" width="50%" -->

Note:

The monster that came out of it was a Jenkins that could do everything.

The Jenkinstein.

Instead of having a unified build system including pipeline, we had a multitude of jobs that were all somehow connected.

We abused Jenkins as a build system, as a test system, as a deployment system, as a monitoring system.

Everything our build system couldn't do, we packed into Jenkins pipelines.

- The crux with Jenkins pipelines
  - Java developers who just want to program Java
  - And then aren't allowed to!
  - Many misunderstandings about what runs where
  - Nobody understands how the pipeline works anymore.
  - Nobody can debug.
  - Nobody can follow it.
  - Anti-pattern of CI.
- 2 Scrum teams were at least 50% occupied with maintenance.
- The "Service Card" was being passed around.

--

### The Infrastructure

- On-premise Jenkins with 500 static VMs <!-- .element: class="fragment" -->
- Micro services for reporting and artifact storage <!-- .element: class="fragment" -->
- Combination of CI/CD, nightly builds and on-demand builds <!-- .element: class="fragment" -->

---

### What did we actually do wrong?

Note:

At first, everything went well ...

--

### The Reality

- CI for tools <!-- .element: class="fragment" -->
- CI for target builds (Ninja) <!-- .element: class="fragment" -->
- Nightly target builds (Eclipse + GNU Make) <!-- .element: class="fragment" -->
- Nightly unit tests (GNU Make) <!-- .element: class="fragment" -->
- Jenkins pipelines as orchestration layer <!-- .element: class="fragment" -->

--

### Freestyle Happiness

![](images/freestyle-happiness.png) <!-- .element width="80%" -->

Note:

Sure, when you start with Jenkins, you begin with simple freestyle jobs.

Just building.

--

### Freestyle Faith

<div style="position:relative; width:900px; height:600px; margin:0 auto;">
    <img src="images/freestyle-faith.png" style="position:absolute;top:0;left:0;" />
    <img src="images/freestyle-faith-2.png" style="position:absolute;top:0;left:350;" />
</div>

Note:

- then suddenly a bit more happens
- gradually tools need to be glued together
- Connection to the SCM system
- Reporting

--

### Holy Moly Groovy Pipelines

![](images/holy-moly-pipelines.png) <!-- .element width="80%" -->

--

![](images/pipeline-lotr.png) <!-- .element width="65%" -->

Note:
Higher, faster, further: One pipeline to rule them all.

--

### Law of the Instrument

- Pipeline as replacement build system <!-- .element: class="fragment" -->
- Build logic in pipelines (10,000s of lines of Groovy DSL) <!-- .element: class="fragment" -->
- Sufficient? No! Shared libraries and plugins still exist ... <!-- .element: class="fragment" -->
- Non-reproducible CI results <!-- .element: class="fragment" -->
- Worst case: separate repos for product source code and CI pipeline <!-- .element: class="fragment" -->

Note:

- CI system does different/more things than the build environment.
- With a hammer in hand, the world looks like a pile of nails.
- Birmingham screwdriver

--

### Continuous Complexity

![](images/weight.png) <!-- .element width="60%" style="filter: invert(100%)" -->

---

### How to do it better?

--

### Architecture Principles

<div class="compact-list">

<div class="fragment">

🎯 **Separation of Concerns** → Pipeline = Orchestration only

</div>

<div class="fragment">

💻 **Local-First Development** → Same commands everywhere

</div>

<div class="fragment">

🚀 **Bootstrapping** → Scripts handle dependencies

</div>

<div class="fragment">

🏗️ **Unified Build System** → CMake + Ninja for all variants

</div>

<div class="fragment">

✅ **Quality Gates = Test Selection** → Pytest markers drive everything

</div>

</div>

Note:

These are the core principles we derived after recognizing that CI and local environments differ primarily in orchestration, not in actual build and test execution.

Separation of Concerns: All business logic lives in the build system, not in pipeline DSL.

Local-First: Jenkins executes the exact same commands developers run on their machines.

Bootstrapping: Build scripts handle all dependency resolution and tool installation automatically.

Unified Build System: CMake as meta-build system generates all artifacts for all variants.

Quality Gates: Different test levels are just pytest marker selections, making them transparent and reproducible.

--

### The SPLE Platform Stack

<div class="compact-list">

<div class="fragment">

📦 **Scoop** - Windows package manager

</div>

<div class="fragment">

🏗️ **CMake + Ninja** - Fast (meta) build system

</div>

<div class="fragment">

🐍 **Python + Pytest** - Universal test framework

</div>

<div class="fragment">

🔄 **Thin (Jenkins/GitHub) Pipeline** - Minimal orchestration

</div>

<div class="fragment">

🎯 **Quality Gates** - Pytest marker selection

</div>

</div>

Note:

Our implementation stack is simple but powerful:

Scoop handles all toolchain installation on Windows automatically.

CMake as meta-build system generates ninja build files for performance - building all artifacts of all variants.

Python and Pytest serve as the universal test framework for ALL quality gates.

Jenkins pipeline is thin - just orchestration, calling pytest with appropriate markers.

Quality gates are transparent: quick tests for PRs, full tests for main branch, extended tests for nightly.

--

### Pipeline Happiness?

- Checkout from repository<!-- .element: class="fragment" -->
- Installation of all dependencies <!-- .element: class="fragment" -->
- Execute selected tests as quality checks <!-- .element: class="fragment" -->
- Archive results <!-- .element: class="fragment" -->

--

### Jenkins

<div style="font-size: xx-large">

```Groovy
...

node() {
    stage("Checkout Code") {
        checkout scm
    }

    stage("Installation of Dependencies") {
        bat "call build.bat -install -installOptional || exit /b 1"
    }

    stage ("Execute Tests") {
        bat "call build.bat -selftests -marker 'build_debug or reports' || exit /b 1"
    }

    stage("Deploy Test Results") {
        junit allowEmptyResults: false, keepLongStdio: false, testResults: "test/output/test-report.xml"
    }

    ...
}

...
```

</div>

--

<div class="mermaid" style="width: 120%; height: auto; margin-left: -10%; ">
<pre>
%%{ init: { 'theme': 'dark', 'themeVariables': { 'edgeLabelBackground': 'transparent', 'fontSize': '20px' } } }%%
flowchart LR

    subgraph QG["🎯 Quality Gate Selection"]
        C1["What to test?"] --> C2{Trigger Type}
        C2 -->|PR| C3["⚡ Quick Tests"]
        C2 -->|Main Branch| C4["🔍 Full Tests"]
        C2 -->|Nightly| C5["🌙 Long Tests"]
    end

      C3 --> C6["🎭 Start Parallel Execution"]
      C4 --> C6
      C5 --> C6

      subgraph TE["🔄 Test Execution"]
          subgraph A1["Agent 1"]
              M1A["📥 Checkout Code"] --> M1B["🔧 Installation of Dependencies"]
              M1B --> M1C["🧪 Execute Tests"]
              M1C --> M1D["📋 Deploy Test Results"]
              M1D --> M1E["📦 Deploy Artifacts"]
          end

          subgraph Ax["..."]
          end

          subgraph An["Agent N"]
              M3A["📥 Checkout Code"] --> M3B["🔧 Installation of Dependencies"]
              M3B --> M3C["🧪 Execute Tests"]
              M3C --> M3D["📋 Deploy Test Results"]
              M3D --> M3E["📦 Deploy Artifacts"]
          end
          START["▶️ Start"] --> M1A
          START --> Ax
          START --> M3A
          M1E --> END["⏹️ End"]
          M3E --> END
      end

      C6 --> TE

      TE --> C7["📊 Wait & Collect<br/>Overall Status"]

      %% Style to make an element transparent
      classDef transparent fill:transparent,stroke:transparent
      class M2 transparent

</pre>
</div>

Note:

This diagram shows our unified SPLE pipeline approach.

The pipeline simply selects a quality gate based on the trigger type - pull request, main branch push, or nightly build.

Then it orchestrates parallel execution across multiple agents.

Each agent runs the same four steps: checkout code, install dependencies, execute tests with selected markers, and deploy results.

This transforms quality gates from opaque pipeline magic into transparent, reproducible test selections.

--

### Pytest: The Universal Test Framework

<div style="font-size: large">

```python
class Test_MyVariant:
    variant = "MyVariant"

    @pytest.mark.build
    def test_build(self):
        spl_build = SplBuild(variant=self.variant,
                            build_kit="prod",
                            target="build")
        result = spl_build.execute()
        assert result == 0, "Building failed"

    @pytest.mark.unittests
    def test_unittests(self):
        spl_build = SplBuild(variant=self.variant,
                            build_kit="test",
                            target="unittests")
        result = spl_build.execute()
        assert result == 0, "Unit tests failed"
```

</div>

Note:

Here's the actual code structure we use.

Each variant gets a pytest class with methods decorated with markers.

The build quality gate is marked with pytest.mark.build.

The unittests quality gate is marked with pytest.mark.unittests.

Each test uses the same SplBuild wrapper that calls CMake targets.

This works identically on developer machines and in CI - no magic, fully reproducible.

--

### GitHub Actions

<div style="font-size: xx-large">

```yaml
---
jobs:
  test:
    name: CI Gate
    runs-on: windows-latest

    steps:
      - name: Checkout Code
        uses: actions/checkout@v4
        with:
          fetch-depth: 0
      - name: Installation of Dependencies
        run: |
          .\build.ps1 -install
        shell: powershell
      - name: Execute Tests
        run: |
          .\build.ps1 -selftests -marker "build_debug or reports"
        shell: powershell
      - name: Deploy Test Results
        uses: EnricoMi/publish-unit-test-result-action/windows@v2
        if: always()
        with:
          files: |
            test/output/test-report.xml
```

</div>

--

### Platform as a Product 🎁

<div class="compact-list">

<div class="fragment">

**Agile Release Train** with SAFe

</div>

<div class="fragment">

**Shared Ownership** across all teams

</div>

<div class="fragment">

**Regular Sprint Reviews** with user feedback

</div>

<div class="fragment">

**Management Support** for budget & infrastructure

</div>

<div class="fragment">

**From Fragmented Tools → Unified Platform**

</div>

</div>

Note:

A major shift was treating the platform itself as a product.

We developed it collaboratively within an Agile Release Train following the Scaled Agile Framework.

This moved us from fragmented, tool-specific automation efforts to a unified, organization-wide initiative.

By coining a clear name and vision, we gave all contributors a shared sense of ownership.

Every team now contributes features, feedback, and improvements through regular sprint reviews.

Management actively supports from a business perspective with dedicated budgets for training, licenses, and infrastructure.

This transforms the platform from an ad-hoc engineering effort into a sustainable, strategic product.

--

<!-- .slide: data-visibility="hidden" -->

### SPLE Platform

- VSCode plus CMake Tools
- Configuration as Code
- Easily extensible
- SPLE enables modular SW development
- Components as building blocks of the software
- Separate repositories thanks to RTE interfaces
- Custom configuration
- Variant-independent unit tests
- Separation of customer and developer view
- Integration tests of components possible

--

### Jenkins

- does NOTHING different than the user locally <!-- .element: class="fragment" -->
- Build is a one-liner <!-- .element: class="fragment" -->
- Automatic job creation for branches and pull requests <!-- .element: class="fragment" -->
- Few plugins to display results <!-- .element: class="fragment" -->
- Supporting developers in analyzing errors <!-- .element: class="fragment" -->

Note:

- https://www.jenkins.io/doc/book/pipeline/pipeline-best-practices/
- Minimal Jenkinsfile plus Organization Folder Plugin (Bitbucket, GitHub)
- A single config file (config.xml of the org)

--

### Benefits for Everyone 🎉

<div style="text-align: left; margin-left: 10%">

**👨‍💻 Developers:**

- Same commands locally & CI
- Easy debugging of failures
- Fast feedback cycles

<!-- .element: class="fragment" -->

**🔧 Platform Engineers:**

- Maintainable Python code
- Reusable components across SPLs
- Clear separation of concerns

<!-- .element: class="fragment" -->

**👔 Management:**

- Fast, reliable quality feedback
- Transparent quality criteria
- Always releasable software state

<!-- .element: class="fragment" -->

</div>

Note:

Let's summarize the benefits for different stakeholders.

For developers: The same commands work locally and in CI, making debugging straightforward with fast feedback.

For platform engineers: We have maintainable Python code instead of complex Groovy DSL, with reusable components across all Software Product Lines.

For management: Fast, reliable feedback on software quality with transparent criteria ensuring always releasable software.

This transformation from Jenkinstein to a clean SPLE Platform has made everyone happier - hence our title: Less Pipelines, More Happy Developers!
