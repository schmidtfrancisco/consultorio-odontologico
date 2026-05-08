# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Maven-built Jakarta EE 8 web application (`.war` packaging) for a dental clinic ("Clínica Odontológica"). Targets Java 8 source/target and is configured to deploy to Tomcat (per `nb-configuration.xml`). The project is in an early skeleton stage: domain model classes exist, but persistence, services, and web layer are not yet implemented.

The project root for Maven is `clinicaOdontologica/` (one level below the repo root, which also contains the UML class diagram `Diagrama de clases.drawio` / `.png`).

## Build & Run

All Maven commands are run from `clinicaOdontologica/`:

- Build the WAR: `mvn package` → produces `target/clinicaOdontologica-1.0-SNAPSHOT.war`
- Clean rebuild: `mvn clean package`
- Compile only: `mvn compile`
- Run tests: `mvn test` (no tests currently exist under `src/test/java`)
- Run a single test once tests exist: `mvn -Dtest=ClassName#methodName test`

The `maven-dependency-plugin` copies the `javaee-api` jar into `target/endorsed/` during the `validate` phase — this is part of the standard Java EE 7/8 endorsed-dirs setup and runs automatically on every build.

Deployment target is Tomcat at context path `/clinicaOdontologica` (see `src/main/webapp/META-INF/context.xml`). Note: a vanilla Tomcat does not provide the full Java EE 8 stack; if CDI/JPA/EJB are added later, either switch to TomEE/Payara/WildFly or bundle the needed implementations.

## Architecture

The codebase follows a layered package structure under `src/main/java/`:

- **`logic/`** — domain model (POJOs, no annotations yet). Inheritance hierarchy: `Person` is the base for `Pacient`, `Dentist`, `Secretary`, and `Responsible`. `User` (id/username/password/role) is composed into `Dentist` and `Secretary` for authentication. `Appointment` links to both `Pacient` and `Dentist` via `shiftList` collections on each side. `Schedule` belongs to `Dentist`. Note the misspelling `Pacient` (Spanish-influenced) is consistent across the codebase — keep it unless doing a deliberate rename.
- **`persistence/`** — currently empty; intended for DAOs / JPA entity managers. `src/main/resources/META-INF/persistence.xml` declares a persistence unit `my_persistence_unit` but no datasource, provider, or entity classes are configured yet.
- **`src/main/webapp/`** — Jakarta EE web app descriptors. `WEB-INF/beans.xml` enables CDI with `bean-discovery-mode="all"`. `WEB-INF/web.xml` only sets a 30-minute session timeout. No servlets, filters, or JSPs exist yet.

The class diagram in the parent directory (`Diagrama de clases.drawio` / `.png`) is the design source of truth for the domain model — consult it when extending the model rather than inferring relationships from the partially-implemented Java classes.

## Conventions

- Domain classes are plain JavaBeans: no-arg constructor + all-args constructor + getters/setters, no Lombok, no annotations.
- Field names mix English (most fields) with Spanish-influenced naming (`Pacient`, `responsabilityType`). Match the existing style of the file you're editing.
- `Person.birthdate` is exposed via `getBornDate()`/`setBornDate()` (the field/getter names disagree) — be aware when wiring this to JPA or serialization.
