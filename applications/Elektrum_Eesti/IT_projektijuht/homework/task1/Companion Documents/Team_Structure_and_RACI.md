# Team Structure & RACI Matrix

Last updated: 2025-10-24T23:20:06+03:00

**Project**: EE HH Recommendation System  
**Purpose**: Define team composition, roles, and decision-making authority  
**Author**: Mihkel Putrinš (IT Project Manager)

## Team Organization Chart

**Steering Committee**  

Reporting to Steering Committee (parallel roles):

- **Product Owner** (Business)
  - Owns backlog and business priorities
  - Approves deliverables
  
- **IT Project Manager**
  - Manages delivery execution
  - Coordinates teams below:

**Teams reporting to IT Project Manager**:

- **Development Team**
  - CC&B Developers
  - Portal Developer
  - Mobile Developer
  
- **IT Specialist** (Key Role)
  - Bridge between business and technical
  
- **Support Functions**
  - QA Engineer
  - DevOps Engineer
  - UX Designer

## Decision Authority

### IT Project Manager

**Can Decide**: Sprint scope, resource allocation, risk mitigation, daily operations  
**Must Escalate**: Budget overruns, timeline extensions >8 weeks, major scope changes

### Product Owner

**Can Decide**: Backlog priority, story acceptance, business rules  
**Must Escalate**: Scope changes requiring budget/timeline impact

### IT Specialist

**Can Decide**: Bug severity, test coverage, acceptance criteria  
**Must Escalate**: Requirement conflicts, major blockers, quality risks

\newpage

## Core Team Roles

### 1. IT Project Manager

**Reports to**: Steering Committee

**Key Responsibilities**:

- Overall delivery (scope, schedule, budget, quality)
- Stakeholder management and communication
- Risk/issue management and escalation
- Cross-team coordination
- Sprint planning and retrospectives

### 2. Product Owner

**Reports to**: Business Sponsors, collaborates with IT PM

**Key Responsibilities**:

- Prioritize product backlog
- Accept/reject completed work
- Define business value and success metrics
- UAT approval and go-live sign-off

**Collaboration**: Daily alignment on priorities, weekly sprint ceremonies

### 3. IT Specialist (Key Technical Role)

**Reports to**: IT Project Manager

**Core Function**: Bridge between business and technical teams

**Key Responsibilities**:

- **Requirements**: Translate business needs to technical specs
- **Testing**: Create test cases, coordinate UAT, triage bugs
- **Integration**: Ensure CC&B, Portal, Mobile work together
- **Documentation**: API docs, runbooks, user guides

**Phase-by-Phase Activities**:

| Phase | Focus |
|-------|-------|
| Requirements | User stories, acceptance criteria |
| Design | Test strategy, API contracts |
| Development | Clarifications, validation |
| Testing | UAT coordination, bug triage |
| Deployment | Smoke testing, rollback planning |

**See**: ***`IT_Specialist_Role_Definition.md`*** for details

\newpage

### 4. Development Teams

**CC&B Team** (2-3 devs): Backend billing system  
**Portal Team** (1-2 devs): Elektrum.ee web portal  
**Mobile Team** (0.5-1 dev): Android/iOS apps

**Coordination**: Daily stand-ups with IT Specialist for requirements clarification

### 5. Support Functions

**QA Engineer**: Test execution, automation, bug tracking  
**DevOps Engineer**: CI/CD, deployment, monitoring  
**UX Designer**: UI design, usability testing  
**Scrum Master**: Agile ceremonies (may be IT PM)

## RACI Matrix

**Key Project Activities** - Who Does What

| Activity | IT PM | Product Owner | IT Specialist | Developers | QA | DevOps |
|----------|-------|---------------|---------------|------------|----|----|
| Requirements Definition | C | A | R | C | I | I |
| Backlog Prioritization | C | A/R | C | I | I | I |
| Sprint Planning | A/R | C | C | C | C | I |
| Technical Design | I | I | A | R | C | C |
| Development | I | I | C | R | I | C |
| Integration Testing | I | I | A/R | C | R | C |
| UAT Coordination | C | R | A | I | C | I |
| Bug Triage | C | C | A/R | C | R | I |
| Deployment | A | C | C | C | I | R |
| Go-Live Decision | A/R | A | C | I | I | I |

**Legend**:

- R = Responsible (does work)
- A = Accountable (approves)
- C = Consulted
- I = Informed

\newpage

## Team Capacity

| Role | FTE | Notes |
|------|-----|-------|
| IT Project Manager | 1.0 | Full-time |
| Product Owner | 0.3 | Part-time |
| IT Specialist | 1.0 | Full-time |
| CC&B Developers | 2.0 | 2 developers |
| Portal Developer | 1.0 | Sprints 2-4 |
| Mobile Developer | 0.5 | Shared resource |
| QA Engineer | 1.0 | Full-time |
| DevOps Engineer | 0.3 | Setup + deployment |

**Total**: ~8.5 FTE across 8 weeks

## Communication Rhythm

**Daily**: Stand-ups (15 min), IT Specialist ↔ Developers clarifications  
**Weekly**: Sprint review/planning, IT PM → Stakeholder status email  
**Ad-hoc**: Critical blockers escalated immediately to IT PM

## Key Takeaways

1. **IT Project Manager** orchestrates overall delivery and stakeholder management
2. **IT Specialist** ensures business-technical alignment and quality
3. **Product Owner** drives business value and priorities
4. **Development teams** build features across CC&B, Portal, Mobile
5. **Clear decision authority** prevents bottlenecks and delays
6. **RACI matrix** eliminates confusion on who does what

This structure supports the delivery plan in [task1_agile_plan.md](../task1_agile_plan.md).

---

**Document Version**: 1.0  
**Date**: October 23, 2025  
**Author**: Mihkel Putrinš
