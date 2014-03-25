Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oa0-x236.google.com ([2607:f8b0:4003:c02::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSMzP-0003y2-Fm
 for ath10k@lists.infradead.org; Tue, 25 Mar 2014 08:45:44 +0000
Received: by mail-oa0-f54.google.com with SMTP id n16so163549oag.27
 for <ath10k@lists.infradead.org>; Tue, 25 Mar 2014 01:45:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAEFj9867Z+x3orcwUpwjwQB-9c5r4FfAuZBHYDGZ1hNe=6Z1pA@mail.gmail.com>
References: <1395734146-10907-1-git-send-email-yeohchunyeow@gmail.com>
 <CA+BoTQmVw1fiDU_Pu_fowRfFdme-AZ1-qLmxhCHuxFPSK831rw@mail.gmail.com>
 <CAEFj9867Z+x3orcwUpwjwQB-9c5r4FfAuZBHYDGZ1hNe=6Z1pA@mail.gmail.com>
Date: Tue, 25 Mar 2014 09:45:22 +0100
Message-ID: <CA+BoTQn4ji2boTV8x-owO8PbaPm510wYEKmbKqf+VS+MS+DXnQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix printing of peer stats in non-AP firmware
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjUgTWFyY2ggMjAxNCAwOTozMywgWWVvaCBDaHVuLVllb3cgPHllb2hjaHVueWVvd0BnbWFp
bC5jb20+IHdyb3RlOgo+IEhpLCBNaWNoYWwKPgo+PiBJIHN1cHBvc2UgdGhlcmUncyBhIGxpbWl0
IGhvdyBtdWNoIHBlZXIgZW50cmllcyBmaXJtd2FyZSBpcyBhYmxlIHRvCj4+IHBhY2sgdXAgaW50
byBhIHNpbmdsZSBldmVudC4gVGhlIHNlY29uZCBldmVudCB5b3UgaGFuZGxlIGhlcmUgaXMgc3Rp
bGwKPj4gZ29pbmcgdG8gaGF2ZSBzb21lIHNvcnQgb2YgYSBsaW1pdCBhbmQgeW91J2xsIGVuZCB1
cCBkcm9wcGluZyByZXN1bHRzCj4+IGFnYWluLiBUaGUgc2FtZSBwcm9iYWJseSBnb2VzIHdpdGgg
dmRldiBzdGF0cyAod2hpY2ggYXJlbid0IGhhbmRsZWQKPj4geWV0LCBidXQgaGV5KS4KPgo+IHZk
ZXYgc3RhdHMgaXMgbm90IHN1cHBvcnRlZCBieSBmaXJtd2FyZSA5OTkuOTk5LjAuNjM2LCBhbSBJ
IHJpZ2h0PwoKVHJ1ZSwgYnV0IG9uY2UgaXQgaXMgc3VwcG9ydGVkIHRoZW4gaXQgd2lsbCBtb3N0
IGxpa2VseSBuZWVkIHRoZSBzYW1lCnRyZWF0bWVudCBhcyBwZWVyIHN0YXRzLgoKCj4gQlRXLCBJ
IGFsc28gc2F3IHRoYXQgdGhlIHNhbWUgaGFwcGVuIHRvIGxhdGVzdCBBUCBmaXJtd2FyZSB3aGVu
ZXZlcgo+IHRoZSBwZWVyIHN0YXRzIGlzIG1vcmUgdGhhbiAxLiBCdXQgc2luY2UgdGhlIGZpcnN0
IHBlZXIgc3RhdHMgaXMgc2VsZgo+IHN0YXRzLCBzbyBpdCBpcyBvayB0byBvdmVyd3JpdGUgaXQu
CgpJIGRpc2FncmVlLiBXaHkgZG8geW91IHRoaW5rIGl0IGlzIG9rYXkgdG8gb3ZlcndyaXRlIHNl
bGYgcGVlciBzdGF0cz8KCkJ0dy4gMTAuMSBmaXJtd2FyZSBoYXMgbW9yZSBwZGV2IHN0YXRzIHdo
aWNoIGJyZWFrcyBwYXJzaW5nIG9mIHBlZXIgZW50cmllcy4uLgoKCk1pY2hhxYIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxp
c3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
