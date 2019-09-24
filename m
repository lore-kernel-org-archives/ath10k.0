Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCgeM-0000d4-2n
 for ath10k@lists.infradead.org; Tue, 24 Sep 2019 08:58:23 +0000
MIME-Version: 1.0
Date: Tue, 24 Sep 2019 16:58:21 +0800
From: Yibo Zhao <yiboz@codeaurora.org>
Subject: Re: [PATCH V3 3/4] mac80211: fix low throughput in multi-clients
 situation
In-Reply-To: <87d0fq3wqy.fsf@toke.dk>
References: <1569223201-1490-1-git-send-email-yiboz@codeaurora.org>
 <1569223201-1490-4-git-send-email-yiboz@codeaurora.org>
 <87impj5lkm.fsf@toke.dk> <2aab0bd944ee34751304a5f92b885113@codeaurora.org>
 <87d0fq3wqy.fsf@toke.dk>
Message-ID: <0c58a6be437e5a21c63ad44cc86c317b@codeaurora.org>
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
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

T24gMjAxOS0wOS0yNCAxNjo0OCwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdyb3RlOgo+IFlp
Ym8gWmhhbyA8eWlib3pAY29kZWF1cm9yYS5vcmc+IHdyaXRlczoKPiAKPj4+IEkgY2FuIHNlZSB3
aHkgd2UgbmVlZCB0aGUgc2Vjb25kIHBhcnQgKGJhc2ljYWxseSwgdGhpcyBoYXBwZW5zIAo+Pj4g
YmVjYXVzZQo+Pj4gSQo+Pj4gZm9yZ290IHRvIGFkZCBhIGNoZWNrIGZvciAibm8gZWxpZ2libGUg
c3RhdGlvbnMiIGluIG1heV90cmFuc21pdCgpLAo+Pj4gbGlrZQo+Pj4gdGhlIG9uZSBpbiBuZXh0
X3R4cSgpKS4gQW5kIHJvdW5kaW5nIHVwIHRoZSBkaXZpc2lvbiByZXN1bHQgZG9lc24ndAo+Pj4g
aHVydCwgSSBndWVzcy4gQnV0IHdoeSBkb2VzIGl0IGhlbHAgdG8gY2hhbmdlIHRoZSBncmFjZSBw
ZXJpb2QgaWYgCj4+PiB3ZSdyZQo+Pj4gZG9pbmcgYWxsIHRoZSBvdGhlciBzdHVmZj8KPj4gSW4g
bXVsdGktY2xpZW50cyBjYXNlLCBpdCBpcyBwb3NzaWJsZSBhIFRYUSBzb21ldGltZXMgZ2V0cyBk
cmFpbmVkIGR1ZQo+PiB0byBGVyBoYXMgZGVlcCBxdWV1ZSBhbmQgZmV3IHBhY2tldHMgaW4gVFhR
IGF0IHRoYXQgdGltZS4gU28gdGhlIFRYUSAKPj4gaXMKPj4gcmVtb3ZlZCBmcm9tIHRoZSByYnRy
ZWUgYWZ0ZXIgZGVxdWV1aW5nLiBXaGVuIGl0IGlzIGFib3V0IHRvIGFkZGVkIAo+PiBiYWNrCj4+
IHZlcnkgc29vbiBhZnRlciB0aGUgcmVtb3ZhbCwgdGhlIGdfdnQgbWlnaHQgaGF2ZSBnb25lIGEg
bGl0dGxlIGZhciAKPj4gYXdheQo+PiBmcm9tIHN0YSB2dCB3aGVyZSBzeW5jIGlzIG5lZWRlZC4g
V2l0aCB0aGlzIHN5bmMsIHRoZSBzdGF0aW9uIGlzIAo+PiBmb3JjZWQKPj4gdG8gY2F0Y2ggdXAg
d2l0aCB0aGUgZ192dCwgaG93ZXZlciwgaXRzIGNoYW5jZSBmb3IgdHJhbnNtaXNzaW9uIGhhcyAK
Pj4gYmVlbgo+PiByZWR1Y2VkLiBJIHRoaW5rIDUwMHVzIGlzIHF1aXRlIGEgc2hvcnQgcGVyaW9k
IGluIG11bHRpLWNsaWVudHMgY2FzZS4KPiAKPiBUaGF0J3MgYSBnb29kIHBvaW50LCBhY3R1YWxs
eTogSGF2aW5nIHRoZSBncmFjZSBwZXJpb2QgYmUgdG9vIHNtYWxsIAo+IHdpbGwKPiBhbGxvdyBz
dGF0aW9ucyB0aGF0IGxlYXZlIGFuZCByZS1lbnRlciB0aGUgcXVldWUgdG8gInNraXAgYWhlYWQi
IGFuZCAKPiB1c2UKPiBtb3JlIHRoYW4gaXRzIHNoYXJlLiBIb3dldmVyLCBJIHRoaW5rIGl0J3Mg
YSBzZXBhcmF0ZSBpc3N1ZSBmcm9tIHdoYXQKPiB0aGlzIHBhdGNoIGlzIGFib3V0OyBzbyBob3cg
YWJvdXQgSSBqdXN0IGluY3JlYXNlIHRoZSBncmFjZSBwZXJpb2QgaW4KPiB0aGUgbmV4dCB2ZXJz
aW9uIG9mIHRoZSBiYXNlIHBhdGNoPwoKU3VyZSwgbm8gcHJvYmxlbS4gOikKPiAKPiAtVG9rZQoK
LS0gCllpYm8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
