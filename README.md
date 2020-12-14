# Shipkit demo

[![Build Status](https://travis-ci.com/shipkit/shipkit-demo.svg?branch=master)](https://travis-ci.com/shipkit/shipkit-demo)
[![Download](https://api.bintray.com/packages/shipkit/examples/shipkit-demo/images/download.svg)](https://bintray.com/shipkit/examples/shipkit-demo/_latestVersion)

This is a demo project that showcases release automation with Shipkit plugins.
Use it as a reference to automate your project!

## Overview

This project represents a development model where every change on the main development branch will produce a new release via the CI system.
The release is a Maven publication (jars, poms) that get uploaded to a free public repository (Bintray) via a free CI system (Travis).
We chose Bintray and Travis CI as examples - you can use any system of your choice (for example: Bintray + GH Actions, Maven Central + Circle CI).
The Gradle plugins we chose for this use case represent the minimum set of Gradle plugins to conveniently automate the releases.

 - the Maven publication (jars, poms) is configured using Gradle's built-in [maven-publish](https://docs.gradle.org/current/userguide/publishing_maven.html) plugin.
 - the publication to a public repository (Bintray) is configured using JFrog's [bintray](https://github.com/bintray/gradle-bintray-plugin) plugin.
    Published versions and artifacts can be viewed in [Bintray web app](https://bintray.com/shipkit/examples/shipkit-demo).
    If you want to publish to a different repository than Bintray, you would use a different plugin for that.
    For example, if you want to publish to Sonatype Nexus for Open Source, you can use [maven-publish](https://docs.gradle.org/current/userguide/publishing_maven.html) plugin.
 - the next version for the release is deducted automatically by [shipkit-auto-version](https://github.com/shipkit/shipkit-auto-version) plugin.
    This plugin is minimalistic, written for sole purpose of automated deduction of version before the release. 
 - the GitHub release is performed via GH REST API by [shipkit-auto-version](https://github.com/shipkit/shipkit-changelog) plugin.
    This plugin is minimalistic, written for sole purpose of generating changelog (release notes) and performing a GH release.
    The releases and changelog can be viewed on [GH releases page](https://github.com/shipkit/shipkit-demo/releases).

## Implementation reference

- Java publication (javadoc/sources jar, pom customization, Bintray plugin): [gradle/java-publication.gradle](/gradle/java-publication.gradle).
    Note that "BINTRAY_API_KEY" env variable is required for Bintray upload.
- Release automation (deducting version, generating changelog, creating GitHub release via GH REST API): [gradle/release.gradle](/gradle/release.gradle).
    Note that "GH_WRITE_TOKEN" env variable is required to perform GitHub release.
- Continuous delivery (CI server configuration): [.travis.yml](/gradle/release.gradle).
    Note that you can use *any* CI system, we chose Travis CI as an example.
