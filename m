Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e7HzE-00082N-8L
 for ath10k@lists.infradead.org; Wed, 25 Oct 2017 09:28:35 +0000
Subject: Re: [PATCH v2] ath10k: rebuild crypto header in Rx data frames
References: <1508867652-16199-1-git-send-email-kvalo@qca.qualcomm.com>
 <720ce165-4a06-1d6e-6158-7983d75eea8a@dd-wrt.com>
 <CAGyitvNvCFAfuRg=uKLvZeZVzxsQ14GeXR702FHwu+RLLE_WAQ@mail.gmail.com>
 <87d15boasv.fsf@qca.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <2d87e371-33e7-2918-e149-40311e32b7f6@dd-wrt.com>
Date: Wed, 25 Oct 2017 11:28:04 +0200
MIME-Version: 1.0
In-Reply-To: <87d15boasv.fsf@qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, Jasmine Strong <jas@eero.com>
Cc: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

QW0gMjUuMTAuMjAxNyB1bSAxMTowNyBzY2hyaWViIEthbGxlIFZhbG86Cj4gKGZpeGluZyB0b3Ag
cG9zdGluZykKPgo+IEphc21pbmUgU3Ryb25nIDxqYXNAZWVyby5jb20+IHdyaXRlczoKPgo+PiBP
biBUdWUsIE9jdCAyNCwgMjAxNyBhdCAxOjQxIFBNLCBTZWJhc3RpYW4gR290dHNjaGFsbAo+PiA8
cy5nb3R0c2NoYWxsQGRkLXdydC5jb20+IHdyb3RlOgo+Pgo+Pj4gcGF0Y2ggd29ya3MuIHRlc3Rl
ZCBpbiBzdGEgYW5kIGFwIG1vZGUgc28gZmFyIG9uIDk5ODQKPj4gU2VlbXMgdG8gd29yayBva2F5
IG9uIG1peGVkIG5ldHdvcmtzIG9mIDk4ODIsIDQwMTkgYW5kIDk4ODguCj4gVGhhbmtzIFNlYmFz
dGlhbiBhbmQgSmFzbWluZSBmb3IgdGVzdGluZyB0aGlzLCB2ZXJ5IG11Y2ggYXBwcmVjaWF0ZWQu
IFdlCj4gaGF2ZSBhIHYzIGNvbWluZyB1cCBzb29uIHdoaWNoIHNob3VsZCBmaXggR0NNUCwgR0NN
UC0yNTYgYW5kIENDTVAtMjU2IGFzCj4gd2VsbC4KCmkgaGF2ZSBteSBvd24gdjMsIGJ1dCB3aWxs
IHdhaXQgZm9yIHlvdXIgdmVyc2lvbiB0byBjaGVjayBob3cgbXVjaCBpdHMgCmRpZmZlcmVudCBm
cm9tIG1pbmUKCmknbSBhbHNvIGFibGUgdG8gdGVzdCBnbXAgLyBhZXMgMjU2IHVzaW5nIDIgUUNB
IDk5ODQgZGV2aWNlcwoKCi0tIApNaXQgZnJldW5kbGljaGVuIEdyw7xzc2VuIC8gUmVnYXJkcwoK
U2ViYXN0aWFuIEdvdHRzY2hhbGwgLyBDVE8KCk5ld01lZGlhLU5FVCBHbWJIIC0gREQtV1JUCkZp
cm1lbnNpdHo6ICBTdHViZW53YWxkYWxsZWUgMjFhLCA2NDYyNSBCZW5zaGVpbQpSZWdpc3Rlcmdl
cmljaHQ6IEFtdHNnZXJpY2h0IERhcm1zdGFkdCwgSFJCIDI1NDczCkdlc2Now6RmdHNmw7xocmVy
OiBQZXRlciBTdGVpbmjDpHVzZXIsIENocmlzdGlhbiBTY2hlZWxlCmh0dHA6Ly93d3cuZGQtd3J0
LmNvbQplbWFpbDogcy5nb3R0c2NoYWxsQGRkLXdydC5jb20KVGVsLjogKzQ5NjI1MS01ODI2NTAg
LyBGYXg6ICs0OTYyNTEtNTgyNjU2NQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
