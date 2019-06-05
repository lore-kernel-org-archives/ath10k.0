Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYOB6-0008Uy-MY
 for ath10k@lists.infradead.org; Wed, 05 Jun 2019 05:09:38 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: Qualcomm Atheros QCA6174 monitoring mode receiving no data
References: <1559296628.11260.4.camel@dedrone.com>
 <87lfyjyq9c.fsf@kamboji.qca.qualcomm.com>
 <1559566253.12864.47.camel@dedrone.com>
Date: Wed, 05 Jun 2019 08:09:30 +0300
In-Reply-To: <1559566253.12864.47.camel@dedrone.com> (Patrick Daume's message
 of "Mon, 3 Jun 2019 12:50:54 +0000")
Message-ID: <87zhmwvcs5.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Patrick Daume <patrick.daume@dedrone.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

UGF0cmljayBEYXVtZSA8cGF0cmljay5kYXVtZUBkZWRyb25lLmNvbT4gd3JpdGVzOgoKPiBJIGJ1
aWxkIHRoZSBrZXJuZWw6IDUuMS4wLXJjNy13dC1hdGgrIGZyb20gdGhlIHJlcG9zaXRvcnkgKGdp
dDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9rdmFsby9hdGguZ2l0
KcKgCj4gYW5kIHJlcGxhY2UgV0xBTi5STS40LjQuMS0wMDEzMi1RQ0FSTVNXUC0xIHdpdGggIi9s
aWIvZmlybXdhcmUvYXRoMTBrL1FDQTYxNzQvaHczLjAvZmlybXdhcmUtNi5iaW4iLsKgCj4KPiBT
YW1lIGJlaGF2aW9pdXIgYXMgb2JzZXJ2ZWQgYmVmb3JlLiBUaGUgaW50ZXJmYWNlIHJlY2VpdmVz
IG5vIGRhdGEgaW4gbW9uaXRvcmluZyBtb2RlLiBXaGlsZSBtYW5hZ2VkIG1vZGUgc2VlbXMgdG8g
d29yay4KPgoKWy4uLl0KCj4gW8KgwqDCoMKgNC45NDg3NzFdIGF0aDEwa19wY2kgMDAwMDowMjow
MC4wOiBxY2E2MTc0IGh3My4yIHRhcmdldCAweDA1MDMwMDAwIGNoaXBfaWQgMHgwMDM0MGFmZiBz
dWIgMWRhYzowMjYxCj4gW8KgwqDCoMKgNC45NDg3NzNdIGF0aDEwa19wY2kgMDAwMDowMjowMC4w
OiBrY29uZmlnIGRlYnVnIDAgZGVidWdmcyAxIHRyYWNpbmcgMSBkZnMgMCB0ZXN0bW9kZSAwCj4g
W8KgwqDCoMKgNC45NDkxODJdIGF0aDEwa19wY2kgMDAwMDowMjowMC4wOiBmaXJtd2FyZSB2ZXIg
V0xBTi5STS40LjQuMS0wMDEzMi1RQ0FSTVNXUC0xIGFwaSA2IGZlYXR1cmVzIHdvd2xhbixpZ25v
cmUtb3RwLG1mcCBjcmMzMiA3OWY0ZGI4Ngo+IFvCoMKgwqDCoDUuMDE1MzAwXSBhdGgxMGtfcGNp
IDAwMDA6MDI6MDAuMDogYm9hcmRfZmlsZSBhcGkgMiBibWlfaWQgTi9BIGNyYzMyIDRlZDM1Njll
Cj4gW8KgwqDCoMKgNS4wNzczNTFdIGF0aDEwa19wY2kgMDAwMDowMjowMC4wOiBVQVJUIHByaW50
cyBlbmFibGVkCj4gW8KgwqDCoMKgNS4xNDU2MDhdIGF0aDEwa19wY2kgMDAwMDowMjowMC4wOiB1
bnN1cHBvcnRlZCBIVEMgc2VydmljZSBpZDogMTUzNgo+IFvCoMKgwqDCoDUuMzk5MjQ4XSBhdGgx
MGtfcGNpIDAwMDA6MDI6MDAuMDogaHR0LXZlciAzLjYwIHdtaS1vcCA0IGh0dC1vcCAzIGNhbCBv
dHAgbWF4LXN0YSAzMiByYXcgMCBod2NyeXB0byAxCgpJbmRlZWQsIHRoYXQgZmlybXdhcmUgdmVy
c2lvbiBkb2VzIG5vdCBoYXZlIHJhdyBtb2RlIGVuYWJsZWQgKCJyYXcgMCIpLgpDYW4geW91IHRy
eSB0aGlzIG9uZToKCmh0dHBzOi8vZ2l0aHViLmNvbS9rdmFsby9hdGgxMGstZmlybXdhcmUvYmxv
Yi9tYXN0ZXIvUUNBNjE3NC9odzMuMC80LjQuMS5jMy9maXJtd2FyZS02LmJpbl9XTEFOLlJNLjQu
NC4xLmMzLTAwMDMwCgotLSAKS2FsbGUgVmFsbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0
aDEwawo=
