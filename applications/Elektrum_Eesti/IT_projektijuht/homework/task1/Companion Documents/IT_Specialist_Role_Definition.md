# EE IT Specialist: Detailed Role Definition

Last updated: 2025-10-23T14:29:55+03:00

**Document Purpose**: Comprehensive definition of IT Specialist role and responsibilities for EE HH Recommendation System project

**Date**: October 23, 2025

**Author**: Mihkel Putrinš

---

## Role Overview

The EE IT Specialist serves as the critical bridge between business stakeholders and technical implementation teams, ensuring that the EE HH Recommendation functionality delivers business value while maintaining technical excellence and operational reliability.

**Core Mission**: Transform business requirements into working software solutions through effective coordination, rigorous quality assurance, and proactive problem-solving.

---

## Key Responsibilities Summary

| Phase | Primary Focus | Key Deliverables |
|-------|--------------|------------------|
| Requirements | Understanding & Documentation | Business requirements, user stories, acceptance criteria |
| Design | Technical Coordination | Architecture review, integration plan, test strategy |
| Development | Quality Assurance & Support | Requirement clarifications, testing, blocker resolution |
| Testing | Validation & UAT | Test cases, UAT coordination, bug triage |
| Deployment | Release Management | Deployment checklist, smoke tests, rollback plan |
| Maintenance | Continuous Improvement | Monitoring, incident management, enhancement backlog |

---

## Detailed Responsibilities by Project Phase

### Phase 1: Requirements Gathering & Analysis

**Objective**: Ensure complete understanding of business needs and translate them into actionable technical requirements.

**Activities**:

1. **Stakeholder Engagement**
   - Conduct workshops with business analysts, product owners, and end-users
   - Document current pain points and desired outcomes
   - Validate understanding through requirement playback sessions
   - Build consensus on priorities and scope

2. **Business Requirements Documentation**
   - Create functional requirement specifications
   - Document non-functional requirements (performance, security, scalability)
   - Define business rules and validation logic (see `business_problem_summary.md` Section 3)
   - Map user workflows and system touchpoints

3. **User Story Creation**
   - Break down features into user stories following INVEST principles:
     - **I**ndependent: Can be developed separately
     - **N**egotiable: Details can be refined
     - **V**aluable: Delivers business benefit
     - **E**stimable: Team can estimate effort
     - **S**mall: Completable within one sprint
     - **T**estable: Clear acceptance criteria
   - Write acceptance criteria in Given-When-Then format
   - Link stories to business objectives and success metrics

### Example Output: User Story

```markdown

4. **Integration Point Analysis**
   - Map data flows between systems (CC&B, Elektrum.ee, Sales Portal, Mobile Apps)
   - Document API requirements and data formats
   - Identify authentication and authorization needs
   - Assess integration complexity and potential risks
   - Reference existing integrations and patterns (e.g., LEO-25125 discount functionality)

**Example Output: User Story**

```markdown
**US-001**: As an existing electricity customer, I want a unique promo code automatically 
generated when my contract activates, so I can share it with friends.

**Business Value**: Enables viral customer acquisition channel

**Acceptance Criteria**:
- **Given** a new electricity contract is activated
- **When** the contract activation event is triggered in CC&B
- **Then** a unique 8-character alphanumeric promo code is generated
- **And** the code is stored in CC&B Account → Services tab
- **And** the code status is set to ACTIVE
- **And** the code is unique across all customer accounts (database constraint)

**Technical Notes**:
- Integration point: CC&B contract activation event listener
- Data model: Promo code table (code, account_id, status, start_date, created_at)
- Uniqueness validation: Database unique constraint + collision retry logic

**Definition of Ready**:
- [ ] Acceptance criteria clear and testable
- [ ] Integration approach confirmed with CC&B team
- [ ] Database schema design reviewed
- [ ] Test data requirements identified
```

**Deliverables**:

- [ ] Business Requirements Document
- [ ] Product Backlog (prioritized user stories)
- [ ] Integration Architecture Diagram
- [ ] Risk Assessment Matrix
- [ ] Glossary of domain terms (reference `business_problem_summary.md` Domain Acronyms)

---

### Phase 2: Design & Planning

**Objective**: Ensure technical solution aligns with business requirements and is feasible to implement within project constraints.

**Activities**:

1. **Technical Architecture Review**
   - Participate in design sessions with development teams
   - Validate that proposed architecture addresses all business requirements
   - Review database schema designs (promo code tables, tracking tables)
   - Assess API design for code generation, validation, discount application
   - Ensure security considerations are addressed (code uniqueness, fraud prevention)

2. **Sprint Planning Support**
   - Help prioritize backlog items based on business value and dependencies
   - Clarify story requirements and answer questions from developers
   - Assist with story point estimation using Planning Poker
   - Identify cross-team dependencies and coordinate resolution
   - Commit to testing and documentation tasks for the sprint

3. **Test Strategy Development**
   - Define testing layers: Unit -> Integration -> E2E -> UAT -> Performance
   - Create test scenarios for each user story
   - Plan UAT approach with business stakeholders
   - Identify test data requirements (different discount groups, edge cases)
   - Coordinate test environment setup with DevOps team

4. **Documentation Planning**
   - Outline user documentation structure (user guides, FAQ)
   - Plan operations runbook content (troubleshooting, known issues)
   - Define API documentation standards (Swagger/OpenAPI)
   - Schedule knowledge transfer sessions for support team

### Example Output: Test Strategy

```markdown
## Test Strategy: Promo Code Generation (Sprint 1)

### Unit Tests (Development Team)
- Code generation algorithm produces unique codes
- Uniqueness collision retry logic works correctly
- Database constraints enforce uniqueness
- **Coverage Target**: 80%

### Integration Tests (IT Specialist + QA)
- CC&B contract activation event triggers code generation
- Generated code stored correctly in database
- Manual code generation via CC&B UI works
- Error handling when generation fails

### Test Data Requirements
- Active contracts for automatic generation testing
- Accounts without promo codes for manual generation testing
- Test accounts with existing codes (test duplicate prevention)

### UAT Scenarios (Business Stakeholders)
- View generated promo code in CC&B Account → Services tab
- Manually generate code when automatic generation fails
- Verify code format and uniqueness

### Performance Tests
- Code generation completes within 2 seconds
- Database lookup by code completes within 100ms
- System handles 1000 concurrent code generations
```

**Deliverables**:

- [ ] Technical Architecture Review Notes
- [ ] Sprint Plans with Story Commitments
- [ ] Test Strategy Document
- [ ] UAT Plan with Stakeholder Schedule
- [ ] Documentation Plan

---

### Phase 3: Development & Implementation

**Objective**: Ensure development progresses smoothly with requirements being correctly implemented and blockers quickly resolved.

**Activities**:

1. **Daily Coordination**
   - Attend daily stand-up meetings (15 min at 9:00)
   - Track sprint progress against commitments
   - Identify and escalate blockers requiring business decisions
   - Facilitate communication between business and technical teams
   - Update sprint board and burndown charts

2. **Requirement Clarification**
   - Answer developer questions about business logic
   - Provide examples and use cases when requirements are unclear
   - Coordinate with business stakeholders for complex clarifications
   - Document requirement changes and update user stories
   - Assess impact of scope changes on sprint goals

3. **Feature Validation**
   - Review implemented features in development environment
   - Validate against acceptance criteria before QA testing
   - Provide feedback to developers on business logic correctness
   - Test integration points between systems
   - Verify error handling and edge cases

4. **Blocker Resolution**
   - Identify root cause of blockers (requirement ambiguity, technical challenge, dependency)
   - Coordinate with appropriate teams to resolve
   - Escalate to project manager when business decisions needed
   - Track blocker resolution time and communicate to stakeholders
   - Document lessons learned for retrospective

**Example Daily Stand-up Update**:

```markdown
**Yesterday**:
- Validated promo code validation API with portal team
- Reviewed discount calculation logic implementation
- Updated US-009 acceptance criteria based on LEO-25125 reference

**Today**:
- Test discount application in staging environment
- Coordinate with CC&B team on database index creation
- Prepare test data for QA team (Sprint 3 stories)

**Blockers**:
- Waiting for CC&B team to confirm "Continuous bill discount" 
  integration approach (escalated to tech lead)
```

**Deliverables**:

- [ ] Daily Sprint Status Updates
- [ ] Requirement Clarification Notes
- [ ] Updated User Stories (refined acceptance criteria)
- [ ] Blocker Resolution Log

---

### Phase 4: Testing & Quality Assurance

**Objective**: Ensure delivered solution meets all requirements and is ready for production deployment.

**Activities**:

1. **Test Case Design**
   - Create detailed test cases for integration testing
   - Define test data scenarios (happy path, edge cases, error conditions)
   - Document expected results for each test case
   - Ensure coverage for all acceptance criteria
   - Reference edge cases from `business_problem_summary.md` Section 8

2. **QA Coordination**
   - Work with QA team to execute test cases
   - Validate test results against acceptance criteria
   - Reproduce bugs reported by QA team
   - Provide additional context for bug investigation
   - Verify bug fixes before marking as resolved

3. **Bug Triage & Prioritization**
   - Assess bug severity (Critical, High, Medium, Low)
   - Determine priority based on business impact
   - Decide which bugs block release vs. can be deferred
   - Coordinate with Product Owner on triage decisions
   - Track bug resolution progress

**Bug Severity Guidelines**:

| Severity | Definition | Example | Release Impact |
|----------|------------|---------|----------------|
| **Critical** | System crash, data loss, security breach | Promo code generation crashes CC&B | Blocks release |
| **High** | Core functionality broken, no workaround | Discount not applied to referee account | Blocks release (usually) |
| **Medium** | Functionality impaired, workaround available | Code display formatting issue in portal | May defer if low business impact |
| **Low** | Minor cosmetic issue, no functional impact | Typo in user message | Defer to next sprint |

1. **UAT Coordination**
   - Schedule UAT sessions with business stakeholders
   - Prepare UAT environment with realistic test data
   - Create UAT test scripts for stakeholders
   - Guide stakeholders through test scenarios
   - Collect and document feedback
   - Validate that solution meets business needs
   - Obtain formal UAT sign-off

**Example UAT Test Script**:

```markdown
## UAT Test Script: Promo Code Sharing (Sprint 2)

**Objective**: Verify that existing customers can view and share their promo codes

**Prerequisites**:
- Test account with active electricity contract
- Promo code already generated: "TEST2025"

**Test Steps**:

1. **View Promo Code**
   - Navigate to Elektrum.ee self-service portal
   - Log in with test credentials
   - Go to Account Dashboard
   - Expected: Promo code "TEST2025" is displayed with "Active" status

2. **Copy Code to Clipboard**
   - Click "Copy Code" button
   - Paste into text editor
   - Expected: Code "TEST2025" copied correctly

3. **Share via Email**
   - Click "Share" button
   - Select "Email" option
   - Expected: Email client opens with pre-filled message:
     "Join Elektrum using my code TEST2025 and we both get [X] EUR discount!"

4. **Share via WhatsApp (Mobile)**
   - Open Elektrum mobile app
   - Navigate to promo code section
   - Click "Share" button
   - Select "WhatsApp"
   - Expected: WhatsApp opens with pre-filled message

**Sign-off**: [ ] Pass / [ ] Fail
**Comments**: _____________________
```

**Deliverables**:

- [ ] Integration Test Cases & Results
- [ ] Bug Triage Reports
- [ ] UAT Test Scripts
- [ ] UAT Session Notes
- [ ] UAT Sign-off Document

---

### Phase 5: Deployment & Release

**Objective**: Ensure smooth production deployment with minimal risk and clear rollback capability.

**Activities**:

1. **Release Planning**
   - Participate in deployment planning meetings
   - Validate deployment checklist completeness
   - Coordinate communication plan (customers, support team, operations)
   - Schedule deployment during low-traffic window
   - Ensure all stakeholders aware of deployment timeline

2. **Pre-Deployment Validation**
   - Verify all acceptance criteria met for release scope
   - Confirm all UAT sign-offs obtained
   - Validate database migration scripts tested on staging
   - Review rollback plan and ensure team understands procedure
   - Check monitoring and alerting configured

3. **Deployment Support**
   - Be available during deployment window (on-call)
   - Monitor deployment progress and assist with issues
   - Execute smoke tests immediately after deployment
   - Validate critical path functionality in production
   - Communicate deployment status to stakeholders

4. **Smoke Testing in Production**
   - Test promo code generation for new contract
   - Verify code display in CC&B and self-service portal
   - Test code validation API call
   - Confirm discount application works correctly
   - Check integration with mobile apps
   - Verify no regressions in existing functionality

**Deployment Checklist**:

```markdown
## Deployment Checklist: EE HH Recommendation System

### Pre-Deployment (1 day before)
- [ ] All user stories in release scope marked "Done"
- [ ] UAT sign-off obtained from Product Owner
- [ ] Database migration scripts tested on staging
- [ ] Rollback plan documented and reviewed with team
- [ ] Monitoring dashboards configured
- [ ] Communication prepared (customer announcement email, support team briefing)
- [ ] Deployment runbook reviewed with operations team

### Deployment Day
- [ ] Deployment window confirmed: [Date/Time]
- [ ] Team on-call roster confirmed
- [ ] Database backup completed
- [ ] Database migrations executed successfully
- [ ] Application deployment completed (blue-green switch)
- [ ] Smoke tests passed in production
- [ ] Monitoring shows normal system health
- [ ] Customer communication sent

### Post-Deployment (First 24 hours)
- [ ] No critical errors in logs
- [ ] System performance metrics normal
- [ ] No increase in support tickets
- [ ] Promo code generation rate as expected
- [ ] Post-deployment review meeting scheduled
```

**Deliverables**:

- [ ] Deployment Checklist (completed)
- [ ] Smoke Test Results
- [ ] Deployment Communication Log
- [ ] Rollback Plan Document

---

### Phase 6: Post-Deployment & Continuous Improvement

**Objective**: Ensure system operates reliably in production and continuously improve based on real-world usage.

**Activities**:

1. **Production Monitoring**
   - Monitor system health dashboards daily (first 2 weeks)
   - Track key metrics:
     - Promo code generation success rate (target: >99.9%)
     - Code validation API response time (target: <500ms)
     - Discount application accuracy (target: 100%)
     - System availability (target: 99.5%)
   - Review error logs and identify patterns
   - Set up alerts for anomalies (spike in failures, performance degradation)

2. **Incident Management**
   - Triage production issues reported by users or monitoring
   - Assess severity and business impact
   - Coordinate with development team on bug fixes
   - Communicate status to stakeholders (hourly for critical issues)
   - Document incident timeline and resolution
   - Conduct post-incident review (for critical/high severity)

**Incident Response Process**:

```markdown
## Incident: [Brief Description]

**Severity**: Critical / High / Medium / Low
**Detected**: [Date/Time]
**Reported By**: [User/Monitoring System]

**Impact**:
- Users affected: [Estimate]
- Business impact: [Revenue, customer satisfaction, etc.]
- Systems affected: [CC&B, Portal, Mobile]

**Timeline**:
- 10:15 - Issue detected (monitoring alert)
- 10:20 - IT Specialist notified, began investigation
- 10:35 - Root cause identified (database connection pool exhausted)
- 10:45 - Fix deployed (increased connection pool size)
- 11:00 - Monitoring confirms issue resolved
- 11:15 - Communication sent to stakeholders

**Root Cause**: Database connection pool configuration too small for production load

**Resolution**: Increased connection pool size from 20 to 50

**Prevention**: Add connection pool monitoring, set alerts at 70% utilization

**Lessons Learned**:
- Load testing should include database connection scenarios
- Production configuration should be validated against peak load projections
```

1. **Feedback Collection & Analysis**
   - Review support tickets related to promo code system
   - Analyze user feedback (surveys, feedback forms, app reviews)
   - Track business metrics (code adoption rate, usage rate, conversion)
   - Identify improvement opportunities (UX enhancements, feature gaps)
   - Prioritize feedback for next iteration

2. **Backlog Management**
   - Add enhancement requests to product backlog
   - Prioritize bugs and improvements with Product Owner
   - Groom backlog for next sprint planning
   - Document technical debt items
   - Plan future iterations (e.g., expanding to business customers)

**Deliverables**:

- [ ] Production Monitoring Reports
- [ ] Incident Response Documentation
- [ ] Enhancement Backlog (prioritized)
- [ ] Retrospective Action Items
- [ ] Operations Runbook (updated based on learnings)

---

## Cross-Functional Collaboration

The IT Specialist works closely with multiple teams:

| Team | Interaction Frequency | Key Collaboration Areas |
|------|----------------------|-------------------------|
| **Business Analysts** | Daily | Requirements clarification, user story refinement, UAT coordination |
| **CC&B Development** | Daily (during sprints) | Integration design, API contracts, database schema, technical blockers |
| **Portal Development** | Daily (during sprints) | UI/UX validation, API integration, responsive design testing |
| **Mobile Development** | Weekly | Mobile app integration, share functionality, platform-specific testing |
| **QA Team** | Daily (during testing) | Test case review, bug triage, regression testing coordination |
| **Operations/DevOps** | Weekly | Deployment planning, monitoring setup, incident response |
| **Customer Support** | Ad-hoc | Knowledge transfer, troubleshooting guidance, user issue resolution |
| **Product Owner** | Weekly (sprint ceremonies) | Backlog prioritization, acceptance decisions, roadmap planning |

---

## Key Skills & Competencies

### Technical Skills

- Understanding of web application architecture (frontend, backend, database)
- Familiarity with integration patterns (REST APIs, event-driven architecture)
- Basic knowledge of databases (SQL queries, schema design concepts)
- Awareness of security best practices (authentication, authorization, data protection)
- Experience with testing methodologies (unit, integration, E2E, UAT)

### Business Skills

- Requirements elicitation and documentation
- Business process analysis and mapping
- Stakeholder management and communication
- Risk assessment and mitigation planning
- Business case understanding (ROI, cost-benefit analysis)

### Agile Skills

- User story writing (INVEST principles, acceptance criteria)
- Sprint planning and estimation (Planning Poker, story points)
- Facilitation of Agile ceremonies (stand-ups, reviews, retrospectives)
- Backlog management and prioritization
- Continuous improvement mindset

### Soft Skills

- Communication: Clear, concise, audience-appropriate
- Collaboration: Work effectively across teams and disciplines
- Problem-solving: Analytical thinking, root cause analysis
- Adaptability: Handle changing requirements and priorities
- Attention to detail: Catch edge cases and potential issues early

---

## Success Metrics for IT Specialist Role

| Metric | Target | Measurement Method |
|--------|--------|-------------------|
| **Requirements Clarity** | <5 requirement clarifications per sprint | Sprint retrospective feedback |
| **Story Acceptance Rate** | >90% of stories accepted first time | Sprint review outcomes |
| **UAT Pass Rate** | >95% of UAT scenarios pass | UAT session results |
| **Bug Escape Rate** | <3 production bugs per sprint | Production incident tracking |
| **Stakeholder Satisfaction** | >4.0/5.0 rating | Quarterly stakeholder survey |
| **Documentation Quality** | >4.0/5.0 rating | Team feedback survey |

---

## Typical Week in the Life of IT Specialist

### Monday

- **9:00-9:15**: Daily stand-up
- **9:30-11:00**: Sprint planning (if sprint start) or backlog refinement
- **11:00-12:00**: Review new user stories with business analyst
- **14:00-16:00**: Integration testing of last sprint's features
- **16:00-17:00**: Document test results and update stories

### Tuesday

- **9:00-9:15**: Daily stand-up
- **9:30-12:00**: UAT session with business stakeholders (Sprint 2 features)
- **13:00-14:30**: Bug triage meeting with QA team
- **14:30-17:00**: Update UAT test scripts for upcoming sprint

### Wednesday

- **9:00-9:15**: Daily stand-up
- **9:30-11:00**: Technical coordination meeting with CC&B team
- **11:00-12:30**: Review API documentation and provide feedback
- **14:00-16:00**: Test promo code validation in staging environment
- **16:00-17:00**: Prepare demo for Friday's sprint review

### Thursday

- **9:00-9:15**: Daily stand-up
- **9:30-11:30**: Investigate blocker reported by developer (discount calculation issue)
- **11:30-13:00**: Coordinate with business stakeholder to clarify discount group logic
- **14:00-16:00**: Re-test after fix deployed
- **16:00-17:00**: Update documentation with clarifications

### Friday

- **9:00-9:15**: Daily stand-up
- **10:00-12:00**: Sprint review - demo completed features to stakeholders
- **13:00-14:30**: Sprint retrospective - process improvements
- **14:30-16:00**: Sprint planning prep for next sprint (review backlog, identify questions)
- **16:00-17:00**: Weekly status report to project manager

---

## Key Deliverables Summary

| Deliverable | Purpose | Audience | Frequency |
|-------------|---------|----------|-----------|
| **User Stories** | Define requirements | Development team | Every sprint |
| **Test Cases** | Ensure quality | QA team | Every sprint |
| **UAT Scripts** | Validate business needs | Business stakeholders | Per feature |
| **Deployment Checklist** | Ensure release readiness | Operations team | Per release |
| **Incident Reports** | Document and learn from issues | Management, team | Per incident |
| **Sprint Status Updates** | Track progress | Project manager, stakeholders | Weekly |
| **Operations Runbook** | Support production system | Support team | Continuously updated |

---

## Conclusion

The EE IT Specialist role is a multifaceted position requiring a blend of technical understanding, business acumen, and strong communication skills. Success in this role means:

- **Business value delivered**: Features meet stakeholder needs and drive business outcomes
- **Quality maintained**: Low defect rate, high UAT pass rate, stable production system
- **Teams enabled**: Developers have clear requirements, QA has good test cases, operations has documentation
- **Stakeholders satisfied**: Clear communication, transparency on progress and issues

The IT Specialist is not just a coordinator but an active contributor to the project's success, ensuring that the EE HH Recommendation functionality delivers on its promise of cost-effective customer acquisition through satisfied customer advocacy.

---

**Document Version**: 1.0

**Date**: October 23, 2025

**Author**: Mihkel Putrinš
