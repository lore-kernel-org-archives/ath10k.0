Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdh5c-0007GI-Sy
 for ath10k@lists.infradead.org; Tue, 14 Feb 2017 17:40:36 +0000
MIME-Version: 1.0
Subject: Re: [1/3] ath10k: remove ath10k_vif_to_arvif()
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1486030773-30600-1-git-send-email-amadeusz.slawinski@tieto.com>
References: <1486030773-30600-1-git-send-email-amadeusz.slawinski@tieto.com>
Message-ID: <dffab7ef3a364a49a28d876f577561db@eusanexr01a.eu.qualcomm.com>
Date: Tue, 14 Feb 2017 09:40:01 -0800
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
To: =?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeusz.slawinski@tieto.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

QW1hZGV1c3ogU8WCYXdpxYRza2kgd3JvdGU6Cj4gaXQgYWRkcyB1bm5lY2Vzc2FyeSBsZXZlbCBv
ZiBpbmRpcmVjdGlvbiwgd2hpbGUgd2UganVzdCBhY2Nlc3Mgc3RydWN0dXJlCj4gZmllbGQKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBbWFkZXVzeiBTxYJhd2nFhHNraSA8YW1hZGV1c3ouc2xhd2luc2tp
QHRpZXRvLmNvbT4KCjMgcGF0Y2hlcyBhcHBsaWVkIHRvIGF0aC1uZXh0IGJyYW5jaCBvZiBhdGgu
Z2l0LCB0aGFua3MuCgo1NmFjMTNiZmM3MDMgYXRoMTBrOiByZW1vdmUgYXRoMTBrX3ZpZl90b19h
cnZpZigpCjE4MmYxZTVhNjI2ZSBhdGgxMGs6IHVzZSBzaXplX3QgZm9yIGxlbiB2YXJpYWJsZXMK
NmQyMTkxMTM1NjM3IGF0aDEwazogZml4IGNvbW1lbnQKCi0tIApodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3BhdGNoLzk1NTE1NTkvCgpEb2N1bWVudGF0aW9uIGFib3V0IHN1Ym1pdHRpbmcg
d2lyZWxlc3MgcGF0Y2hlcyBhbmQgY2hlY2tpbmcgc3RhdHVzCmZyb20gcGF0Y2h3b3JrOgoKaHR0
cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9u
L3N1Ym1pdHRpbmdwYXRjaGVzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
