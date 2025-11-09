---
title: ENTRA.UF.1003.T01.Email - All Users should have a Capital-Initial Email Format
description: Ensures all users emails are in the correct capital-first-initial email addresses format
---
## All Users should have a Capital-Initial Email Format

### Description

All user emails must have the first character of the given name in uppercase and the first character of the last name in uppercase, with the remaining letters in lowercase.

### How to fix

Confirm with HR the correct email format for the user.

Then run:

```powershell
Update-MgUser -UserID testuser@4IoT.com -Mail "JSmith@4IoT.com"
```

### Related links

- [4IoT Email Format Requirements](https://4IoT.service-now.com/emailformat)
