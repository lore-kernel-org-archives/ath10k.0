Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLT1N-0005Dw-Pc
 for ath10k@lists.infradead.org; Fri, 18 Oct 2019 14:14:27 +0000
Message-ID: <78035e38264feac9d15a761b009c89b9738b4de1.camel@sipsolutions.net>
Subject: Re: [PATCH v2 1/4] mac80211: Rearrange ieee80211_tx_info to make
 room for tx_time_est
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 18 Oct 2019 16:14:20 +0200
In-Reply-To: <87d0eudufu.fsf@toke.dk> (sfid-20191018_160136_042961_4FF7E805)
References: <157115993755.2500430.12214017471129215800.stgit@toke.dk>
 <157115993866.2500430.13989567853855880476.stgit@toke.dk>
 <CA+iem5t6xghBocck864nDX2snWQ5O+v6_M2Jc9aCdn_hE+mFCA@mail.gmail.com>
 <87sgnqe4wg.fsf@toke.dk>
 <10b885b3238cede2d99c6134bebcc0c8ba6f6b10.camel@sipsolutions.net>
 <87imomdvsj.fsf@toke.dk>
 <9fc60b546b54b40357264d67536733251cf39ebe.camel@sipsolutions.net>
 <87d0eudufu.fsf@toke.dk> (sfid-20191018_160136_042961_4FF7E805)
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
To: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>, Kan Yan <kyan@google.com>
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, make-wifi-fast@lists.bufferbloat.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

T24gRnJpLCAyMDE5LTEwLTE4IGF0IDE2OjAxICswMjAwLCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5z
ZW4gd3JvdGU6Cj4gCj4gPiBXZSBjYW4gYWxzbyBwbGF5IHdpdGggdGhlIHVuaXRzIG9mIHRoZSBh
aXJ0aW1lLCBlLmcuIG1ha2luZyB0aGF0IGEKPiA+IG11bHRpcGxlIG9mIDIgb3IgNCB1cz8gU2Vl
bXMgdW5saWtlbHkgdG8gbWF0dGVyIG11Y2g/Cj4gCj4gU3VyZSwgdGhhdCdzIGEgZ29vZCBwb2lu
dCEgSW5jcmVtZW50cyBvZiA0dXMgbWVhbnMgd2UgY2FuIGZpdCA0bXMgaXMgMTAKPiBiaXRzLCBs
ZWF2aW5nIHBsZW50eSBvZiBzcGFjZSBmb3IgQUNLIElEcyAoaG9wZWZ1bGx5KS4KCklmIHlvdSBk
byBuZWVkIG1vcmUgYml0cyAoZS5nLiB0byBiZSBvbiB0aGUgc2FmZSBzaWRlIGFuZCBoYXZlIHNw
YWNlIGZvcgo4bXMpIHlvdSBjb3VsZCBhbHNvIHN0ZWFsIGJpdHMgb3V0IG9mICdiYW5kJyAod2Ug
b25seSBuZWVkIDMgSSB0aGluaykKYW5kICdod19xdWV1ZScgKG5vdCBzdXJlIHdoYXQgdGhlIGxp
bWl0IHJlYWxseSBpcywgYnV0IHRoZXJlIGFyZW4ndCBtYW55CnVzZXJzLCBzZWVtcyBsaWtlIG9u
bHkgaXdsd2lmaS9kdm0gYW5kIGh3c2ltIGNhcmUsIGFuZCB0aG9zZSBjZXJ0YWlubHkKZG9uJ3Qg
bmVlZCA+MzIgcXVldWVzKS4KCk9mIGNvdXJzZSBpZiB5b3UgbGVhdmUgbW9yZSBiaXRzIGZvciBs
YXRlciB0aGF0J3MgZ29vZCB0b28gOy0pCgpqb2hhbm5lcwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hdGgxMGsK
