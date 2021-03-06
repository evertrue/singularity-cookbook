singularity CHANGELOG
This is the Changelog for the singularity cookbook.

## [Unreleased][unreleased]

### Changes

### Fixes

## v11.1.0 - (2016-10-21)

## For additional changes see the [GitHub Release Notes](https://github.com/evertrue/singularity-cookbook/releases)

## v11.0.0 - (2016-09-13)

## Changes

* **BREAKING:** Bump singularity version to 0.11.0
* **BREAKING:** Stop pinning mesos package version
* **BREAKING:** Bump et_mesos to 6.0

## Fixes

* Run update-ca-certificates after maven is installed (Resolves Maven SSL downloads issue)
* Stop testing that /usr/local/singularity is owned by singularity user (it's not, doesn't need to be, and never will be)

## v10.0.0 - (2016-09-13)

## Changes

* Add a CHANGELOG!
* Break out the Singularity Executor into its own [cookbook](https://github.com/evertrue/singularity_executor-cookbook)
