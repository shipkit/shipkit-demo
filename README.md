# Shipkit demo

[![CI](https://github.com/shipkit/shipkit-demo/workflows/CI/badge.svg)](https://github.com/shipkit/shipkit-demo/actions)
[![Maven Central](https://img.shields.io/maven-central/v/org.shipkit.shipkit-demo/shipkit-demo-impl)](https://repo1.maven.org/maven2/org/shipkit/shipkit-demo/shipkit-demo-impl)

This is a demo project that showcases release automation with Shipkit plugins.
Use it as a reference to automate your project!

## Overview

This project represents a development model where every change on the main development branch will produce a new release via the CI system.
The release is a Maven publication (jars, poms) that get uploaded to a free public repository (Maven Central) via a free CI system (Travis).
We chose Maven Central and Travis CI as examples - you can use any system of your choice (for example: JFrog Artifactory + GH Actions).
The Gradle plugins we chose for this use case represent the minimum set of Gradle plugins to conveniently automate the releases.

 - the Maven publication (jars, poms) is configured using Gradle's built-in [maven-publish](https://docs.gradle.org/current/userguide/publishing_maven.html) plugin.
 - the publication to a public repository (Maven Central) is configured using [gradle-nexus/publish-plugin](https://github.com/gradle-nexus/publish-plugin/) plugin.
    Published versions and artifacts can be viewed in [Maven Central](https://repo1.maven.org/maven2/org/shipkit/shipkit-demo/shipkit-demo-impl).
    If you want to publish to a different repository than Maven Central, you would use a different plugin for that.
    For example, if you want to publish to JFrog Artifactory, you can use [com.jfrog.artifactory](https://www.jfrog.com/confluence/display/JFROG/Gradle+Artifactory+Plugin) plugin.
 - the next version for the release is deducted automatically by [shipkit-auto-version](https://github.com/shipkit/shipkit-auto-version) plugin.
    This plugin is minimalistic, written for sole purpose of automated deduction of version before the release. 
 - the GitHub release is performed via GH REST API by [shipkit-auto-version](https://github.com/shipkit/shipkit-changelog) plugin.
    This plugin is minimalistic, written for sole purpose of generating changelog (release notes) and performing a GH release.
    The releases and changelog can be viewed on [GH releases page](https://github.com/shipkit/shipkit-demo/releases).

## Implementation reference

- Java publication (javadoc/sources jar, pom customization, signing): [gradle/java-publication.gradle](/gradle/java-publication.gradle).
    Note that `PGP_KEY` and `PGP_PWD` environment variables are required for successful publications.
- Release automation (deducting version, generating changelog, creating GitHub release via GH REST API, Sonatype/Maven Central settings): [gradle/release.gradle](/gradle/release.gradle).
    Note that `GITHUB_TOKEN` env variable is required to perform GitHub release.
    `SONATYPE_USER` and `SONATYPE_PWD` are required for publications to Sonatype Nexus (Maven Central).
- CI/CD configuration: [.github/workflows/ci.yml](/.github/workflows/ci.yml).
    Note that you can use *any* CI system.
