Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22b.google.com ([2607:f8b0:400c:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xbs3b-00065u-33
 for ath10k@lists.infradead.org; Wed, 08 Oct 2014 14:17:36 +0000
Received: by mail-vc0-f171.google.com with SMTP id hy10so6778061vcb.16
 for <ath10k@lists.infradead.org>; Wed, 08 Oct 2014 07:17:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <etPan.5433ced3.74b0dc51.2d48@Mac-Pro.local>
References: <etPan.5433ced3.74b0dc51.2d48@Mac-Pro.local>
Date: Wed, 8 Oct 2014 16:17:11 +0200
Message-ID: <CA+BoTQkvUkdkWDLOzu2cz6C6SGWFL2SCgwMDLf=ruaFwP9umjg@mail.gmail.com>
Subject: Re: How to know the information about RTS reception in mac80211 or
 device driver
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
To: Okhwan Lee <ohlee@mwnl.snu.ac.kr>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

K2F0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCgpPbiA3IE9jdG9iZXIgMjAxNCAxMzozMCwgT2to
d2FuIExlZSA8b2hsZWVAbXdubC5zbnUuYWMua3I+IHdyb3RlOgo+IEhpLAo+Cj4gV2UgYXJlIHRy
eWluZyB0byBkZXZlbG9wIGFuIGFsZ29yaXRobSBieSB1c2luZyB0aGUgaW5mb3JtYXRpb24gb2Yg
UlRTIHJlY2VwdGlvbiBhdCB0aGUgcmVjZWl2ZXIgc2lkZS4gKGFjdHVhbGx5LCB3ZSBuZWVkIHRo
ZSBwcmVjZWRpbmcgZnJhbWUgb2YgQS1NUERVKS4KPiBBcyBmYXIgYXMgd2Uga25vdywgUlRTL0NU
UyBleGNoYW5nZSBpcyBkb25lIGJ5IGZpcm13YXJlIG9mIE5JQy4KPiBIb3dldmVyLCBpbiBtb25p
dG9yIG1vZGUsIHdlIHF1aXRlIHN1cmUgdGhhdCB0aGUgUlRTL0NUUyBmcmFtZSByZWNlcHRpb24g
c2hvdWxkIGJlIHJlcG9ydGVkIHRvIHVwcGVyIGxheWVyLgo+IEFzIGFuIGV2aWRlbmNlLCBXaXJl
c2hhcmsgY2FuIGNhcHR1cmUgYW5kIGRpc3BsYXkgdGhlIFJUUy9DVFMgcmVjZXB0aW9uLgo+Cj4g
SG93ZXZlciwgbWFjODAyMTEgYW5kIGRldmljZSBkcml2ZXIgKGUuZy4sIGF0aDEwaykgY2FuIG5v
dCByZWNvZ25pemUgdGhlIHJlY2VwdGlvbiBvZiBSVFMgZXZlbiBpZiB3ZSBwdXQgdGhlIFdpRmkg
TklDIGluIG1vbml0b3IgbW9kZS4KPiBXZSBjaGVjayB0aGUgdHlwZSBhbmQgc3VidHlwZSBvZiBm
cmFtZV9jb250cm9sIGZpZWxkIGZvciBhbGwgdGhlIHJlY2VpdmVkIGZyYW1lcyBhdCB0aGUg4oCc
aWVlZTgwMjExX3J4X21vbml0b3LigJ0gZnVuY3Rpb24gb2YgbWFjODAyMTEuCj4gV2UgY2FuIGZp
bmQgdGhlIHJlY2VwdGlvbiBvZiBkYXRhIGZyYW1lcyBhbWQgbWdtdCBmcmFtZXMsIGJ1dCB0aGVy
ZSBpcyBubyBSVFMvQ1RTIGZyYW1lLgo+IChXZSBjb25maXJtIHRoYXQgdGhlcmUgaXMgdGhlIFJU
Uy9DVFMgZnJhbWUgYnkgdXNpbmcgd2lyZXNoYXJrLikKPgo+IElzIHRoZXJlIGFueSB3YXkgdG8g
a25vdyB0aGUgaW5mb3JtYXRpb24gYWJvdXQgUlRTIHJlY2VwdGlvbiBpbiBtYWM4MDIxMSBvciBk
ZXZpY2UgZHJpdmVyPwoKSSB0aGluayB5b3UndmUganVzdCBmb3VuZCBhbiBhdGgxMGsgYnVnLgoK
SSd2ZSBiZWVuIHJ1bm5pbmcgdGhyb3VnaCBSeCBjb2RlIGxhdGVseS4gSSB3YXMgbG9va2luZyBh
dApodHRfcnhfbXBkdV9zdGF0dXMgYW5kIG5vdGljZWQgaXQgd2FzIGEgYml0IGdyZWVkeS4gSSB0
aGVuIHJlY2FsbGVkCnNvbWVvbmUgd2FzIGNvbXBsYWluaW5nIGFib3V0IFJUUyByZWNlcHRpb24u
CgpJJ2xsIHRyeSB0byBmaXggdGhpcyBzb29uLiBJJ2xsIHB1dCB5b3UgaW4gQ2MgaW4gY2FzZSB5
b3UnZCB3YW50IHRvCnBsYXkgd2l0aCBpdCBiZWZvcmUgaXQncyBtZXJnZWQuCgoKTWljaGHFggoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1h
aWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
