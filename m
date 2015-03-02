Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSMaG-0007Y6-8g
 for ath10k@lists.infradead.org; Mon, 02 Mar 2015 09:24:19 +0000
Received: by wibbs8 with SMTP id bs8so13186374wib.4
 for <ath10k@lists.infradead.org>; Mon, 02 Mar 2015 01:23:53 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1425287785.1906.0.camel@sipsolutions.net>
References: <1425287344-30594-1-git-send-email-michal.kazior@tieto.com>
 <1425287344-30594-2-git-send-email-michal.kazior@tieto.com>
 <1425287785.1906.0.camel@sipsolutions.net>
Date: Mon, 2 Mar 2015 10:23:53 +0100
Message-ID: <CA+BoTQnrS74yx=V_sPvTgzkoZeWbOBFawqXZMAv6oEhUypmoQA@mail.gmail.com>
Subject: Re: [PATCH 2/3] ath10k: always save/restore pci config space
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMiBNYXJjaCAyMDE1IGF0IDEwOjE2LCBKb2hhbm5lcyBCZXJnIDxqb2hhbm5lc0BzaXBzb2x1
dGlvbnMubmV0PiB3cm90ZToKPiBPbiBNb24sIDIwMTUtMDMtMDIgYXQgMTA6MDkgKzAxMDAsIE1p
Y2hhbCBLYXppb3Igd3JvdGU6Cj4+IFRoZSBjaGVjayBpc24ndCByZWFsbHkgbmVjZXNzYXJ5IGFu
ZCBjb3VsZG4ndCBldmVuCj4+IHdvcmsgYmVjYXVzZSBiZWNhc2UgcGNpX3Jlc3RvcmVfc3RhdGUo
KSByZXN0b3Jlcwo+PiBvbmx5IGZpcnN0IDY0IGJ5dGVzIG9mIFBDSSBjb25maWd1cmF0aW9uIHNw
YWNlLgo+Pgo+PiBUaGlzIGlzIG5lY2Vzc2FyeSBmb3IgZnV0dXJlIFdvV0xBTiBzdXBwb3J0Lgo+
Cj4+ICsgICAgIHBjaV9zYXZlX3N0YXRlKHBkZXYpOwo+PiArICAgICBwY2lfZGlzYWJsZV9kZXZp
Y2UocGRldik7Cj4KPiBJIGJlbGlldmUgdGhlIHdob2xlIHRoaW5nIGlzbid0IG5lY2Vzc2FyeSBh
dCBhbGwgc2luY2UgdGhlIGtlcm5lbCdzIFBDSWUKPiBsYXllciB3aWxsIHRha2UgY2FyZSBvZiBp
dC4KCllvdSBtZWFuIG9ubHkgdGhlIHBjaV9zYXZlX3N0YXRlKCkgYW5kIHBjaV9kaXNhYmxlX2Rl
dmljZSgpIG9yLCB0aGUKcmVzdW1lIGNvdW50ZXJwYXJ0IGFzIHdlbGw/IEhtbS4KCkVhcmxpZXIg
dGhlIHJlc3VtZSBjb3VudGVycGFydCBkaWRuJ3QgZG8gYW55IHJlc3RvcmUgc3R1ZmYgYW5kIHRo
ZQpkZXZpY2UgZW5kZWQgdXAgcHJldHR5IGNvbmZ1c2VkLi4KCgpNaWNoYcWCCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0
CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
