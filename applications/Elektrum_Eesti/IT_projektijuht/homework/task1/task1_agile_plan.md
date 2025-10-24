# Task 1: Agile Development Plan & IT Specialist Responsibilities

Last updated: 2025-10-24T23:20:06+03:00

**Prepared for**: Elektrum Eesti OÜ - IT Projektijuht Position  
**Date**: October 23, 2025  
**Author**: Mihkel Putrinš

## Executive Summary

The EE HH Recommendation functionality represents a strategic customer acquisition initiative that leverages existing customer satisfaction to drive new contract growth. The system enables customers to share unique promo codes with prospects, creating a win-win scenario where both parties receive financial incentives when new contracts are activated.

This Agile development plan builds upon the comprehensive business requirements analysis documented in ***`business_problem_summary.md`***, which provides detailed domain terminology, complete business logic breakdown, integration point mapping, and edge case analysis.

This document outlines a structured Agile implementation approach spanning 4 sprints (8 weeks) with clear milestones, deliverables, and IT specialist responsibilities. The solution integrates with CC&B billing system, self-service portal (Elektrum.ee), Sales Portal, and mobile platforms to create a seamless user experience.

**Key Success Metrics**:

- Customer acquisition cost reduction through recommendation channel
- Promo code adoption rate among existing customers
- New customer conversion rate via promo codes
- System reliability (99.5% service availability target)

\newpage

## 1. Agile Development Plan

### Sprint 0: Planning & Foundation (Week 1)

**Objectives**:

- Finalize requirements and acceptance criteria
- Establish development environment and tools
- Create initial product backlog
- Define team structure and communication protocols

**Key Activities**:

1. **Requirements Workshop** (Days 1-2)
   - Deep-dive into specification document with business stakeholders
   - Clarify promo code generation rules and lifecycle (*`business_problem_summary.md:3.1`*)
   - Validate discount calculation logic and group definitions (*`business_problem_summary.md:3.2`*)
   - Map integration touchpoints (CC&B, portals, mobile) (*`business_problem_summary.md:4`*)
   - Document business rules and edge cases (*`business_problem_summary.md:8`*)

2. **Technical Architecture Design** (Days 2-3)
   - Database schema design (promo code storage, tracking tables)
   - API design for code generation, validation, discount application
   - Integration patterns with CC&B and portal systems
   - Security considerations (code uniqueness, validation, fraud prevention)
   - Performance planning (code lookup optimization, caching strategy)

3. **Product Backlog Creation** (Days 3-4)
   - Break down features into user stories with acceptance criteria
   - Estimate story points using Planning Poker
   - Prioritize based on business value and technical dependencies
   - Identify technical spikes for research items

4. **Team Setup** (Day 5)
   - Development environment configuration
   - CI/CD pipeline setup
   - Code repository and branching strategy
   - Testing framework initialization
   - Documentation structure

**Deliverables**:

- Requirements specification document (validated with stakeholders)
- Technical architecture diagram
- Product backlog (prioritized, estimated)
- Definition of Done criteria
- Sprint 1 commitment and plan

**IT Specialist Responsibilities in Sprint 0**:

- Lead requirements gathering sessions with business analysts
- Document functional and non-functional requirements
- Create user stories with clear acceptance criteria
- Coordinate with CC&B development team on integration approach
- Set up test environment and data

\newpage

### Sprint 1: Promo Code Generation & Storage (Weeks 2-3)

**Sprint Goal**: Enable automatic promo code generation for existing and new customers with persistence in CC&B.

**Business Value Delivered**: Existing customers receive unique shareable codes, establishing the foundation for viral customer acquisition growth.

**User Stories**:

1. **US-001**: As an existing electricity customer, I want a unique promo code automatically generated when my contract activates, so I can share it with friends.
   - **Acceptance Criteria**:
     - Code generated on contract activation event
     - Code is unique across all accounts
     - Code stored in CC&B Account -> Services tab
     - Code format: 8-character alphanumeric (e.g., "A123B456")
     - Code status: ACTIVE upon generation

2. **US-002**: As a system administrator, I want promo codes stored in CC&B with status tracking, so I can monitor code lifecycle.
   - **Acceptance Criteria**:
     - Database table created with fields: code, account_id, status, start_date, end_date, created_at
     - Indexes on code (unique) and account_id for fast lookup
     - Status values: ACTIVE, INACTIVE, EXPIRED
     - Audit trail for code status changes

3. **US-003**: As an IT specialist, I want manual promo code generation capability in CC&B, so I can handle edge cases (failed generation, code issues).
   - **Acceptance Criteria**:
     - Manual generation button in CC&B Account → Services tab
     - Validation prevents duplicate codes
     - Log entry created for manual generation (audit trail)
     - Generated code follows same format and rules as automatic

**Key Activities**:

- Database migration scripts for promo code tables
- Promo code generation service implementation (uniqueness algorithm)
- CC&B integration (event listener for contract activation)
- Manual generation UI in CC&B Services tab
- Unit tests (code generation, uniqueness validation)
- Integration tests (CC&B event handling)

**Sprint Ceremonies**: Sprint Planning (Day 1), Daily Stand-ups (15 min), Sprint Review & Retrospective (last day)

**IT Specialist Responsibilities in Sprint 1**:

- Coordinate with CC&B team on database schema changes
- Review and approve code generation algorithm (uniqueness, format)
- Test integration with CC&B contract activation events
- Document API endpoints and data structures
- Create test data for QA team
- Triage and prioritize bugs found during sprint

\newpage

### Sprint 2: Self-Service Portal & Code Display (Weeks 4-5)

**Sprint Goal**: Enable existing customers to view and share promo codes via self-service portal and mobile apps.

**Business Value Delivered**: Customers can easily discover and share their codes, activating the recommendation channel and driving word-of-mouth marketing.

**User Stories**:

1. **US-004**: As an existing customer, I want to see my promo code on Elektrum.ee self-service portal, so I know what code to share.
   - **Acceptance Criteria**:
     - Promo code displayed in customer account dashboard
     - Clear instructions on how to share code
     - "Copy to clipboard" functionality
     - Code shown with status indicator (Active/Inactive)

2. **US-005**: As an existing customer, I want a pre-filled sharing message with my code, so I can easily share via email, WhatsApp, or SMS.
   - **Acceptance Criteria**:
     - "Share" button generates pre-filled text: "Join Elektrum using my code [CODE] and we both get [X] EUR discount!"
     - Share options: email, WhatsApp, SMS, copy to clipboard
     - Share tracking (optional): log when share button is clicked
     - Works on both web (desktop/mobile) and mobile apps (Android/iOS)

**Key Activities**:

- Self-service portal UI development (React/Vue components)
- API integration with promo code service
- Mobile app updates (Android/iOS native or React Native)
- Share functionality implementation (native share APIs)
- Responsive design for mobile web
- E2E tests for portal flows

**IT Specialist Responsibilities in Sprint 2**:

- Review UI/UX designs with portal team
- Test API integration between portal and promo code service
- Coordinate mobile app updates with mobile development team
- Validate sharing functionality across platforms (web, Android, iOS)
- Test responsive design on various devices
- Document user-facing features for support team

---

### Sprint 3: Code Usage & Discount Application (Weeks 6-7)

**Sprint Goal**: Enable new customers to use promo codes during signup and automatically apply discounts to both parties.

**Business Value Delivered**: Complete conversion funnel from code sharing to new customer acquisition with automated financial incentive delivery, directly impacting customer acquisition cost and revenue growth.

\newpage

**User Stories**:

1. **US-007**: As a new customer, I want to enter a promo code when signing up via self-service, so I can get a discount.
   - **Acceptance Criteria**:
     - Promo code input field in contract signup flow
     - Real-time validation (code exists, is active)
     - Display discount amount if code is valid
     - Show error message if code is invalid/inactive
     - Promo code optional (signup works without it)

2. **US-008**: As a new customer, I want to see the discount amount before completing signup, so I know what benefit I'll receive.
   - **Acceptance Criteria**:
     - Display: "With code [CODE], you'll get [X] EUR discount"
     - Discount amount based on effective discount group at signup moment
     - Clear explanation of when discount is applied (after contract activation)

3. **US-009**: As the system, I want to automatically apply discounts to both customers when new contract activates, so the recommendation reward is processed correctly.
   - **Acceptance Criteria**:
     - Trigger: new customer contract activation event
     - Validate promo code is still active at activation
     - Apply discount to new customer account (discount group: new customer self-service, *`business_problem_summary.md:3.2`*)
     - Apply discount to existing customer account (discount group: existing customer)
     - Use "Continuous bill discount" type (as specified in LEO-25125, *`Domain_Glossary.md`*)
     - Log both discount applications for audit

4. **US-010**: As a Sales Portal employee, I want to manually enter promo codes for customers signing up via phone/office, so offline channels can also benefit.
   - **Acceptance Criteria**:
     - Promo code field in Sales Portal sales event form
     - Validation with warning (not blocking) if code inactive
     - Ability to override discount group if needed (e.g., customer started online but finished offline)
     - Discount amount displayed after code entry

**Key Activities**:

- Self-service portal signup flow updates (add promo code field)
- Promo code validation API development
- Discount application service (integration with billing system)
- Sales Portal updates (promo code field, validation)
- Business logic implementation (discount groups, effective dates)
- Automated tests for discount calculation and application

**IT Specialist Responsibilities in Sprint 3**:

- Validate discount calculation with business stakeholders (*`business_problem_summary.md:3.2`*)
- Test promo code validation across all entry points (self-service, Sales Portal)
- Verify discount application matches specification (LEO-25125 reference)
- Coordinate with billing team on "Continuous bill discount" implementation
- Test edge cases: inactive codes, expired discounts, duplicate usage, self-service failures (*`business_problem_summary.md:8`*)
- Document promo code usage flows for operations team

\newpage

### Sprint 4: Edge Cases, Reporting & Launch (Week 8)

**Sprint Goal**: Handle edge cases, implement tracking/reporting, finalize documentation, and prepare for production launch.

**Business Value Delivered**: Campaign optimization capability through analytics, fraud prevention mechanisms, and complete operational readiness for scaled deployment.

**User Stories**:

1. **US-011**: As a system administrator, I want to manually inactivate promo codes (e.g., fraud prevention), so I can block misuse.
   - **Acceptance Criteria**:
     - "Inactivate" button in CC&B for each promo code
     - Reason field required (e.g., "Suspected fraud", "Customer request")
     - Inactivated codes cannot be used for new signups
     - Existing discounts from this code remain valid
     - Audit log entry created

2. **US-012**: As a business analyst, I want a report of promo code usage (sent/used, conversion rates), so I can measure program effectiveness.
   - **Acceptance Criteria**:
     - Report shows: total codes generated, codes shared, codes used, conversion rate
     - Filter by date range, customer segment, discount group
     - Export to CSV/Excel
     - Accessible via CC&B reporting module

3. **US-013**: As a customer, I want unused discount transferred if I close my account, so I don't lose my earned rewards.
   - **Acceptance Criteria**:
     - If customer has multiple accounts, show option to transfer discount
     - Transfer to account selection (dropdown of customer's other accounts)
     - Confirmation dialog before transfer
     - Discount amount and type preserved
     - Original account discount marked as transferred (audit trail)

**Key Activities**:

- Edge case handling (contract termination, account transfers, fraud scenarios)
- Reporting dashboard development (analytics, metrics, exports)
- End-to-end testing (complete user journeys)
- User acceptance testing (UAT) with business stakeholders
- Performance testing (load test code generation, validation, discount application)
- Security audit (code guessing, brute force prevention)
- Documentation finalization (user guides, operations runbooks, API docs)
- Deployment planning (rollout strategy, rollback plan)

**IT Specialist Responsibilities in Sprint 4**:

- Coordinate UAT sessions with business users
- Document edge cases and their handling
- Create operations runbook for support team
- Prepare rollback plan if critical issues arise
- Conduct performance review and optimization
- Final sign-off on deployment readiness

\newpage

### Release & Post-Launch (Week 9+)

**Release Activities**:

1. **Deployment** (Weekend or low-traffic period)
   - Database migrations in production
   - Application deployment (blue-green or canary)
   - Smoke tests in production
   - Communication to customers (new feature announcement)

2. **Monitoring** (First 2 weeks post-launch)
   - System health metrics (uptime, response times, error rates)
   - Business metrics (code generation rate, usage rate, discount application success)
   - User feedback collection (support tickets, feedback forms)
   - Daily check-ins with operations team

3. **Retrospective** (End of Week 9)
   - What went well in the project?
   - What could be improved?
   - Lessons learned for future projects
   - Process improvements to implement

**IT Specialist Responsibilities Post-Launch**:

- Monitor system performance and error logs
- Triage production issues and coordinate fixes
- Collect and prioritize feedback for future iterations
- Document lessons learned
- Support operations team with questions/issues
- Plan next iteration (e.g., expanding to business customers, additional features)

\newpage

## 1.5 Definition of Done (DoD)

A user story is considered "Done" when all of the following criteria are met:

### Code Quality

- [ ] Code reviewed by at least one other developer
- [ ] Unit test coverage ≥ 80%
- [ ] No critical or high-severity code quality issues
- [ ] Follows team coding standards and conventions
- [ ] No hardcoded values (use configuration files)

### Functional Testing

- [ ] All acceptance criteria met and verified
- [ ] Integration tests passing (CC&B, portals, mobile)
- [ ] Manual testing completed for UI components
- [ ] Edge cases tested (*`business_problem_summary.md:8`*)
- [ ] Error handling validated (invalid codes, inactive codes, system failures)

### Documentation

- [ ] API documentation updated (endpoints, request/response formats)
- [ ] User-facing documentation written (if applicable)
- [ ] Technical design decisions documented
- [ ] Known limitations/caveats noted in release notes

### Deployment Readiness

- [ ] Feature flag configured (if needed for gradual rollout)
- [ ] Database migration scripts tested on staging
- [ ] Rollback plan documented and tested
- [ ] Monitoring/alerts configured for new functionality
- [ ] Configuration changes documented

### Stakeholder Approval

- [ ] Demo completed to Product Owner in Sprint Review
- [ ] Business analyst sign-off obtained
- [ ] UAT passed (for customer-facing features)
- [ ] No open blockers or critical bugs

\newpage

## 1.6 IT Specialist in Agile Ceremonies

### Daily Stand-up (15 min, every morning at 9:00)

**IT Specialist Participation**:

- Report progress on integration testing and coordination work
- Identify blockers (e.g., missing API documentation, delayed CC&B schema changes)
- Highlight cross-team dependencies that need attention
- Request clarifications on requirements if needed

**Example Update**:

> "Yesterday I validated the promo code validation API with the portal team. Today I'm testing discount calculation logic in the staging environment. Blocker: Waiting for CC&B team to confirm database index creation completion."

### Sprint Planning (4 hours, first day of sprint)

**IT Specialist Participation**:

- Validate technical feasibility of user stories
- Provide effort estimates for integration and coordination work
- Clarify acceptance criteria with business analyst
- Identify dependencies between stories
- Commit to testing and documentation tasks

**Responsibilities**:

- Ensure all stories have clear, testable acceptance criteria
- Flag stories that require external team coordination
- Estimate testing effort for complex integration scenarios

### Sprint Review (2 hours, last day of sprint)

**IT Specialist Participation**:

- Demo completed features to stakeholders
- Walk through acceptance criteria validation
- Gather feedback on UI/UX aspects
- Document change requests for backlog
- Present metrics (velocity, bugs found/fixed, test coverage)

**Example Demo Flow**:

1. Show promo code generated for new customer
2. Display code in CC&B Account -> Services tab
3. Demonstrate code validation API call
4. Show error handling for invalid codes

\newpage

### Sprint Retrospective (1.5 hours, last day of sprint after review)

**IT Specialist Participation**:

- Share lessons learned on CC&B integration challenges
- Propose process improvements (e.g., better API documentation practices)
- Highlight what worked well (e.g., daily sync with portal team)
- Update team working agreements if needed

**Focus Areas**:

- Communication effectiveness with external teams
- Quality of requirements and acceptance criteria
- Testing approach and coverage
- Deployment process improvements

### Backlog Refinement (2 hours, mid-sprint)

**IT Specialist Participation**:

- Break down large stories into implementable tasks
- Research technical spikes (e.g., feasibility of cross-account discount transfer)
- Update story estimates based on new information
- Add acceptance criteria details based on implementation learnings

**Preparation**:

- Review upcoming stories in backlog
- Identify questions for business stakeholders
- Research integration complexity for new features

\newpage

## 2. IT Specialist Role Summary

The IT Specialist serves as the critical bridge between business stakeholders and technical teams throughout the project lifecycle, ensuring requirements are clearly understood, solutions are correctly implemented, and quality standards are maintained.

**Role Phases Overview**:

| Phase         | Focus     | Key Activities | Timeline |
|---------------|-----------|----------------|----------|
| **Requirements** | Understanding business needs | Workshops, user story creation, integration analysis | Sprint 0 |
| **Design & Planning** | Technical coordination | Architecture review, test strategy, sprint planning | Sprint 0 - 1 |
| **Development** | Quality assurance & support | Daily coordination, requirement clarification, feature validation | Sprint 1 - 4 |
| **Testing** | Validation & UAT | Test case design, bug triage, UAT coordination | Sprint 1 - 4 |
| **Deployment** | Release management | Deployment coordination, smoke testing, rollback planning | End of Sprint 4 |
| **Handover** | Operational transition | Knowledge transfer, operations runbook, team training | Sprint 4 & Week 9 |

### Sprint-Specific Responsibilities

Throughout the 4 sprints outlined in Section 1, the IT Specialist maintains ongoing responsibilities that vary by sprint phase (detailed under each sprint above). These include:

- **Sprint 0**: Requirements gathering, user story creation, integration point analysis
- **Sprint 1**: CC&B integration coordination, database schema validation, test data creation
- **Sprint 2**: Portal/mobile UI validation, API integration testing, responsive design verification
- **Sprint 3**: Discount logic validation, promo code validation testing, edge case testing
- **Sprint 4**: UAT coordination, deployment preparation, operations runbook creation

### Detailed Role Definition

For comprehensive information about the IT Specialist role, including:

- Detailed responsibilities for each project phase
- Concrete examples (user stories, test scripts, UAT scenarios)
- Cross-functional collaboration matrix
- Skills and competencies framework
- Success metrics and KPIs
- Practical templates (deployment checklists, operations runbooks)
- "Week in the life" schedule

-> See ***`task1_it_specialist_role.md`***

This companion document provides actionable guidance on how to effectively execute the IT Specialist role, with real-world examples and templates derived from this project

\newpage

## 3. Key Success Factors

### 3.1 Communication & Collaboration

- **Stakeholder Engagement**: Regular touchpoints with business stakeholders
- **Team Coordination**: Daily communication with development, QA, and operations
- **Transparency**: Proactive communication of risks, blockers, and status changes
- **Feedback Loops**: Continuous validation of implementation vs. business expectations

### 3.2 Agile Discipline

- **Iterative Delivery**: Working software delivered every 2 weeks (sprint cadence)
- **Flexibility**: Adapt to changing requirements while maintaining sprint goals
- **Retrospectives**: Continuous process improvement based on team learnings
- **Definition of Done**: Clear quality gates ensure consistent delivery standards

### 3.3 Quality Assurance

- **Test-First Mindset**: Acceptance criteria defined before development begins
- **Multi-Layer Testing**: Unit, integration, E2E, UAT, performance testing
- **Edge Case Coverage**: Explicit handling of error scenarios and edge cases
- **Production Readiness**: Thorough validation before go-live

### 3.4 Risk Management

- **Early Identification**: Proactive risk assessment in Sprint 0 and throughout
- **Mitigation Planning**: Clear strategies for addressing identified risks
- **Contingency Plans**: Rollback and workaround procedures documented
- **Monitoring**: Post-launch monitoring to catch issues early

## 4. Conclusion

The Agile development plan outlined above provides a structured, iterative approach to delivering the EE HH Recommendation functionality. By breaking the project into 4 focused sprints with clear goals and deliverables, we ensure:

- **Business Value**: Each sprint delivers working features that can be validated with stakeholders
- **Risk Mitigation**: Early integration testing and incremental delivery reduce big-bang release risks
- **Quality**: Multi-phase testing (unit, integration, UAT) ensures robust implementation
- **Flexibility**: Agile ceremonies (sprint reviews, retrospectives) allow for course correction

The IT Specialist role is critical throughout this journey, serving as the bridge between business needs and technical implementation, ensuring requirements are clearly understood, solutions are correctly implemented, and quality standards are maintained from concept through production.

**Next Steps**:

1. Stakeholder approval of this plan
2. Team capacity planning and assignment
3. Sprint 0 kickoff and backlog refinement
4. Development environment setup
5. Sprint 1 launch (Week 2)

---

**Document Version**: 1.0  
**Date**: October 23, 2025  
**Author**: Mihkel Putrinš
