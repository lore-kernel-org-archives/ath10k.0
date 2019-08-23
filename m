Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i156E-0007Eg-Ky
 for ath10k@lists.infradead.org; Fri, 23 Aug 2019 08:39:11 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 001B94E93D
 for <ath10k@lists.infradead.org>; Fri, 23 Aug 2019 08:39:09 +0000 (UTC)
Received: by mail-ed1-f72.google.com with SMTP id f11so4890737edb.16
 for <ath10k@lists.infradead.org>; Fri, 23 Aug 2019 01:39:09 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: RE: [PATCH 4/7] ath10k: disable TX complete indication of htt for sdio
In-Reply-To: <250d064103394dfd864c1281f0da3d83@aptaiexm02f.ap.qualcomm.com>
References: <1566302108-18219-1-git-send-email-wgong@codeaurora.org>
 <1566302108-18219-5-git-send-email-wgong@codeaurora.org>
 <87blwkt480.fsf@toke.dk>
 <00992d0991704b0fae73a500bb2eb504@aptaiexm02f.ap.qualcomm.com>
 <8736husub0.fsf@toke.dk>
 <86d0eabcc63849efa914f2c14a3cd59f@aptaiexm02f.ap.qualcomm.com>
 <874l29pffy.fsf@toke.dk>
 <250d064103394dfd864c1281f0da3d83@aptaiexm02f.ap.qualcomm.com>
Date: Fri, 23 Aug 2019 10:39:07 +0200
Message-ID: <875zmonums.fsf@toke.dk>
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
YWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiA8dG9rZUBy
ZWRoYXQuY29tPgo+PiBTZW50OiBUaHVyc2RheSwgQXVndXN0IDIyLCAyMDE5IDg6MTIgUE0KPj4g
VG86IFdlbiBHb25nIDx3Z29uZ0BxdGkucXVhbGNvbW0uY29tPjsgV2VuIEdvbmcKPj4gPHdnb25n
QGNvZGVhdXJvcmEub3JnPjsgYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gQ2M6IGxpbnV4
LXdpcmVsZXNzQHZnZXIua2VybmVsLm9yZwo+PiBTdWJqZWN0OiBbRVhUXSBSRTogW1BBVENIIDQv
N10gYXRoMTBrOiBkaXNhYmxlIFRYIGNvbXBsZXRlIGluZGljYXRpb24gb2YgaHR0Cj4+IGZvciBz
ZGlvCj4+ID4+IFdoYXQncyBhIHR5cGljYWwgbGltaXQgaW4gdGhlIGZpcm13YXJlPwo+PiA+IEl0
IGlzIDk2IGRhdGEgcGFja2V0IGluIG15IHRlc3QuIEl0IGNhbiBjaGFuZ2VkIGluIGZpcm13YXJl
IGNvZGUuCj4+IAo+PiBSaWdodCwgSSBzZWUuIElzIHRoaXMgY291bnRlciBhdmFpbGFibGUgaW4g
YWxsIGF0aDEwayBmaXJtd2FyZSwgb3IgaXMgaXQKPj4gU0RJTyBvbmx5Pwo+PiAKPiBJdCBpcyBv
bmx5IGZvciBTRElPLgo+IEZvciBQQ0lFLCBpdCBkb2VzIG5vdCBoYXZlIGNyZWRpdCBsaW1pdCwg
ZmlybXdhcmUgbWVtb3J5IG9ubHkgbmVlZCB0byBzYXZlCj4gVGhlIHR4IGRlc2NyaXB0b3IsIG5v
dCBuZWVkIGZvciBwYWx5bG9hZC4KCk9LLCB0b28gYmFkLiBUaGFua3MgZm9yIHRoZSBleHBsYW5h
dGlvbnMgOikKCi1Ub2tlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
