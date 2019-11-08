Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iT1KD-0004hE-LW
 for ath10k@lists.infradead.org; Fri, 08 Nov 2019 10:17:06 +0000
Message-ID: <0b43c4822ab83ea4d33a5a32d8ff6c7a56eff6c5.camel@sipsolutions.net>
Subject: Re: [PATCH v6 4/4] mac80211: Use Airtime-based Queue Limits (AQL)
 on packet dequeue
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 08 Nov 2019 11:17:00 +0100
In-Reply-To: <157182474399.150713.16380222749144410045.stgit@toke.dk>
References: <157182473951.150713.7978051149956899705.stgit@toke.dk>
 <157182474399.150713.16380222749144410045.stgit@toke.dk>
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
To: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Cc: Kan Yan <kyan@google.com>, Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, make-wifi-fast@lists.bufferbloat.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

T24gV2VkLCAyMDE5LTEwLTIzIGF0IDExOjU5ICswMjAwLCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5z
ZW4gd3JvdGU6Cj4gCj4gKwlpZiAoaW5mby0+dHhfdGltZV9lc3QpIHsKPiArCQlzdHJ1Y3Qgc3Rh
X2luZm8gKnN0YSA9IE5VTEwsICpzOwo+ICsJCXN0cnVjdCByaGxpc3RfaGVhZCAqdG1wOwo+ICsK
PiArCQlyY3VfcmVhZF9sb2NrKCk7Cj4gKwo+ICsJCWZvcl9lYWNoX3N0YV9pbmZvKGxvY2FsLCBo
ZHItPmFkZHIxLCBzLCB0bXApIHsKPiArCQkJLyogc2tpcCB3cm9uZyB2aXJ0dWFsIGludGVyZmFj
ZSAqLwo+ICsJCQlpZiAoIWV0aGVyX2FkZHJfZXF1YWwoaGRyLT5hZGRyMiwgcy0+c2RhdGEtPnZp
Zi5hZGRyKSkKPiArCQkJCWNvbnRpbnVlOwo+ICsKPiArCQkJc3RhID0gczsKPiArCQkJYnJlYWs7
Cj4gKwkJfQoKSSBndWVzcyB0aGF0IGlzIGJldHRlciB0aGFuIGxvb2tpbmcgdXAgdGhlIHNkYXRh
IGFuZCB0aGVuIHVzaW5nCnN0YV9pbmZvX2dldCgpLCBidXQgSSB0aGluayBJJ2QgbGlrZSB0byBz
ZWUgdGhpcyB3cmFwcGVkIGludG8gYSBmdW5jdGlvbgooZXZlbiBpZiBpdCdzIGFuIGlubGluZSkg
aW4gc3RhX2luZm8ue2MsaH0uCgo+ICsJCWFpcnRpbWUgPSBpZWVlODAyMTFfY2FsY19leHBlY3Rl
ZF90eF9haXJ0aW1lKGh3LCB2aWYsIHR4cS0+c3RhLAo+ICsJCQkJCQkJICAgICBza2ItPmxlbik7
Cj4gKwkJaWYgKGFpcnRpbWUpIHsKPiArCQkJLyogV2Ugb25seSBoYXZlIDEwIGJpdHMgaW4gdHhf
dGltZV9lc3QsIHNvIHN0b3JlIGFpcnRpbWUKPiArCQkJICogaW4gaW5jcmVtZW50cyBvZiA0dXMg
YW5kIGNsYW1wIHRoZSBtYXhpbXVtIHRvIDIqKjEyLTEKPiArCQkJICovCj4gKwkJCWFpcnRpbWUg
PSBtaW5fdCh1MzIsIGFpcnRpbWUsIDQwOTUpICYgfjNVOwo+ICsJCQlpbmZvLT50eF90aW1lX2Vz
dCA9IGFpcnRpbWUgPj4gMjsKPiArCQkJaWVlZTgwMjExX3N0YV91cGRhdGVfcGVuZGluZ19haXJ0
aW1lKGxvY2FsLCB0eC5zdGEsCj4gKwkJCQkJCQkgICAgIHR4cS0+YWMsIGFpcnRpbWUsCj4gKwkJ
CQkJCQkgICAgIGZhbHNlKTsKCkkgd29uZGVyIGlmIGl0J2QgYmUgYmV0dGVyIHRvIHBhc3MgdGhl
IHNoaWZ0ZWQgdmFsdWUgdG8KaWVlZTgwMjExX3N0YV91cGRhdGVfcGVuZGluZ19haXJ0aW1lKCkg
dG8gYXZvaWQgYWxsIHRoZSBzaGlmdGluZyBpbiBhbGwKcGxhY2VzPwoKWW91IGNvdWxkIGV2ZW4g
c3RvcmUgdGhlIHNoaWZ0ZWQgdmFsdWUgaW4gImFxbF90eF9wZW5kaW5nIiBhbmQKImFxbF90b3Rh
bF9wZW5kaW5nX2FpcnRpbWUiIGV0Yy4sIGl0J3MgY29tcGxldGVseSBlcXVpdmFsZW50LCBhbmQg
b25seQpzaGlmdCBpdCBvdXQgZm9yIHBlb3BsZSBsb29raW5nIGF0IGRlYnVnZnMuCgpqb2hhbm5l
cwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEw
ayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
