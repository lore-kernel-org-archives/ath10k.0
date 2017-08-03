Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-01.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ddEQ4-00018U-RW
 for ath10k@lists.infradead.org; Thu, 03 Aug 2017 11:36:02 +0000
MIME-Version: 1.0
Subject: Re: ath10k: sdio: fix compile warning
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1499540921-18521-1-git-send-email-erik.stromdahl@gmail.com>
References: <1499540921-18521-1-git-send-email-erik.stromdahl@gmail.com>
Message-ID: <4a06a6fc064e43009a37fc7a4a1c52af@euamsexm01a.eu.qualcomm.com>
Date: Thu, 3 Aug 2017 13:35:27 +0200
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

RXJpayBTdHJvbWRhaGwgPGVyaWsuc3Ryb21kYWhsQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEFzIHN1
Z2dlc3RlZCBieSBBcm5kIEJlcmdtYW5uLCByZXBsYWNlCj4gIndoaWxlICh0aW1lX2JlZm9yZV8u
Li4pIHt9Igo+IHdpdGgKPiAiZG8ge30gd2hpbGUgKHRpbWVfYmVmb3JlXy4uLikiCj4gCj4gVGhp
cyBmaXhlcyB0aGUgZm9sbG93aW5nIHdhcm5pbmdzIGRldGVjdGVkIGJ5IGdjYyA0LjEuMjoKPiAK
PiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3NkaW8uYzogSW4gZnVuY3Rpb24KPiDi
gJhhdGgxMGtfc2Rpb19tYm94X3J4bXNnX3BlbmRpbmdfaGFuZGxlcuKAmToKPiBkcml2ZXJzL25l
dC93aXJlbGVzcy9hdGgvYXRoMTBrL3NkaW8uYzo2NzY6IHdhcm5pbmc6IOKAmHJldOKAmSBtYXkg
YmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoaXMgZnVuY3Rpb24KPiAKPiAuLi4KPiAKPiBkcml2
ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3NkaW8uYzogSW4gZnVuY3Rpb24KPiDigJhhdGgx
MGtfc2Rpb19pcnFfaGFuZGxlcuKAmToKPiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBr
L3NkaW8uYzoxMzMxOiB3YXJuaW5nOiDigJhyZXTigJkgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXpl
ZCBpbiB0aGlzIGZ1bmN0aW9uCj4gCj4gU2lnbmVkLW9mZi1ieTogRXJpayBTdHJvbWRhaGwgPGVy
aWsuc3Ryb21kYWhsQGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBLYWxsZSBWYWxvIDxrdmFs
b0BxY2EucXVhbGNvbW0uY29tPgoKUGF0Y2ggYXBwbGllZCB0byBhdGgtbmV4dCBicmFuY2ggb2Yg
YXRoLmdpdCwgdGhhbmtzLgoKNDMzZWYxYjIyNjc4IGF0aDEwazogc2RpbzogZml4IGNvbXBpbGUg
d2FybmluZwoKLS0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvOTgzMTQ5OS8K
Cmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRh
dGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
