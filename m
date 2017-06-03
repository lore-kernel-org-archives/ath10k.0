Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Subject: Re: [wpa_supplicant] Is there a way to limit peers (to about 12) for
 IBSS/adhoc?
References: <edc163f6-a49c-21f3-9cf1-74df6e262fdb@gmail.com>
 <CAJ-Vmo=4-wKKV_4pXTSgVqdPOyR+zOrHbtVP4Mv9vxaueyrh=A@mail.gmail.com>
 <c9f21f91-992d-604f-91ac-4784e8258c3e@gmail.com>
 <CAJ-Vmo=RnRGCEOTs6VHzTVZeex0n7OnTEiJq8jZR2cDhbnTXwA@mail.gmail.com>
From: Xuebing Wang <xbing6@gmail.com>
Message-ID: <458fa88b-b6d9-d02a-8d5f-012f6c83edef@gmail.com>
Date: Sat, 3 Jun 2017 14:30:27 +0800
MIME-Version: 1.0
In-Reply-To: <CAJ-Vmo=RnRGCEOTs6VHzTVZeex0n7OnTEiJq8jZR2cDhbnTXwA@mail.gmail.com>
Content-Language: en-US
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: hostap@lists.infradead.org, simon Wunderlich <sw@simonwunderlich.de>, b.a.t.m.a.n@lists.open-mesh.org, Jason Toschlog <jason.toschlog@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Sven Eckelmann <sven@narfation.org>

SGkgQWRyaWFuLAoKPT4gSXMgaXQgYSBncmFkdWFsIHRoaW5nPyAgSWUsIGRvIHlvdSBrbm93IHdo
ZW4gaXQgc3RhcnRzIHRvIGhhbmc/IERvZXMKaXQgaGFuZyBhdCA0MD8gb3IgZ3JhZHVhbGx5IGFz
IHlvdSBhcHByb2FjaCA0MD8KCldlIGRvIG5vdCBrbm93LiBXaGF0IHdlIGRvIGtub3cgaXMsIDIw
IHBlZXJzIC8gbmVpZ2hib3JzIHdvcmsgd2VsbC4KCkphc29uIFRvc2NobG9nIGluIENDIHNhaWQg
dGhhdCBoZSBvYnNlcnZlZCBzaW1pbGFyIGlzc3VlcyB3aXRoIGJyY21mbWFjIAp3aGVuIHBlZXJz
IHJlYWNoIDMyICgxNiBwZWVycyB3b3JrIGZvciBoaW0pLgoKSSBndWVzcyBJIHdpbGwgc2V0dXAg
MzIgb3IgNDAgbm9kZXMgaGVyZSBhbmQgdHJ5IGxpbWl0IHRoZSBtYXggbnVtYmVyIG9mIApwZWVy
cyAoYXQgd3BhX3N1cHBsaWNhbnQpIGZvciBJQlNTL2FkaG9jLgoKVGhhbmtzIGFnYWluLgoKWHVl
YmluZyBXYW5nCgpPbiAyMDE35bm0MDbmnIgwM+aXpSAxNDoxNiwgQWRyaWFuIENoYWRkIHdyb3Rl
Ogo+IEhpLAo+Cj4gV2VsbCwgaXQgc291bmRzIGxpa2Ugc29tZXRoaW5nIHlvdSBuZWVkIGEgNDAg
bm9kZSB0ZXN0IG5ldHdvcmsgZm9yIDopCj4KPiBJIHdhcyB3b25kZXJpbmcgd2hldGhlciBpdCB3
YXMgc29tZSBraW5kIG9mIE1BQyBidWcgdGhhdCB3YXMgYmVpbmcKPiB0cmlnZ2VyZWQgYmVjYXVz
ZSBvZiBzbyBtYW55IHVuaXRzIHNheSwgb3ZlcmZsb3dpbmcgdGhlIGtleWNhY2hlIG9yCj4gc29t
ZXRoaW5nLiBCdXQgaWYgaXQncyBzb2Z0d2FyZSBlbmNyeXB0aW9uIHRoZW4gbWF5YmUgbm90LiBJ
IHdpc2ggSQo+IGNvdWxkIGhlbHAgbW9yZSwgYnV0IHNldHRpbmcgdXAgYSA0MCBub2RlIG5ldHdv
cmsgdG8gdGVzdCBpcyBhIGJpZwo+IGNoYWxsZW5nZS4gOikKPgo+IElzIGl0IGEgZ3JhZHVhbCB0
aGluZz8gIEllLCBkbyB5b3Uga25vdyB3aGVuIGl0IHN0YXJ0cyB0byBoYW5nPyBEb2VzCj4gaXQg
aGFuZyBhdCA0MD8gb3IgZ3JhZHVhbGx5IGFzIHlvdSBhcHByb2FjaCA0MD8KPgo+IEFzIGZvciBh
c3NvY2lhdGlvbiBsaW1pdHMgLSBJIHRob3VnaHQgdGhlcmUgd2FzIGEgbWF4aW11bSBzdGF0aW9u
Cj4gcGFyYW1ldGVyIHNvbWV3aGVyZS4uLgo+Cj4KPiAtYWRyaWFuCj4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0
aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vYXRoMTBrCg==
