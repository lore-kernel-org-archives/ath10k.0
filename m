Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iT16y-00085q-GL
 for ath10k@lists.infradead.org; Fri, 08 Nov 2019 10:03:26 +0000
Message-ID: <e40e97d46c0f602677e654bd15c5e14f05274852.camel@sipsolutions.net>
Subject: Re: [PATCH v6 1/4] mac80211: Shrink the size of ack_frame_id to
 make room for tx_time_est
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 08 Nov 2019 11:03:15 +0100
In-Reply-To: <157182474063.150713.16132669599100802716.stgit@toke.dk>
References: <157182473951.150713.7978051149956899705.stgit@toke.dk>
 <157182474063.150713.16132669599100802716.stgit@toke.dk>
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
ZW4gd3JvdGU6Cj4gRnJvbTogVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHJlZGhhdC5j
b20+Cj4gCj4gVG8gaW1wbGVtZW50IGFpcnRpbWUgcXVldWUgbGltaXRpbmcsIHdlIG5lZWQgdG8g
a2VlcCBhIHJ1bm5pbmcgYWNjb3VudCBvZgo+IHRoZSBlc3RpbWF0ZWQgYWlydGltZSBvZiBhbGwg
c2ticyBxdWV1ZWQgaW50byB0aGUgZGV2aWNlLiBEbyB0byB0aGlzCj4gY29ycmVjdGx5LCB3ZSBu
ZWVkIHRvIHN0b3JlIHRoZSBhaXJ0aW1lIGVzdGltYXRlIGludG8gdGhlIHNrYiBzbyB3ZSBjYW4K
PiBkZWNyZWFzZSB0aGUgb3V0c3RhbmRpbmcgYmFsYW5jZSB3aGVuIHRoZSBza2IgaXMgZnJlZWQu
IFRoaXMgbWVhbnMgdGhhdCB0aGUKPiB0aW1lIGVzdGltYXRlIG11c3QgYmUgc3RvcmVkIHNvbWV3
aGVyZSB0aGF0IHdpbGwgc3Vydml2ZSBmb3IgdGhlIGxpZmV0aW1lCj4gb2YgdGhlIHNrYi4KPiAK
PiBUbyBnZXQgdGhpcywgZGVjcmVhc2UgdGhlIHNpemUgb2YgdGhlIGFja19mcmFtZV9pZCBmaWVs
ZCB0byA2IGJpdHMsIGFuZAo+IGxvd2VyIHRoZSBzaXplIG9mIHRoZSBJRCBzcGFjZSBhY2NvcmRp
bmdseS4gVGhpcyBsZWF2ZXMgMTAgYml0cyBmb3IgdXNlIGZvcgo+IHR4X3RpbWVfZXN0LCB3aGlj
aCBpcyBlbm91Z2ggdG8gc3RvcmUgYSBtYXhpbXVtIG9mIDQwOTYgdXMsIGlmIHdlIHNoaWZ0IHRo
ZQo+IHZhbHVlcyBzbyB0aGV5IGJlY29tZSB1bml0cyBvZiA0dXMuCj4gCgpJJ3ZlIGFwcGxpZWQg
dGhpcyBhcyBwcmVwYXJhdGlvbi4KCmpvaGFubmVzCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2F0aDEwawo=
