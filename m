Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iT2A4-0004Gp-DW
 for ath10k@lists.infradead.org; Fri, 08 Nov 2019 11:10:41 +0000
Received: by mail-lf1-f71.google.com with SMTP id h3so1232244lfp.17
 for <ath10k@lists.infradead.org>; Fri, 08 Nov 2019 03:10:35 -0800 (PST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH v6 3/4] mac80211: Implement Airtime-based Queue Limit (AQL)
In-Reply-To: <f395a9a971ca1a0d0438fca10dfb160c421caa7a.camel@sipsolutions.net>
References: <157182473951.150713.7978051149956899705.stgit@toke.dk>
 <157182474287.150713.12867638269538730397.stgit@toke.dk>
 <1a2eb096119c9029e67caf797564d6511c8803a7.camel@sipsolutions.net>
 <87a796fxgd.fsf@toke.dk>
 <f395a9a971ca1a0d0438fca10dfb160c421caa7a.camel@sipsolutions.net>
Date: Fri, 08 Nov 2019 12:10:32 +0100
Message-ID: <874kzefwt3.fsf@toke.dk>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Kan Yan <kyan@google.com>, Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, make-wifi-fast@lists.bufferbloat.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

Sm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29sdXRpb25zLm5ldD4gd3JpdGVzOgoKPiBPbiBG
cmksIDIwMTktMTEtMDggYXQgMTE6NTYgKzAxMDAsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3
cm90ZToKPj4gSm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29sdXRpb25zLm5ldD4gd3JpdGVz
Ogo+PiAKPj4gPiBPbiBXZWQsIDIwMTktMTAtMjMgYXQgMTE6NTkgKzAyMDAsIFRva2UgSMO4aWxh
bmQtSsO4cmdlbnNlbiB3cm90ZToKPj4gPiA+ICAKPj4gPiA+ICt2b2lkIGllZWU4MDIxMV9zdGFf
dXBkYXRlX3BlbmRpbmdfYWlydGltZShzdHJ1Y3QgaWVlZTgwMjExX2xvY2FsICpsb2NhbCwKPj4g
PiA+ICsJCQkJCSAgc3RydWN0IHN0YV9pbmZvICpzdGEsIHU4IGFjLAo+PiA+ID4gKwkJCQkJICB1
MTYgdHhfYWlydGltZSwgYm9vbCB0eF9jb21wbGV0ZWQpCj4+ID4gPiArewo+PiA+ID4gKwlzcGlu
X2xvY2tfYmgoJmxvY2FsLT5hY3RpdmVfdHhxX2xvY2tbYWNdKTsKPj4gPiA+ICsJaWYgKHR4X2Nv
bXBsZXRlZCkgewo+PiA+ID4gKwkJaWYgKHN0YSkgewo+PiA+ID4gKwkJCWlmIChXQVJOX09OQ0Uo
c3RhLT5haXJ0aW1lW2FjXS5hcWxfdHhfcGVuZGluZyA8IHR4X2FpcnRpbWUsCj4+ID4gPiArCQkJ
CSAgICAgICJUWFEgcGVuZGluZyBhaXJ0aW1lIHVuZGVyZmxvdzogJXUsICV1IiwKPj4gPiA+ICsJ
CQkJICAgICAgc3RhLT5haXJ0aW1lW2FjXS5hcWxfdHhfcGVuZGluZywgdHhfYWlydGltZSkpCj4+
ID4gCj4+ID4gTWF5YmUgYWRkIHRoZSBTVEEvQUMgdG8gdGhlIG1lc3NhZ2U/Cj4+IAo+PiBDYW4g
ZG8uIEFueSBpZGVhIHdoeSB3ZSBtaWdodCBiZSBzZWVpbmcgdW5kZXJmbG93cyAoYXMgS2FuIHJl
cG9ydGVkKT8KPgo+IE5vLCBJIHJlYWxseSBoYXZlIG5vIGlkZWEuIFRoZSBzaGlmdGluZyBsb29r
ZWQgT0sgdG8gbWUsIHRob3VnaCBJIGRpZG4ndAo+IHJldmlldyBpdCBjYXJlZnVsbHkgZW5vdWdo
IHRvIHNheSBJJ3ZlIHJlYWxseSBsb29rZWQgYXQgYWxsIHBsYWNlcyAuLi4KClJpZ2h0LCBidWdn
ZXIuIEkgd2FzIHRoaW5raW5nIG1heWJlIHRoZXJlJ3MgYSBjYXNlIHdoZXJlIHNrYnMgY2FuIGJl
CmNsb25lZCAoYW5kIHJldGFpbiB0aGUgdHhfdGltZV9lc3QgZmllbGQpIGFuZCB0aGVuIHJlbGVh
c2VkIHR3aWNlPyBPcgptYXliZSBzb21ld2hlcmUgdGhhdCBzdGVwcyBvbiB0aGUgc2tiLT5jYiBm
aWVsZCBpbiBzb21lIG90aGVyIHdheT8KQ291bGRuJ3QgZmluZCBhbnl0aGluZyBvYnZpb3VzIG9u
IGEgZmlyc3QgcGVydXNhbCBvZiB0aGUgVFggcGF0aCBjb2RlLApidXQgbWF5YmUgeW91IGNvdWxk
IHRoaW5rIG9mIHNvbWV0aGluZz8KCk90aGVyd2lzZSBJIGd1ZXNzIHdlJ2xsIGJlIGZvcmNlZCB0
byBnbyBhbmQgZG8gc29tZSBhY3R1YWwsCm9sZC1mYXNoaW9uZWQgZGVidWdnaW5nIDspCgotVG9r
ZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEw
ayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
