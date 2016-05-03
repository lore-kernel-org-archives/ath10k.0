Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-he1eur01on0058.outbound.protection.outlook.com
 ([104.47.0.58] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axaFj-0007ZS-Hk
 for ath10k@lists.infradead.org; Tue, 03 May 2016 13:20:40 +0000
Subject: Re: [Codel] fq_codel_drop vs a udp flood
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
 <1462125592.5535.194.camel@edumazet-glaptop3.roam.corp.google.com>
 <865DA393-262D-40B6-A9D3-1B978CD5F6C6@gmail.com>
 <CAA93jw6WKyWmgzni1Tn0oQfJyN7hss++MKLkJ8+3sRcVLu7krg@mail.gmail.com>
From: Kevin Darbyshire-Bryant <kevin@darbyshire-bryant.me.uk>
Message-ID: <5728A589.6010107@darbyshire-bryant.me.uk>
Date: Tue, 3 May 2016 14:20:09 +0100
MIME-Version: 1.0
In-Reply-To: <CAA93jw6WKyWmgzni1Tn0oQfJyN7hss++MKLkJ8+3sRcVLu7krg@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3512072735359589560=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

--===============3512072735359589560==
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-512; boundary="------------ms050707070801010005080205"

--------------ms050707070801010005080205
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 03/05/16 03:26, Dave Taht wrote:
> On Sun, May 1, 2016 at 11:20 AM, Jonathan Morton <chromatix99@gmail.com=
> wrote:
>>> On 1 May, 2016, at 20:59, Eric Dumazet <eric.dumazet@gmail.com> wrote=
:
>>>
>>> fq_codel_drop() could drop _all_ packets of the fat flow, instead of =
a
>>> single one.
>> Unfortunately, that could have bad consequences if the =E2=80=9Cfat fl=
ow=E2=80=9D happens to be a TCP in slow-start on a long-RTT path.  Such a=
 flow is responsive, but on an order-magnitude longer timescale than may =
have been configured as optimum.
>>
>> The real problem is that fq_codel_drop() performs the same (excessive)=
 amount of work to cope with a single unresponsive flow as it would for a=
 true DDoS.  Optimising the search function is sufficient.
> Don't think so.
>
> I did some tests today,  (not the fq_codel batch drop patch yet)
>
>
> As for cake struggling to cope:
>
> root@apu2:/home/d/git/tc-adv/tc# ./tc -s qdisc show dev enp2s0
>
> qdisc cake 8018: root refcnt 9 bandwidth 100Mbit diffserv4 flows rtt 10=
0.0ms raw
>  Sent 219736818 bytes 157121 pkt (dropped 989289, overlimits 1152272 re=
queues 0)
>  backlog 449646b 319p requeues 0
>  memory used: 2658432b of 5000000b
>  capacity estimate: 100Mbit
>              Bulk    Best Effort     Video       Voice
>   thresh       100Mbit   93750Kbit      75Mbit      25Mbit
>   target         5.0ms       5.0ms       5.0ms       5.0ms
>   interval     100.0ms     100.0ms     100.0ms     100.0ms
>   pk_delay         0us       5.2ms        92us        48us
>   av_delay         0us       5.1ms         4us         2us
>   sp_delay         0us       5.0ms         4us         2us
>   pkts               0     1146649          31          49
>   bytes              0  1607004053        2258        8779
>   way_inds           0           0           0           0
>   way_miss           0          15           2           1
>   way_cols           0           0           0           0
>   drops              0      989289           0           0
>   marks              0           0           0           0
>   sp_flows           0           0           0           0
>   bk_flows           0           1           0           0
>   last_len           0        1514          66         138
>   max_len            0        1514         110         487
I think it's interesting that the memory used is only a little of 55% of
the autoconfigured max buffer size, so cake_enqueue won't have gone into
its 'buffer full' cake_drop routine - I do wonder if should it ever get
there that it should 'use a shovel' of 64 packets rather than teaspoon
of iterating dropping single packets.

The above also suggests that cake is spending time dropping packets over
the target threshold individually.  Does/could cake codel drop do
something like 'drop sufficient bytes (in packet lumps) to get that flow
back under target threshold- after ECN signalling' in one go, up to some
packet number limit (64)?  Again the idea is to really jump on the
naughty flow!



>
> ...
>
> But I am very puzzled as to why flow isolation would fail in the face
> of this overload.
>
>>  - Jonathan Morton
>>
>
>



--------------ms050707070801010005080205
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgMFADCABgkqhkiG9w0BBwEAAKCC
DYEwggY0MIIEHKADAgECAgEeMA0GCSqGSIb3DQEBBQUAMH0xCzAJBgNVBAYTAklMMRYwFAYD
VQQKEw1TdGFydENvbSBMdGQuMSswKQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZpY2F0
ZSBTaWduaW5nMSkwJwYDVQQDEyBTdGFydENvbSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTAe
Fw0wNzEwMjQyMTAxNTVaFw0xNzEwMjQyMTAxNTVaMIGMMQswCQYDVQQGEwJJTDEWMBQGA1UE
ChMNU3RhcnRDb20gTHRkLjErMCkGA1UECxMiU2VjdXJlIERpZ2l0YWwgQ2VydGlmaWNhdGUg
U2lnbmluZzE4MDYGA1UEAxMvU3RhcnRDb20gQ2xhc3MgMSBQcmltYXJ5IEludGVybWVkaWF0
ZSBDbGllbnQgQ0EwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDHCYPMzi3YGrEp
pC4Tq5a+ijKDjKaIQZZVR63UbxIP6uq/I0fhCu+cQhoUfE6ERKKnu8zPf1Jwuk0tsvVCk6U9
b+0UjM0dLep3ZdE1gblK/1FwYT5Pipsu2yOMluLqwvsuz9/9f1+1PKHG/FaR/wpbfuIqu54q
zHDYeqiUfsYzoVflR80DAC7hmJ+SmZnNTWyUGHJbBpA8Q89lGxahNvuryGaC/o2/ceD2uYDX
9U8Eg5DpIpGQdcbQeGarV04WgAUjjXX5r/2dabmtxWMZwhZna//jdiSyrrSMTGKkDiXm6/3/
4ebfeZuCYKzN2P8O2F/Xe2AC/Y7zeEsnR7FOp+uXAgMBAAGjggGtMIIBqTAPBgNVHRMBAf8E
BTADAQH/MA4GA1UdDwEB/wQEAwIBBjAdBgNVHQ4EFgQUU3Ltkpzg2ssBXHx+ljVO8tS4UYIw
HwYDVR0jBBgwFoAUTgvvGqRAW6UXaYcwyjRoQ9BBrvIwZgYIKwYBBQUHAQEEWjBYMCcGCCsG
AQUFBzABhhtodHRwOi8vb2NzcC5zdGFydHNzbC5jb20vY2EwLQYIKwYBBQUHMAKGIWh0dHA6
Ly93d3cuc3RhcnRzc2wuY29tL3Nmc2NhLmNydDBbBgNVHR8EVDBSMCegJaAjhiFodHRwOi8v
d3d3LnN0YXJ0c3NsLmNvbS9zZnNjYS5jcmwwJ6AloCOGIWh0dHA6Ly9jcmwuc3RhcnRzc2wu
Y29tL3Nmc2NhLmNybDCBgAYDVR0gBHkwdzB1BgsrBgEEAYG1NwECATBmMC4GCCsGAQUFBwIB
FiJodHRwOi8vd3d3LnN0YXJ0c3NsLmNvbS9wb2xpY3kucGRmMDQGCCsGAQUFBwIBFihodHRw
Oi8vd3d3LnN0YXJ0c3NsLmNvbS9pbnRlcm1lZGlhdGUucGRmMA0GCSqGSIb3DQEBBQUAA4IC
AQAKgwh9eKssBly4Y4xerhy5I3dNoXHYfYa8PlVLL/qtXnkFgdtY1o95CfegFJTwqBBmf8py
TUnFsukDFUI22zF5bVHzuJ+GxhnSqN2sD1qetbYwBYK2iyYA5Pg7Er1A+hKMIzEzcduRkIMm
CeUTyMyikfbUFvIBivtvkR8ZFAk22BZy+pJfAoedO61HTz4qSfQoCRcLN5A0t4DkuVhTMXIz
uQ8CnykhExD6x4e6ebIbrjZLb7L+ocR0y4YjCl/Pd4MXU91y0vTipgr/O75CDUHDRHCCKBVm
z/Rzkc/b970MEeHt5LC3NiWTgBSvrLEuVzBKM586YoRD9Dy3OHQgWI270g+5MYA8GfgI/EPT
5G7xPbCDz+zjdH89PeR3U4So4lSXur6H6vp+m9TQXPF3a0LwZrp8MQ+Z77U1uL7TelWO5lAp
sbAonrqASfTpaprFVkL4nyGH+NHST2ZJPWIBk81i6Vw0ny0qZW2Niy/QvVNKbb43A43ny076
khXO7cNbBIRdJ/6qQNq9Bqb5C0Q5nEsFcj75oxQRqlKf6TcvGbjxkJh8BYtv9ePsXklAxtm8
J7GCUBthHSQgepbkOexhJ0wP8imUkyiPHQ0GvEnd83129fZjoEhdGwXV27ioRKbj/cIq7JRX
un0NbeY+UdMYu9jGfIpDLtUUGSgsg2zMGs5R4jCCB0UwggYtoAMCAQICAw5ySjANBgkqhkiG
9w0BAQsFADCBjDELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0Q29tIEx0ZC4xKzApBgNV
BAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcxODA2BgNVBAMTL1N0YXJ0
Q29tIENsYXNzIDEgUHJpbWFyeSBJbnRlcm1lZGlhdGUgQ2xpZW50IENBMB4XDTE1MDYyMDIw
MzA1MloXDTE2MDYyMDE0MjY0N1owVjEmMCQGA1UEAwwda2V2aW5AZGFyYnlzaGlyZS1icnlh
bnQubWUudWsxLDAqBgkqhkiG9w0BCQEWHWtldmluQGRhcmJ5c2hpcmUtYnJ5YW50Lm1lLnVr
MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAugCNtDhytCJ9HOfenUHr/vUGUECv
PL1IJXgHMl4cIJmwgLOkXhIcTMxHnX+kFweqvT+eDWv1hzA9yMWhvjLFC4eLoFaV0xiAat8O
XQ7t3MwKY5DW0mB1dOnjiFIcc/XMwyYI4KfEGnFMJQkzon0rDVpkl/Q1f/hu1sELO7Zc6TFL
wuuDuiP7S73zrz50TRoq0+Ob3x0uOMW2uVwVzf6NLwHgBE2LFleMXblyUMx0IlIcLan2nWiI
Vsa3XYd+C6KAGGwlmO4VAZ25KuX7hkj8f82lSapvtKTtvrSoDghXlHH2JXiIQX+Sn0UgOmbX
1KyOe9vN7WzQ+tpPRzpFRffnnnp1VQye3wVRPBumjDxQSFTOhUtslnvbefUQSPw6p5w9ZiXI
GJICLkX/MkYN/TwGCvuUG2PxBybSR1A2I5ap+VI/zGSG3XGVEA69SOZQyD+8YjJZfaY2nCu+
DuM64JrJUi2CvX6fwcdHNschJNrrfetpnrx3JrGnG9o+pWuUG1phBg+KKN2bhrdzY79qm7ha
86EMKSUOn5nBdGY3YxdXq/naoUQeOCUV2JMFGOulu7sKpiWcz7HVFacXjd9ebisVLv+jOwll
z14BWRb87s1+LBEJn/Ybn3ekhtgyEAhB4kgj0scl4hI8xCU6zrZyDnbXmxSvDXbClZA0PACt
f/jhGvUCAwEAAaOCAuMwggLfMAkGA1UdEwQCMAAwCwYDVR0PBAQDAgSwMB0GA1UdJQQWMBQG
CCsGAQUFBwMCBggrBgEFBQcDBDAdBgNVHQ4EFgQULkW2CpDiQpRNumQ7wdspjFfgX+AwHwYD
VR0jBBgwFoAUU3Ltkpzg2ssBXHx+ljVO8tS4UYIwKAYDVR0RBCEwH4Eda2V2aW5AZGFyYnlz
aGlyZS1icnlhbnQubWUudWswggFMBgNVHSAEggFDMIIBPzCCATsGCysGAQQBgbU3AQIDMIIB
KjAuBggrBgEFBQcCARYiaHR0cDovL3d3dy5zdGFydHNzbC5jb20vcG9saWN5LnBkZjCB9wYI
KwYBBQUHAgIwgeowJxYgU3RhcnRDb20gQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwAwIBARqB
vlRoaXMgY2VydGlmaWNhdGUgd2FzIGlzc3VlZCBhY2NvcmRpbmcgdG8gdGhlIENsYXNzIDEg
VmFsaWRhdGlvbiByZXF1aXJlbWVudHMgb2YgdGhlIFN0YXJ0Q29tIENBIHBvbGljeSwgcmVs
aWFuY2Ugb25seSBmb3IgdGhlIGludGVuZGVkIHB1cnBvc2UgaW4gY29tcGxpYW5jZSBvZiB0
aGUgcmVseWluZyBwYXJ0eSBvYmxpZ2F0aW9ucy4wNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDov
L2NybC5zdGFydHNzbC5jb20vY3J0dTEtY3JsLmNybDCBjgYIKwYBBQUHAQEEgYEwfzA5Bggr
BgEFBQcwAYYtaHR0cDovL29jc3Auc3RhcnRzc2wuY29tL3N1Yi9jbGFzczEvY2xpZW50L2Nh
MEIGCCsGAQUFBzAChjZodHRwOi8vYWlhLnN0YXJ0c3NsLmNvbS9jZXJ0cy9zdWIuY2xhc3Mx
LmNsaWVudC5jYS5jcnQwIwYDVR0SBBwwGoYYaHR0cDovL3d3dy5zdGFydHNzbC5jb20vMA0G
CSqGSIb3DQEBCwUAA4IBAQBicQWe98eF/o09TXFsExc+WSyYjt3oSnXyocLzXQp82CQhIg21
5RqNZ1e+hsO7tq8S6hdItUDbKpecpIV59+57ke1zVl2slTRIT19fhYINHH78rVVRPzuHoiDt
MXnGrp9hbq3Cz8P4mm8INKDiYK46kyplRAQ3ZMouPG1lsnDzgQAvbCj74H8yAp7fK8if6cxs
28BCUmdP8D3c6M1ffdNNaqNT+4Z3mtOujXXg7zOfmXN0Zg/mEtZ0NrWE2uICGdWjTv9KZiI7
fi4hk2CRpCL63qzmu6BwtcgtwhgYYtuAk2N43+SiyDkyLKGAcjEor3t5f9HivN29E0F0MXTH
1OdgMYIFDTCCBQkCAQEwgZQwgYwxCzAJBgNVBAYTAklMMRYwFAYDVQQKEw1TdGFydENvbSBM
dGQuMSswKQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZpY2F0ZSBTaWduaW5nMTgwNgYD
VQQDEy9TdGFydENvbSBDbGFzcyAxIFByaW1hcnkgSW50ZXJtZWRpYXRlIENsaWVudCBDQQID
DnJKMA0GCWCGSAFlAwQCAwUAoIICSTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqG
SIb3DQEJBTEPFw0xNjA1MDMxMzIwMDlaME8GCSqGSIb3DQEJBDFCBECMw9gelyCeAIF5qk7s
u5cltCVRKfR0YsoWXJtNpn3SjbJpyJPc15/hgBG93gR4rii7zo/vf9+yInvH8kP6D7ntMGwG
CSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAO
BggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgw
gaUGCSsGAQQBgjcQBDGBlzCBlDCBjDELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0Q29t
IEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcxODA2
BgNVBAMTL1N0YXJ0Q29tIENsYXNzIDEgUHJpbWFyeSBJbnRlcm1lZGlhdGUgQ2xpZW50IENB
AgMOckowgacGCyqGSIb3DQEJEAILMYGXoIGUMIGMMQswCQYDVQQGEwJJTDEWMBQGA1UEChMN
U3RhcnRDb20gTHRkLjErMCkGA1UECxMiU2VjdXJlIERpZ2l0YWwgQ2VydGlmaWNhdGUgU2ln
bmluZzE4MDYGA1UEAxMvU3RhcnRDb20gQ2xhc3MgMSBQcmltYXJ5IEludGVybWVkaWF0ZSBD
bGllbnQgQ0ECAw5ySjANBgkqhkiG9w0BAQEFAASCAgAZKvEBdBvnp36drJusxMs7OOSEPn94
ePpvUGlBp0hkvqFKgO+nhA08BMQTpkANiYezxbF25yJBtLDqpzYeyEm/TDUujuicHtN/IUkE
8OSBw2vL+L/gb5TQjkhOYzZ0IL5fBrkYNYInNS3+PGShwnkSDkqs8jznvQ9qY48iLIt2gUiM
iAYf99OIfouS/r+qvCSndVop4TEizveE0zcC+waxhxCie3kRRp4XVcMLljyZI2IAtWaf7ku6
cyiE0HE0URo435Gxf06C2x5kZT5kOHseMEZfqa+oh3i9Xs/Pa/B2iG1I1UR1gLngKKvvCpg/
H15OhmVnqtBBW0dyuPAqA7qWYUtwMIc9p256wLkE/etuPzvYt13ZyvrJtXwI5BCwVkWnd5rN
/Xi+Ylz68SgxmQjDQRUiwqrAXwe9Q+E4VHeBuqgbYzEi4XahmSExlVEOFqx3+Os/59fFq3Hs
bNrk5qlNJPFMIlVTVlTZGQG9qqsjP9nMk1AX7l2Alsh3psMS47XoEpKzRStt8IMFWMdnlM2r
4pirpXpZlLM5BZ13HoIzxwlyDNaLtKwswGDUQAXOXOe/VaqIdG0AaKBpGybW8dSadLVfBBEb
iEqdvRXFcEyT85jTlLTYTY0Jn5qrXiHHirAtgYcPIF+2Bz1rKINu2ODxruPtPuilfzLqCOJw
BS3AigAAAAAAAA==
--------------ms050707070801010005080205--


--===============3512072735359589560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============3512072735359589560==--
