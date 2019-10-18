Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLSMO-0004Sb-B1
 for ath10k@lists.infradead.org; Fri, 18 Oct 2019 13:32:06 +0000
Received: by mail-lj1-f197.google.com with SMTP id m8so1083946ljb.3
 for <ath10k@lists.infradead.org>; Fri, 18 Oct 2019 06:31:59 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH v2 1/4] mac80211: Rearrange ieee80211_tx_info to make room
 for tx_time_est
In-Reply-To: <10b885b3238cede2d99c6134bebcc0c8ba6f6b10.camel@sipsolutions.net>
References: <157115993755.2500430.12214017471129215800.stgit@toke.dk>
 <157115993866.2500430.13989567853855880476.stgit@toke.dk>
 <CA+iem5t6xghBocck864nDX2snWQ5O+v6_M2Jc9aCdn_hE+mFCA@mail.gmail.com>
 <87sgnqe4wg.fsf@toke.dk>
 <10b885b3238cede2d99c6134bebcc0c8ba6f6b10.camel@sipsolutions.net>
Date: Fri, 18 Oct 2019 15:31:56 +0200
Message-ID: <87imomdvsj.fsf@toke.dk>
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
To: Johannes Berg <johannes@sipsolutions.net>, Kan Yan <kyan@google.com>
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, make-wifi-fast@lists.bufferbloat.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

Sm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29sdXRpb25zLm5ldD4gd3JpdGVzOgoKPiBPbiBG
cmksIDIwMTktMTAtMTggYXQgMTI6MTUgKzAyMDAsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3
cm90ZToKPgo+PiBIb3dldmVyLCB0aGVyZSdzIGEgbmljZSBqdWljeSAndTE2IGFja19mcmFtZV9p
ZCcgYXQgdGhlIHN0YXJ0IG9mCj4+IGllZWU4MDIxMV90eF9pbmZvLiBDb3VsZCB3ZSBwb3RlbnRp
YWxseSB1c2UgdGhhdD8gV2UgY291bGQgdXNlIHRoZSB0b3AKPj4gYml0IGFzIGEgZGlzYW1iaWd1
YXRpb24gZmxhZzsgSSB0aGluayB3ZSdyZSBmaW5lIHdpdGggMTUgYml0cyBmb3IgdGhlIFRYCj4+
IHRpbWUgaXRzZWxmIChhIHNpbmdsZSBwYWNrZXQgd29uJ3QgZXhjZWVkIDhtcyBvciBUWCB0aW1l
KSwgc28gaWYgd2UgY2FuCj4+IGxpdmUgd2l0aCAxNSBiaXRzIG9mIEFDSyBmcmFtZSBJRCBzcGFj
ZSwgdGhhdCBjb3VsZCBiZSBhIHdheSBmb3J3YXJkPwo+Cj4gSSB3YXMgZ29pbmcgdG8gc2F5IHRo
YXQgc2hvdWxkIHdvcmsgYXMgd2Ugb25seSBldmVyIGhhdmUgYSBoYW5kZnVsIG9mCj4gQUNLIGZy
YW1lIElEcywgYnV0IC4uLiB5b3Ugc3RpbGwgbmVlZCB0aGUgYWlydGltZSBldmVuIGZvciBhIGZy
YW1lIHRoYXQKPiB1c2Vyc3BhY2Ugd2FudHMgdG8ga25vdyB0aGUgQUNLIHN0YXR1cyBvZiwgbm8/
CgpPaCwgcmlnaHQuCgpXZWxsLCBsZXQncyB0cnkgdG8gZG8gdGhlIGFjdHVhbCBtYXRoLi4uIEEg
ZnVsbC1zaXplICgxNTM4IGJ5dGVzKSBwYWNrZXQKdGFrZXMgfjIwNTAgbWljcm9zZWNvbmRzIHRv
IHRyYW5zbWl0IGF0IDYgTWJwcy4gQWRkaW5nIGluIG92ZXJoZWFkLCBpdCdzCmNlcnRhaW5seSBz
dGlsbCBsZXNzIHRoYXQgNDA5NiB1cywgc28gMTIgYml0cyBpcyBwbGVudHkuIFRoYXQgbGVhdmVz
CmZvdXIgYml0cyBmb3IgdGhlIEFDSyBzdGF0dXMgSUQgaWYgd2UganVzdCBzcGxpdCB0aGUgdTE2
OyBpZiB3ZSBvbmx5CmV2ZXIgaGF2ZSAiYSBoYW5kZnVsIiwgdGhhdCBzaG91bGQgYmUgZW5vdWdo
LCBubz8KCldlIGNvdWxkIGFsc28gc3BsaXQgNS8xMS4gVGhhdCB3b3VsZCBzdXBwb3J0IHVwIHRv
IDMyIEFDSyBJRHMsIGFuZCB3ZQpjYW4ganVzdCB0cnVuY2F0ZSB0aGUgYWlydGltZSBhdCAyMDQ4
IHVzLCB3aGljaCBpcyBub3QgYSBiaWcgZGVhbCBJJ2QKc2F5LiBXZSBjb3VsZCBldmVuIHNwbGl0
IDYvMTAgYW5kIG9ubHkgbmVlZCB0byB0cnVuY2F0ZSB0aGUgVFggdGltZSBhdApyYXRlcyBiZWxv
dyAxMyBNYnBzLi4uIE9yIHdlIGNvdWxkIHNhY3JpZmljZSBhIGJpdCB0byB0aGUgZmxhZyBhbmQg
b25seQp0cnVuY2F0ZSBpZiB0aGUgQUNLIHN0YXR1cyBmbGFnIGlzIHNldC4KClRoaW5rIGl0IG1v
c3RseSBkZXBlbmRzIG9uIHdoYXQgaXMgdGhlIHNtYWxsZXN0IElEIHNwYWNlIGZvciBBQ0sgSURz
IHdlCmNhbiBsaXZlIHdpdGg/IDopCgotVG9rZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
dGgxMGsK
