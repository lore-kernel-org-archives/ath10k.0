Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGSl7-00071N-Le
 for ath10k@lists.infradead.org; Fri, 04 Oct 2019 18:57:06 +0000
MIME-Version: 1.0
Date: Fri, 04 Oct 2019 11:56:51 -0700
From: Jeff Johnson <jjohnson@codeaurora.org>
Subject: Re: [PATCH 5/5] ath10k: pull_svc_rdy code-style fix
In-Reply-To: <CAKR_QVK=XwLtaGgoLeU5-+XQP_-jVvAdWfkGvdyV9WNK_5QUng@mail.gmail.com>
References: <1569268165-1639-1-git-send-email-pozega.tomislav@gmail.com>
 <1569268165-1639-5-git-send-email-pozega.tomislav@gmail.com>
 <87d0fq5kic.fsf@codeaurora.org>
 <CAKR_QVK=XwLtaGgoLeU5-+XQP_-jVvAdWfkGvdyV9WNK_5QUng@mail.gmail.com>
Message-ID: <998c7ce60b99865835f619dee86b301b@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Tom Psyborg <pozega.tomislav@gmail.com>
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

T24gMjAxOS0wOS0yNCAwMDo0OSwgVG9tIFBzeWJvcmcgd3JvdGU6Cj4gT24gMjQvMDkvMjAxOSwg
S2FsbGUgVmFsbyA8a3ZhbG9AY29kZWF1cm9yYS5vcmc+IHdyb3RlOgo+PiBUb21pc2xhdiBQb8W+
ZWdhIDxwb3plZ2EudG9taXNsYXZAZ21haWwuY29tPiB3cml0ZXM6Cj4+IEFjdHVhbGx5IEkgcHJl
ZmVyIHRoZSBvcmlnaW5hbCBzdHlsZSwgc28gdGhhdCB3ZSBmaXJzdCBjaGVjayB0aGUgZGF0YSAK
Pj4gaW4KPj4gc2tiIGlzIHZhbGlkIGFuZCBvbmx5IHRoZW4gYXNzaWduIHRoZSBkYXRhIHRvIGV2
Lgo+PiAKPj4gLS0KPj4gS2FsbGUgVmFsbwo+PiAKPiAKPiBJdCBjYW1lIHRvIG15IG1pbmQgdGhh
dCB0aGlzIG1pZ2h0IGJlIHRoZSByZWFzb24gd2h5IHRoZSBjdXJyZW50Cj4gZHJpdmVyIGRpZCBu
b3QgZ2l2ZSBtZSB3YXJuaW5nIGFib3V0IHRvbyBzaG9ydCBzZXJ2aWNlIHJlYWR5IGV2ZW50LAo+
IGJ1dCB0aGVyZSB3YXMgbm8gd2FybmluZyBhYm91dCBldmVudCBsZW5ndGggaW4gZWl0aGVyIGNh
c2UuCj4gSSBldmVuIHRlc3RlZCB0aGlzIHdpdGggY29tcGF0IHdpcmVsZXNzIGZyb20gMjAxMy4g
YW5kIHRoZXJlIHRoZQo+IHNpdHVhdGlvbiB3YXMgdGhlIG9wcG9zaXRlOiBpbiBib3RoIGNhc2Vz
IHRoZXJlIHdhcyB3YXJuaW5nIGFib3V0Cj4gc2VydmljZSByZWFkeSBsZW5ndGguCgpIbW1tLCBt
eSB1bmRlcnN0YW5kaW5nIG9mIHRoZSB3YXkgdGhlIFRMViBXTUkgaXMgc3VwcG9zZWQgdG8gd29y
ayBpcyAKdGhhdCB0aGUgaW5kaXZpZHVhbCBkYXRhIHN0cnVjdHVyZXMgYXJlIGV4dGVuc2libGUs
IGFuZCBpbiB0aGUgY2FzZSAKd2hlcmUgYSBkYXRhIHN0cnVjdHVyZSBpcyByZWNlaXZlZCB3aXRo
IGEgInNob3J0IiBsZW5ndGggdGhlIHJlY2lwaWVudCAKaXMgc3VwcG9zZWQgdG8gemVyby1leHRl
bmQgdG8gdGhlIGV4cGVjdGVkIGxlbmd0aCwgYW5kIHRoZW4gaGFuZGxlIHRoZSAKInplcm9lZCIg
ZmllbGQocykgYXBwcm9wcmlhdGVseS4gVGhpcyBpcyBzdXBwb3NlZCB0byBob2xkIGZvciBib3Ro
IApob3N0PT5maXJtd2FyZSBhbmQgZmlybXdhcmU9Pmhvc3QuIFNpbmNlIHRoZSB3bWlfc2Vydmlj
ZV9yZWFkeV9ldmVudCBoYXMgCmJlZW4gZXh0ZW5kZWQgb3ZlciB0aW1lIHRoaXMgYmVoYXZpb3Ig
aXMgbmVjZXNzYXJ5IGluIHRoZSBjYXNlIG9mIGEgaG9zdCAKYnVpbHQgd2l0aCB0aGUgY3VycmVu
dCBmb3JtYXQgaW50ZXJmYWNpbmcgdG8gYSBmaXJtd2FyZSBidWlsdCB3aXRoIGFuIAplYXJsaWVy
IHZlcnNpb24gb2YgdGhlIGZvcm1hdC4gSSdtIG5vdCBzdXJlIHdoeSBhdGgxMGsgaXNuJ3Qgc3Vw
cG9ydGluZyAKdGhpcyBzaW5jZSB0aGUgUVRJICJvdXQgb2YgdHJlZSIgZHJpdmVyIChteSBhcmVh
IG9mIGZvY3VzKSBoYXMgdGhhdCAKc3VwcG9ydC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
dGgxMGsK
