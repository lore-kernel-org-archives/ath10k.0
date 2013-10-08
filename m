Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x22e.google.com ([2a00:1450:4008:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTaUJ-00062x-PX
 for ath10k@lists.infradead.org; Tue, 08 Oct 2013 16:50:24 +0000
Received: by mail-bk0-f46.google.com with SMTP id 6so3370936bkj.33
 for <ath10k@lists.infradead.org>; Tue, 08 Oct 2013 09:50:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87mwmjsz2k.fsf@kamboji.qca.qualcomm.com>
References: <1380805765-31521-1-git-send-email-michal.kazior@tieto.com>
 <1380865425-3791-1-git-send-email-michal.kazior@tieto.com>
 <1380865425-3791-2-git-send-email-michal.kazior@tieto.com>
 <87mwmjsz2k.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 8 Oct 2013 09:49:59 -0700
Message-ID: <CA+BoTQ=qep+rKEyLKrNjNP6K1q+FHKpvkscwXuRMR_45YnRvHA@mail.gmail.com>
Subject: Re: [PATCH/RFT v2 1/4] ath10k: fix add_interface failure handling
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

T24gOCBPY3RvYmVyIDIwMTMgMDU6NTQsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5j
b20+IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0
ZXM6Cj4KPj4gSWYgc29tZXRoaW5nIGZhaWxlZCBhbG9uZyBhZGRfaW50ZXJmYWNlKCkgc2V0dXAg
aXQKPj4gd2FzIHBvc3NpYmxlIHRvIGxlYWsgYSB2ZGV2IGlkLCB2ZGV2IGFuZCBwZWVyLgo+Pgo+
PiBUaGlzIGNvdWxkIGVuZCB1cCB3aXRoIGxlYWtlZCBGVyBzdGF0ZSBvciBGVyBjcmFzaAo+PiAo
YXNzdW1pbmcgYWRkX2ludGVyZmFjZSgpIGZhaWx1cmUgd2Fzbid0IGEgcmVzdWx0IG9mCj4+IGEg
Y3Jhc2gpLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9y
QHRpZXRvLmNvbT4KPgo+IFRoZW4gSSBhcHBseSB0aGlzIHBhdGNoIG9uIHRvcCBvZiBjdXJyZW50
IGF0aC5naXQgbWFzdGVyIGJyYW5jaCAoY29tbWl0Cj4gMThmZTBiNTNlNzYpIGludGVyZmFjZSB1
cCBmYWlscyBvbiB0aGUgbWFuYWdlZCBtb2RlOgo+Cj4gJCBzdWRvIGlwIGxpbmsgc2V0IHdsYW4x
IHVwCj4gUlRORVRMSU5LIGFuc3dlcnM6IEludmFsaWQgYXJndW1lbnQKPgo+IExvZ3MgZG9uJ3Qg
aGF2ZSBhbnl0aGluZyBzcGVjaWFsICh0aGUgVFggZW5jYXAgZXJyb3Igd2FzIGFscmVhZHkKPiBi
ZWZvcmUpOgo+Cj4gWyAxMjU5LjgxODg2M10gYXRoMTBrOiBNU0ktWCBkaWRuJ3Qgc3VjY2VlZCAo
MSksIHRyeWluZyBNU0kKPiBbIDEyNTkuODE5Mjk4XSBhdGgxMGtfcGNpIDAwMDA6MDI6MDAuMDog
aXJxIDQ5IGZvciBNU0kvTVNJLVgKPiBbIDEyNTkuODIwMDU1XSBhdGgxMGs6IE1TSSBpbnRlcnJ1
cHQgaGFuZGxpbmcKPiBbIDEyNjAuNzQ3ODc3XSBhdGgxMGs6IFVBUlQgcHJpbnRzIGRpc2FibGVk
Cj4gWyAxMjYwLjgyODIxOV0gYXRoMTBrOiBmaXJtd2FyZSAxMC4xLjM4OSBib290ZWQKPiBbIDEy
NjAuODM3NTg1XSBhdGgxMGs6IGh0dCB0YXJnZXQgdmVyc2lvbiAyLjEKPiBbIDEyNjAuODM4NDk4
XSBhdGgxMGs6IEZhaWxlZCB0byBzZXQgVFggZW5jYXA6IC0yMgoKQWguIFJpZ2h0LiBJJ3ZlIHRl
c3RlZCB0aGlzIHBhdGNoIHdpdGggbWFpbiBGVyBicmFuY2ggd2hpY2ggc3VwcG9ydHMKVFggZW5j
YXAgY29tbWFuZC4gVGhlIFRYIGVuY2FwIGlzc3VlIHNob3VsZCBiZSBkZWFsdGggd2l0aCBmaXJz
dC4KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
