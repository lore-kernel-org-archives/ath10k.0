Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x234.google.com ([2a00:1450:400c:c05::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgUjS-00065H-7h
 for ath10k@lists.infradead.org; Tue, 21 Oct 2014 08:23:54 +0000
Received: by mail-wi0-f180.google.com with SMTP id em10so1065290wid.13
 for <ath10k@lists.infradead.org>; Tue, 21 Oct 2014 01:23:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87lho9ygy1.fsf@kamboji.qca.qualcomm.com>
References: <1413807758-30249-1-git-send-email-michal.kazior@tieto.com>
 <1413807758-30249-4-git-send-email-michal.kazior@tieto.com>
 <87lho9ygy1.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 21 Oct 2014 10:23:31 +0200
Message-ID: <CA+BoTQn9Rc4fLUV8JS5_ZrrckyNz8YPevgmc+FpxtGJ1xhtX2w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ath10k: speed up hw recovery
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

T24gMjEgT2N0b2JlciAyMDE0IDEwOjE3LCBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNvbW0u
Y29tPiB3cm90ZToKPiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4gd3Jp
dGVzOgo+Cj4+IEluIHNvbWUgY2FzZXMgaHcgcmVjb3Zlcnkgd2FzIHRha2luZyBhbiBhYnN1cmRs
eQo+PiBsb25nIHRpbWUgZHVlIHRvIGF0aDEwayB3YWl0aW5nIGZvciB0aGluZ3MgdGhhdAo+PiB3
b3VsZCBuZXZlciByZWFsbHkgY29tcGxldGUuCj4+Cj4+IEluc3RlYWQgb2Ygd2FpdGluZyBmb3Ig
aW5ldml0YWJsZSB0aW1lb3V0cyBwb2tlCj4+IGFsbCBjb21wbGV0aW9ucyBhbmQgd2FrZXF1ZXVl
cyBhbmQgY2hlY2sgaWYgaXQncwo+PiBzdGlsbCB3b3J0aCB3YWl0aW5nLgo+Pgo+PiBSZWFkaW5n
L3dyaXRpbmcgYXItPnN0YXRlIHJlcXVpcmVzIGNvbmZfbXV0ZXguCj4+IFNpbmNlIHdhaXRlcnMg
bWlnaHQgYmUgaG9sZGluZyBpdCBpbnRyb2R1Y2UgYSBuZXcKPj4gZmxhZyBDUkFTSF9GTFVTSCBz
byBpdCdzIHBvc3NpYmxlIHRvIHRlbGwgd2FpdGVycwo+PiB0byBhYm9ydCB3aGF0ZXZlciB0aGV5
IHdlcmUgd2FpdGluZyBmb3IuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBLYXppb3IgPG1p
Y2hhbC5rYXppb3JAdGlldG8uY29tPgo+Cj4gV2hpbGUgYXBwbHlpbmcgdG8gYXRoLW5leHQtdGVz
dCB0aGVyZSB3YXMgYSBjb25mbGljdCBpbiBjb3JlLmguIFBsZWFzZQo+IGNoZWNrIG15IHJlc29s
dXRpb246Cj4KPiBodHRwczovL2dpdGh1Yi5jb20va3ZhbG8vYXRoL2NvbW1pdC82Y2NjZGEwMTg1
YzdkZjk2ZjQzOWRjM2Y4Nzk2MWU4MTg0M2RlM2VlCgpJIHRoaW5rIGl0IHdhcyBgZW51bSBhdGgx
MGtfY2FsX21vZGUge2AgdnMgYGVudW0gYXRoMTBrX3NjYW5fc3RhdGUge2AKYmVjYXVzZSBteSBw
YXRjaCB3YXMgYmFzZWQgd2l0aG91dCB5b3VyIGNhbCBwYXRjaGVzLgoKQW55d2F5IC0gbG9va3Mg
Z29vZCwgdGhhbmtzIQoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
