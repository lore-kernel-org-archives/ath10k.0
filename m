Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iT1wW-0004hX-PF
 for ath10k@lists.infradead.org; Fri, 08 Nov 2019 10:56:42 +0000
Received: by mail-lj1-f197.google.com with SMTP id h16so1171352ljk.20
 for <ath10k@lists.infradead.org>; Fri, 08 Nov 2019 02:56:36 -0800 (PST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH v6 3/4] mac80211: Implement Airtime-based Queue Limit (AQL)
In-Reply-To: <1a2eb096119c9029e67caf797564d6511c8803a7.camel@sipsolutions.net>
References: <157182473951.150713.7978051149956899705.stgit@toke.dk>
 <157182474287.150713.12867638269538730397.stgit@toke.dk>
 <1a2eb096119c9029e67caf797564d6511c8803a7.camel@sipsolutions.net>
Date: Fri, 08 Nov 2019 11:56:34 +0100
Message-ID: <87a796fxgd.fsf@toke.dk>
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

Sm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29sdXRpb25zLm5ldD4gd3JpdGVzOgoKPiBPbiBX
ZWQsIDIwMTktMTAtMjMgYXQgMTE6NTkgKzAyMDAsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3
cm90ZToKPj4gCj4+ICAKPj4gK3ZvaWQgaWVlZTgwMjExX3N0YV91cGRhdGVfcGVuZGluZ19haXJ0
aW1lKHN0cnVjdCBpZWVlODAyMTFfbG9jYWwgKmxvY2FsLAo+PiArCQkJCQkgIHN0cnVjdCBzdGFf
aW5mbyAqc3RhLCB1OCBhYywKPj4gKwkJCQkJICB1MTYgdHhfYWlydGltZSwgYm9vbCB0eF9jb21w
bGV0ZWQpCj4+ICt7Cj4+ICsJc3Bpbl9sb2NrX2JoKCZsb2NhbC0+YWN0aXZlX3R4cV9sb2NrW2Fj
XSk7Cj4+ICsJaWYgKHR4X2NvbXBsZXRlZCkgewo+PiArCQlpZiAoc3RhKSB7Cj4+ICsJCQlpZiAo
V0FSTl9PTkNFKHN0YS0+YWlydGltZVthY10uYXFsX3R4X3BlbmRpbmcgPCB0eF9haXJ0aW1lLAo+
PiArCQkJCSAgICAgICJUWFEgcGVuZGluZyBhaXJ0aW1lIHVuZGVyZmxvdzogJXUsICV1IiwKPj4g
KwkJCQkgICAgICBzdGEtPmFpcnRpbWVbYWNdLmFxbF90eF9wZW5kaW5nLCB0eF9haXJ0aW1lKSkK
Pgo+IE1heWJlIGFkZCB0aGUgU1RBL0FDIHRvIHRoZSBtZXNzYWdlPwoKQ2FuIGRvLiBBbnkgaWRl
YSB3aHkgd2UgbWlnaHQgYmUgc2VlaW5nIHVuZGVyZmxvd3MgKGFzIEthbiByZXBvcnRlZCk/Cgot
VG9rZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0
aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
