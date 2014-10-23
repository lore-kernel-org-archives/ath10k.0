Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22a.google.com ([2a00:1450:400c:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XhDku-0008Oc-HJ
 for ath10k@lists.infradead.org; Thu, 23 Oct 2014 08:28:25 +0000
Received: by mail-wi0-f170.google.com with SMTP id n3so2679147wiv.5
 for <ath10k@lists.infradead.org>; Thu, 23 Oct 2014 01:27:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1413807282-27951-5-git-send-email-michal.kazior@tieto.com>
References: <1413807282-27951-1-git-send-email-michal.kazior@tieto.com>
 <1413807282-27951-5-git-send-email-michal.kazior@tieto.com>
Date: Thu, 23 Oct 2014 10:27:57 +0200
Message-ID: <CA+BoTQ=P2XOaOsaVOj+=fEs=nGfhUCNQvDYx6qb=A=JRCnbQmg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] ath10k: make warm reset a bit safer and faster
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>

T24gMjAgT2N0b2JlciAyMDE0IDE0OjE0LCBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRp
ZXRvLmNvbT4gd3JvdGU6Cj4gT25lIG9mIHRoZSBwcm9ibGVtcyB3aXRoIHdhcm0gcmVzZXQgSSd2
ZSBmb3VuZCBpcwo+IHRoYXQgaXQgbXVzdCBiZSBndWFyYW50ZWVkIHRoYXQgY29weSBlbmdpbmUK
PiByZWdpc3RlcnMgYXJlIG5vdCBiZWluZyBhY2Nlc3NlZCB3aGlsZSBiZWluZwo+IHJlc2V0LiBP
dGhlcndpc2UgaW4gd29yc3QgY2FzZSBzY2VuYXJpbyB0aGUgaG9zdAo+IG1heSBsb2NrIHVwLgo+
Cj4gSW5zdGVhZCBvZiB1c2luZyBzbGVlcHMgYW5kIGhvcGluZyB0aGUgZGV2aWNlIGlzCj4gb3Bl
cmF0aW9uYWwgaW4gc29tZSBhcmJpdHJhcnkgdGltZWZyYW1lcyB1c2UKPiBmaXJtd2FyZSBpbmRp
Y2F0aW9uIHJlZ2lzdGVyLgo+Cj4gQXMgYSBzaWRlIGVmZmVjdCB0aGlzIG1ha2VzIGRyaXZlcgo+
IGJvb3Qvc3RvcC9yZWNvdmVyeSBmYXN0ZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgS2F6
aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4KPiAtLS0KPgo+IE5vdGVzOgo+ICAgICB2MjoK
PiAgICAgICogZml4IGtlcm5lbCBwYW5pYyBvbiBlYXJseSBmdyBjcmFzaCBkdWUgdG8gQ0Ugbm90
IGJlaW5nIGZ1bGx5IGluaXRpYWxpemVkIFtKYW51c3pdCgpNYXJlayByZXBvcnRlZCBoZSBzZWVz
IGEgbWVtb3J5IGxlYWsgYW5kIGdpdCBiaXNlY3QgYmxhbWVzIHRoaXMgcGF0Y2guClBsZWFzZSBk
b24ndCBhcHBseSB0aGlzIHBhdGNoIHlldC4KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vYXRoMTBrCg==
