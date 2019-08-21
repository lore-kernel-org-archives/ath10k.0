Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0NRS-0004lx-D5
 for ath10k@lists.infradead.org; Wed, 21 Aug 2019 10:02:11 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C6D2483F40
 for <ath10k@lists.infradead.org>; Wed, 21 Aug 2019 10:02:09 +0000 (UTC)
Received: by mail-ed1-f69.google.com with SMTP id z25so991468edm.3
 for <ath10k@lists.infradead.org>; Wed, 21 Aug 2019 03:02:09 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: RE: [PATCH 2/7] ath10k: change max RX bundle size from 8 to 32 for
 sdio
In-Reply-To: <59f668bda688419e9b6f44587d391135@aptaiexm02f.ap.qualcomm.com>
References: <1566302108-18219-1-git-send-email-wgong@codeaurora.org>
 <1566302108-18219-3-git-send-email-wgong@codeaurora.org>
 <87ef1gt49d.fsf@toke.dk>
 <59f668bda688419e9b6f44587d391135@aptaiexm02f.ap.qualcomm.com>
Date: Wed, 21 Aug 2019 12:02:07 +0200
Message-ID: <878srmsuow.fsf@toke.dk>
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
To: Wen Gong <wgong@qti.qualcomm.com>, Wen Gong <wgong@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

V2VuIEdvbmcgPHdnb25nQHF0aS5xdWFsY29tbS5jb20+IHdyaXRlczoKCj4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IGF0aDEwayA8YXRoMTBrLWJvdW5jZXNAbGlzdHMuaW5m
cmFkZWFkLm9yZz4gT24gQmVoYWxmIE9mIFRva2UKPj4gSMO4aWxhbmQtSsO4cmdlbnNlbgo+PiBT
ZW50OiBUdWVzZGF5LCBBdWd1c3QgMjAsIDIwMTkgODoyMyBQTQo+PiBUbzogV2VuIEdvbmcgPHdn
b25nQGNvZGVhdXJvcmEub3JnPjsgYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gQ2M6IGxp
bnV4LXdpcmVsZXNzQHZnZXIua2VybmVsLm9yZwo+PiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENI
IDIvN10gYXRoMTBrOiBjaGFuZ2UgbWF4IFJYIGJ1bmRsZSBzaXplIGZyb20gOCB0bwo+PiAzMiBm
b3Igc2Rpbwo+PiAKPj4gV2VuIEdvbmcgPHdnb25nQGNvZGVhdXJvcmEub3JnPiB3cml0ZXM6Cj4+
IAo+PiA+IFRoZSBtYXggYnVuZGxlIHNpemUgc3VwcG9ydCBieSBmaXJtd2FyZSBpcyAzMiwgY2hh
bmdlIGl0IGZyb20gOCB0byAzMgo+PiA+IHdpbGwgaGVscCBwZXJmb3JtYW5jZS4gVGhpcyByZXN1
bHRzIGluIHNpZ25pZmljYW50IHBlcmZvcm1hbmNlCj4+ID4gaW1wcm92ZW1lbnQgb24gUlggcGF0
aC4KPj4gCj4+IFdoYXQgaGFwcGVucyB3aGVuIHRoZSBoYXJkd2FyZSBkb2Vzbid0IGhhdmUgZW5v
dWdoIGRhdGEgdG8gZmlsbCBhCj4+IGJ1bmRsZT8gRG9lcyBpdCBzZW5kIGEgc21hbGxlciBvbmUs
IG9yIGRvZXMgaXQgd2FpdCB1bnRpbCBpdCBjYW4gZmlsbAo+PiBpdD8KPj4gCj4KPiBUaGUgYnVu
ZGxlIGlzIGZpbGxlZCBieSBmaXJtd2FyZS4gCj4gSXQgd2lsbCBub3Qgd2FpdCB1bnRpbCBpdCBj
YW4gZmlsbCBpdC4KPiBGb3IgZXhhbXBsZSwgaWYgeW91IGRvIHBpbmcgcGVyIHNlY29uZCwgaXQg
d2lsbCBoYXZlIG9ubHkgMSBwaW5nIHBhY2tldAo+IEluIHRoZSBidW5kbGUuCgpSaWdodCwgY29v
bC4KCi1Ub2tlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
