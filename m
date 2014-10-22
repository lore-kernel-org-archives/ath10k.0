Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgudI-0006XG-Kw
 for ath10k@lists.infradead.org; Wed, 22 Oct 2014 12:03:17 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k: calibration data through Device Tree?
References: <87tx3mmx4s.fsf@kamboji.qca.qualcomm.com>
 <20141002132914.GN5788@leverpostej>
 <87ppeamvr9.fsf@kamboji.qca.qualcomm.com>
 <542DA1F7.9090904@amacapital.net>
 <CAJ-VmomR+AzsUVqSik=ejntHHhQf_wj9kU==uCqWyk27M7Gp9w@mail.gmail.com>
 <CALCETrV_LoCJ_DHcyQ2ztyXfdH2vAF0r7OX29_nPj6gMcodBig@mail.gmail.com>
 <87vbnvhls4.fsf@kamboji.qca.qualcomm.com>
 <F0D1326B-4716-4897-8259-1591B64EB55C@codeaurora.org>
Date: Wed, 22 Oct 2014 15:02:30 +0300
In-Reply-To: <F0D1326B-4716-4897-8259-1591B64EB55C@codeaurora.org> (Kumar
 Gala's message of "Fri, 17 Oct 2014 14:25:01 +0200")
Message-ID: <87tx2ws46h.fsf@kamboji.qca.qualcomm.com>
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
To: Kumar Gala <galak@codeaurora.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Andy Lutomirski <luto@amacapital.net>

SGkgS3VtYXIsCgpLdW1hciBHYWxhIDxnYWxha0Bjb2RlYXVyb3JhLm9yZz4gd3JpdGVzOgoKPiBB
cyBBcm5kIG1lbnRpb25lZCB5b3Ugd291bGQgaGF2ZSBzb21ldGhpbmcgbGlrZToKPgo+IHBjaSB7
ICAgCj4gICAgICAgICBwY2llQDAgewo+ICAgICAgICAgICAgICAgICByZWcgPSA8MCAwIDAgMCAw
PjsgCj4gICAgICAgICAgICAgICAgICNpbnRlcnJ1cHQtY2VsbHMgPSA8MT47Cj4gICAgICAgICAg
ICAgICAgICNzaXplLWNlbGxzID0gPDI+Owo+ICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxs
cyA9IDwzPjsKPiAgICAgICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAicGNpIjsKPgo+ICAgICAg
ICAgICAgICAgICBhdGgxMGtAMCwwIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8
MHgwMDAwIDB4MCAweDAgMHgwIDB4MD47Cj4gICAgICAgICAgICAgICAgICAgICAgICAgZGV2aWNl
X3R5cGUgPSAicGNpIjsKPiAgICAgICAgICAgICAgICAgICAgICAgICBxY29tLGF0aDEway1jYWxp
YnJhdGlvbi1kYXRhID0gWyAwMSAwMyAwNCAwNSAwNiDigKYgXTsKPiAgICAgICAgICAgICAgICAg
fTsgICAgICAKPiAgICAgICAgIH07Cj4gfTsKPgo+IE9uIHRoZSBkcml2ZXIgc2lkZSB5b3UgY2Fu
IGRvIHNvbWV0aGluZyBsaWtlOgo+Cj4gCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnA7Cj4KPiAJbnAg
PSBwY2lfZGV2aWNlX3RvX09GX25vZGUoZGV2KTsKPgo+IHRoYW4geW91IGNhbiBkbyBub3JtYWwg
T0YgY2FsbHMgb24g4oCYbnDigJkuCgpBaCwgbm93IEkgdW5kZXJzdGFuZCBob3cgdGhpcyBpcyBz
dXBwb3NlZCB0byB3b3JrLiBUaGFuayB5b3UgdmVyeSBtdWNoCmZvciBwcm92aWRpbmcgYW4gZXhh
bXBsZS4KCi0tIApLYWxsZSBWYWxvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
