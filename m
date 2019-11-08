Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iT1xo-0004qt-Ik
 for ath10k@lists.infradead.org; Fri, 08 Nov 2019 10:58:01 +0000
Message-ID: <4ce4c199522ef112362efb8db8823e31d5c41944.camel@sipsolutions.net>
Subject: Re: [PATCH v6 2/4] mac80211: Import airtime calculation code from mt76
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 08 Nov 2019 11:57:54 +0100
In-Reply-To: <87d0e2fxi0.fsf@toke.dk>
References: <157182473951.150713.7978051149956899705.stgit@toke.dk>
 <157182474174.150713.17459330922820192258.stgit@toke.dk>
 <42266e95f45d5772e04c9c016bd6179ea14ffefa.camel@sipsolutions.net>
 <87d0e2fxi0.fsf@toke.dk>
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

T24gRnJpLCAyMDE5LTExLTA4IGF0IDExOjU1ICswMTAwLCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5z
ZW4gd3JvdGU6Cj4gSm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29sdXRpb25zLm5ldD4gd3Jp
dGVzOgo+IAo+ID4gT24gV2VkLCAyMDE5LTEwLTIzIGF0IDExOjU5ICswMjAwLCBUb2tlIEjDuGls
YW5kLUrDuHJnZW5zZW4gd3JvdGU6Cj4gPiA+IEZyb206IFRva2UgSMO4aWxhbmQtSsO4cmdlbnNl
biA8dG9rZUByZWRoYXQuY29tPgo+ID4gPiAKPiA+ID4gRmVsaXggcmVjZW50bHkgYWRkZWQgY29k
ZSB0byBjYWxjdWxhdGUgYWlydGltZSBvZiBwYWNrZXRzIHRvIHRoZSBtdDc2Cj4gPiA+IGRyaXZl
ci4gSW1wb3J0IHRoaXMgaW50byBtYWM4MDIxMSBzbyB3ZSBjYW4gdXNlIGl0IGZvciBhaXJ0aW1l
IHF1ZXVlIGxpbWl0Cj4gPiA+IGNhbGN1bGF0aW9ucyBsYXRlci4KPiA+ID4gCj4gPiA+IFRoZSBh
aXJ0aW1lLmMgZmlsZSBpcyBjb3BpZWQgdmVyYmF0aW0gZnJvbSB0aGUgbXQ3NiBkcml2ZXIsIGFu
ZCBhZGp1c3RlZCB0bwo+ID4gPiB1c2UgbWFjODAyMTEgZGF0YSBzdHJ1Y3R1cmVzIGluc3RlYWQg
KHdoaWNoIGlzIGZhaXJseSBzdHJhaWdodCBmb3J3YXJkKS4KPiA+ID4gVGhlIHBlci1yYXRlIFRY
IHJhdGUgY2FsY3VsYXRpb24gaXMgc3BsaXQgb3V0IHRvIGl0cyBvd24KPiA+ID4gZnVuY3Rpb24g
KGllZWU4MDIxMV9jYWxjX3R4X2FpcnRpbWVfcmF0ZSgpKSBzbyBpdCBjYW4gYmUgdXNlZCBkaXJl
Y3RseSBmb3IKPiA+ID4gdGhlIEFRTCBjYWxjdWxhdGlvbnMgYWRkZWQgaW4gYSBzdWJzZXF1ZW50
IHBhdGNoLgo+ID4gCj4gPiBBbnkgd2F5IGl0IGNvdWxkIGJlIGV4cG9zZWQgYnkgbWFjODAyMTEg
YmFjayB0byB0aGUgZHJpdmVycywgcGVyaGFwcywgdG8KPiA+IHNoYXJlIGl0Pwo+IAo+IERpZG4n
dCBJIGFscmVhZHkgZXhwb3J0IHNvbWUgb2YgdGhlIGZ1bmN0aW9ucz8gTXkgaW50ZW50aW9uIHdh
cyB0byBkbwo+IHRoYXQsIGNlcnRhaW5seSwgYW5kIHRvIHBhdGNoIG10NzYgdG8gc3dpdGNoIHRv
IHVzaW5nIHRoZW0gb25jZSB0aGUKPiB0cmVlcyBoYXZlIGNvbnZlcmdlZC4uLgoKWWVhaCwgSSB0
aGluayB5b3UgZGlkLiBTb3VuZHMgZ29vZC4KCmpvaGFubmVzCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2F0aDEwawo=
