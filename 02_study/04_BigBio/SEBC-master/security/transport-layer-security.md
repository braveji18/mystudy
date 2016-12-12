### <center> TLS - Transport Layer Security

* Provides over-the-wire protection 
    * Authentication
    * Message integrity
    * Data encryption
* A standard evolved from Secure Sockets Layer (SSL)
    * SSL has many well-known vulnerabilities (including POODLE)
    * TLSv1 initiated after SSLv3
    * 'SSL' is often as a synonym for TLS -- it is not!
    * TLS 1.2 is a standard([RFC 5246)(https://datatracker.ietf.org/doc/rfc5246/)]; TLS 1.3 is [s draft RFC](https://datatracker.ietf.org/doc/draft-ietf-tls-tls13/)

---

### <center> TLS Authentication

* TLS uses certificates to authenticate
* A certificate includes the owner's public key and identifying information
    * The certificate issuer (authority)
    * Date to which the certificate is deemed valid
    * Other attributes as required
* A certificate is signed by its issuer
    * Can be self-signed
    * Can be a well-known Certificate Authority (CA)
* Certificates rely on [asymmetric encryption](https://en.wikipedia.org/wiki/Public-key_cryptography) 

---

### <center> You Need A Certificate Authority (CA)

* A trusted third party between client programs and a service
    * A CA maintains its own certificate
    * A CA acts as guarantor for issuing and signing other certificates
* There are well-known public CAs such as VeriSign 
    * Expensive for casual use
* In-house certificate servers are common in large enterprises
    * MS Active Directory includes Certificate Services
    * A certificate issued from one CA to another is called an <i>intermediate certificate</i>
* A <i>root CA</i> has to use a self-signed certificate
    * Its reputation for safekeeping is its only asset

---

### <center> How Clients Establish Trust with Services

* Client A wants to negotiate a connection with Service B over TLS
* Service B owns a certificate issued by CA1
* Client  A must <i>trust</i> CA for negotiation to continue
    * Client A shows trust by keeping CA's certificate in its <i>trust store</i>
* If Service B has trust Client A for negotiation to continue, it's the same process
    * Client A trusts Service B => one-way TLS
    * Service B trusts Client A also => two-way TLS
* The Client only needs a certificate if the Service has to trust it

---

### <center> Certificate Chaining

* CA1 (root) issues a certificate to CA2 (intermediary)
* Service B gets its certificate from CA2 
* CA1 cannot verify Service B's certificate for client A
    * But Client A only has CA1 in its trust store
    * CA2 must present Client A with a chain that leads to CA1
* Service B's chain is simple: CA2 -> CA1
    * If Client trusts CA1, Service B can just present CA2's chain
    * Client trust stores in the wild (i.e., end-user browsers) contain root CA's only
    * The more intermediaries involved, the longer the chain

---

### <center> Certificate Formatting

* You can encode a certificate multiple ways
    * Binary: DER ([Distinguished Encoding Rules](http://www.planetlarg.net/encyclopedia/ssl-secure-sockets-layer/der-distinguished-encoding-rules-certificate-encoding))
    * Text: Privacy Enhanced Email (PEM): Base64 counterpart to DER
        * Exchange-friendly format 
* In EDH, Java-based services use a Java keystore (DER)
    * Default location `jre/lib/security/cacerts`
    * Other EDH services use PEM format
* The `openssl` library supports conversion between these formats
    * Java `keytool` utility works with Keystore objects

---

### <center> Getting a Certificate 

* Prepare a certificate signing request (CSR) for your chosen CA
    * Requires your private key (RSA) and identifying information
* CSR's must be Base64-encoded and must include
    * The public key associated with your private key
    * Your identifying information 
* You can self-sign your CSR (for testing and other casual use)
* The response will include your public key and the authorization attributes for your certifcate
    * `Client Auth` and `Server Auth` are expected at a minimum
* Some CAs provide templates for common authorization needs

---

### <center> What about Encryption or Integrity Checking?

* EDH uses TLS for authentication only
    * Asymmetric encryption is too expensive for data transfer
    * Also slower and less secure than alternatives
* TLS is used to create and encrypt symmetric keys to encrypt session data
    * AES is the most common symmetric key encryption suite
    * The symmetric key is negotiated between Client and Server
    * The <i>digest</i> for integrity checks is also negotiated (e.g., SHA-256)

---

### <center> Tools to Remember

* Use `openssl s_client ...` to test connections
    * Is the server endpoint using TLS?
    * Is there a certificate chain provided?
    * Would I accept the server's certificate?
    * Can I import the certificates into my trust store?
* Java `keytool`
    * To add/remove/modify content from the keystore
    * To verify the password that protects the keystore

---

### <center> Performance Cost

* Encryption is compute-intensive
* The `openssl` libraries use AES-NI natively
    * EDH uses the `openssl-devel` package to access it (kinda)
    * TLS uses AES for encryption
* Use the command `hadoop checknative` to see which `openssl` libraries you have
* Strong encryption relies on system-generated entropy
    * Bare metal servers probably have the entropy power you need 
    * Install `rng-tools` if the CPU supports Intel RDRAND
    * Otherwise, install `haveged` from the EPEL repo 

---

### <center> Putting It All To Use

* Cloudera Manager offers three progressive levels of TLS integration
    * Level 1: wire encrpytion between agents and server (no authenetication)
    * Level 2: agents validate the server (one-way trust)
    * Level 3: server validates agents (two-way trust)
* Best practice: enable TLS before integrating Kerberos
    * This provides protection for keytab files in transit
* EDH components that use TLS
    * Navigator & HUE web UIs
    * Hive & Impala (secure JDBC/ODBC access)
    * Oozie
    * Hadoop web UIs, MapReduce shuffling

---

### <center> Ben's Lab Environment

* Use the domain `CLOUDERA.LOCAL`
* Centrify is installed on clusters and nodes are AD-registered
* All required certificates available in `/opt/cloudera/security`
* Your PEM key password is `cloudera`
* Anything else that needs a password, `Cloudera!` should work
* All private keys for server certificates are PEM-encoded
* Use public documentation to enable TLS levels 1, 2, and 3 for CM
* Remember you can check certificates with `openssl s_client ...`

---

### <center> Should you run out of things to do

* Enable Active Directory LDAPS authentication
    * Cloudera Manager
    * Cloudera Navigator
    * HUE
    * Impala
* Enable spill encryption for Impala
* Enable Sentry and configure roles for Alice and Bob
* Enable HDFS RPC Encryption and DataNode transfer encryption

