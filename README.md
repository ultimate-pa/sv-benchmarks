<!--
This file is part of the SV-Benchmarks collection of verification tasks:
https://github.com/sosy-lab/sv-benchmarks

SPDX-FileCopyrightText: 2011-2020 The SV-Benchmarks Community

SPDX-License-Identifier: Apache-2.0
-->

# Collection of Verification Tasks

## Repository Description

### Purpose

This collection of verification tasks is constructed and maintained as a common benchmark
for evaluating the effectiveness and efficiency of state-of-the-art verification technology.

This repository is used by many research groups to evaluate the effectiveness and efficiency
of verification algorithms for software.
The category structure was developed for the International Competition on Software Verification [SV-COMP].

The verification tasks were contributed by several research and development groups. 
After the submission of verification tasks,
a group of people (mainly [SV-COMP] organizer and participants)
are working on improving the quality of the verification tasks.
This means that after the sets were made public, some programs were removed
(no property encoded, unknown architecture), and 
some programs got technically improved (compiler warnings, memory model).
These changes have improved the overall quality of the final set of programs for the competition [SV-COMP], and
have not changed the intended verification result; all changes are tracked in the public repository.

**This repository is open for submission of new verification tasks!**
Please refer to our [contribution guidelines](CONTRIBUTING.md)
to see how to submit verification tasks to this repository.

Thanks to all contributors of programs, patches, and discussion comments.

### Structure

The collection consists of three directories, which contain verification tasks written in different languages:
- `c/` (programming language C, follows the GNU C standard, many programs even adhere to ANSI C)
- `java/` (programming language Java)
- `causes/` (systems from the other directories translated to Horn clauses and stored in SMT format)

### License

The programs are under different licenses, which are specified either via a file `LICENSE*.txt` in the same directory,
or via a comment in the program header.
Most of the programs are under an open-source license such as Apache 2.0 or GPL.

### Origin, Description, and Attribution

The subdirectories that contain the programs contain files `README.txt`, which give further information
about the programs, in particular, this is the place to trace the origin and to attribute the programs to their contributors.
For some programs, this information is given in the header of the program as comment.

### Categories

The verification tasks for C programs are grouped into (sub-)categories
as defined by [SV-COMP](https://sv-comp.sosy-lab.org/2017/benchmarks.php).

A (sub-)category `<category>` is defined by a file named `<category>.set`
that contains patterns that specify the set of programs.


## Definitions

The following definitions are taken from the SV-COMP report
[2016](https://www.sosy-lab.org/~dbeyer/Publications/2016-TACAS.Reliable_and_Reproducible_Competition_Results_with_BenchExec_and_Witnesses.pdf) (and previous years).

A *verification task* consists of
- a [program](#progams),
- a [specification](#specifications) (set of properties), and
- [parameters](#parameters).

A *category* is a set of verification tasks.

A *sub-category* is a set of verification tasks that consist of the same
specification.

A *verification run* is
- a non-interactive execution
- of one verification tool
- on one verification task
- under specific resource constraints
in order to check whether the following statement is correct:
"The program satisfies the specification."

A *verification result* is a triple (ANSWER, WITNESS, TIME) with
- ANSWER is an element from {TRUE, FALSE, UNKNOWN},
- WITNESS is a violation witness or correctness witness in the common [witness format] that supports validation of the (untrusted) answer, and
- TIME is the CPU time that the verification run has consumed (in practice, also other resource measurement values are reported).


### Programs

The program files in this repository are named as follows:
- the original file name or short title of the program is given at the beginning,
- for each property against which the program is to be verified,
  the string `_false-<property>` or `_true-<property>` is included, according to the expected verification answer, and
- the filename ends with ending `.c` for not preprocessed files and `.i` for preprocessed files (for C files).

For example, the program `minepump_spec5_product61_true-unreach-call_false-termination.cil.c`
is expected to satisfy property `unreach-call` and to violate property `termination`.

There are some old programs that have ending `.c` although they are preprocessed.

### Behavioral Specifications

There are several 'default' specifications that many people use:
  - [unreach-call](c/properties/unreach-call.prp):
    A certain function call must not be reachable in the program.
  - [valid-memsafety, valid-deref, valid-free, valid-memtrack](c/properties/valid-memsafety.prp):
    A certain memory safety property must hold in the program.
    "memsafety" is the conjunction the other three properties.
  - [valid-memcleanup](c/properties/valid-memcleanup.prp):
    All allocated memory must be deallocated before the program terminates (note that this is stronger then avoiding memory leaks).
  - [no-overflow](c/properties/no-overflow.prp):
    A certain kind of undefined behavior (overflows of signed ints) must not be present in the program.
  - [termination](c/properties/termination.prp):
    The program must terminate on all execution paths.

The above specifications are used, e.g., by SV-COMP, and the [competition reports](https://doi.org/10.1007/978-3-030-45237-7_21)
explains those specifications.

### Test Specifications

The following are some 'default' specifications that many people use for test-case generation:
  - [coverage-branches](c/properties/coverage-branches.prp):
    The generated test suite should cover all branches of the program.
  - [coverage-error-call](c/properties/coverage-error-call.prp):
    The generated test suite should contain (at least) one test case that covers the call of a certain function.

The above test specifications are used, e.g., by Test-Comp, and the [competition reports](https://doi.org/10.1007/978-3-030-45234-6_25)
define those specifications.

### Parameters

The parameters of a verification task are needed to make additional information
about the verification task available to the verification run.
The most prominent parameter is the machine model;
currently, there are verification tasks for the ILP32 (32-bit) and the LP64 (64-bit) architecture
(cf. https://www.unix.org/whitepapers/64bit.html).

### Task Definitions

In order to obtain verification tasks from the programs and specifications in the repository,
a simple task-definition mechanism is used.
We use [version 2.0 of this format](https://gitlab.com/sosy-lab/benchmarking/task-definition-format/-/tree/2.0)
with some additional requirements.
For each program, the repository contains a .yml file that specifies the following items:
  - `format_version`: the version of the format (the version string `2.0`)
  - `input_files`: the subject program files or directories
    (a file or directory name, or a list of files or directory names, that the program consists of)
  - `properties`: the properties that constitute the specification of the program,
    each consisting of the following items:
    - `property_file`: file that contains a property definition
      (cf. common property files [for C][C-props] and [for Java][Java-props])
    - `expected_verdict`: the intended verification result (`true` or `false`, only for non-coverage properties)
    - `subproperty` (optional): a subproperty of the property that is violated
      in cases where the property is a conjunction of subproperties (for verdict `false`)
  - `options`: parameters that are relevant for verification or give extra information:
    - `language`: programming language that the program is written in (`C` or `Java`)
    - `data_model` data model of the computer architecture
      (`ILP32`, `LP64`, see https://www.unix.org/whitepapers/64bit.html, only for `C` programs)

Optional items are explicitly marked as optional, all other items are mandatory.
The dictionary `options` can contain additional data that are not mentioned above.

[C-props]: https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks/-/tree/main/c/properties
[Java-props]: https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks/-/tree/main/java/properties

The [SV-COMP 2019 report] has documented the first version of the repository's task-definition format 1.0,
and contains a description of the format with an example in Sect. 4 and Fig. 3.
Format 2.0 adds the `options` dictionary.
Here as example an extract of the task-definition file [c/list-properties/list-1.yml](c/list-properties/list-1.yml):

```
format_version: '2.0'

input_files: 'list-1.i'

properties:
  - property_file: ../properties/unreach-call.prp
    expected_verdict: true
  - property_file: ../properties/valid-memsafety.prp
    expected_verdict: false
    subproperty: valid-memtrack

options:
  language: C
  data_model: ILP32
```


[SV-COMP]: https://sv-comp.sosy-lab.org/
[witness format]: https://github.com/sosy-lab/sv-witnesses
[SV-COMP 2019 report]: https://doi.org/10.1007/978-3-030-17502-3_9
