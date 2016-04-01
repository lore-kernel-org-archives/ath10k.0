Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alsJp-0003ib-5Q
 for ath10k@lists.infradead.org; Fri, 01 Apr 2016 06:12:29 +0000
Received: by mail-wm0-x232.google.com with SMTP id f198so11715601wme.0
 for <ath10k@lists.infradead.org>; Thu, 31 Mar 2016 23:12:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1459457986-29222-1-git-send-email-greearb@candelatech.com>
References: <1459457986-29222-1-git-send-email-greearb@candelatech.com>
Date: Fri, 1 Apr 2016 08:12:07 +0200
Message-ID: <CA+BoTQnmMKoK9z2QnTgBeRkXR0GdR1WV0XpOzD7JZnJ6QbHQ1w@mail.gmail.com>
Subject: Re: [PATCH 1/3] ath10k: Ensure txrx-compl-task is stopped when
 cleaning htt-tx.
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMzEgTWFyY2ggMjAxNiBhdCAyMjo1OSwgIDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNvbT4gd3Jv
dGU6Cj4gRnJvbTogQmVuIEdyZWVhciA8Z3JlZWFyYkBjYW5kZWxhdGVjaC5jb20+Cj4KPiBPdGhl
cndpc2UsIHRoZSB0eHJ4LWNvbXBsLXRhc2sgbWF5IGFjY2VzcyBzb21lIGJhZCBtZW1vcnk/Cj4K
PiBTaWduZWQtb2ZmLWJ5OiBCZW4gR3JlZWFyIDxncmVlYXJiQGNhbmRlbGF0ZWNoLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9odHRfdHguYyB8IDIgKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvaHR0X3R4LmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9h
dGgvYXRoMTBrL2h0dF90eC5jCj4gaW5kZXggMDdiOTYwZS4uNThlODhkMyAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2h0dF90eC5jCj4gKysrIGIvZHJpdmVy
cy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9odHRfdHguYwo+IEBAIC0zNzYsNiArMzc2LDggQEAg
dm9pZCBhdGgxMGtfaHR0X3R4X2ZyZWUoc3RydWN0IGF0aDEwa19odHQgKmh0dCkKPiAgewo+ICAg
ICAgICAgaW50IHNpemU7Cj4KPiArICAgICAgIHRhc2tsZXRfa2lsbCgmaHR0LT50eHJ4X2NvbXBs
X3Rhc2spOwo+ICsKCkkgdGhpbmssIGluc3RlYWQsIHRoZSBvcmRlcmluZyBvZiBhdGgxMGtfaHR0
X3R4X2ZyZWUoKSBhbmQKYXRoMTBrX2h0dF9yeF9mcmVlKCkgc2hvdWxkIGJlIHJldmVyc2VkLiBJ
dCdzIGFscmVhZHkgaW4gdGhlICJjb3JyZWN0IgpvcmRlciBpbiBhdGgxMGtfY29yZV9zdG9wKCkg
b24gZXJyb3IgcGF0aC4KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBr
Cg==
