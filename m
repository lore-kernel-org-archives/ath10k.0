Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from s3.sipsolutions.net ([2a01:4f8:191:72ef::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eKnhs-00081C-1o
 for ath10k@lists.infradead.org; Fri, 01 Dec 2017 15:58:31 +0000
Message-ID: <1512143881.25588.18.camel@sipsolutions.net>
Subject: Re: [PATCH 2/2] ath10k: add per peer tx stats support for 10.2.4
From: Johannes Berg <johannes@sipsolutions.net>
Date: Fri, 01 Dec 2017 16:58:01 +0100
In-Reply-To: <87a7z230m3.fsf@toke.dk>
References: <1512046701-14435-1-git-send-email-akolli@qti.qualcomm.com>
 <1512046701-14435-3-git-send-email-akolli@qti.qualcomm.com>
 <87k1y7zqtj.fsf@kamboji.qca.qualcomm.com>
 <DAB5EBB8-C820-4056-8AAB-063D05F38BD5@toke.dk>
 <87bmjjzppd.fsf@kamboji.qca.qualcomm.com>
 <5080a68538fd2d883e15bacaa969661b@codeaurora.org> <87r2se36rq.fsf@toke.dk>
 <87k1y6y04i.fsf@kamboji.qca.qualcomm.com> <87d13y31r0.fsf@toke.dk>
 <1512143142.25588.17.camel@sipsolutions.net> <87a7z230m3.fsf@toke.dk>
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
To: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless-owner@vger.kernel.org" <linux-wireless-owner@vger.kernel.org>, Anilkumar Kolli <akolli@qti.qualcomm.com>, "akolli@codeaurora.org" <akolli@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gRnJpLCAyMDE3LTEyLTAxIGF0IDE2OjU0ICswMTAwLCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5z
ZW4gd3JvdGU6Cgo+IEkgZ3Vlc3MgdGhhdCBvbmNlIHdlIGhhdmUgYW4gYXN5bmNocm9ub3VzIHNj
aGVkdWxlciB0YXNrIG9mIHNvbWUga2luZCwKPiBzdXBwb3J0aW5nIHRoZSBjYWxsYmFjayBpcyBl
YXN5LCBidXQgcHVsbGluZyB0aGUgZGF0YSBvdXQgb2YgZWFjaCBwYWNrZXQKPiBuZWVkcyBtb3Jl
IHdvcmsuCgpSaWdodC4KCgo+IEJ1dCBzaW5jZSB3ZSdsbCBoYXZlIHRvIGRvIHRoYXQgZm9yIGF0
aDlrIGFueXdheSBpdAo+IGJlY29tZXMgbW9yZSBhIHF1ZXN0aW9uIG9mIHdoZXRoZXIgaXQncyBz
b21ldGhpbmcgdGhhdCBzaG91bGQgYmUKPiBzdXBwb3J0ZWQgaW4gbWFjODAyMTEgb3IgaWYgaXQg
c2hvdWxkIGJlIGltcGxlbWVudGVkIGluIGVhY2ggZHJpdmVyLgo+IEJ1dCBzaW5jZSB0aGF0IGxv
Z2ljIHdpbGwgaGF2ZSB0byBiZSB3cml0dGVuIGZyb20gc2NyYXRjaCBhbnl3YXksIGlzCj4gdGhl
cmUgYW55IHJlYXNvbiB0byBub3QganVzdCBkbyBpdCBpbiBtYWM4MDIxMSBmcm9tIHRoZSBiZWdp
bm5pbmc/CgpJIHdhcyB0aGlua2luZyBpbiB0aGUgZHJpdmVyIHNvIHRoYXQgdGhlcmUncyBubyBv
dmVyaGVhZCBmb3IgdGhlIG90aGVyCmRyaXZlcnMgdGhhdCBkb24ndCB3YW50IGl0IHRoYXQgd2F5
LgoKRHVubm8uIEl0IHByb2JhYmx5IGRvZXNuJ3QgcmVhbGx5IG1hdHRlci4KCmpvaGFubmVzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFp
bGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
