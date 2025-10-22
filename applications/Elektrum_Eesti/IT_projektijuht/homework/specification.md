---

**Akciju sabiedrība "Latvenergo"**  
**Projekts "CC&B attīstība un uzturēšana"**

---

# EE HH Recommendation functionality with PROMO code

Last updated: 2025-10-22T14:16:54+03:00

**prasību specifikācija**:

_Versija 1.0. 19.02.2021._

**Apstiprināts:**

---

---

---

---

**Izmaiņu vēsture**:

| Versija | Datums     | Apraksts      | Autors |
| :------ | :--------- | :------------ | :----- |
| **1.0** | 19.02.2021 | Pirmā versija |        |

**Saistītie dokumenti**:

| Dokumenta nosaukums | Apraksts |
| :------------------ | :------- |
|                     |          |

**Saīsinājumi**:

| Saīsinājums | Skaidrojums |
| :---------- | :---------- |
|             |             |

---

## Saturs

- [EE HH Recommendation functionality with PROMO code](#ee-hh-recommendation-functionality-with-promo-code)
  - [Saturs](#saturs)
  - [1. Biznesa prasības (LE bizness – tiek aizpildīts pieprasījuma pieteikšanas brīdī)](#1-biznesa-prasības-le-bizness--tiek-aizpildīts-pieprasījuma-pieteikšanas-brīdī)
    - [1.1 Problēmas apraksts\*](#11-problēmas-apraksts)
    - [1.2 Izmaiņu mērķis un pamatojums\*](#12-izmaiņu-mērķis-un-pamatojums)
    - [1.3 Biznesa procesa shēma](#13-biznesa-procesa-shēma)
      - [Promo code](#promo-code)
      - [Discount of recommendation](#discount-of-recommendation)
    - [1.4 Ietekme\*](#14-ietekme)
    - [1.5 Ierobežojumi / pieņēmumi](#15-ierobežojumi--pieņēmumi)
    - [1.6 Riski](#16-riski)
  - [2. Prasības risinājumam (LE bizness + IT – tiek aizpildīts pēc LE IT novērtēšanas)\*](#2-prasības-risinājumam-le-bizness--it--tiek-aizpildīts-pēc-le-it-novērtēšanas)
    - [2.1 Nepieciešamas funkcionalitātes makets](#21-nepieciešamas-funkcionalitātes-makets)
  - [3. Tehniskā specifikācija (TL)\*](#3-tehniskā-specifikācija-tl)
    - [3.1 Risinājuma apraksts (tiek iesniegts kopā ar TL novērtējumu)](#31-risinājuma-apraksts-tiek-iesniegts-kopā-ar-tl-novērtējumu)
    - [3.2 Ierobežojumi un pieņēmumi](#32-ierobežojumi-un-pieņēmumi)
    - [3.3 Sistēmas komponenšu dizains (CC\&B objekti, DB objekti, Procesi) (tiek aizpildīts pēc TL izstrādes realizācijas)](#33-sistēmas-komponenšu-dizains-ccb-objekti-db-objekti-procesi-tiek-aizpildīts-pēc-tl-izstrādes-realizācijas)
    - [3.4 Sistēmas konfigurācija (tiek aizpildīts pēc TL izstrādes realizācijas)](#34-sistēmas-konfigurācija-tiek-aizpildīts-pēc-tl-izstrādes-realizācijas)
  - [4. Testa piemēri (LE bizness, papildina IT un TL)\*](#4-testa-piemēri-le-bizness-papildina-it-un-tl)
  - [5. Atvērtie un atrisinātie jautājumi](#5-atvērtie-un-atrisinātie-jautājumi)
    - [5.1 Atvērtie jautājumi](#51-atvērtie-jautājumi)
    - [5.2 Atrisinātie jautājumi](#52-atrisinātie-jautājumi)

_\*Obligāti aizpildāma sadaļa_

---

---

## 1. Biznesa prasības (LE bizness – tiek aizpildīts pieprasījuma pieteikšanas brīdī)

### 1.1 Problēmas apraksts\*

EE self-service platform is planned to be used for client acquisition since during a short period of time we have over 1000 agreements signed by customers themselves. More options and attractions for this channel are needed, since it does not need any back office or sales managers assistance and it will be the cheapest way to extend the number of customers that we have.

Recommendation process is:

- Cheapest owned client acquisition channel;
- Enabling existing customers to become brand ambassadors;
- Ability to work with external sales channels.

This will be used for private electricity sales but later it will be adapted to solar panel/park sales and other products, so since it will be developed it will be used all the time as a steady channel.

### 1.2 Izmaiņu mērķis un pamatojums\*

EE HH market opening and to ensure Elektrum competitiveness in the HH electricity market, meeting customer needs.

### 1.3 Biznesa procesa shēma

#### Promo code

All customers should have unique promo code, that will be used for customer acquisition – existing customer will share his promo code to potential customers and recommend Elektrum services. When potential new customer becomes Elektrum customer, then both existing and new customer gets discount in his account.

Initially functionality is planned to be used for private electricity customers, but in the future it is planned to use it also to be used also for electricity & gas business customers (mostly micro BUS customers).

For example, similar functionality is used with such services as Wolt, Bolt etc.

Example of promo code in Wolt app:

**Promo code for existing Elektrum customer**  

Promo code for existing customer should be on account level, customer can collect discounts by recommendations for each account separately. There should be unique promo code for each account.

**Promo code generation**  

Initially unique promo code should be generated to all existing electricity private customers with active contract. In the future also to electricity & gas micro BUS customers.

For new customers promo code should be generated, when customer conclude agreement with us, promo code is active when contract is activated/ enters into force.

If ex-customer renews contract with Electrum, new promo code should be generated automatically.

There should also be possibility to generate promo code for customer account manually in CC&B, for example in case if something goes wrong and promo code is not generated automatically, or generated promo code is not working.

**Duration of promo code:**

- Promo code is open ended and should be active as long as customer has active electricity/gas contract with Elektrum;
- after customer terminates contract with us, promo code becomes inactive;
- there should also be possibility to add end date and inactivate promo code before contract is terminated. For example, if promo code is used for some malicious purposes.
- If customer has more than one promo code in one account, then effective period of codes can't overlap, only one promo code can be active in period.

When promo code is inactivated, new promo code should not be generated automatically, except if ex-customer renews contract with Electrum.

**Info of promo code in CC&B and self service**  

In CC&B should be displayed Promo code of existing customer, start and end date of promo code, status of promo code. Please IT to evaluate where this information could be displayed, based on possible technical solution. From business perspective as we see it, this information could be stored in Account → Services tab.

Promo code of existing customer should be displayed in self-service portal Elektrum.ee. Code in self-service should be sharable with predefined text and link to self-service. Also, should be usable on Android and iOS mobile operating systems with generated text and code / link.

There should be ability to track the recommendation - Sent / Used, export report.

**Promo code usage by new customer**  

Promo code can be used only by new customers, who are concluding contract with Elektrum. If existing customer is doing something with active contract (for example adding new objects to contract or change product), promo code can't be used to get discount

**Self-service portal**  
New customer adds promo code (that was shared by existing customer) in self-service portal when he concludes electricity contract with Elektrum. It should be possible to display discount amount (effective at contract concluding moment) for customer.

When promo code is entered in self-service portal, validation should be done of promo code status and if such promo code exists at all. If promo code doesn’t exist or is inactive, informative message should be displayed for customer in self-service portal, that promo code can't be used to get discount.

Used promo code (if it was valid at contract concluding moment) and discount amount (effective at contract concluding moment) should be displayed also in Sales Portal sales event.

If something goes wrong with contract concluding and Case LT-SUPCRQ " Supplier Change Request" is created, promo code (if it was valid at contract concluding moment) that new customer was using in contract concluding and discount amount (effective at contract concluding moment) should be added to Case. For case new characteristics "Promo code" and "Discount amount" should be created.

**Sales Portal**  
There should also be possibility to add promo code in Sales Portal sales event manually before contract is activated.  
After contract is already active, promo code can't be used to get discount.

After promo code is entered in Sales Portal, discount amount should be displayed in sales event.

When promo code is entered in Sales Portal manually, validation should be done of promo code status. If promo code is inactive, warning message should be displayed for employee, that promo code is inactive.

Exceptions should be provided, for example, when promo code was active and/or discount amount effective at contract concluding moment in self-service portal, but Case LT-SUPCRQ was created and employee finishes contract concluding in Sales Portal later, when promo code is not active and/or discount amount is not effective anymore. In such cases in Sales portal it should be possible to conclude contract manually with inactive promo code and/or discount amount, that was effective at actual contract concluding moment (when customer started contract conluding in self-service portal).

#### Discount of recommendation

**Amount of discount**  

Discount amount is fixed amount in EUR. Discount for kWh will not be used with discount of recommendation.

Initially discount amount could be divided in three "discount amount groups"

- for existing customer (who shared promo code);
- for new customer (who used promo code) there could be different amount depending on sales channel
  - one amount if contract is concluded in self-service portal by customer himself;
  - different amount if contract is concluded by employee manually.

In Sales Portal sales event it should be possible to change "discount amount group". By default, "discount amount group" should be displayed according to sales event creator (customer in self-service portal or employee in CC\&B or electrum portal). But, for example, in scenario, when customer couldn't finish contract concluding in self-service portal and Case in CC\&B was created, it should be possible for employee to change "discount amount group" as customer would have concluded contract by himself.

Should provide possibility to edit "discount amount groups" – add new groups, disable existing groups etc.

It should be possible to enter discount amount and discount effective period for each "discount amount group" –

- each "discount amount group" could have different discount amount;
- all customers in one "discount amount group" at same effective period will have one discount amount,
- discount amount should be effective at contract concluding moment (not at contract start date or contract activization date),
- effective period of discount amount can't overlap within one discount amount group,
- for each "discount amount group" period of discount amount can be different, but also can overlap.

**Example**  

- for existing customers discount amount is 10 EUR, effective from 01.01.2021
- for new customers discount amount is 7 EUR, effective 01.01.2021

After some time, situation in market is changed and discount amount is changed

- for existing customers discount amount is 15EUR, effective from 01.03.2021
- for new customers discount amount is 12 EUR, effective 01.04.2021

Customer A shared his promo code "A123"

1. New customer B concluded contract in January by using promo code "A123" with contract start date 01.02.2021 → Customer A gets discount 10 EUR and customer B gets discount 7 EUR.
2. New customer C concluded contact in January by using promo code "A123" with contract start date 01.03.2021 → Customer A gets discount 10 EUR and customer B gets discount 7 EUR.
3. Another customer D concluded contact in March by using promo code "A123" with contract start date 01.04.2021 → Customer A gets discount 15 EUR and customer B gets discount 7 EUR.
4. Another customer E concluded contact in April by using promo code "A123" with contract start date 01.05.2021 → Customer A gets discount 15 EUR and customer B gets discount 12 EUR.

**Process of applying discount**  

Discount for existing customer (who shared promo code) and for new customer (who used promo code) should automatically be applied only when contract of new customer is activated (enter into force).

There should be no limitations on how many times one promo code is used. Existing customer gets discount each time, when promo code is used, and contract of new customer is activated. For existing customer all discounts of recommendations should be summed up and there is no limited period when discount should be used.

For both existing and new customer should be applied discount type "Continuous bill discount". Functionality how discount should be applied on bill is the same as described and implemented in LEO-25125 "Discount functionality for LT PRI and MICRO BUS customers".

If new customer terminates agreement, existing customer keeps discount of recommendations, that is already applied (also unused part) to his contract.

For customer (existing and new) it should be possible to transfer unused discount amount to another account of same customer, if contract in account, where discount was applied initially, is terminated.

If customer will have to pay back recommendation discount, in case if contract is terminated before end date, from the beginning early termination fee will be added manually. Separate CR will be created to automatize early termination fee functionality in the future.

### 1.4 Ietekme\*

### 1.5 Ierobežojumi / pieņēmumi

### 1.6 Riski

---

## 2. Prasības risinājumam (LE bizness + IT – tiek aizpildīts pēc LE IT novērtēšanas)\*

| #Nr.  | Tips            | Prasība |     |
| :---- | :-------------- | :------ | :-- |
| 001   | Biznesa prasība |         |     |
| 001.1 | Teh. prasība    |         |     |
| 002   | Biznesa prasība |         |     |
| 003   | Biznesa prasība |         |     |
|       |                 |         |     |

### 2.1 Nepieciešamas funkcionalitātes makets

---

## 3. Tehniskā specifikācija (TL)\*

### 3.1 Risinājuma apraksts (tiek iesniegts kopā ar TL novērtējumu)

### 3.2 Ierobežojumi un pieņēmumi

### 3.3 Sistēmas komponenšu dizains (CC&B objekti, DB objekti, Procesi) (tiek aizpildīts pēc TL izstrādes realizācijas)

### 3.4 Sistēmas konfigurācija (tiek aizpildīts pēc TL izstrādes realizācijas)

---

## 4. Testa piemēri (LE bizness, papildina IT un TL)\*

| Nr. | Testa scenārijs | Rezultāts |
| :-: | --------------- | --------- |
| 1.  |                 |           |
| 2.  |                 |           |
| 3.  |                 |           |
| 4.  |                 |           |
| 5.  |                 |           |
| 6.  |                 |           |
| 7.  |                 |           |
| 8.  |                 |           |
|     |                 |           |
|     |                 |           |

Primāri aizpilda LE bizness (notiek kontekstā ar biznesa prasībām). LE IT un TL papildina no tehniskas puses.

---

## 5. Atvērtie un atrisinātie jautājumi

### 5.1 Atvērtie jautājumi

| Nr. | Jautājums | Risinājums | Atbildīgais | Plānotais risinājuma datums |
| --- | --------- | :--------: | :---------: | :-------------------------: |
|     |           |            |             |                             |
|     |           |            |             |                             |
|     |           |            |             |                             |
|     |           |            |             |                             |
|     |           |            |             |                             |
|     |           |            |             |                             |
|     |           |            |             |                             |
|     |           |            |             |                             |

### 5.2 Atrisinātie jautājumi

| Nr. | Jautājums | Risinājums | Atbildīgais | Plānotais risinājuma datums |
| :-: | --------- | ---------- | ----------- | --------------------------- |
|     |           |            |             |                             |
|     |           |            |             |                             |
|     |           |            |             |                             |
|     |           |            |             |                             |
