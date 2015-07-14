Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22a.google.com ([2a00:1450:400c:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZEsXF-0001en-C3
 for ath10k@lists.infradead.org; Tue, 14 Jul 2015 05:13:42 +0000
Received: by wgjx7 with SMTP id x7so311439036wgj.2
 for <ath10k@lists.infradead.org>; Mon, 13 Jul 2015 22:13:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55A4446C.4090803@candelatech.com>
References: <55A4446C.4090803@candelatech.com>
Date: Tue, 14 Jul 2015 07:13:17 +0200
Message-ID: <CA+BoTQmR-7ShZr3FUh-C+LXmZmgFkz_vK9WTW7fLS6akHrZp9Q@mail.gmail.com>
Subject: Re: Don't enable PROMISC when adding AP to a bridge?
From: Michal Kazior <michal.kazior@tieto.com>
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

T24gMTQgSnVseSAyMDE1IGF0IDAxOjA2LCBCZW4gR3JlZWFyIDxncmVlYXJiQGNhbmRlbGF0ZWNo
LmNvbT4gd3JvdGU6Cj4gSSBub3RpY2Ugc29tZSBvZiBteSBXTEU5MDBWWCBjYXJkcyB3aWxsIGxv
Y2sgdXAgYW5kIG5vdCByZWNlaXZlIGFueSBwYWNrZXRzCj4gYWZ0ZXIgYSBmZXcgc2Vjb25kcyBv
ZiBiZWluZyBpbiBQUk9NSVNDIG1vZGUuICBUaGlzIGhhcHBlbnMgb24gbXkgb3duCj4gQ1QgZmly
bXdhcmUgYXMgd2VsbCBhcyBzdG9jayBmaXJtd2FyZS0yLmJpbi4gIFRoaXMgYnJlYWtzIG1vbml0
b3IgbW9kZSwgb2YKPiBjb3Vyc2UsIGJ1dCBpdCBhbHNvIGJyZWFrcyBicmlkZ2VkIEFQIG1vZGUu
Cj4KPiBTbywgSSBmb3VuZCB0aGlzIHBhdGNoIGZyb20gd2F5IGJhY2sgd2hlbjoKPiBodHRwOi8v
bGlzdHMuY2VsaW51eGZvcnVtLm9yZy9waXBlcm1haWwvYnJpZGdlLzIwMDgtSnVuZS8wMDU5MDYu
aHRtbAo+Cj4gSSBoYWNrZWQgYSBzaW1pbGFyIHRoaW5nIGludG8gbXkgNC4wLjQga2VybmVsLCBh
bmQgbm93IGJyaWRnZWQgbW9kZQo+IEFQIHNlZW1zIG11Y2ggbW9yZSBzdGFibGUgKGFuZCB0aGUg
cmFkaW8gZG9lcyBub3QgZ28gaW50byBQUk9NSVNDIG1vZGUsCj4gc28gaXQgc2hvdWxkIGJlIG1v
cmUgZWZmaWNpZW50IGluIGEgYnVzeSBSRiBlbnZpcm9ubWVudCkuCj4KPiBNYXliZSB0aGlzIGZl
YXR1cmUgY291bGQgYmUgcmV2aXNpdGVkPwoKVGhpcyBoYXMgYWxyZWFkeSBiZWVuIGRvbmUgYW5k
IG1hYzgwMjExIGluIDQuMi1yYyBubyBsb25nZXIgcHJvcGFnYXRlcwpwcm9taXNjIHRvIGRyaXZl
cnNbMV0uCgpbMV06IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY2dpdC9saW51eC9rZXJuZWwvZ2l0
L3RvcnZhbGRzL2xpbnV4LmdpdC9jb21taXQvbmV0L21hYzgwMjExP2lkPWRmMTQwNDY1MGNjYmZl
Yjc2YTg0ZjMwMWYyMjMxNmJlMGQwMGE4NjQKCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vYXRoMTBrCg==
