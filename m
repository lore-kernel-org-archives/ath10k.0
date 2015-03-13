Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22a.google.com ([2a00:1450:400c:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YWJOB-0007wn-JT
 for ath10k@lists.infradead.org; Fri, 13 Mar 2015 06:48:08 +0000
Received: by wggz12 with SMTP id z12so21251317wgg.0
 for <ath10k@lists.infradead.org>; Thu, 12 Mar 2015 23:47:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1426175362-8640-1-git-send-email-hofrat@osadl.org>
References: <1426175362-8640-1-git-send-email-hofrat@osadl.org>
Date: Fri, 13 Mar 2015 07:47:45 +0100
Message-ID: <CA+BoTQ=VYkOcKBjBuLsJcDjPNevTD2UFxVfB1uimRr=9uBO4Fw@mail.gmail.com>
Subject: Re: [PATCH 2/3 RFC] ath10k: wmi: match wait_for_completion_timeout
 return type
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
To: Nicholas Mc Guire <hofrat@osadl.org>
Cc: Network Development <netdev@vger.kernel.org>, Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, linux-kernel@vger.kernel.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTIgTWFyY2ggMjAxNSBhdCAxNjo0OSwgTmljaG9sYXMgTWMgR3VpcmUgPGhvZnJhdEBvc2Fk
bC5vcmc+IHdyb3RlOgo+IFJldHVybiB0eXBlIG9mIHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91
dCBpcyB1bnNpZ25lZCBsb25nIG5vdCBpbnQuCj4gQW4gYXBwcm9wcmlhdGVseSBuYW1lZCB1bnNp
Z25lZCBsb25nIGlzIGFkZGVkIGFuZCB0aGUgYXNzaWdubWVudHMgZml4ZWQgdXAuCj4gUmF0aGVy
IHRoYW4gcmV0dXJuaW5nIDAgKHRpbWVvdXQpIG9yIGEgbW9yZSBvciBsZXNzIHJhbmRvbSByZW1h
aW5pbmcgdGltZQo+IChjb21wbGV0aW9uIHN1Y2Nlc3MpIHRoaXMgcmV0dXJuIDAgb3IgMSB3aGlj
aCBhbHNvIHJlc29sdmVzIHRoZSB0eXBlIG9mIHRoZQo+IGZ1bmN0aW9ucyBiZWluZyBpbnQuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBOaWNob2xhcyBNYyBHdWlyZSA8aG9mcmF0QG9zYWRsLm9yZz4KPiAt
LS0KPgo+IENoZWNraW5nIHRoZSBjYWxsLXNpdGVzIG9mIGF0aDEwa193bWlfd2FpdF9mb3JfdW5p
ZmllZF9yZWFkeSBhbmQKPiBhdGgxMGtfd21pX3dhaXRfZm9yX3NlcnZpY2VfcmVhZHkgdGhlIHBv
c2l0aXZlIHJldHVybiB2YWx1ZSAocmVtYWluaW5nCj4gdGltZSBpbiBqaWZmaWVzKSBpcyBuZXZl
ciBwYXNzZWQgdXAgdGhlIGNhbGwtY2hhaW4gbm9yIHVzZWQgc28gaXQgaXMKPiBjbGVhbmVyIHRv
IHRyZWF0IHRoaXMgbGlrZSBhIGJvb2xlYW4gc3VjY2Vzcy9mYWlsIG9ubHkgKGFjdHVhbGx5IHRo
ZSB0d28KPiBmdW5jdGlvbnMgc2hvdWxkIHByb2JhYmx5IGJlIG9mIHR5cGUgYm9vbCAtIGJ1dCB0
aGF0IGRvZXMgbm90IHNlZW0gdG8gYmUKPiBjb21tb24gcHJhY3RpY2UgaW4gdGhlIGF0aDEwayBj
b2RlIGJhc2UpCgpJdCdkIG1ha2Ugc2Vuc2UgdG8gaGF2ZSB0aGVzZSBmdW5jdGlvbnMgcmV0dXJu
IDAgb3IgLUVUSU1FRE9VVC4gSW4KdGhhdCBjYXNlIGJvdGggY2FsbCBzaXRlcyB3b3VsZCBuZWVk
IHRvIGJlIGFkanVzdGVkIHRvIHRyZWF0ICI8IDAiIG9yCiIheCIgYXMgYW4gZXJyb3IgKGluc3Rl
YWQgb2YgdGhlIGN1cnJlbnQgIjw9IDAiKSBjb25kaXRpb24gYW5kIG5vdCBzZXQKLUVUSU1FRE9V
VCB0aGVtc2VsdmVzLgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
