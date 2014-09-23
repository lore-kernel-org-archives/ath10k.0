Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22a.google.com ([2a00:1450:400c:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWLx4-00044P-SD
 for ath10k@lists.infradead.org; Tue, 23 Sep 2014 09:00:03 +0000
Received: by mail-wg0-f42.google.com with SMTP id a1so3836069wgh.13
 for <ath10k@lists.infradead.org>; Tue, 23 Sep 2014 01:59:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1411426820-4047-1-git-send-email-greearb@candelatech.com>
References: <1411426820-4047-1-git-send-email-greearb@candelatech.com>
Date: Tue, 23 Sep 2014 10:59:40 +0200
Message-ID: <CA+BoTQn9sECMNZsxQpB4i3wHPxfVL+LXq9=2GBd-opH6+9TD=A@mail.gmail.com>
Subject: Re: [PATCH] ath10k: use configured nss instead of max nss.
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

T24gMjMgU2VwdGVtYmVyIDIwMTQgMDE6MDAsICA8Z3JlZWFyYkBjYW5kZWxhdGVjaC5jb20+IHdy
b3RlOgo+IEZyb206IEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRlY2guY29tPgo+Cj4gV2hl
biByZS1hc3NvY2lhdGluZyBhIHN0YXRpb24sIHRoZSBuc3Mgd2FzIHNldCBiYWNrIHRvCj4gbWF4
aW11bSB2YWx1ZSBldmVuIGlmIHVzZXIgaGFkIGNvbmZpZ3VyZWQgc21hbGwgbnVtYmVyCj4gb2Yg
dHggY2hhaW5zLiAgU28sIHBheSBhdHRlbnRpb24gdG8gdXNlcidzIGNvbmZpZyBpbgo+IHRoaXMg
Y2FzZSBhcyB3ZWxsLgo+Cj4gU2lnbmVkLW9mZi1ieTogQmVuIEdyZWVhciA8Z3JlZWFyYkBjYW5k
ZWxhdGVjaC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvbWFj
LmMgfCAxMSArKysrKysrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9h
dGgxMGsvbWFjLmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL21hYy5jCj4gaW5k
ZXggODU1YzcxYy4uYzVkMzFjYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC93aXJlbGVzcy9h
dGgvYXRoMTBrL21hYy5jCj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9t
YWMuYwo+IEBAIC00MDg2LDYgKzQwODYsMTAgQEAgYXRoMTBrX2RlZmF1bHRfYml0cmF0ZV9tYXNr
KHN0cnVjdCBhdGgxMGsgKmFyLAo+ICAgICAgICAgdTMyIGxlZ2FjeSA9IDB4MDBmZjsKPiAgICAg
ICAgIHU4IGh0ID0gMHhmZiwgaTsKPiAgICAgICAgIHUxNiB2aHQgPSAweDNmZjsKPiArICAgICAg
IHUxNiBucmYgPSBhci0+bnVtX3JmX2NoYWluczsKPiArCj4gKyAgICAgICBpZiAoYXItPmNmZ190
eF9jaGFpbm1hc2spCj4gKyAgICAgICAgICAgICAgIG5yZiA9IGdldF9uc3NfZnJvbV9jaGFpbm1h
c2soYXItPmNmZ190eF9jaGFpbm1hc2spOwoKT2gsIHNvIHlvdSBkbyB1cGRhdGUgdGhlIHBlZXIg
bnNzIHZhbHVlIGhlcmUuCgpJIHRoaW5rIGl0IG1pZ2h0IGJlIGEgZ29vZCBpZGVhIHRvIGNvbnZl
eSB0aGUgbGltaXRhdGlvbiBvZiB0eC9yeApjaGFpbm1hc2sgdG8gdGhlIHVzZXI6IHlvdSBjYW4n
dCBjaGFuZ2UgdGhlIHR4L3J4IGNoYWlubWFzayBvbiB0aGUgZmx5CmVhc2lseSAod2hpbGUgY29u
bmVjdGVkL2hhdmUgYXNzb2NpYXRlZCBzdGF0aW9ucykuIE9yIGRvIHlvdSBwbGFuIHRvCnNjaGVk
dWxlIHBlZXIgcmVhc3NvYyBpbiBfX2F0aDEwa19zZXRfYW50ZW5uYSgpIGluIGEgZm9sbG93IHVw
CnBhdGNoKGVzKSBsYXRlcj8KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRo
MTBrCg==
