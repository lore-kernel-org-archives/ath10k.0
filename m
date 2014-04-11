Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYTuY-0003ly-Pz
 for ath10k@lists.infradead.org; Fri, 11 Apr 2014 05:22:04 +0000
Received: by mail-wi0-f179.google.com with SMTP id z2so408029wiv.6
 for <ath10k@lists.infradead.org>; Thu, 10 Apr 2014 22:21:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53469F7B.2080202@candelatech.com>
References: <53469F7B.2080202@candelatech.com>
Date: Fri, 11 Apr 2014 07:21:32 +0200
Message-ID: <CA+BoTQmc=n7ifUh+8Lq_1P=t4KJyDDFjcs3Z1mW1nHFO+WR2hw@mail.gmail.com>
Subject: Re: Question on ath10k_mgmt_tx_flush
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
To: Ben Greear <greearb@candelatech.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTAgQXByaWwgMjAxNCAxNTo0MSwgQmVuIEdyZWVhciA8Z3JlZWFyYkBjYW5kZWxhdGVjaC5j
b20+IHdyb3RlOgo+IENhbiB3ZSBvcHRpbWl6ZSB0aGlzIG1ldGhvZCB0byByZXR1cm4gZWFybHkg
aWYgdGhlIHR4LWNyZWRpdHMKPiBhcmUgZnVsbHkgcmVwbGVuaXNoZWQgKGllLCA9PSAyKSBpbnN0
ZWFkIG9mIGp1c3Qgc2xlZXBpbmcgdGhlCj4gMiB4IGJlYWNvbi1pbnRlcnZhbD8gIFRoYXQgd291
bGQgaW5kaWNhdGUgYWxsIG1lc3NhZ2VzCj4gaGF2ZSBiZWVuIGZsdXNoZWQsIHJpZ2h0PwoKWWVh
aC4gWW91J3JlIF9hbG1vc3RfIHJpZ2h0LiBFdmVyeSBvZGQgbWdtdCBmcmFtZSB3aWxsIHRyaWdn
ZXIgdHgKY3JlZGl0IHJlcGxlbmlzaG1lbnQsIGV2ZW4gaWYgeW91IHNldCBORUVEU19DUkVESVRT
IGh0YyB0eCBmbGFnIGZvcgphbGwgcGFja2V0cy4gSXQgc2VlbXMgdGhhdCB0eCBjcmVkaXRzIGFy
ZW4ndCByZXBsZW5pc2hlZCB1bnRpbCB5b3UKc3VibWl0IGFuIGV2ZW4gbnVtYmVyIG9mIG1nbXQg
dHg6CgogW3R4IGNyZWRpdHMgPTJdCiB2ZGV2IGNyZWF0ZSBbLTEsID0xXQogW3JlcGxlbmlzaCAr
MSwgPTJdCiBtZ210IHR4IFstMSwgPTFdCiBbZnJhbWUgaXMgc2VlbiBvbiBhaXIsIG1lYW5zIGl0
IGxlZnQgdHggcXVldWUsIGJ1dCBubyByZXBsZW5pc2htZW50XQogdmRldiBzZXQgcGFyYW0gWy0x
LCA9MF0KIFtyZXBsZW5pc2ggKzEsID0xXQogbWdtdCB0eCBbLTEsID0wXQogW2ZyYW1lIHNlZW4g
b24gYWlyXQogW3JlcGxlbmlzaCArMiwgPTJdCgpIb3dldmVyIG9uY2UgeW91IGZsdXNoIHBlZXIg
dGlkcyB5b3UgZ2V0IHRoZSB0eCBjcmVkaXQgaW1tZWRpYXRlbHkuClRoaXMgbWVhbnMgeW91IGRv
bid0IGV2ZXIgcmVhY2ggaGF2aW5nIDIgbWdtdCB0eCBjb25zdW1pbmcgMiB0eApjcmVkaXRzICh1
bmxlc3MgdGhpbmdzIGdvIHRlcnJpYmx5IHRlcnJpYmx5IHdyb25nIGF0IHdoaWNoIHBvaW50IGl0
J3MKcHJvYmFibHkgYWxyZWFkeSBiZXlvbmQgaGVscCkuCgpBIHZlcnkgdWdseSBoYWNrIHdvdWxk
IGJlIHRvIHRyeSBhbmQgc2VuZCBvdXQgbWdtdCB0eCBpbiBwYWlycyAtIGEKcmVxdWVzdGVkIGZy
YW1lIGFuZCBhIGR1bW15IGZyYW1lIChzdWNoIHRoYXQgZmlybXdhcmUgd2lsbCBub3QgYnVmZmVy
Cml0KSBzbyB0aGF0IHlvdSB1c2UgdHggY3JlZGl0IHJlcGxlbmlzaG1lbnQgYXMgdHggY29tcGxl
dGlvbgppbmRpY2F0aW9uLgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgx
MGsK
