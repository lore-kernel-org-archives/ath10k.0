Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSNPe-0006Yd-4s
 for ath10k@lists.infradead.org; Mon, 02 Mar 2015 10:17:22 +0000
Received: by wibbs8 with SMTP id bs8so13532222wib.4
 for <ath10k@lists.infradead.org>; Mon, 02 Mar 2015 02:17:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1425288321.1906.1.camel@sipsolutions.net>
References: <1425287344-30594-1-git-send-email-michal.kazior@tieto.com>
 <1425287344-30594-2-git-send-email-michal.kazior@tieto.com>
 <1425287785.1906.0.camel@sipsolutions.net>
 <CA+BoTQnrS74yx=V_sPvTgzkoZeWbOBFawqXZMAv6oEhUypmoQA@mail.gmail.com>
 <1425288321.1906.1.camel@sipsolutions.net>
Date: Mon, 2 Mar 2015 11:17:00 +0100
Message-ID: <CA+BoTQnk8FBRwqTuq=ZAp__exwHejO1HncNhcVOASwn8+dKu=g@mail.gmail.com>
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

T24gMiBNYXJjaCAyMDE1IGF0IDEwOjI1LCBKb2hhbm5lcyBCZXJnIDxqb2hhbm5lc0BzaXBzb2x1
dGlvbnMubmV0PiB3cm90ZToKPiBPbiBNb24sIDIwMTUtMDMtMDIgYXQgMTA6MjMgKzAxMDAsIE1p
Y2hhbCBLYXppb3Igd3JvdGU6Cj4KPj4gPiBJIGJlbGlldmUgdGhlIHdob2xlIHRoaW5nIGlzbid0
IG5lY2Vzc2FyeSBhdCBhbGwgc2luY2UgdGhlIGtlcm5lbCdzIFBDSWUKPj4gPiBsYXllciB3aWxs
IHRha2UgY2FyZSBvZiBpdC4KPj4KPj4gWW91IG1lYW4gb25seSB0aGUgcGNpX3NhdmVfc3RhdGUo
KSBhbmQgcGNpX2Rpc2FibGVfZGV2aWNlKCkgb3IsIHRoZQo+PiByZXN1bWUgY291bnRlcnBhcnQg
YXMgd2VsbD8gSG1tLgo+Cj4gUmVzdW1lIGFzIHdlbGwgLSBidXQgSSBiZWxpZXZlIGl0J3MgYWxs
LW9yLW5vdGhpbmcuCj4KPj4gRWFybGllciB0aGUgcmVzdW1lIGNvdW50ZXJwYXJ0IGRpZG4ndCBk
byBhbnkgcmVzdG9yZSBzdHVmZiBhbmQgdGhlCj4+IGRldmljZSBlbmRlZCB1cCBwcmV0dHkgY29u
ZnVzZWQuLgo+Cj4gd2hpY2ggbWF5IGV4cGxhaW4gdGhpcy4KCkhtbS4uIEkgcmVtb3ZlZCB0aGUg
c2F2ZS9yZXN0b3JlL2VuYWJsZS9kaXNhYmxlIGNvbXBsZXRlbHkgYW5kCnJlLXRlc3RlZC4gSXQg
c2VlbXMgdG8gd29yayBmaW5lIGFzIHdlbGwuCgpJJ2xsIHBvc3QgYSB2MiBsYXRlciB0aGVuLiBU
aGFua3MhCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
