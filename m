Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAXDO-0002n0-5R
 for ath10k@lists.infradead.org; Wed, 18 Sep 2019 10:29:39 +0000
MIME-Version: 1.0
Date: Wed, 18 Sep 2019 18:29:37 +0800
From: Yibo Zhao <yiboz@codeaurora.org>
Subject: Re: [PATCH V2 3/4] mac80211: fix low throughput in multi-clients
 situation
In-Reply-To: <874l19j56n.fsf@toke.dk>
References: <1568800033-17297-1-git-send-email-yiboz@codeaurora.org>
 <1568800033-17297-3-git-send-email-yiboz@codeaurora.org>
 <874l19j56n.fsf@toke.dk>
Message-ID: <38267df5b284bfd681ad69c7e816c5a4@codeaurora.org>
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
To: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

T24gMjAxOS0wOS0xOCAxNzo1OSwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdyb3RlOgo+IFlp
Ym8gWmhhbyA8eWlib3pAY29kZWF1cm9yYS5vcmc+IHdyaXRlczoKPiAKPj4gTm90IGxvbmcgYWZ0
ZXIgdGhlIHN0YXJ0IG9mIG11bHRpLWNsaWVudHMgdGVzdCwgbm90IGEgc2luZ2xlIHN0YXRpb24g
Cj4+IGlzCj4+IGFuIGVsaWdpYmxlIGNhbmRpZGF0ZSBmb3IgdHJhbnNtaXNzaW9uIHNpbmNlIGds
b2JhbCB2aXJ0dWFsIHRpbWUoZ192dCkgCj4+IGlzCj4+IHNtYWxsZXIgdGhhbiB0aGUgdmlydHVh
bCBhaXJ0aW1lKHNfdnQpIG9mIGFsbCB0aGUgc3RhdGlvbnMuIEFzIGEgCj4+IHJlc3VsdCwKPj4g
dGhlIFR4IGhhcyBiZWVuIGJsb2NrZWQgYW5kIHRocm91Z2hwdXQgaXMgcXVpdGUgbG93Lgo+PiAK
Pj4gVGhpcyBtYXkgbWFpbmx5IGR1ZSB0byBzeW5jIG1lY2hhbmlzbSBhbmQgYWNjdW11bGF0aXZl
IGRldmlhdGlvbiBmcm9tIAo+PiB0aGUKPj4gZGV2aXNpb24gY2FsY3VsYXRpb24gb2YgZ192dC4K
Pj4gCj4+IEZvciBleGFtcGxlOgo+PiBTdXBwb3NlIHdlIGhhdmUgNTAgY2xpZW50cyBpbiBmaXJz
dCByb3VuZC4KPj4gUm91bmQgMToKPj4gU1RBCXdlaWdodAlUeF90aW1lX3JvdW5kICB3dF9zdW0J
c192dAlnX3Z0ICB2YWxpZF9mb3JfbmV4dF9UeAo+PiAuCS4JLgkJCS4JCS4KPj4gLgkuCS4JCQku
CQkuCj4+IC4JLgkuCQkJLgkJLgo+PiAKPj4gQWZ0ZXIgdGhpcyByb3VuZCwgYWxsIHRoZSBzdGF0
aW9ucyBhcmUgbm90IHZhbGlkIGZvciBuZXh0IHRyYW5zbWlzc2lvbiAKPj4gZHVlCj4+IHRvIGFj
Y3VtdWxhdGl2ZSBkZXZpYXRpb24uCj4+IAo+PiBBbmQgaWYgd2UgYWRkIGEgbmV3ICM1MSwKPj4g
Um91bmQgMjoKPj4gU1RBCXdlaWdodAlUeF90aW1lX3JvdW5kCXd0X3N1bSAgc192dAlnX3Z0ICB2
YWxpZF9mb3JfbmV4dF9UeAo+PiAuCS4JLgkJCS4JCS4KPj4gLgkuCS4JCQkuCQkuCj4+IC4JLgku
CQkJLgkJLgo+PiAKPj4gU3luYyBpcyBkb25lIGJ5Ogo+PiBtYXgoZ192dCBvZiBsYXN0IHJvdW5k
IC0gZ3JhY2UgcGVyaW9kLCBzX3Z0KQo+PiBhbmQgc192dCBvZiAjNTEgPSBtYXgoMjAwMCAtIDUw
MCwgMCkgKyAxMDI0ID0gMjUyNCwgYW5kIGl0IGlzIG1vcmUgCj4+IHRoYW4gdGhlCj4+IGZpbmFs
IGdfdnQgb2YgdGhpcyByb3VuZC4KPj4gCj4+IEFmdGVyIHRoaXMgcm91bmQsIG5vIG1vcmUgc3Rh
dGlvbiBpcyB2YWxpZCBmb3IgdHJhbnNtaXNzaW9uLgo+IAo+IEknbSBub3Qgc3VyZSBJIHVuZGVy
c3RhbmQgdGhpcy4gV2FzIHRoZXJlIHN1cHBvc2VkIHRvIGJlIG51bWJlcnMgaW4KPiB0aG9zZSB0
YWJsZXMgYWJvdmU/ClllcywgaXQgbG9va3MgbGlrZSB0aGVyZSBhcmUgc29tZSBkaXNwbGF5IGlz
c3Vlcy4gV2lsbCBmaXggaXQgaW4gbmV4dCAKdmVyc2lvbi4KPiAKPiAtVG9rZQoKLS0gCllpYm8K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBt
YWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
