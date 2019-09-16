Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAF0i-0005oG-C9
 for ath10k@lists.infradead.org; Tue, 17 Sep 2019 15:03:22 +0000
Received: by mail-ed1-f69.google.com with SMTP id j8so2362761edl.11
 for <ath10k@lists.infradead.org>; Tue, 17 Sep 2019 08:03:15 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH 1/4] mac80211: Switch to a virtual time-based airtime
 scheduler
In-Reply-To: <1568639388-27291-1-git-send-email-yiboz@codeaurora.org>
References: <1568639388-27291-1-git-send-email-yiboz@codeaurora.org>
Date: Mon, 16 Sep 2019 16:51:37 +0200
Message-ID: <877e68l2fa.fsf@toke.dk>
MIME-Version: 1.0
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
To: Yibo Zhao <yiboz@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

WWlibyBaaGFvIDx5aWJvekBjb2RlYXVyb3JhLm9yZz4gd3JpdGVzOgoKPiBGcm9tOiBUb2tlIEjD
uGlsYW5kLUrDuHJnZW5zZW4gPHRva2VAcmVkaGF0LmNvbT4KPgo+IFRoaXMgc3dpdGNoZXMgdGhl
IGFpcnRpbWUgc2NoZWR1bGVyIGluIG1hYzgwMjExIHRvIHVzZSBhIHZpcnR1YWwgdGltZS1iYXNl
ZAo+IHNjaGVkdWxlciBpbnN0ZWFkIG9mIHRoZSByb3VuZC1yb2JpbiBzY2hlZHVsZXIgdXNlZCBi
ZWZvcmUuIFRoaXMgaGFzIGEKPiBjb3VwbGUgb2YgYWR2YW50YWdlczoKClRoYW5rIHlvdSBmb3Ig
a2VlcGluZyBhdCB0aGlzISBJJ2xsIHRha2UgYSBsb29rIGF0IHRoZSBzZXJpZXMgaW4gZGV0YWls
CnRvbW9ycm93LgoKV2hpbGUgeW91J3JlIHRlc3RpbmcgdGhpbmdzIHJlbGF0ZWQgdG8gdGhpcywg
SSd2ZSBhbHNvIHByb3RvdHlwZWQgYSBwb3J0Cm9mIHRoZSAiYWlydGltZSBxdWV1ZSBsaW1pdCIg
ZmVhdHVyZSBmcm9tIGNocm9tZW9zIGludG8gbWFpbmxpbmUuIEl0J3MKY3VycmVudGx5IGluIG15
IHRyZWUgaGVyZToKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvdG9rZS9saW51eC5naXQvbG9nLz9oPW1hYzgwMjExLWFxbC0wMQoKSWYgeW91IGhhdmUgdGlt
ZSB0byB0ZXN0IGl0IGF0IHNvbWUgcG9pbnQsIHRoYXQgd291bGQgYmUgYXdlc29tZS4gSSdtCnBs
YW5uaW5nIHRvIHN1Ym1pdCBpdCBhcyBhbiBSRkMsIGJ1dCBpdCBuZWVkcyBhIGJpdCBtb3JlIHdv
cmsgZmlyc3QuCkFsc28sIGl0J3MgY29tcGxldGVseSB1bnRlc3RlZCwgYnV0IGl0IGRvZXMgY29t
cGlsZSA6KQoKLVRva2UKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
