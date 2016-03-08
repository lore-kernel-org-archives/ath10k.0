Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adCgM-0005IG-Vf
 for ath10k@lists.infradead.org; Tue, 08 Mar 2016 08:08:02 +0000
Message-ID: <1457424451.2283.2.camel@sipsolutions.net>
Subject: Re: [RFC v1] mac80211: Add support for per station rx stats histogram
From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 08 Mar 2016 09:07:31 +0100
In-Reply-To: <1457367809-13637-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1457367809-13637-1-git-send-email-mohammed@qca.qualcomm.com>
Mime-Version: 1.0
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
To: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>, linux-wireless@vger.kernel.org
Cc: mohammed@codeaurora.org, Anilkumar Kolli <akolli@qti.qualcomm.com>, kvalo@codeaurora.org, ath10k@lists.infradead.org

T24gTW9uLCAyMDE2LTAzLTA3IGF0IDIxOjUzICswNTMwLCBNb2hhbW1lZCBTaGFmaSBTaGFqYWto
YW4gd3JvdGU6Cj7CoAo+ICsjZGVmaW5lIElFRUU4MDIxMV9IVF9NQ1NfTlVNCQkzMgo+ICsjZGVm
aW5lIElFRUU4MDIxMV9WSFRfTUNTX05VTQkJMTAKPiArI2RlZmluZSBJRUVFODAyMTFfQldfTlVN
CQk0Cj4gKyNkZWZpbmUgSUVFRTgwMjExX05TU19OVU0JCTQKPiArI2RlZmluZSBJRUVFODAyMTFf
R0lfTlVNCQkyCj4gKyNkZWZpbmUgSUVFRTgwMjExX1JBVEVfVEFCTEVfTlVNCTMyMAo+ICsjZGVm
aW5lIElFRUU4MDIxMV9MRUdBQ1lfUkFURV9OVU0JMTIKCj4gKyNpZmRlZiBDT05GSUdfTUFDODAy
MTFfREVCVUdfUEVSX1NUQV9SWF9TVEFUUwo+ICsJdTY0IHJ4X2xlZ2FjeV9wa3RbSUVFRTgwMjEx
X0xFR0FDWV9SQVRFX05VTV07Cj4gKwl1NjQgcnhfaHRfcGt0W0lFRUU4MDIxMV9IVF9NQ1NfTlVN
XTsKPiArCXU2NCByeF92aHRfcGt0W0lFRUU4MDIxMV9WSFRfTUNTX05VTV07Cj4gKwl1NjQgcnhf
YndfcGt0W0lFRUU4MDIxMV9CV19OVU1dOwo+ICsJdTY0IHJ4X25zc19wa3RbSUVFRTgwMjExX05T
U19OVU1dOwo+ICsJdTY0IHJ4X2dpX3BrdFtJRUVFODAyMTFfR0lfTlVNXTsKPiArCXU2NCByeF9y
YXRlX3BrdFtJRUVFODAyMTFfUkFURV9UQUJMRV9OVU1dOwo+ICsJdTY0IHJ4X2xlZ2FjeV9ieXRl
W0lFRUU4MDIxMV9MRUdBQ1lfUkFURV9OVU1dOwo+ICsJdTY0IHJ4X2h0X2J5dGVbSUVFRTgwMjEx
X0hUX01DU19OVU1dOwo+ICsJdTY0IHJ4X3ZodF9ieXRlW0lFRUU4MDIxMV9WSFRfTUNTX05VTV07
Cj4gKwl1NjQgcnhfYndfYnl0ZVtJRUVFODAyMTFfQldfTlVNXTsKPiArCXU2NCByeF9uc3NfYnl0
ZVtJRUVFODAyMTFfTlNTX05VTV07Cj4gKwl1NjQgcnhfZ2lfYnl0ZVtJRUVFODAyMTFfR0lfTlVN
XTsKPiArCXU2NCByeF9yYXRlX2J5dGVbSUVFRTgwMjExX1JBVEVfVEFCTEVfTlVNXTsKPiArI2Vu
ZGlmCgpEbyB5b3Uga25vdyBob3cgbXVjaCBkYXRhIHRoaXMgaXM/IQoKRmVsaXggaXMgZ29pbmcg
dG8ga2lsbCBib3RoIG9mIHVzIGlmIEkgYXBwbHkgaXQuCgpQbGVhc2UgbG9vayBhdCByZXZpdmlu
ZyBteSByYXRlLXN0YXRpc3RpY3MgcGF0Y2ggYW5kIGRvIHRoZSByZW1haW5pbmcKd29yayBpbiB1
c2Vyc3BhY2U6CgpodHRwOi8vdGhyZWFkLmdtYW5lLm9yZy9nbWFuZS5saW51eC5rZXJuZWwud2ly
ZWxlc3MuZ2VuZXJhbC8xMzMxNzIKCmpvaGFubmVzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
YXRoMTBrCg==
