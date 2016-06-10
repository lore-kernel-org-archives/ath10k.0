Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bBHCq-0007Ps-HH
 for ath10k@lists.infradead.org; Fri, 10 Jun 2016 07:50:17 +0000
Received: by mail-wm0-x22b.google.com with SMTP id v199so137251189wmv.0
 for <ath10k@lists.infradead.org>; Fri, 10 Jun 2016 00:49:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5759FFAF.4040609@candelatech.com>
References: <5759FFAF.4040609@candelatech.com>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Fri, 10 Jun 2016 09:49:50 +0200
Message-ID: <CA+BoTQkSE5c=v08r=XsHgX27+pLMPSt2daP3Rh6tEw6fdtj6wg@mail.gmail.com>
Subject: Re: Any reason to allow MGT TID to be paused by power-save?
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
To: Ben Greear <greearb@candelatech.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

T24gMTAgSnVuZSAyMDE2IGF0IDAxOjQ1LCBCZW4gR3JlZWFyIDxncmVlYXJiQGNhbmRlbGF0ZWNo
LmNvbT4gd3JvdGU6Cj4gSSdtIHRyeWluZyB0byB0cmFjayBkb3duIGEgdHJpY2t5IHByb2JsZW0g
d2l0aCBhIE1hYyBib29rIGFuZCBwb3dlciBzYXZlCj4gd2l0aCBteSBhdGgxMGsgZmlybXdhcmUu
Cj4KPiBBdCBsZWFzdCBwYXJ0IG9mIHRoZSBpc3N1ZSBpcyB0aGF0IHdoZW4gdGhlIE1hYyBzbGVl
cHMsIGl0IGdvZXMgaW50bwo+IHBvd2VyLXNhdmUKPiBzdGF0ZSBhcyBmYXIgYXMgQVAgaXMgY29u
Y2VybmVkLCBhbmQgdGhlbiBpdCBzaW1wbHkgdHVybnMgaXRzZWxmIG9mZi4gIFdoZW4KPiBpdCB3
YWtlcwo+IHVwIGEgc2hvcnQgdGltZSBsYXRlciwgaXQgdGhlbiB0cmllcyB0byBzY2FuIGFuZCBy
ZS1hc3NvY2lhdGUuICBCdXQsIGlmCj4gaG9zdGFwZAo+IGhhc24ndCB0aW1lZCBvdXQgdGhlIHN0
YXRpb24gKGR1ZSB0byBsb25nZXIgaWRsZSB0aW1lciksIHRoZW4gU1RBIHN0aWxsIGlzCj4gdHJl
YXRlZAo+IGFzIGJlaW5nIGluIHBvd2VyLXNhdmUgaW4gdGhlIGZpcm13YXJlLiAgSXQgYXBwZWFy
cyB0aGF0IHRoaXMgY2F1c2VzCj4gbWd0LWZyYW1lcyAocHJvYmUgcmVzcG9uc2VzKQo+IG5vdCBi
ZSBzZW50IGJhY2sgb3V0IG9mIHRoZSBmaXJtd2FyZSwgc28gTWFjIGdpdmVzIHVwIGZhaXJseSBx
dWlja2x5Lgo+Cj4gSSBmaXhlZCBhdCBsZWFzdCBzb21lIG9mIHRoaXMgYnkgZm9yY2luZyBhIHBv
d2VyLXNhdmUgd2FrZSBvbgo+IHJlY2VpcHQgb2YgcHJvYmUgcmVxdWVzdHMgYW5kIGF1dGggcmVx
dWVzdHMsIGJ1dCBzb21lIGlzc3VlcyByZW1haW4KPiBmb3Igb25lIHJlYXNvbiBvciBhbm90aGVy
Lgo+Cj4gT25lIHRoaW5nIHRoYXQgY2FtZSB0byBtaW5kOiAgSXMgaXQgKmV2ZXIqIGEgZ29vZCBp
ZGVhIHRvIHBhdXNlIGEgbWd0LXRpZAo+IGR1ZSB0bwo+IHBvd2VyLXNhdmU/CgpUaGUgc3BlYyBk
ZWZpbmVzIHNvbWUgbWdtdCBmcmFtZXMgYXMgYnVmZmVyYWJsZSAoSUVFRSA4MDIuMTEtMjAxMgo4
LjIuNC4xLjcpLiBTZWUgaWVlZTgwMjExX2lzX2J1ZmZlcmFibGVfbW1wZHUoKSBpbgppbmNsdWRl
L2xpbnV4L2llZWU4MDIxMS5oLgoKQWN0aW9uLCBkZWF1dGggYW5kIGRpc2Fzc29jIGFyZSBidWZm
ZXJhYmxlLiBJdCBtYWtlcyBzZW5zZSBhbnl3YXkuCgpFLmcuIE9uIERGUyBjaGFubmVsIHlvdSBt
YXkgb3B0IGZvciBDU0EgYWN0aW9uIGZyYW1lIChpbnN0ZWFkIG9mIENTQQpJRSBpbiBiZWFjb25z
KSBpbiB3aGljaCBjYXNlIHlvdSBkbyB3YW50IHRvIGJ1ZmZlciBmcmFtZXMgdG8gY2xpZW50cwp0
aGF0IGFyZSBhc2xlZXAgdG8gZ2l2ZSB0aGVtIGEgY2hhbmNlIHRvIG5vdGljZSBpdCwgd2FrZSB1
cCBhbmQgZ2V0Cml0LgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
