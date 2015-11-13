Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zx7ir-0001r2-Vn
 for ath10k@lists.infradead.org; Fri, 13 Nov 2015 06:20:35 +0000
Received: by wmdw130 with SMTP id w130so15688714wmd.0
 for <ath10k@lists.infradead.org>; Thu, 12 Nov 2015 22:20:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87mvuj585b.fsf@kamboji.qca.qualcomm.com>
References: <1446472988-2603-1-git-send-email-michal.kazior@tieto.com>
 <1447161055-2283-1-git-send-email-michal.kazior@tieto.com>
 <87mvuj585b.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 13 Nov 2015 07:20:06 +0100
Message-ID: <CA+BoTQnQioRd_aR4+DVRsR942JoCAH1dUc2fdWX-Td7=j5++NA@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] ath10k: clean up ath10k_skb_cb
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

T24gMTIgTm92ZW1iZXIgMjAxNSBhdCAyMDoyOSwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxj
b21tLmNvbT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+
IHdyaXRlczoKPgo+PiBUaGUgYXRoMTBrX3NrYl9jYiBzdHJ1Y3R1cmUgd2Fzbid0IHJlYWxseSBz
cGFjZQo+PiBlZmZpY2llbnQuIFNvbWUgc3R1ZmYgaXMgcmVtb3ZlZCBvciByZXBsYWNlZCB3aXRo
Cj4+IG1vcmUgY29tcGFjdCByZXByZXNlbnRhdGlvbi4KPj4KPj4gVGhpcyBjbGVhbnVwIGlzIG5l
Y2Vzc2FyeSBmb3IgZnV0dXJlIGZlYXR1cmVzLgo+Pgo+PiBUaGUgc2l6ZSBvZiBhdGgxMGtfc2ti
X2NiOgo+Pgo+PiAgICAgICAgICAgYmVmb3JlICAgYWZ0ZXIKPj4gIHg4Ni0zMiAgIDI2ICAgICAg
IDEyCj4+ICB4ODYtNjQgICAzNCAgICAgICAyMAo+Pgo+Pgo+PiB2MjoKPj4gICogZml4IGEgYnVn
IChwYXRjaCA3LzkgaW50cm9kdWNlZCkKPj4KPj4KPj4gTWljaGFsIEthemlvciAoOSk6Cj4+ICAg
YXRoMTBrOiBtZXJnZSBpc19wcm90ZWN0ZWQgd2l0aCBub2h3Y3J5cHQKPj4gICBhdGgxMGs6IHJl
bmFtZSBmdW5jdGlvbiB0byBhZGhlcmUgdG8gbmFtaW5nIGNvbnZlbnRpb24KPj4gICBhdGgxMGs6
IHJlbW92ZSB0eG1vZGUgZnJvbSBza2JfY2IKPj4gICBhdGgxMGs6IHJlbW92ZSBpc19vZmZjaGFu
Cj4+ICAgYXRoMTBrOiByZW1vdmUgZnJlcSBmcm9tIHNrYl9jYgo+PiAgIGF0aDEwazogcGFjayB1
cCBmbGFncyBpbiBza2JfY2IKPj4gICBhdGgxMGs6IGZpeCB0eCBoZWFkZXIgcGFyc2luZwo+PiAg
IGF0aDEwazogcmVwbGFjZSB2ZGV2X2lkIGFuZCB0aWQgaW4gc2tiIGNiCj4+ICAgYXRoMTBrOiBz
dG9yZSBtc2R1X2lkIGluc3RlYWQgb2YgdHhidWYgcG9pbnRlcnMKPgo+IEkgaGF2ZSBhIGNvbmZs
aWN0IHdoaWNoIEkgY2FuJ3QgZml4IG15c2VsZjoKPgo+IEFwcGx5aW5nOiBhdGgxMGs6IG1lcmdl
IGlzX3Byb3RlY3RlZCB3aXRoIG5vaHdjcnlwdAo+IEFwcGx5aW5nOiBhdGgxMGs6IHJlbmFtZSBm
dW5jdGlvbiB0byBhZGhlcmUgdG8gbmFtaW5nIGNvbnZlbnRpb24KPiBBcHBseWluZzogYXRoMTBr
OiByZW1vdmUgdHhtb2RlIGZyb20gc2tiX2NiCj4gQXBwbHlpbmc6IGF0aDEwazogcmVtb3ZlIGlz
X29mZmNoYW4KPiBmYXRhbDogc2hhMSBpbmZvcm1hdGlvbiBpcyBsYWNraW5nIG9yIHVzZWxlc3Mg
KGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvbWFjLmMpLgo+IFJlcG9zaXRvcnkgbGFj
a3MgbmVjZXNzYXJ5IGJsb2JzIHRvIGZhbGwgYmFjayBvbiAzLXdheSBtZXJnZS4KPiBDYW5ub3Qg
ZmFsbCBiYWNrIHRvIHRocmVlLXdheSBtZXJnZS4KPiBQYXRjaCBmYWlsZWQgYXQgMDAwNCBhdGgx
MGs6IHJlbW92ZSBpc19vZmZjaGFuCgpBaCwgc29ycnkuIEkgdGhvdWdodCBJIHJlYmFzZWQgb24g
dG9wIG9mIHlvdXIgbWFzdGVyIGJyYW5jaCBidXQgaXQKbG9va3MgbGlrZSBJIGRpZG4ndC4gTGV0
IG1lIGZpeCB0aGF0Li4KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBr
Cg==
