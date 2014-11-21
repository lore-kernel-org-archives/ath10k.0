Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22c.google.com ([2a00:1450:400c:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xrle2-0003mS-5Z
 for ath10k@lists.infradead.org; Fri, 21 Nov 2014 10:40:54 +0000
Received: by mail-wg0-f44.google.com with SMTP id b13so6164803wgh.31
 for <ath10k@lists.infradead.org>; Fri, 21 Nov 2014 02:40:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <21615.5541.120044.376524@gargle.gargle.HOWL>
References: <1416492382-18058-1-git-send-email-sujith@msujith.org>
 <CA+BoTQnyf0tvg8ngLqsoux-A9-3J46cDuJdd-V=kS24wWS4Y1A@mail.gmail.com>
 <21615.3019.437408.992893@gargle.gargle.HOWL>
 <CA+BoTQm_X3-kpJanZu=dJ3LDPqjAfnUoyBwqzgYGX3bK+H1f2g@mail.gmail.com>
 <21615.5541.120044.376524@gargle.gargle.HOWL>
Date: Fri, 21 Nov 2014 11:40:27 +0100
Message-ID: <CA+BoTQk2fy024b5E=khSrzpUGzCL=jU_4wpxJ0AAyxmsFZuWhA@mail.gmail.com>
Subject: Re: [RFC] ath10k: Fix shared WEP
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
To: Sujith Manoharan <sujith@msujith.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjEgTm92ZW1iZXIgMjAxNCAxMTozNiwgU3VqaXRoIE1hbm9oYXJhbiA8c3VqaXRoQG1zdWpp
dGgub3JnPiB3cm90ZToKPiBNaWNoYWwgS2F6aW9yIHdyb3RlOgo+PiBHb29kIHBvaW50LCBidXQg
d2hhdCBJJ20gd29ycmllZCBpdCdsbCBiZSBlYXNpZXIgdG8gbWlzcyB0aGlzIHN1YnRsZXR5Cj4+
IGFuZCBpbnRyb2R1Y2UgcmFjZXMgaW4gdGhlIGZ1dHVyZS4KPgo+IEkgYW0gbm90IHZlcnkgZmFt
aWxpYXIgd2l0aCBhdGgxMGsgbG9ja2luZywgYnV0IHBlZXJfa2V5cyBpcwo+IGFsc28gdXNlZCBp
biBhdGgxMGtfY2xlYXJfcGVlcl9rZXlzKCksIHdoZXJlIGl0IHJlbGllcyBvbiBjb25mX211dGV4
Lgo+IFNob3VsZCB0aGF0IGJlIGFkZHJlc3NlZCB0b28gPwoKWWVzLiBCYXNpY2FsbHkgcGVlci0+
a2V5c1tdIHNob3VsZCBiZSBwcm90ZWN0ZWQgYnkgYm90aCBjb25mX211dGV4IGFuZApkYXRhX2xv
Y2sgaWYgeW91IHdhbnQgdG8gbW9kaWZ5IGl0LiBJZiB5b3Ugd2FudCB0byByZWFkIGl0IHlvdSBu
ZWVkCmVpdGhlciBvbmUuCgoKPj4gRG8geW91IGhhdmUgaXQgc2F2ZWQgc29tZXdoZXJlPyBJZiBz
bywgY2FuIHlvdSBwb3N0IGl0LCBwbGVhc2U/Cj4KPiBodHRwOi8vcGFzdGViaW4uY29tL3l5d2lQ
WlhMCgpUaGFua3MhIExvb2tzIGxpa2UgdGhlIGBjYW5jZWxfd29ya19zeW5jKCZhcnZpZi0+d2Vw
X2tleV93b3JrKTtgCnNob3VsZCBnbyBfYmVmb3JlXyBgbXV0ZXhfbG9jaygmYXItPmNvbmZfbXV0
ZXgpO2AuCgpJJ20gYnVzeSB3aXRoIHNvbWUgc3R1ZmYgc28gZmVlbCBmcmVlIHRvIHNlbmQgYSBw
YXRjaCA6LSkKCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
