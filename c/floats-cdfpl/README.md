<!--
This file is part of the SV-Benchmarks collection of verification tasks:
https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks

SPDX-FileCopyrightText: 2001-2016 Daniel Kroening, Computer Science Department, University of Oxford
SPDX-FileCopyrightText: 2001-2016 Edmund Clarke, Computer Science Department, Carnegie Mellon University
SPDX-FileCopyrightText: 2014-2021 The SV-Benchmarks Community

SPDX-License-Identifier: LicenseRef-BSD-4-Clause-Attribution-Kroening-Clarke
-->

These benchmarks were originally used in the paper

Vijay D'Silva, Leopold Haller, Daniel Kroening, Michael Tautschnig:
Numeric Bounds Analysis with Conflict-Driven Learning. TACAS 2012

The basic benchmarks are

sine - A taylor expansion of a sine function
square - A taylor expansion of a square root 
newton - Newton approximation of sine

where each of them comes with 8 different interval bounds. The Newton
approximation furthermore varies from 1 to 3 iterations. All .i files were
generated from the .c files using suitable values for the NR and ITERATIONS
preprocessor defines.

