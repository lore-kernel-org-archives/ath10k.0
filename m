Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eKcrg-0000Jx-M9
 for ath10k@lists.infradead.org; Fri, 01 Dec 2017 04:23:54 +0000
MIME-Version: 1.0
Date: Fri, 01 Dec 2017 09:53:30 +0530
From: akolli@codeaurora.org
Subject: Re: [PATCH 2/2] ath10k: add per peer tx stats support for 10.2.4
In-Reply-To: <87bmjjzppd.fsf@kamboji.qca.qualcomm.com>
References: <1512046701-14435-1-git-send-email-akolli@qti.qualcomm.com>
 <1512046701-14435-3-git-send-email-akolli@qti.qualcomm.com>
 <87k1y7zqtj.fsf@kamboji.qca.qualcomm.com>
 <DAB5EBB8-C820-4056-8AAB-063D05F38BD5@toke.dk>
 <87bmjjzppd.fsf@kamboji.qca.qualcomm.com>
Message-ID: <5080a68538fd2d883e15bacaa969661b@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless-owner@vger.kernel.org, Anilkumar Kolli <akolli@qti.qualcomm.com>, =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

T24gMjAxNy0xMS0zMCAyMjowOCwgS2FsbGUgVmFsbyB3cm90ZToKPiBUb2tlIEjDuGlsYW5kLUrD
uHJnZW5zZW4gPHRva2VAdG9rZS5kaz4gd3JpdGVzOgo+IAo+Pj4+ICtzdHJ1Y3QgYXRoMTBrXzEw
XzJfcGVlcl90eF9zdGF0cyB7Cj4+Pj4gKwl1OCByYXRlY29kZVtQRUVSX1NUQVRTX0ZPUl9OT19P
Rl9QUERVU107Cj4+Pj4gKwl1OCBzdWNjZXNzX3BrdHNbUEVFUl9TVEFUU19GT1JfTk9fT0ZfUFBE
VVNdOwo+Pj4+ICsJX19sZTE2IHN1Y2Nlc3NfYnl0ZXNbUEVFUl9TVEFUU19GT1JfTk9fT0ZfUFBE
VVNdOwo+Pj4+ICsJdTggcmV0cnlfcGt0c1tQRUVSX1NUQVRTX0ZPUl9OT19PRl9QUERVU107Cj4+
Pj4gKwlfX2xlMTYgcmV0cnlfYnl0ZXNbUEVFUl9TVEFUU19GT1JfTk9fT0ZfUFBEVVNdOwo+Pj4+
ICsJdTggZmFpbGVkX3BrdHNbUEVFUl9TVEFUU19GT1JfTk9fT0ZfUFBEVVNdOwo+Pj4+ICsJX19s
ZTE2IGZhaWxlZF9ieXRlc1tQRUVSX1NUQVRTX0ZPUl9OT19PRl9QUERVU107Cj4+Pj4gKwl1OCBm
bGFnc1tQRUVSX1NUQVRTX0ZPUl9OT19PRl9QUERVU107Cj4+Pj4gKwlfX2xlMzIgdHhfZHVyYXRp
b247Cj4+Pj4gKwl1OCB0eF9wcGR1X2NudDsKPj4+PiArCXU4IHBlZXJfaWQ7Cj4+Pj4gK30gX19w
YWNrZWQ7Cj4+PiAKPj4+IFRva2UsIGhvcGVmdWxseSB0aGUgdHhfZHVyYXRpb24gdmFsdWUgaGVy
ZSBoZWxwcyB3aXRoIEFURgo+Pj4gaW1wbGVtZW50YXRpb24KPj4+IHVzaW5nIFFDQTk4OFguCj4+
IAo+PiBBd2Vzb21lISBXaGF0J3MgdGhlIHNlbWFudGljcyBvZiB0aGlzIGZpZWxkPyBKdXN0IHRv
dGFsCj4+IGR1cmF0aW9uIHNwZW50IHNlcnZpbmcgdGhhdCBzdGF0aW9uIGluIHRoZSByZXBvcnRp
bmcgaW50ZXJ2YWw/Cj4+IERvZXMgaXQgaW5jbHVkZSByZXRyeSBhdHRlbXB0cz8KPiAKPiBJIGhh
dmUgbm8gY2x1ZSA6KSBJIGp1c3Qgbm90aWNlZCB0aGlzIHdoaWxlIEkgd2FzIHJldmlld2luZyB0
aGUgcGF0Y2gKPiBpbnRlcm5hbGx5IGFuZCBpbW1lZGlhdGVseSByZWNhbGxlZCBvdXIgZGlzY3Vz
c2lvbnMgYXQgU2VvdWwuIEkgY2FuIHRyeQo+IHRvIGZpbmQgb3V0LCBidXQgdGhhdCB3aWxsIHRh
a2UgYSBsb25nIHRpbWUgYXMgSSBoYXZlIHdheSB0b28gbXVjaCAKPiBzdHVmZgo+IHBlbmRpbmcg
YXQgdGhlIG1vbWVudC4gSG9wZWZ1bGx5IHNvbWVvbmUgbW9yZSBrbm93bGVkZ2VhYmxlIAo+IChB
bmlsa3VtYXI/KQo+IGNhbiBjaGltZSBpbiBhbmQgaGVscC4KCnR4X2R1cmF0aW9uIGlzIGFnZ3Jl
Z2F0ZSB0aW1lIGR1cmF0aW9uIG9mIDQgUFBEVSBzZW50IHRvIFNUQS4KRlcgc2VuZHMgdGhlc2Ug
dmFsdWVzIGZvciByZXRyeSBwYWNrZXRzIGFsc28uCgpUaGFua3MsCkFuaWwuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0
CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
