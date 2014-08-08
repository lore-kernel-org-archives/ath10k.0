Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22b.google.com ([2a00:1450:400c:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFhME-0004ij-3q
 for ath10k@lists.infradead.org; Fri, 08 Aug 2014 10:25:10 +0000
Received: by mail-wg0-f43.google.com with SMTP id l18so5288315wgh.26
 for <ath10k@lists.infradead.org>; Fri, 08 Aug 2014 03:24:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87d2cbz3wy.fsf@kamboji.qca.qualcomm.com>
References: <1406628239-31322-1-git-send-email-michal.kazior@tieto.com>
 <87d2cbz3wy.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 8 Aug 2014 12:24:48 +0200
Message-ID: <CA+BoTQkF3+-1ded_dj63BGH7-bdD_uxLSkTZjGMb654yPzbtnA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix wmi service bitmap debug
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gOCBBdWd1c3QgMjAxNCAxMjoxMSwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21tLmNv
bT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+IHdyaXRl
czoKPgo+PiBUaGUgMTAueCBhbmQgbWFpbiBmaXJtd2FyZSBicmFuY2hlcyBoYXZlCj4+IGNvbmZs
aWN0aW5nIFdNSSBzZXJ2aWNlIGJpdG1hcCBkZWZpbml0aW9ucy4KPj4KPj4gVGhpcyBhbHNvIGZp
eGVzIFdNSSBzZXJ2aWNlcyBwYXJzaW5nIG9uIGJpZy1lbmRpYW4KPj4gaG9zdHMgYW5kIGNoYW5n
ZXMgZGVidWdmcyBvdXRwdXQgdG8gYmUgbW9yZSBodW1hbgo+PiBmcmllbmRseS4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+Cj4KPiBC
YXNlZCBvbiBKb2UncyBzdWdnZXN0aW9uLCBJJ20gcGxhbm5pbmcgdG8gY2hhbmdlIHRoZSBtYWNy
byBsaWtlIGJlbG93Lgo+IEFyZSB5b3Ugb2sgd2l0aCB0aGF0Pwo+Cj4gSXQgYWN0dWFsbHkgYWRk
cyBhIG5ldyBjaGVja3BhdGNoIHdhcm5pbmcgYnV0IEknbSBnb2luZyB0byBpZ25vcmUgdGhhdAo+
IGZvciBub3c6Cj4KPiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3dtaS5oOjE3Nzog
RVJST1I6IE1hY3JvcyB3aXRoIGNvbXBsZXggdmFsdWVzIHNob3VsZCBiZSBlbmNsb3NlZCBpbiBw
YXJlbnRoZXNpcwo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgx
MGsvd21pLmggYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3dtaS5oCj4gaW5kZXgg
MTA5ZWE2ODRmODhmLi5lNzA4MzY1ODY3NTYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvd2ly
ZWxlc3MvYXRoL2F0aDEway93bWkuaAo+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9h
dGgxMGsvd21pLmgKPiBAQCAtMTc0LDQ2ICsxNzQsNDggQEAgZW51bSB3bWlfbWFpbl9zZXJ2aWNl
IHsKPgo+ICBzdGF0aWMgaW5saW5lIGNoYXIgKndtaV9zZXJ2aWNlX25hbWUoaW50IHNlcnZpY2Vf
aWQpCj4gIHsKPiAtI2RlZmluZSBTVkNTVFIoeCkgeyBjYXNlIHg6IHJldHVybiAjeDsgfQo+ICsj
ZGVmaW5lIFNWQ1NUUih4KSBjYXNlIHg6IHJldHVybiAjeAo+ICsKWy4uLl0KClRoaXMgd2FzIHRo
ZSBjaGVja3BhdGNoIHdhcm5pbmcgSSBvcmlnaW5hbGx5IGZpeGVkIGJ5IHVzaW5nIHsgLi4gfSA6
LSkKCkFueXdheSwgSSBkb24ndCBzZWUgYSBwcm9ibGVtIHdpdGggdGhlIG1hY3JvIGNoYW5nZSB5
b3Ugc3VnZ2VzdC4KQXBwYXJlbnRseSB3ZSdyZSBkb29tZWQgdG8gaGF2ZSBhIGNoZWNrcGF0Y2gg
d2FybmluZyBlaXRoZXIgd2F5IHVubGVzcwp3ZSBkb24ndCB1c2UgYSBtYWNybyBhdCBhbGwuCgoK
TWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
