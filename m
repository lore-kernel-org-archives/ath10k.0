Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x232.google.com ([2a00:1450:4008:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VCRmH-0003Lx-Qq
 for ath10k@lists.infradead.org; Thu, 22 Aug 2013 10:06:06 +0000
Received: by mail-bk0-f50.google.com with SMTP id mz11so586189bkb.23
 for <ath10k@lists.infradead.org>; Thu, 22 Aug 2013 03:05:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1377066854-13981-1-git-send-email-michal.kazior@tieto.com>
References: <1377066854-13981-1-git-send-email-michal.kazior@tieto.com>
Date: Thu, 22 Aug 2013 12:05:25 +0200
Message-ID: <CA+BoTQksSJEJnkArCGb5Vkn=9REYSsfQ0HEsdrkoqNF-5FOj1w@mail.gmail.com>
Subject: Re: [PATCH 0/3] ath10k: fixes
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>

T24gMjEgQXVndXN0IDIwMTMgMDg6MzQsIE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGll
dG8uY29tPiB3cm90ZToKPiBIaSwKPgo+IFRoaXMgcGF0Y2hzZXQgYWRkcmVzc2VzIHNvbWUgdGhy
b3VnaHB1dCBpc3N1ZXMuCj4KPgo+IFBvemRyYXdpYW0gLyBCZXN0IHJlZ2FyZHMsCj4gTWljaGFs
IEthemlvci4KPgo+Cj4gTWljaGFsIEthemlvciAoMyk6Cj4gICBhdGgxMGs6IG1ha2UgdGhlIHdv
cmtxdWV1ZSBtdWx0aXRocmVhZGVkCj4gICBhdGgxMGs6IG1vdmUgaHR0IHJ4IHByb2Nlc3Npbmcg
dG8gd29ya2VyCj4gICBhdGgxMGs6IGZpeCBpc3N1ZXMgb24gbm9uLXByZWVtcHRpYmxlIHN5c3Rl
bXMKPgo+ICBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2NvcmUuYyAgIHwgICAgNCAr
Ky0KPiAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9jb3JlLmggICB8ICAgIDcgKysr
Kwo+ICBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2h0Yy5jICAgIHwgICAgNCArKysK
PiAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9odHQuaCAgICB8ICAgIDMgKysKPiAg
ZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9odHRfcnguYyB8ICAgNTggKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tCj4gIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsv
d21pLmMgICAgfCAgICA0ICsrKwo+ICA2IGZpbGVzIGNoYW5nZWQsIDcyIGluc2VydGlvbnMoKyks
IDggZGVsZXRpb25zKC0pCgpEcm9wIHRoaXMgcGF0Y2hzZXQgZm9yIG5vdywgcGxlYXNlLCBUaGVy
ZSBhcmUgc29tZSBtaW5vciBpc3N1ZXMgSSdkCmxpa2UgdG8gYWRkcmVzcyBmaXJzdC4gTmV2ZXJ0
aGVsZXNzLCBmZWVsIGZyZWUgdG8gY29tbWVudCB0aGUgcGF0Y2hzZXQKaWYgeW91IHNlZSBhbnkg
aXNzdWVzLgoKClBvemRyYXdpYW0gLyBCZXN0IHJlZ2FyZHMsCk1pY2hhxYIgS2F6aW9yLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxp
bmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
