Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c7Pc9-0000ae-HE
 for ath10k@lists.infradead.org; Thu, 17 Nov 2016 16:32:42 +0000
Received: by mail-wm0-x241.google.com with SMTP id a20so22858411wme.2
 for <ath10k@lists.infradead.org>; Thu, 17 Nov 2016 08:32:20 -0800 (PST)
From: Erik Stromdahl <erik.stromdahl@gmail.com>
Subject: Re: [RFC 04/12] ath10k: htc: refactorization
References: <1479141222-8493-1-git-send-email-erik.stromdahl@gmail.com>
 <1479141222-8493-5-git-send-email-erik.stromdahl@gmail.com>
 <CA+BoTQnTkwQjmNBdr8a+YauXffWGNBNyPTZ=RByoviTSp+1ZYQ@mail.gmail.com>
Message-ID: <5b62d41b-7125-f1ce-b09f-29db7572a748@gmail.com>
Date: Thu, 17 Nov 2016 17:32:17 +0100
MIME-Version: 1.0
In-Reply-To: <CA+BoTQnTkwQjmNBdr8a+YauXffWGNBNyPTZ=RByoviTSp+1ZYQ@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

CgpPbiAxMS8xNS8yMDE2IDExOjE5IEFNLCBNaWNoYWwgS2F6aW9yIHdyb3RlOgo+IE9uIDE0IE5v
dmVtYmVyIDIwMTYgYXQgMTc6MzMsIEVyaWsgU3Ryb21kYWhsIDxlcmlrLnN0cm9tZGFobEBnbWFp
bC5jb20+IHdyb3RlOgo+PiBDb2RlIHJlZmFjdG9yaXphdGlvbjoKPj4KPj4gTW92ZWQgdGhlIGNv
ZGUgZm9yIGVwIDAgaW4gYXRoMTBrX2h0Y19yeF9jb21wbGV0aW9uX2hhbmRsZXIKPj4gdG8gYXRo
MTBrX2h0Y19jb250cm9sX3J4X2NvbXBsZXRlLgo+Pgo+PiBUaGlzIGVhc2VzIHRoZSBpbXBsZW1l
bnRhdGlvbiBvZiBTRElPL21ib3ggc2lnbmlmaWNhbnRseSBzaW5jZQo+PiB0aGUgZXBfcnhfY29t
cGxldGUgY2IgaXMgaW52b2tlZCBkaXJlY3RseSBmcm9tIHRoZSBTRElPL21ib3gKPj4gaGlmIGxh
eWVyLgo+Pgo+PiBTaW5jZSB0aGUgYXRoMTBrX2h0Y19jb250cm9sX3J4X2NvbXBsZXRlIGFscmVh
ZHkgaXMgcHJlc2VudAo+PiAob25seSBjb250YWluaW5nIGEgd2FybmluZyBtZXNzYWdlKSB0aGVy
ZSBpcyBubyByZWFzb24gZm9yIG5vdAo+PiB1c2luZyBpdCAoaW5zdGVhZCBvZiBoYXZpbmcgYSBz
cGVjaWFsIGNhc2UgZm9yIGVwIDAgaW4KPj4gYXRoMTBrX2h0Y19yeF9jb21wbGV0aW9uX2hhbmRs
ZXIpLgo+IAo+IFRoaXMgc2hvdWxkIGJlIHNxdWFzaGVkIHdpdGggUGF0Y2ggMyBzaW5jZSBpdCdz
IGluc2VwYXJhYmxlIHBhcnQgb2YKPiB0aGUgc2FtZSByZWZhY3Rvcml6YXRpb24uCj4gCj4gCj4g
TWljaGHFggo+IAoKCkhtbSwgSSBkb24ndCByZWFsbHkgc2VlIHdoeSB0aGlzIGlzIGFuIGluc2Vw
YXJhYmxlIHBhcnQgb2YgdGhlIHByZXZpb3VzCnBhdGNoLgoKQXMgZmFyIGFzIEkgc2VlIHRoaXMg
cGF0Y2ggaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCBwYXRjaCAzLCBvciBhbSBJCm1pc3NpbmcgYW55
dGhpbmc/CgpBcmUgeW91IHJlYWxseSBzdXJlIHRoZXkgc2hvdWxkIGJlIHNxdWFzaGVkPwoKRXJp
awoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBr
IG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
