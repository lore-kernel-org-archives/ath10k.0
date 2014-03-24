Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WRyWL-0005Cp-N7
 for ath10k@lists.infradead.org; Mon, 24 Mar 2014 06:38:06 +0000
Received: by mail-ob0-f173.google.com with SMTP id gq1so5309853obb.32
 for <ath10k@lists.infradead.org>; Sun, 23 Mar 2014 23:37:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1395414428.4164.16.camel@jlt4.sipsolutions.net>
References: <1395410520-26939-1-git-send-email-michal.kazior@tieto.com>
 <1395411440.4164.15.camel@jlt4.sipsolutions.net>
 <CA+BoTQk5RiFPjDGMSwFHd6GGt=x9M6QXGZcdENtMjQrDcORicg@mail.gmail.com>
 <1395414428.4164.16.camel@jlt4.sipsolutions.net>
Date: Mon, 24 Mar 2014 07:37:33 +0100
Message-ID: <CA+BoTQ=zZo-f=w3KaWPC6TJ6TmoW+XOBHNwyYCSkbc1cnedihQ@mail.gmail.com>
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

T24gMjEgTWFyY2ggMjAxNCAxNjowNywgSm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29sdXRp
b25zLm5ldD4gd3JvdGU6Cj4gT24gRnJpLCAyMDE0LTAzLTIxIGF0IDE1OjU4ICswMTAwLCBNaWNo
YWwgS2F6aW9yIHdyb3RlOgo+Cj4+ID4gRGlkbid0IHdlIGhhdmUgdGhpcyBkaXNjdXNzaW9uIG9u
IHRoZSBod3NpbSBwYXRjaCBiZWZvcmU/Cj4+Cj4+IE9oLiBJJ20gbm90IGF3YXJlIG9mIHRoZSBk
aXNjdXNzaW9uLiBQcm9iYWJseSBtaXNzZWQgaXQuCj4KPiBPciBJIGdvdCBpdCB3cm9uZyA6KQo+
Cj4+ID4gSSdkIGFyZ3VlIHRoYXQgaWYgYWxsIGRyaXZlcnMgbXVzdCB0cmFjayB0aGlzLCB0aGVu
IHRoZSBtYWM4MDIxMSBBUEkgaXMKPj4gPiBkZWZlY3RpdmUuCj4+Cj4+IEkgY2FuIG1ha2UgdGhp
cyBhIG1hYzgwMjExIHBhdGNoIHRoZW4/Cj4KPiBZZWFoIEkgZ3Vlc3MuIFdoYXQgd2FzIHRoZSBy
ZWFzb24gZm9yIHRoaXMgdGhvdWdoPyBIZXJlIGl0J3MgbXVsdGktdmlmPwo+IEJlZm9yZSBJIHRo
aW5rIHdlIHdlcmUgdGFsa2luZyBhYm91dCByYWNlcz8KCkJlZm9yZSBtdWx0aS12aWYgaWYgaWVl
ZTgwMjExX2NzYV9maW5hbGl6ZSgpIGZhaWxlZCBhbmQgbGVmdApjc2FfYWN0aXZlPT10cnVlIGRy
aXZlciBjb3VsZCBlbmQgdXAgcG9raW5nIHRoZSBjc2FfZmluYWxpemVfd29yaygpCm92ZXIgYW5k
IG92ZXIgYWdhaW4gSSBndWVzcz8KCkZvciBtdWx0aS12aWYgY3NhIHVzaW5nIHJlc2VydmF0aW9u
IHRoZXJlIGFyZSAyIHJlYXNvbnM6CiBhKSBjaGFubmVsIHN3aXRjaGVzIGFjcm9zcyBpbnRlcmZh
Y2VzIG1heSBub3QgYmUgdGlnaHRseQpzeW5jaHJvbml6ZWQuIEkgZGlkIHRlc3RzIHdoZXJlIDIg
bG9uZyAoY3NfY291bnQ9MTAwKSBjaGFubmVsIHN3aXRjaGVzCndlcmUgYSBmZXcgc2Vjb25kcyBh
cGFydC4gSW4gdGhhdCBjYXNlIGRyaXZlciBwb2tlZCBjc2FfZmluYWxpemUgd29yawpxdWl0ZSBh
IGxvdCByZXN1bHRpbmcgaW4gYSBtZXNzLgogYikgbXkgY3VycmVudCBhcHByb2FjaCBoYXMgdGhl
IGZvbGxvd2luZyBmbG93OgoKMS4gcmVzZXJ2ZV9jaGFuY3R4KCkKMi4gKHNvbWUgdGltZSBsYXRl
cikgZHJpdmVyIGNhbGxzIGNzYV9maW5pc2gsIGFuZCBjc2FfZmluYWxpemUgY2FsbHMKdXNlX3Jl
c2VydmVkX2NoYW5jdHgoKSBiZWNhdXNlIHJlc2VydmVkX2NoYW5jdHggaXMgc2V0CjMuIChwb3Nz
aWJseSBzb21lIHRpbWUgbGF0ZXIsIGZvciBtdWx0aS12aWYgcmVzZXJ2YXRpb25zKSBjc2FfZmlu
YWxpemUKaXMgY2FsbGVkIGFnYWluIGJ1dCB0aGlzIHRpbWUgd2l0aG91dCByZXNlcnZlZF9jaGFu
Y3R4LCBzbyBpdCB2ZXJpZmllcwppZiBic3NfY29uZi5jaGFuZGVmIGlzIGNzYV9jaGFuZGVmIChh
ZnRlciBzdWNjZXNzZnVsIHJlc2VydmF0aW9uIGl0CnNob3VsZCBiZSkuCgpUaGlzIG1lYW5zIGlm
IGRyaXZlciB3b3VsZCBwb2tlIGNzYV9maW5hbGl6ZSgpIG1vcmUgdGhhbiBvbmNlIHRoZW4KdXNl
X3Jlc2VydmVkX2NoYW5jdHgoKSB3b3VsZCBiZSBjYWxsZWQgYWdhaW4gYW5kIGFnYWluIGFzIGEg
cmVzdWx0LgoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
