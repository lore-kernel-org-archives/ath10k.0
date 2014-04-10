Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x234.google.com ([2a00:1450:400c:c00::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WY9e3-0004jt-DV
 for ath10k@lists.infradead.org; Thu, 10 Apr 2014 07:43:36 +0000
Received: by mail-wg0-f52.google.com with SMTP id k14so3579250wgh.35
 for <ath10k@lists.infradead.org>; Thu, 10 Apr 2014 00:43:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87fvllhctr.fsf@kamboji.qca.qualcomm.com>
References: <1396611464-5940-1-git-send-email-michal.kazior@tieto.com>
 <1397040531-6224-1-git-send-email-michal.kazior@tieto.com>
 <1397040531-6224-4-git-send-email-michal.kazior@tieto.com>
 <87k3axhdqc.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=c+dTcK_diBKi6VJVgUkyBv21bDkRf+9GvGyhhqqMuNQ@mail.gmail.com>
 <87fvllhctr.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 10 Apr 2014 09:43:13 +0200
Message-ID: <CA+BoTQkL8Vp_hjOP-=RZL97QXScF+WVX=BGf6d-HY8cQmu=WCQ@mail.gmail.com>
Subject: Re: [RFTv2 3/5] ath10k: rework peer accounting
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTAgQXByaWwgMjAxNCAwOToxOCwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21tLmNv
bT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+IHdyaXRl
czoKPgo+Pj4+ICsvKiBob2xkIGNvbmZfbXV0ZXggZm9yIHNpbXBsZSBpdGVyYXRpb24sIG9yIGNv
bmZfbXV0ZXgrZGF0YV9sb2NrIGZvcgo+Pj4+ICsgKiBtb2RpZmljYXRpb25zICovCj4+Pj4gIHN0
cnVjdCBhdGgxMGtfcGVlciAqYXRoMTBrX3BlZXJfZmluZChzdHJ1Y3QgYXRoMTBrICphciwgaW50
IHZkZXZfaWQsCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB1
OCAqYWRkcikKPj4+PiAgewo+Pj4+ICAgICAgIHN0cnVjdCBhdGgxMGtfcGVlciAqcGVlcjsKPj4+
Pgo+Pj4+IC0gICAgIGxvY2tkZXBfYXNzZXJ0X2hlbGQoJmFyLT5kYXRhX2xvY2spOwo+Pj4+IC0K
Pj4+PiAgICAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KHBlZXIsICZhci0+cGVlcnMsIGxpc3QpIHsK
Pj4+PiAgICAgICAgICAgICAgIGlmIChwZWVyLT52ZGV2X2lkICE9IHZkZXZfaWQpCj4+Pj4gICAg
ICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+Pj4KPj4+IFRoZSBjb21tZW50IGhlcmUgbWFr
ZXMgbWUgc3VzcGljaW91cy4gSG93IGNhbiB3ZSBzYWZlbHkgaXRlcmF0ZSB0aGUgbGlzdAo+Pj4g
aWYgd2UgZG9uJ3QgdGFrZSBkYXRhX2xvY2s/IERvZXNuJ3QgaXQgbWVhbiB0aGF0IHRoZSBsaXN0
IGNhbiBjaGFuZ2UKPj4+IHdoaWxlIHdlIGhhdmUgY29uZl9tdXRleD8KPj4KPj4gVGhlIGlkZWEg
aXMgeW91IG5lZWQgQk9USCBsb2NrcyB0byBtb2RpZnkgdGhlIGxpc3Qgc3RydWN0dXJlLCBidXQg
eW91Cj4+IG5lZWQgb25seSBvbmUgb2YgdGhlbSB0byBpdGVyYXRlIG92ZXIgdGhlIGxpc3Qgc2Fm
ZWx5IGFuZAo+PiBjb25zaXN0ZW50bHkuIFRoaXMgbWVhbnMgd3JpdGVyIHdpbGwgbm90IGFsdGVy
IHRoZSBsaXN0IHN0cnVjdHVyZQo+PiB1bnRpbCB0aGVyZSBhcmUgbm8gcmVhZGVycy4KPgo+IFN0
aWxsIG5vdCB1bmRlcnN0YW5kaW5nIHRoaXMuIFdoeSBub3QgdGhlbiB1c2UgY29uZl9tdXRleCBh
bHdheXMsIHdoeSBkbwo+IHdlIG5lZWQgZGF0YV9sb2NrIGF0IGFsbD8KCmh0dCBwZWVyIG1hcC91
bm1hcCB3aGljaCBpcyBpbiB0YXNrbGV0IGNvbnRleHQgbmVlZHMgdG8gaXRlcmF0ZSBvdmVyCnRo
ZSBsaXN0LiBJdCBjYW4ndCB0YWtlIGNvbmZfbXV0ZXguCgoKPiBPciBhcmUgeW91IHNheWluZyB0
aGF0IG9uZSBjYW4gaXRlcmF0ZSB0aGUgbGlzdCBieSBlaXRoZXIgdGFraW5nCj4gY29uZl9tdXRl
eCBvciBieSB0YWtpbmcgZGF0YV9sb2NrLCBkZXBlbmRpbmcgb24gY29udGV4dD8KClllcy4KCgpN
aWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
dGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
