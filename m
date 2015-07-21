Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-am1on0055.outbound.protection.outlook.com ([157.56.112.55]
 helo=emea01-am1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHZ4T-0007bq-Th
 for ath10k@lists.infradead.org; Tue, 21 Jul 2015 15:03:07 +0000
Message-ID: <55AE5F00.6080203@darbyshire-bryant.me.uk>
Date: Tue, 21 Jul 2015 16:02:24 +0100
From: Kevin Darbyshire-Bryant <kevin@darbyshire-bryant.me.uk>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k Suppress 'failed to process fft' warning messages.
References: <1437075444-6779-1-git-send-email-kevin@darbyshire-bryant.me.uk>
 <87bnf5ogx7.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87bnf5ogx7.fsf@kamboji.qca.qualcomm.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8622006640503156371=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k@lists.infradead.org

--===============8622006640503156371==
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha1; boundary="------------ms060309040803060104030509"

--------------ms060309040803060104030509
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 21/07/15 13:04, Kalle Valo wrote:
> Kevin Darbyshire-Bryant <kevin@darbyshire-bryant.me.uk> writes:
>
>> When using DFS channels on Ath10k kernel log has warning message 'fail=
ed
>> to process fft', typically when under medium/heavy traffic.  Ticket
>> https://dev.openwrt.org/ticket/19316 discusses and concludes messages
>> are harmless.  They do still contribute to log noise, so this patch
>> enables them only in driver debug mode.
>>
>> Signed-off-by: Kevin Darbyshire-Bryant <kevin@darbyshire-bryant.me.uk>=

> Don't reference to a discussion somewhere else with a link, instead
> summarise the discussion in the commit log.
>
> And please change the title to: ath10k: suppress 'failed to process fft=
'
> warning messages. Also please CC linux-wireless list as instructed here=
:
>
> https://wireless.wiki.kernel.org/en/users/drivers/ath10k/sources#submit=
ting_patches
>
Hi Kalle,

Thanks for your feedback.  Sent again with requested changes.  Best I
can do, so hopefully good enough.

Cheers,

Kevin


--------------ms060309040803060104030509
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIINgTCC
BjQwggQcoAMCAQICAR4wDQYJKoZIhvcNAQEFBQAwfTELMAkGA1UEBhMCSUwxFjAUBgNVBAoT
DVN0YXJ0Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNp
Z25pbmcxKTAnBgNVBAMTIFN0YXJ0Q29tIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTA3
MTAyNDIxMDE1NVoXDTE3MTAyNDIxMDE1NVowgYwxCzAJBgNVBAYTAklMMRYwFAYDVQQKEw1T
dGFydENvbSBMdGQuMSswKQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZpY2F0ZSBTaWdu
aW5nMTgwNgYDVQQDEy9TdGFydENvbSBDbGFzcyAxIFByaW1hcnkgSW50ZXJtZWRpYXRlIENs
aWVudCBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMcJg8zOLdgasSmkLhOr
lr6KMoOMpohBllVHrdRvEg/q6r8jR+EK75xCGhR8ToREoqe7zM9/UnC6TS2y9UKTpT1v7RSM
zR0t6ndl0TWBuUr/UXBhPk+Kmy7bI4yW4urC+y7P3/1/X7U8ocb8VpH/Clt+4iq7nirMcNh6
qJR+xjOhV+VHzQMALuGYn5KZmc1NbJQYclsGkDxDz2UbFqE2+6vIZoL+jb9x4Pa5gNf1TwSD
kOkikZB1xtB4ZqtXThaABSONdfmv/Z1pua3FYxnCFmdr/+N2JLKutIxMYqQOJebr/f/h5t95
m4JgrM3Y/w7YX9d7YAL9jvN4SydHsU6n65cCAwEAAaOCAa0wggGpMA8GA1UdEwEB/wQFMAMB
Af8wDgYDVR0PAQH/BAQDAgEGMB0GA1UdDgQWBBRTcu2SnODaywFcfH6WNU7y1LhRgjAfBgNV
HSMEGDAWgBROC+8apEBbpRdphzDKNGhD0EGu8jBmBggrBgEFBQcBAQRaMFgwJwYIKwYBBQUH
MAGGG2h0dHA6Ly9vY3NwLnN0YXJ0c3NsLmNvbS9jYTAtBggrBgEFBQcwAoYhaHR0cDovL3d3
dy5zdGFydHNzbC5jb20vc2ZzY2EuY3J0MFsGA1UdHwRUMFIwJ6AloCOGIWh0dHA6Ly93d3cu
c3RhcnRzc2wuY29tL3Nmc2NhLmNybDAnoCWgI4YhaHR0cDovL2NybC5zdGFydHNzbC5jb20v
c2ZzY2EuY3JsMIGABgNVHSAEeTB3MHUGCysGAQQBgbU3AQIBMGYwLgYIKwYBBQUHAgEWImh0
dHA6Ly93d3cuc3RhcnRzc2wuY29tL3BvbGljeS5wZGYwNAYIKwYBBQUHAgEWKGh0dHA6Ly93
d3cuc3RhcnRzc2wuY29tL2ludGVybWVkaWF0ZS5wZGYwDQYJKoZIhvcNAQEFBQADggIBAAqD
CH14qywGXLhjjF6uHLkjd02hcdh9hrw+VUsv+q1eeQWB21jWj3kJ96AUlPCoEGZ/ynJNScWy
6QMVQjbbMXltUfO4n4bGGdKo3awPWp61tjAFgraLJgDk+DsSvUD6EowjMTNx25GQgyYJ5RPI
zKKR9tQW8gGK+2+RHxkUCTbYFnL6kl8Ch507rUdPPipJ9CgJFws3kDS3gOS5WFMxcjO5DwKf
KSETEPrHh7p5shuuNktvsv6hxHTLhiMKX893gxdT3XLS9OKmCv87vkINQcNEcIIoFWbP9HOR
z9v3vQwR4e3ksLc2JZOAFK+ssS5XMEoznzpihEP0PLc4dCBYjbvSD7kxgDwZ+Aj8Q9PkbvE9
sIPP7ON0fz095HdThKjiVJe6vofq+n6b1NBc8XdrQvBmunwxD5nvtTW4vtN6VY7mUCmxsCie
uoBJ9OlqmsVWQvifIYf40dJPZkk9YgGTzWLpXDSfLSplbY2LL9C9U0ptvjcDjefLTvqSFc7t
w1sEhF0n/qpA2r0GpvkLRDmcSwVyPvmjFBGqUp/pNy8ZuPGQmHwFi2/14+xeSUDG2bwnsYJQ
G2EdJCB6luQ57GEnTA/yKZSTKI8dDQa8Sd3zfXb19mOgSF0bBdXbuKhEpuP9wirslFe6fQ1t
5j5R0xi72MZ8ikMu1RQZKCyDbMwazlHiMIIHRTCCBi2gAwIBAgIDDnJKMA0GCSqGSIb3DQEB
CwUAMIGMMQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRDb20gTHRkLjErMCkGA1UECxMi
U2VjdXJlIERpZ2l0YWwgQ2VydGlmaWNhdGUgU2lnbmluZzE4MDYGA1UEAxMvU3RhcnRDb20g
Q2xhc3MgMSBQcmltYXJ5IEludGVybWVkaWF0ZSBDbGllbnQgQ0EwHhcNMTUwNjIwMjAzMDUy
WhcNMTYwNjIwMTQyNjQ3WjBWMSYwJAYDVQQDDB1rZXZpbkBkYXJieXNoaXJlLWJyeWFudC5t
ZS51azEsMCoGCSqGSIb3DQEJARYda2V2aW5AZGFyYnlzaGlyZS1icnlhbnQubWUudWswggIi
MA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQC6AI20OHK0In0c596dQev+9QZQQK88vUgl
eAcyXhwgmbCAs6ReEhxMzEedf6QXB6q9P54Na/WHMD3IxaG+MsULh4ugVpXTGIBq3w5dDu3c
zApjkNbSYHV06eOIUhxz9czDJgjgp8QacUwlCTOifSsNWmSX9DV/+G7WwQs7tlzpMUvC64O6
I/tLvfOvPnRNGirT45vfHS44xba5XBXN/o0vAeAETYsWV4xduXJQzHQiUhwtqfadaIhWxrdd
h34LooAYbCWY7hUBnbkq5fuGSPx/zaVJqm+0pO2+tKgOCFeUcfYleIhBf5KfRSA6ZtfUrI57
283tbND62k9HOkVF9+eeenVVDJ7fBVE8G6aMPFBIVM6FS2yWe9t59RBI/DqnnD1mJcgYkgIu
Rf8yRg39PAYK+5QbY/EHJtJHUDYjlqn5Uj/MZIbdcZUQDr1I5lDIP7xiMll9pjacK74O4zrg
mslSLYK9fp/Bx0c2xyEk2ut962mevHcmsacb2j6la5QbWmEGD4oo3ZuGt3Njv2qbuFrzoQwp
JQ6fmcF0ZjdjF1er+dqhRB44JRXYkwUY66W7uwqmJZzPsdUVpxeN315uKxUu/6M7CWXPXgFZ
FvzuzX4sEQmf9hufd6SG2DIQCEHiSCPSxyXiEjzEJTrOtnIOdtebFK8NdsKVkDQ8AK1/+OEa
9QIDAQABo4IC4zCCAt8wCQYDVR0TBAIwADALBgNVHQ8EBAMCBLAwHQYDVR0lBBYwFAYIKwYB
BQUHAwIGCCsGAQUFBwMEMB0GA1UdDgQWBBQuRbYKkOJClE26ZDvB2ymMV+Bf4DAfBgNVHSME
GDAWgBRTcu2SnODaywFcfH6WNU7y1LhRgjAoBgNVHREEITAfgR1rZXZpbkBkYXJieXNoaXJl
LWJyeWFudC5tZS51azCCAUwGA1UdIASCAUMwggE/MIIBOwYLKwYBBAGBtTcBAgMwggEqMC4G
CCsGAQUFBwIBFiJodHRwOi8vd3d3LnN0YXJ0c3NsLmNvbS9wb2xpY3kucGRmMIH3BggrBgEF
BQcCAjCB6jAnFiBTdGFydENvbSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTADAgEBGoG+VGhp
cyBjZXJ0aWZpY2F0ZSB3YXMgaXNzdWVkIGFjY29yZGluZyB0byB0aGUgQ2xhc3MgMSBWYWxp
ZGF0aW9uIHJlcXVpcmVtZW50cyBvZiB0aGUgU3RhcnRDb20gQ0EgcG9saWN5LCByZWxpYW5j
ZSBvbmx5IGZvciB0aGUgaW50ZW5kZWQgcHVycG9zZSBpbiBjb21wbGlhbmNlIG9mIHRoZSBy
ZWx5aW5nIHBhcnR5IG9ibGlnYXRpb25zLjA2BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3Js
LnN0YXJ0c3NsLmNvbS9jcnR1MS1jcmwuY3JsMIGOBggrBgEFBQcBAQSBgTB/MDkGCCsGAQUF
BzABhi1odHRwOi8vb2NzcC5zdGFydHNzbC5jb20vc3ViL2NsYXNzMS9jbGllbnQvY2EwQgYI
KwYBBQUHMAKGNmh0dHA6Ly9haWEuc3RhcnRzc2wuY29tL2NlcnRzL3N1Yi5jbGFzczEuY2xp
ZW50LmNhLmNydDAjBgNVHRIEHDAahhhodHRwOi8vd3d3LnN0YXJ0c3NsLmNvbS8wDQYJKoZI
hvcNAQELBQADggEBAGJxBZ73x4X+jT1NcWwTFz5ZLJiO3ehKdfKhwvNdCnzYJCEiDbXlGo1n
V76Gw7u2rxLqF0i1QNsql5ykhXn37nuR7XNWXayVNEhPX1+Fgg0cfvytVVE/O4eiIO0xecau
n2FurcLPw/iabwg0oOJgrjqTKmVEBDdkyi48bWWycPOBAC9sKPvgfzICnt8ryJ/pzGzbwEJS
Z0/wPdzozV99001qo1P7hnea066NdeDvM5+Zc3RmD+YS1nQ2tYTa4gIZ1aNO/0pmIjt+LiGT
YJGkIvrerOa7oHC1yC3CGBhi24CTY3jf5KLIOTIsoYByMSive3l/0eK83b0TQXQxdMfU52Ax
ggTdMIIE2QIBATCBlDCBjDELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0Q29tIEx0ZC4x
KzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcxODA2BgNVBAMT
L1N0YXJ0Q29tIENsYXNzIDEgUHJpbWFyeSBJbnRlcm1lZGlhdGUgQ2xpZW50IENBAgMOckow
CQYFKw4DAhoFAKCCAh0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUx
DxcNMTUwNzIxMTUwMjI0WjAjBgkqhkiG9w0BCQQxFgQU8gaInS4LiRmlBFqbULpWbdzDlKow
bAYJKoZIhvcNAQkPMV8wXTALBglghkgBZQMEASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMH
MA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIB
KDCBpQYJKwYBBAGCNxAEMYGXMIGUMIGMMQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRD
b20gTHRkLjErMCkGA1UECxMiU2VjdXJlIERpZ2l0YWwgQ2VydGlmaWNhdGUgU2lnbmluZzE4
MDYGA1UEAxMvU3RhcnRDb20gQ2xhc3MgMSBQcmltYXJ5IEludGVybWVkaWF0ZSBDbGllbnQg
Q0ECAw5ySjCBpwYLKoZIhvcNAQkQAgsxgZeggZQwgYwxCzAJBgNVBAYTAklMMRYwFAYDVQQK
Ew1TdGFydENvbSBMdGQuMSswKQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZpY2F0ZSBT
aWduaW5nMTgwNgYDVQQDEy9TdGFydENvbSBDbGFzcyAxIFByaW1hcnkgSW50ZXJtZWRpYXRl
IENsaWVudCBDQQIDDnJKMA0GCSqGSIb3DQEBAQUABIICAGr2/PKq3VOkM/kNsviVZFoL9/Yo
l9x4NJPSgXK9kwVL0pVxzplqf3NSp5/4RL0U2dSgPreKyVUm4c8KMsXqHPN3cuPpLR7kYBkc
Jqnmbc5UL57q4FDcf+ekYVWStw8KGncRhdRuPPNVyKxuvNOLz4sf/GAZ8dsN+dK4Ljw0ZX+T
lBS7fFVMHyaJ2PlpEgKQu74HLmfNH/p7zmu/rAOVl/FidzhOJT77l5MAoprvUBSE/4EvPkTZ
eFK2qsWFIn2tq4Se8CGYbX6ArlLwqYqjur0bJxQjsLtXj3hz5N4khvqFvjhd/JQrkl6a0Leb
3idFwX+b6SJ0FyeIH0p4WKluTviP51d8dE40bVu1ZSizZAFf/W34q1ZT1K659Ut+2oQrQj+J
JVcUHSJmj3KTGzjNYT82eeCe4OuaCuZHnLv+Xwt7tuCRZTFouCLgXRDU3+UjSeqWrdNqbx1Y
03gZza+VpSRNS/+lZoaYX7wC3FZxK37hOCpAjrDF73wuj6UlPxFM3O8BZr7T0SC2ervbjlea
2fFGeA2SfZgSuCVOQVCnRJGaPwzFT8kKQ/DQ6hH81pCTDV3bX0IraExpSPNfCdmj1fCbPulJ
OMl6mIl12Dlf2HJoT2iaE5oM5sNPSCe+mQDLdfcdZ/SrZu75EwWFoQuP8C/qNH8UPwV8Mwkk
nqprSDMyAAAAAAAA
--------------ms060309040803060104030509--


--===============8622006640503156371==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============8622006640503156371==--
