Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x22c.google.com ([2a00:1450:4008:c01::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRF6S-0005y1-La
 for ath10k@lists.infradead.org; Wed, 02 Oct 2013 05:36:05 +0000
Received: by mail-bk0-f44.google.com with SMTP id mz10so116089bkb.31
 for <ath10k@lists.infradead.org>; Tue, 01 Oct 2013 22:35:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8761th6ja6.fsf@kamboji.qca.qualcomm.com>
References: <1380292567-2363-1-git-send-email-michal.kazior@tieto.com>
 <1380292567-2363-3-git-send-email-michal.kazior@tieto.com>
 <8761th6ja6.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 2 Oct 2013 07:35:37 +0200
Message-ID: <CA+BoTQnjG9MnbPsLM-RtAwuGNp_ZAfbvwvR_zg1Ks0ZmUxAtrQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ath10k: fix scheduling while atomic bug
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

T24gMSBPY3RvYmVyIDIwMTMgMTg6MzUsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5j
b20+IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0
ZXM6Cj4KPj4gUmVjZW50IFdNSS9IVEMgY2hhbmdlcyBicm9rZSBXRVAgd2l0aCBtdWx0aXBsZQo+
PiBrZXlzLiBJZiBXTUkgaGFkIG5vIEhUQyBUWCBjcmVkaXRzIHRvIHN1Ym1pdAo+PiBjb21tYW5k
IGZvciBkZWZhdWx0IHdlcCBpbmRleCB1cGRhdGUgaXQgd291bGQKPj4gdHJpZ2dlciBhIGJ1Zy4K
Pj4KPj4gVGhpcyBzaW1wbHkgbW92ZXMgdGhlIHdlcCBrZXkgaW5kZXggdXBkYXRlIHRvIGEKPj4g
d29ya2VyLgo+Pgo+PiBUaGUga2V5IHVwZGF0ZSBtYXkgaGFwcGVuIHNvbWUgdGltZSBhZnRlciBm
aXJzdAo+PiBmcmFtZSB3aXRoIGEgZGlmZmVyZW50IHdlcCBrZXkgaGFzIGJlZW4gc2VudCAoaS5l
Lgo+PiBzb21lIGZyYW1lcyB3aWxsIGJlIHNlbnQgd2l0aCBvbGQga2V5KS4gVGhpcyB3YXMKPj4g
dGhlIGNhc2UgYmVmb3JlIHRvbyBhcyBXTUkgY29tbWFuZHMgd2VyZQo+PiBhc3luY2hyb25vdXMu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8u
Y29tPgo+Cj4gVGhpcyBsb29rcyBwcm9ibGVtYXRpYy4gQmFzaWNhbGx5IHlvdSBqdXN0IGRlbGF5
IHNlbmRpbmcgdGhlIFdNSQo+IGNvbW1hbmQsIGJ1dCB0aGVyZSdzIG5vIGd1YXJhbnRlZSB0aGF0
IHdlIGFjdHVhbGx5IGhhdmUgZnJlZSBjcmVkaXRzIGF0Cj4gdGhlIHRpbWUgb2YgdHJhbnNtaXNz
aW9uLiBTbyB0byBtZSBpdCBsb29rcyBsaWtlIHRoaXMgZml4ZXMgdGhlIGlzc3VlCj4ganVzdCBi
eSBsdWNrLgoKT25lIHRoaW5nIGF0IGEgdGltZS4KClRoaXMgcGF0Y2ggZml4ZXMgJ3NjaGVkdWxp
bmcgd2hpbGUgYXRvbWljJyBidWcgdGhhdCB3YXMgaW50cm9kdWNlZAp3aXRoIHJlY2VudCBIVEMv
V01JIGNoYW5nZXMuCgpNdWx0aXBsZSB3ZXAga2V5IGhhbmRsaW5nIGhhZCB0aGUgc2FtZSBpc3N1
ZSB5b3UgcG9pbnQgb3V0IGJlZm9yZQpIVEMvV01JIGNoYW5nZXMuCgpUbyBmaXggdGhlIGlzc3Vl
IHlvdSBtZW50aW9uIHdlJ2QgbmVlZCB0byBzdG9wIG1hYzgwMjExIHF1ZXVlcywgcXVldWUKZnJh
bWUocykgd2l0aCBhIG5ldyBrZXkgb24gaW50ZXJuYWwgcXVldWUsIHNjaGVkdWxlIGEgd29yay4g
VGhlIHdvcmsKc2hvdWxkIHNldCBuZXcgd2VwIGtleSBpbmRleCwgc2VuZCBwZW5kaW5nIGZyYW1l
cyBmcm9tIGludGVybmFsIHF1ZXVlCmFuZCB3YWtlIG1hYzgwMjExIHF1ZXVlcy4gVGhpcyBpcyBh
IGJpdCBtb3JlIGNvbXBsZXggdGhhbiBpdCBzb3VuZHMKdGhvdWdoLgoKCk1pY2hhxYIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5n
IGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
