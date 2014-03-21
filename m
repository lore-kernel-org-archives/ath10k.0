Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ob0-x232.google.com ([2607:f8b0:4003:c01::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WR0ua-0000ID-Le
 for ath10k@lists.infradead.org; Fri, 21 Mar 2014 14:59:09 +0000
Received: by mail-ob0-f178.google.com with SMTP id wp18so2614900obc.9
 for <ath10k@lists.infradead.org>; Fri, 21 Mar 2014 07:58:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1395411440.4164.15.camel@jlt4.sipsolutions.net>
References: <1395410520-26939-1-git-send-email-michal.kazior@tieto.com>
 <1395411440.4164.15.camel@jlt4.sipsolutions.net>
Date: Fri, 21 Mar 2014 15:58:44 +0100
Message-ID: <CA+BoTQk5RiFPjDGMSwFHd6GGt=x9M6QXGZcdENtMjQrDcORicg@mail.gmail.com>
Subject: Re: [PATCH] ath10k: dont call csa_finish more than once
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjEgTWFyY2ggMjAxNCAxNToxNywgSm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29sdXRp
b25zLm5ldD4gd3JvdGU6Cj4gT24gRnJpLCAyMDE0LTAzLTIxIGF0IDE1OjAyICswMTAwLCBNaWNo
YWwgS2F6aW9yIHdyb3RlOgo+PiBEcml2ZXIgaXMgc3VwcG9zZWQgdG8gY2FsbCBpdCBvbmx5IG9u
Y2UgZm9yIGVhY2gKPj4gc2NoZWR1bGVkIGNoYW5uZWxfc3dpdGNoX2JlYWNvbigpLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4KPj4g
LS0tCj4+IFRoaXMgaXMgcmVxdWlyZWQgZm9yIG11bHRpLXZpZiBjc2EgYnV0IHNpbmNlIHRoYXQK
Pj4gaXNuJ3QgbWVyZ2VkIHlldCBJJ20gbm90IGluY2x1ZGluZyBhbnkgc3BlY2lmaWNzCj4+IGlu
IHRoZSBjb21taXQgbG9nIGl0c2VsZi4KPj4KPj4gUHJldmVudGluZyBtdWx0aXBsZSBpZWVlODAy
MTFfY3NhX2ZpbmlzaCgpIGNhbGxzCj4+IHNvdW5kcyBsaWtlIGEgZ29vZCBpZGVhIGluIGdlbmVy
YWwgdG8gbWUuCj4KPiBEaWRuJ3Qgd2UgaGF2ZSB0aGlzIGRpc2N1c3Npb24gb24gdGhlIGh3c2lt
IHBhdGNoIGJlZm9yZT8KCk9oLiBJJ20gbm90IGF3YXJlIG9mIHRoZSBkaXNjdXNzaW9uLiBQcm9i
YWJseSBtaXNzZWQgaXQuCgoKPiBJJ2QgYXJndWUgdGhhdCBpZiBhbGwgZHJpdmVycyBtdXN0IHRy
YWNrIHRoaXMsIHRoZW4gdGhlIG1hYzgwMjExIEFQSSBpcwo+IGRlZmVjdGl2ZS4KCkkgY2FuIG1h
a2UgdGhpcyBhIG1hYzgwMjExIHBhdGNoIHRoZW4/CgoKTWljaGHFggoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgx
MGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2F0aDEwawo=
