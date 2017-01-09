Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([5.9.151.49] helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQXJy-000639-QY
 for ath10k@lists.infradead.org; Mon, 09 Jan 2017 10:37:01 +0000
Message-ID: <1483958190.17582.15.camel@sipsolutions.net>
Subject: Re: [PATCH 2/4] cfg80211: Add new NL80211_CMD_SET_BTCOEX_PRIORITY
 to support BTCOEX
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 09 Jan 2017 11:36:30 +0100
In-Reply-To: <6f9711ed6f6fe170b915b67a054b985b@codeaurora.org>
References: <1478610932-21954-1-git-send-email-c_traja@qti.qualcomm.com>
 <1478610932-21954-3-git-send-email-c_traja@qti.qualcomm.com>
 <1480949353.31788.27.camel@sipsolutions.net>
 <5e5e8971c96293a81e7cb37bcdfbd593@codeaurora.org>
 <1481645351.20412.34.camel@sipsolutions.net>
 <134cc8e58ecb804b6dda0137c4c37be8@codeaurora.org>
 <1481881024.27953.14.camel@sipsolutions.net>
 <ae82112880d55451342e7a6e5a47c33f@codeaurora.org>
 <1483354130.4596.5.camel@sipsolutions.net>
 <a5521b4e246de90ed8526891c84a97e5@codeaurora.org>
 <1483623500.4394.18.camel@sipsolutions.net>
 <6f9711ed6f6fe170b915b67a054b985b@codeaurora.org>
Mime-Version: 1.0
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
To: Tamizh chelvam <tamizhchelvam@codeaurora.org>
Cc: c_traja@qti.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Cj4gSXMgaXQgZmluZSB0byBoYXZlIHNvbWV0aGluZyBsaWtlIHRoaXMKPiAKPiAxKSBXZSBjYW4g
aGF2ZSB0aGlzIGJ0Y29leF9wcmlvcml0eSB2YWx1ZSBhcyBhIG9wdGlvbmFsIHZhbHVlIGluCj4g
YnRjb2V4wqBlbmFibGUgY29tbWFuZCBsaWtlIGJlbG93Cj4gCj4gaXcgcGh5WCBidGNvZXhfc3Rh
dGUgPGVuYWJsZXwgZGlzYWJsZT4gW3ByaXJvcml0eSh2ZW5kb3Igc3BjaWZpYwo+IHZhbHVlKV0K
PiAKPiAyKSBPciB3ZSBjYW4gaGF2ZSBzZXBlcmF0ZSBjb21tYW5kIGZvciBidGNvZXhfcHJpb3Jp
dHkgYXMgYmVsb3cKPiAKPiBpdyBwaHlYIHNldCBidGNvZXhfcHJpb3JpdHkgPHByaW9yaXR5ICh2
ZW5kb3Igc3BjaWZpYyB2YWx1ZSk+Cj4gCj4gSG9wZWZ1bGx5IHRoaXMgd2lsbCBnZXQgcmlkIG9m
ZiBhbGwgdGhlIG5sODAyMTEgYml0cy4KClRoYXQgbWFrZXMgbm8gc2Vuc2UuCgpJZiB0aGUgYml0
cyBhcmUgdmVuZG9yIHNwZWNpZmljLCB0aGVuIHRoZXJlJ3Mgbm8gdmFsdWUgaW4gaGF2aW5nIHRo
aXMKYXMgYW4gbmw4MDIxMSBjb21tYW5kIChyYXRoZXIgdGhhbiBhIHZlbmRvciBjb21tYW5kKSB0
byBzdGFydCB3aXRoLgoKWW91IG5lZWQgdG8gdW5kZXJzdGFuZCB0aGF0IEknbSBkaWZmZXJlbnRp
YXRpbmcgYmV0d2VlbiAqY2FwYWJpbGl0eSoKYml0cyBhbmQgYWN0dWFsICpwcmlvcml0eSBzZXR0
aW5nKiBiaXRzIC0gcGxlYXNlIHJlLXJlYWQgdGhlIHRocmVhZAp3aXRoIHRoYXQgaW4gbWluZC4K
CmpvaGFubmVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
