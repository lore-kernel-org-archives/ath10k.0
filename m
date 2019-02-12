Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtd3w-0005RX-60
 for ath10k@lists.infradead.org; Tue, 12 Feb 2019 18:45:46 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v6 2/4] ath9k: Switch to mac80211 TXQ scheduling and
 airtime APIs
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20190122142019.21417-3-toke@redhat.com>
References: <20190122142019.21417-3-toke@redhat.com>
Message-Id: <20190212184543.E02E66087F@smtp.codeaurora.org>
Date: Tue, 12 Feb 2019 18:45:43 +0000 (UTC)
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
To: =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc: make-wifi-fast@lists.bufferbloat.net, =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Rajkumar Manoharan <rmanohar@codeaurora.org>

VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdyb3RlOgoKPiBUaGlzIG1vdmVzIHRoZSBhdGg5ayBk
cml2ZXIgdG8gdXNlIHRoZSBtYWM4MDIxMSBUWFEgc2NoZWR1bGluZyBhbmQKPiBhaXJ0aW1lIGFj
Y291bnRpbmcgQVBJcywgcmVtb3ZpbmcgdGhlIGNvcnJlc3BvbmRpbmcgc3RhdGUgdHJhY2tpbmcK
PiBpbnNpZGUgdGhlIGRyaXZlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUb2tlIEjDuGlsYW5kLUrD
uHJnZW5zZW4gPHRva2VAdG9rZS5kaz4KPiBbcm1hbm9oYXJAY29kZWF1cm9yYS5vcmc6IGZpeGVk
IGNoZWNrcGF0Y2ggZXJyb3IgYW5kIHdhcm5pbmdzXQo+IFNpZ25lZC1vZmYtYnk6IFJhamt1bWFy
IE1hbm9oYXJhbiA8cm1hbm9oYXJAY29kZWF1cm9yYS5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogS2Fs
bGUgVmFsbyA8a3ZhbG9AY29kZWF1cm9yYS5vcmc+CgozIHBhdGNoZXMgYXBwbGllZCB0byBhdGgt
bmV4dCBicmFuY2ggb2YgYXRoLmdpdCwgdGhhbmtzLgoKODljZWE3NDkzYTM0IGF0aDlrOiBTd2l0
Y2ggdG8gbWFjODAyMTEgVFhRIHNjaGVkdWxpbmcgYW5kIGFpcnRpbWUgQVBJcwpiYjJlZGI3MzM1
ODYgYXRoMTBrOiBtaWdyYXRlIHRvIG1hYzgwMjExIHR4cSBzY2hlZHVsaW5nCmQxY2UzN2I3ODMx
YSBhdGgxMGs6IHJlcG9ydCBlc3RpbWF0ZWQgZnJhbWUgdHJhbnNtaXQgYWlydGltZSB0byBpbXBy
b3ZlIGZhaXJuZXNzCgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC8xMDc3
NTU0OS8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9j
dW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
dGgxMGsK
