# Domain Glossary - EE HH Recommendation System

Last updated: 2025-10-23T15:47:57+03:00

**Project**: Elektrum Estonia Household Customer Acquisition  
**Purpose**: Domain terminology and acronyms reference  
**Date**: October 23, 2025

---

## Acronyms & Terms

| Term | Full Name | Explanation |
|------|-----------|-------------|
| **EE** | Estonia (Eesti) | Country code for Estonia market |
| **HH** | Household | Residential customers (vs. business customers) |
| **CC&B** | Customer Care & Billing | Core billing system being enhanced with this project; stores customer data, contracts, billing; new functionality will add promo codes and referral tracking |
| **LT-SUPCRQ** | Supplier Change Request | Case type created when self-service signup fails and needs manual completion |
| **BUS** | Business | Business customers segment (vs. household) |
| **API** | Application Programming Interface | Technical connection between systems for data exchange |
| **Elektrum.ee** | - | Self-service web portal where customers manage their accounts and sign contracts |
| **Sales Portal** | - | Internal tool used by Elektrum sales staff for manual contract processing |
| **Promo Code** | Promotional Code | Unique referral code (e.g., "MIHKEL2025") used to track and reward recommendations |
| **Referrer** | - | aka **Existing customer** who shares their promo code with others |
| **Referee** | - | aka **New customer** who uses someone's promo code to get a discount |
| **Referral Transaction** | - | Complete event: Referrer shares code -> Referee signs contract (discount amounts locked) -> Contract activates (discounts applied to both accounts) |
| **Contract Activation** | - | When electricity supply actually starts (not just when contract is signed) |
| **Continuous Bill Discount** | - | Discount type that applies one-time lump sum to customer account; automatically deducts from this pool with each bill until fully consumed |
| **LEO-25125** | - | Reference implementation: Existing "Discount functionality for LT PRI and MICRO BUS customers" that defines how Continuous Bill Discount works technically in CC&B (Note: Internal documentation not accessible for this analysis) |

---

**Version**: 1.0 | **Date**: October 23, 2025
