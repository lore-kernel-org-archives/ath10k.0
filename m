Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x231.google.com ([2a00:1450:400c:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJe7h-000473-Da
 for ath10k@lists.infradead.org; Tue, 19 Aug 2014 07:46:29 +0000
Received: by mail-wg0-f49.google.com with SMTP id k14so5957328wgh.8
 for <ath10k@lists.infradead.org>; Tue, 19 Aug 2014 00:46:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87y4uuqhip.fsf@kamboji.qca.qualcomm.com>
References: <1406628239-31322-1-git-send-email-michal.kazior@tieto.com>
 <87y4uuqhip.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 19 Aug 2014 09:46:07 +0200
Message-ID: <CA+BoTQmTvcLDWeKnRXKnAVh27DGrvk+xgr_9DFmuZ3gA6yedYw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix wmi service bitmap debug
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTIgQXVndXN0IDIwMTQgMDk6NDQsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5j
b20+IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0
ZXM6Cj4KPj4gVGhlIDEwLnggYW5kIG1haW4gZmlybXdhcmUgYnJhbmNoZXMgaGF2ZQo+PiBjb25m
bGljdGluZyBXTUkgc2VydmljZSBiaXRtYXAgZGVmaW5pdGlvbnMuCj4+Cj4+IFRoaXMgYWxzbyBm
aXhlcyBXTUkgc2VydmljZXMgcGFyc2luZyBvbiBiaWctZW5kaWFuCj4+IGhvc3RzIGFuZCBjaGFu
Z2VzIGRlYnVnZnMgb3V0cHV0IHRvIGJlIG1vcmUgaHVtYW4KPj4gZnJpZW5kbHkuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPgo+Cj4g
VGhhbmtzLCBhcHBsaWVkLgoKWW91ciB0cmVlIGhhcyB3bWlfMTB4X3N2Y19tYXAoKSBhbmQgd21p
X21haW5fc3ZjX21hcCgpIHN3YXBwZWRbMV1bMl0uClRoaXMgcmVzdWx0cyBpbiBpbnZhbGlkIHdt
aSBzZXJ2aWNlIG1hcHBpbmdzLiBEaWQgeW91IGhhdmUgYSBjb25mbGljdApvbiB0aGlzIHBhdGNo
PwoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9rdmFsby9hdGgvY29tbWl0L2NmZjk5MGNlN2RkZDZh
NDNmODY3NTc4NjczOTlhOGE2NGFhMjlhZjkjZGlmZi1kNzQ4MzFmMzVkMzU5MDkyZmFkZjU3MGIz
ZDRlZmE5MFIyMTE3ClsyXSBodHRwczovL2dpdGh1Yi5jb20va3ZhbG8vYXRoL2NvbW1pdC9jZmY5
OTBjZTdkZGQ2YTQzZjg2NzU3ODY3Mzk5YThhNjRhYTI5YWY5I2RpZmYtZDc0ODMxZjM1ZDM1OTA5
MmZhZGY1NzBiM2Q0ZWZhOTBSMjE4NwoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hdGgxMGsK
