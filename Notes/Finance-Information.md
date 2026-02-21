Finance Information
===================

Point of Sale software has inherent financial implications to organisations that employ them. Notably:

- Record of sales made
  - Implication to sales ledger
  - Implication to cash day book (cash payments)
  - Implication to sales ledger control account (card payments)
  - Implication to VAT control account (if business is VAT registered)
- Record of inventory
  - Implication to calculation of inventories
    - This is done at the start and end of an accounting period (opening inventories and closing inventories).
    - Calculated at the lower of cost and net realisable value (IAS 2)
      - Cost itself is recognised either specifically, or through FIFO (First-In, First-Out).
- Cash Management
  - Discrepancies in float balances need to be accounted for
    - i.e. if float is over/under at the end of the day (income/expense will need to be recorded)

I have included accounting journals below for reference, actual accounting would be handled by other software (e.g. Sage or Xero) - our software just needs to be able to produce the numbers to put into an external system.

## Example Sale

| Item   | Net Price | VAT   | Gross Price |
|--------|-----------|-------|-------------|
| Item 1 | £10.00    | £2.00 | £12.00      |
| Item 2 | £5.00     | £1.00 | £6.00       |
| Total  | £15.00    | £3.00 | £18.00      |

Payment:
- American Express £10.00
- Cash £8.00

### Accounting journal

This would be posted soon after the sale (possibly daily, weekly, monthly), as it's useful management information - though in practice would be consolidated with other sales.

| Account                      | Description          | Debit | Credit |
|------------------------------|----------------------|-------|--------|
| Sales                        | Sale of goods        |       | 15.00  |
| VAT Control Account          | VAT on sale of goods |       | 3.00   |
| Cash                         | Cash receipts        | 8.00  |        |
| Sales Ledger Control Account | Card payments        | 10.00 |        |
|                              |                      | 18.00 | 18.00  |

There would then be a follow-up journal when the card payments are received from the payment processor:

| Account                      | Description           | Debit | Credit |
|------------------------------|-----------------------|-------|--------|
| Bank                         | Card payments         | 9.50  |        |
| Card Fees                    | Fees on card payments | 0.50  |        |
| Sales Ledger Control Account | Card payments         |       | 10.00  |
|                              |                       | 10.00 | 10.00  |

### Cost of sales calculation

Supposing the following information, but otherwise only accounting for the single sale:

- Opening inventories: £250.00
- Purchases: £0.00
- Closing inventories: £240.00

The cost of sales can be calculated to be: $250.00 + 0.00 - 240.00 = £10.00$.

## Example Cash Management

Supposing the following information:

- Opening float balance: £100.00
- Cash sales: £25.00
- Closing float balance: £124.00

The float can be seen to be under by £1.00, and therefore an expense will need to be raised for this.

| Account        | Description  | Debit | Credit |
|----------------|--------------|-------|--------|
| Cash           | Float losses |       | 1.00   |
| Cash Shortages | Float losses | 1.00  |        |
|                |              | 1.00  | 1.00   |
