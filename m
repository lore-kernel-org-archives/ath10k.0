Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ed1-f65.google.com ([209.85.208.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwsAw-0004VJ-Hl
 for ath10k@lists.infradead.org; Thu, 21 Feb 2019 17:30:24 +0000
Received: by mail-ed1-f65.google.com with SMTP id j89so14434841edb.9
 for <ath10k@lists.infradead.org>; Thu, 21 Feb 2019 09:30:22 -0800 (PST)
From: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: [PATCH] mac80211: Change default tx_sk_pacing_shift to 7
Date: Thu, 21 Feb 2019 18:29:36 +0100
Message-Id: <20190221172936.21816-1-toke@redhat.com>
In-Reply-To: <87d0nlhxl9.fsf@toke.dk>
References: <87d0nlhxl9.fsf@toke.dk>
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
To: linux-wireless@vger.kernel.org
Cc: Kan Yan <kyan@google.com>, wgong@qti.qualcomm.com, =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>, ath10k@lists.infradead.org, Grant Grundler <grundler@google.com>, wgong@codeaurora.org, Ben Greear <greearb@candelatech.com>, Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>

V2hlbiB3ZSBkaWQgdGhlIG9yaWdpbmFsIHRlc3RzIGZvciB0aGUgb3B0aW1hbCB2YWx1ZSBvZiBz
a19wYWNpbmdfc2hpZnQsIHdlCmNhbWUgdXAgd2l0aCA2IG1zIG9mIGJ1ZmZlcmluZyBhcyB0aGUg
ZGVmYXVsdC4gU2FkbHksIDYgaXMgbm90IGEgcG93ZXIgb2YKdHdvLCBzbyB3aGVuIHBpY2tpbmcg
dGhlIHNoaWZ0IHZhbHVlIEkgZXJyZWQgb24gdGhlIHNpemUgb2YgbGVzcyBidWZmZXJpbmcKYW5k
IHBpY2tlZCA0IG1zIGluc3RlYWQgb2YgOC4gVGhpcyB3YXMgcHJvYmFibHkgd3Jvbmc7IHRob3Nl
IDIgbXMgb2YgZXh0cmEKYnVmZmVyaW5nIG1ha2VzIGEgbGFyZ2VyIGRpZmZlcmVuY2UgdGhhbiBJ
IHRob3VnaHQuCgpTbywgY2hhbmdlIHRoZSBkZWZhdWx0IHBhY2luZyBzaGlmdCB0byA3LCB3aGlj
aCBjb3JyZXNwb25kcyB0byA4IG1zIG9mCmJ1ZmZlcmluZy4gVGhlIHBvaW50IG9mIGRpbWluaXNo
aW5nIHJldHVybnMgcmVhbGx5IGtpY2tzIGluIGFmdGVyIDggbXMsIGFuZApzbyBoYXZpbmcgdGhp
cyBhcyBhIGRlZmF1bHQgc2hvdWxkIGN1dCBkb3duIG9uIHRoZSBuZWVkIGZvciBleHRlbnNpdmUK
cGVyLWRldmljZSB0ZXN0aW5nIGFuZCBvdmVycmlkZXMgbmVlZGVkIGluIHRoZSBkcml2ZXJzLgoK
U2lnbmVkLW9mZi1ieTogVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHJlZGhhdC5jb20+
Ci0tLQogbmV0L21hYzgwMjExL21haW4uYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9uZXQvbWFjODAyMTEvbWFp
bi5jIGIvbmV0L21hYzgwMjExL21haW4uYwppbmRleCA1MDU1YWViYTVjNWEuLjgwMGU2NzYxNWUy
YSAxMDA2NDQKLS0tIGEvbmV0L21hYzgwMjExL21haW4uYworKysgYi9uZXQvbWFjODAyMTEvbWFp
bi5jCkBAIC02MTcsMTMgKzYxNywxMyBAQCBzdHJ1Y3QgaWVlZTgwMjExX2h3ICppZWVlODAyMTFf
YWxsb2NfaHdfbm0oc2l6ZV90IHByaXZfZGF0YV9sZW4sCiAJICogV2UgbmVlZCBhIGJpdCBvZiBk
YXRhIHF1ZXVlZCB0byBidWlsZCBhZ2dyZWdhdGVzIHByb3Blcmx5LCBzbwogCSAqIGluc3RydWN0
IHRoZSBUQ1Agc3RhY2sgdG8gYWxsb3cgbW9yZSB0aGFuIGEgc2luZ2xlIG1zIG9mIGRhdGEKIAkg
KiB0byBiZSBxdWV1ZWQgaW4gdGhlIHN0YWNrLiBUaGUgdmFsdWUgaXMgYSBiaXQtc2hpZnQgb2Yg
MQotCSAqIHNlY29uZCwgc28gOCBpcyB+NG1zIG9mIHF1ZXVlZCBkYXRhLiBPbmx5IGFmZmVjdHMg
bG9jYWwgVENQCisJICogc2Vjb25kLCBzbyA3IGlzIH44bXMgb2YgcXVldWVkIGRhdGEuIE9ubHkg
YWZmZWN0cyBsb2NhbCBUQ1AKIAkgKiBzb2NrZXRzLgogCSAqIFRoaXMgaXMgdGhlIGRlZmF1bHQs
IGFueWhvdyAtIGRyaXZlcnMgbWF5IG5lZWQgdG8gb3ZlcnJpZGUgaXQKIAkgKiBmb3IgbG9jYWwg
cmVhc29ucyAobG9uZ2VyIGJ1ZmZlcnMsIGxvbmdlciBjb21wbGV0aW9uIHRpbWUsIG9yCiAJICog
c2ltaWxhcikuCiAJICovCi0JbG9jYWwtPmh3LnR4X3NrX3BhY2luZ19zaGlmdCA9IDg7CisJbG9j
YWwtPmh3LnR4X3NrX3BhY2luZ19zaGlmdCA9IDc7CiAKIAkvKiBzZXQgdXAgc29tZSBkZWZhdWx0
cyAqLwogCWxvY2FsLT5ody5xdWV1ZXMgPSAxOwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgx
MGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2F0aDEwawo=
