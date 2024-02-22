# Subject: Kerberoasting

## Description:

- Kerberoasting is a method used to exploit weaknesses in the Kerberos authentication protocol, targeting service accounts with weak or easily guessable passwords.
- It involves stealing Ticket Granting Service (TGS) tickets and cracking them offline to obtain service account credentials.
- Once compromised, these credentials can be used to authenticate to services and potentially gain unauthorized access within the network.

## Requirements:

- Access to a domain-joined machine within the target network.
- Knowledge of valid domain user credentials or access to the system where service tickets are stored (e.g., domain controller or domain-joined machine with sufficient privileges).

## Execution:

### Tools:
- Various tools can be used to perform Kerberoasting, including:
  - PowerSploit: A PowerShell script used to extract service tickets.
  - Rubeus: A C# tool for performing Kerberos attacks, including Kerberoasting.
  - Impacket: A collection of Python scripts that can be used to interact with the Kerberos protocol.

### Techniques:
- Identify target service accounts: Determine which service accounts are vulnerable to Kerberoasting. These are typically accounts associated with services running within the domain.
- Request TGS tickets: Use tools like PowerSploit or Rubeus to request TGS tickets for the target service accounts without authenticating as the legitimate user.
- Crack TGS tickets: Extract the encrypted service tickets and attempt to crack them offline using password cracking tools like Hashcat or John the Ripper.
- Authenticate to services: Once the service account credentials are obtained, authenticate to services using the compromised credentials to gain unauthorized access within the network.
