Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghj5m-0002dq-NU
 for ath10k@lists.infradead.org; Thu, 10 Jan 2019 22:46:28 +0000
MIME-Version: 1.0
Date: Thu, 10 Jan 2019 14:46:24 -0800
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH v5 5/6] ath10k: migrate to mac80211 txq scheduling
In-Reply-To: <87o99hvecq.fsf@kamboji.qca.qualcomm.com>
References: <1545181331-5288-1-git-send-email-rmanohar@codeaurora.org>
 <1545181331-5288-6-git-send-email-rmanohar@codeaurora.org>
 <87o99hvecq.fsf@kamboji.qca.qualcomm.com>
Message-ID: <7365e300cf7f73e6c4a0774d6a4b7806@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: make-wifi-fast@lists.bufferbloat.net, =?UTF-8?Q?Toke_H=C3=B8iland-J?= =?UTF-8?Q?=C3=B8rgensen?= <toke@toke.dk>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

T24gMjAxOC0xMi0xOSAwNToyNCwgS2FsbGUgVmFsbyB3cm90ZToKPiBSYWprdW1hciBNYW5vaGFy
YW4gPHJtYW5vaGFyQGNvZGVhdXJvcmEub3JnPiB3cml0ZXM6Cj4gCj4+IEZyb206IFRva2UgSMO4
aWxhbmQtSsO4cmdlbnNlbiA8dG9rZUB0b2tlLmRrPgo+PiAKPj4gYXRoMTBrIG1haW50YWlucyBj
b21tb24gdHhxcyBsaXN0IGZvciBhbGwgc3RhdGlvbnMuIFRoaXMgdHhxCj4+IG1hbmFnZW1lbnQg
Y2FuIGJlIHJlbW92ZWQgYnkgbWlncmF0aW5nIHRvIG1hYzgwMjExIHR4cSBBUElzCj4+IGFuZCBs
ZXQgbWFjODAyMTEgaGFuZGxlIHR4cXMgcmVvcmRlcmluZyBiYXNlZCBvbiByZXBvcnRlZCBhaXJ0
aW1lLgo+PiBCeSBkb2luZyB0aGlzLCB0eHEgZmFpcm5lc3MgbWFpbnRhaW5lZCBpbiBhdGgxMGsg
aS5lIHByb2Nlc3NpbmcKPj4gTiBmcmFtZXMgcGVyIHR4cSBpcyByZW1vdmVkLiBCeSBhZGFwdGlu
ZyB0byBtYWM4MDIxMSBBUElzLAo+PiBhdGgxMGsgd2lsbCBzdXBwb3J0IG1hYzgwMjExIGJhc2Vk
IGFpcnRpbWUgZmFpcm5lc3MgYWxnb3JpdGhtLgo+PiAKPj4gVGVzdGVkLWJ5OiBWZW5rYXRlc3dh
cmEgTmFyYWxhc2V0dHkgPHZuYXJhbGFzQGNvZGVhdXJvcmEub3JnPgo+PiBDby1kZXZlbG9wZWQt
Ynk6IFJhamt1bWFyIE1hbm9oYXJhbiA8cm1hbm9oYXJAY29kZWF1cm9yYS5vcmc+Cj4+IFNpZ25l
ZC1vZmYtYnk6IFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiA8dG9rZUB0b2tlLmRrPgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBSYWprdW1hciBNYW5vaGFyYW4gPHJtYW5vaGFyQGNvZGVhdXJvcmEub3JnPgo+
IAo+IFBsZWFzZSBhbHdheXMgYWRkIGhhcmR3YXJlIGFuZCBmaXJtd2FyZSB2ZXJzaW9ucyB1c2Vk
IGZvciB0ZXN0aW5nLiBCdXQgCj4gSQo+IGNhbiBhZGQgdGhhdCwgc28gbm8gbmVlZCB0byByZXNl
bmQgYmVjYXVzZSBvZiB0aGlzLiBKdXN0IGxldCBtZSBrbm93Cj4gd2hhdCB0byBhZGQuCj4gClRo
YW5rcyBLYWxsZS4gUGxlYXNlIGFtZW5kIHRoZSBjb21taXQgbG9nIHdpdGgKClRlc3RlZCBvbiBR
Q0E0MDE5IHdpdGggZmlybXdhcmUgdmVyc2lvbiAxMC40LTMuMi4xLjEtMDAwMTUKVGVzdGVkIG9u
IFFDQTk5ODQgd2l0aCBmaXJtd2FyZSB2ZXJzaW9uIDEwLjQtMy45LjAuMS0wMDAwNQoKLVJhamt1
bWFyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgx
MGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
