# Business Problem Summary: EE HH Recommendation System

Last updated: 2025-10-23T15:47:57+03:00

**Date**: October 23, 2025  
**Project**: Elektrum Estonia Household Customer Acquisition  
**Document Purpose**: Clear explanation of business problem for IT implementation planning

**Domain Terminology**: See [Domain_Glossary.md](Companion%20Documents/Domain_Glossary.md) for acronyms and key terms

---

## 1. The Core Business Challenge

### Current Situation

- Estonia household (HH) electricity market is competitive
- Customer acquisition through traditional sales channels is expensive
- Self-service platform (Elektrum.ee) already operational and successful
- Need more attractions to drive self-service adoption (cheapest acquisition channel)

### The Opportunity

Elektrum has **over 1000 self-service agreements signed** in a short period, proving customers are willing to sign up without sales assistance. The business wants to **amplify this success** by turning existing satisfied customers into brand ambassadors.

---

## 2. The Solution: Referral/Recommendation Program

### How It Works (Like Wolt/Bolt)

**Step 1: Existing Customer Gets Promo Code**  

- Customer "Mihkel" has active electricity contract with Elektrum
- System generates unique promo code: `MIHKEL2025`
- Mihkel sees this code in:
  - CC&B billing system (for Elektrum staff)
  - Elektrum.ee self-service portal (for Mihkel)
  - Mobile app (Android/iOS)
- Code is **shareable** with predefined text and link

**Step 2: Mihkel Shares with Friends**  

- Tells colleague: "Use my code MIHKEL2025 when signing up with Elektrum"
- Colleague clicks shared link or manually enters code in self-service
- System validates: Is code valid? Is it active?

**Step 3: New Customer Signs Up**  

- Colleague enters `MIHKEL2025` during contract signup
- Sees discount amount displayed: "You'll get €7 discount!"
- Completes contract with start date (e.g., April 1)
- Contract must **activate** before discounts apply

**Step 4: Contract Activates -> Discounts Applied**  

- When contract enters into force (becomes active)
- System automatically applies:
  - **€10-15 discount** to Mihkel's account (referrer)
  - **€7-12 discount** to colleague's account (new customer)
- Both discounts added as "Continuous bill discount" (applied to future bills)

**Step 5: Repeat**  

- Mihkel can share code with unlimited people
- Gets discount **every single time** someone uses his code and activates
- Example: 10 successful referrals = 10 × €10-15 = €100-150 in discounts for Mihkel!

---

## 3. Business Rules & Logic

### 3.1 Promo Code Lifecycle

```text
Generate → Active → Used → Discount Applied
    ↓
Inactive (if contract terminated or manually disabled)
```

**Generation**:

- **Existing customers**: All current electricity customers get code immediately
- **New customers**: Code generated when they sign contract (active when contract activates)
- **Ex-customers**: If they return, new code generated automatically
- **Manual override**: Staff can generate code manually in CC&B if auto-generation fails

**Duration**:

- Active as long as customer has active electricity/gas contract
- Becomes inactive when contract terminates
- Can be manually inactivated (e.g., if used for fraud)
- If customer has multiple codes, only one can be active at a time (no overlapping periods)
  
  > **Likely Business Motivations:**
  > - Simplifies tracking and prevents system gaming
  > - Ensures fair referral distribution across customers
  > - Maintains financial sustainability of the program
  > - Reduces technical complexity
  > - Allows quick response to suspicious activity, protecting program integrity
  >
  > **Devil's Advocate Perspective:**
  > - May frustrate power users and reduce total referral volume
  > - Creates operational overhead and potential for arbitrary enforcement
  > - Competitors with more flexible referral programs could have advantage
  > - Automated fraud detection might be more effective than manual intervention
  > - Multiple concurrent campaigns with different codes could drive higher engagement

**Validation**:

- When new customer enters code, system checks:
  - Does code exist?
  - Is code currently active?
  - If invalid: Show error message "Code cannot be used"
  - If valid: Show discount amount and accept signup

### 3.2 Discount Amounts (Three Groups)

The discount is a **fixed EUR amount** (not per kWh), organized into 3 groups:

| Group | Who Gets It                          | Amount |
| ----- | ------------------------------------ | ------ |
| 1     | Existing customer (referrer)         | €10    |
| 2     | New customer (referee, self-service) | €7     |
| 3     | New customer (referee, manual)       | €6     |

**Key Rules**:

- Discount amount is **effective at contract concluding moment** (not start date!)
- Business can change amounts over time with effective periods
- Each group can have different amounts and effective periods
- No overlap within same group, but groups can overlap

**Example Timeline**:

```text
Jan 2021: Referrer €10, New customer €7
Mar 2021: Referrer changes to €15 (new gets stays €7)
Apr 2021: New customer changes to €12

Timeline:
Jan 15: New customer B signs → Referrer gets €10, B gets €7
Feb 10: New customer C signs → Referrer gets €10, C gets €7
Mar 20: New customer D signs → Referrer gets €15, D gets €7
May 05: New customer E signs → Referrer gets €15, E gets €12
```

### 3.3 When Discounts Are Applied

**Critical Rule**: Discount applied only when **new customer's contract activates** (enters into force)

**NOT applied**:

- When contract is signed (only recorded)
- If new customer never activates contract
- If existing customer adds service to current contract (code only for NEW customers)

**Process Flow**:

1. New customer signs contract with promo code on **January 15**
2. Contract has start date **February 1**
3. Contract activates on **February 1**
4. **On February 1** -> System automatically:
   - Adds discount to referrer's account
   - Adds discount to new customer's account
   - Both applied as "Continuous bill discount" type

---

## 4. Integration Points

### Systems Involved

**CC&B (Customer Care & Billing)**:

- Core billing system
- Stores promo codes, tracks usage
- Displays code info: code, start/end date, status
- Manual code generation capability
- Discount application and tracking

**Elektrum.ee Self-Service Portal**:

- Customer-facing web portal
- Displays promo code to existing customers
- Shareable with predefined text + link
- New customers enter code during signup
- Shows discount amount to new customer
- Validates code in real-time

**Sales Portal**:

- Used by Elektrum sales staff
- Manual promo code entry for phone/in-person sales
- Discount amount display
- Validation warnings (not blocking)
- Special handling for cases when self-service fails

**Mobile Apps (Android/iOS)**:

- Display promo code
- Share functionality
- Code must be usable on mobile

**Case Management (LT-SUPCRQ)**:

- "Supplier Change Request" cases
- If self-service signup fails -> creates case
- Promo code and discount amount must transfer to case
- New characteristics needed: "Promo code", "Discount amount"

---

## 5. User Stories

### For Existing Customers (Referrers)

**Story 1**: As an existing customer, I want to see my promo code in self-service portal so I can easily share it with friends.

**Story 2**: As an existing customer, I want to share my code with a link and predefined text so sharing is quick and professional.

**Story 3**: As an existing customer, I want to see how many times my code was used and how much discount I've earned so I'm motivated to share more.

### For New Customers (Referees)

**Story 4**: As a potential customer, I want to enter a promo code during signup so I can get the discount my friend told me about.

**Story 5**: As a potential customer, I want to see immediately if my promo code is valid and how much discount I'll get so I know the deal is real.

**Story 6**: As a new customer, I want my discount applied automatically when my contract starts so I don't have to follow up.

### For Sales Staff

**Story 7**: As a sales agent, I want to manually enter promo codes for customers calling by phone so they can get referral discounts even without using self-service.

**Story 8**: As a sales agent, I want to see a warning if a promo code is inactive so I can explain to customer or find alternative.

**Story 9**: As a sales agent, I want to override discount group when finishing a case that started in self-service so customer gets the self-service discount amount they expected.

### For System Administrators

**Story 10**: As an admin, I want to manually generate or inactivate promo codes so I can handle edge cases and fraud prevention.

**Story 11**: As an admin, I want to configure discount amounts with effective periods so we can adjust incentives based on market conditions.

**Story 12**: As an admin, I want to export reports on promo code usage (Sent/Used) so I can measure campaign effectiveness.

---

## 6. Success Metrics

**Customer Acquisition**:

- Number of new contracts via promo codes (target: 20% of all new signups)
- Customer acquisition cost reduction (benchmark: traditional sales channel cost)
- Self-service conversion rate increase

**Engagement**:

- % of customers who share their promo code (target: 30%)
- Average referrals per active referrer (target: 2-3)
- Code usage rate (used codes / shared codes)

**Technical**:

- System availability: 99.5%
- Code validation response time: <500ms
- Discount application accuracy: 100%

**Financial**:

- Total discount liability (budget management)
- Customer lifetime value of referred customers vs. traditional
- Return on investment: acquisition cost vs. discount cost

---

## 7. Future Expansion Plans

**Phase 2 (mentioned in spec)**:

- Solar panel/park sales
- Other products
- Business customers (micro BUS segment)
- Gas customers

**Implication**: System must be flexible and configurable for different product types and customer segments.

---

## 8. Edge Cases & Special Scenarios

### Scenario 1: Self-Service Failure

- Customer starts signup in self-service with promo code
- Technical issue -> Case LT-SUPCRQ created
- Sales agent finishes in Sales Portal days later
- **Problem**: Code might be inactive now, or discount amount changed
- **Solution**: Sales Portal allows using inactive code and discount amount that was valid at original signup moment

### Scenario 2: Early Termination

- New customer gets €7 discount, uses €3, then terminates contract
- **Current**: Early termination fee will be added manually
- **Future CR**: Automated early termination fee calculation

### Scenario 3: Customer Has Multiple Accounts

- Customer can transfer unused discount to another account if contract terminates
- Prevents losing earned discount value

### Scenario 4: Ex-Customer Returns

- Had promo code "ABC123" (now inactive)
- Signs new contract
- **Action**: New unique promo code generated automatically

### Scenario 5: Fraud Prevention

- Code "XYZ789" is being used inappropriately
- **Action**: Admin manually inactivates code with end date
- No new code generated automatically

---

## 9. Technical Requirements Summary

**Core Functionality**:

- Unique promo code generation algorithm
- Code lifecycle management (active/inactive states)
- Real-time validation API
- Discount calculation engine with configurable amounts
- Discount application integration with billing system

**Data Storage**:

- Promo code table (code, account_id, start_date, end_date, status)
- Referral transaction table (transaction_id, code, referrer_account, referee_account, locked_discount_amounts, contract_concluded_date, contract_activation_date, status)
- Discount configuration (group, amount, effective_from, effective_to)

**Integration APIs**:

- CC&B <-> Self-Service Portal
- CC&B <-> Sales Portal
- CC&B <-> Mobile Apps
- CC&B <-> Case Management

**Reporting**:

- Promo code usage statistics
- Discount liability tracking
- Campaign effectiveness metrics
- Export functionality

**Security**:

- Code uniqueness enforcement
- Validation to prevent double-use within same timeframe
- Fraud detection (usage patterns)
- Audit trail for manual interventions

---

## 10. Why This Matters

**Customer Perspective**:

- Save money on electricity
- Help friends save money
- Feel valued as brand ambassador
- Simple, transparent process

**Business Perspective**:

- Lowest cost customer acquisition channel (no sales staff needed)
- Leverage satisfied customer base
- Scalable growth mechanism
- Competitive advantage in open market
- Data-driven campaign optimization

**Market Context**:

- EE (Estonia) household electricity market recently opened/competitive
- Self-service trend proven successful (1000+ signups)
- Need to maintain competitiveness vs. other providers
- Customer recommendations are trusted more than advertising
