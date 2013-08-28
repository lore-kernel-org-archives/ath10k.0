Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x231.google.com ([2a00:1450:4008:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEYNY-0007hb-Lm
 for ath10k@lists.infradead.org; Wed, 28 Aug 2013 05:33:18 +0000
Received: by mail-bk0-f49.google.com with SMTP id r7so1922652bkg.8
 for <ath10k@lists.infradead.org>; Tue, 27 Aug 2013 22:32:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87y57mjvwu.fsf@kamboji.qca.qualcomm.com>
References: <1377068249-26025-1-git-send-email-michal.kazior@tieto.com>
 <1377601683-12072-1-git-send-email-michal.kazior@tieto.com>
 <1377601683-12072-2-git-send-email-michal.kazior@tieto.com>
 <87y57mjvwu.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 28 Aug 2013 07:32:50 +0200
Message-ID: <CA+BoTQ=mBeWQLvaLUL4gnTENRbGUK_fTkj9bP3HP-OSzBwG0Dg@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] ath10k: use inline ce_state structure
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

T24gMjggQXVndXN0IDIwMTMgMDY6MTIsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5j
b20+IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0
ZXM6Cj4KPj4gU2ltcGxpZmllcyBtZW1vcnkgbWFuYWdhbWVudCBvZiBjZV9zdGF0ZS4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+Cj4K
PiBTb3JyeSwgSSBub3RpY2VkIHRoaXMgb25seSBpbiBteSBzZWNvbmQgcmV2aWV3IHJvdW5kOgo+
Cj4+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvcGNpLmgKPj4gKysrIGIv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9wY2kuaAo+PiBAQCAtMjMzLDcgKzIzMywx
MCBAQCBzdHJ1Y3QgYXRoMTBrX3BjaSB7Cj4+ICAgICAgIHNwaW5sb2NrX3QgY2VfbG9jazsKPj4K
Pj4gICAgICAgLyogTWFwIENFIGlkIHRvIGNlX3N0YXRlICovCj4+IC0gICAgIHN0cnVjdCBjZV9z
dGF0ZSAqY2VfaWRfdG9fc3RhdGVbQ0VfQ09VTlRfTUFYXTsKPj4gKyAgICAgc3RydWN0IGNlX3N0
YXRlIGNlX3N0YXRlc1tDRV9DT1VOVF9NQVhdOwo+PiArCj4+ICsgICAgIC8qIG1ha2VzIHN1cmUg
dGhhdCBkdW1teSByZWFkcyBhcmUgYXRvbWljICovCj4+ICsgICAgIHNwaW5sb2NrX3QgaHdfdjFf
d29ya2Fyb3VuZF9sb2NrOwo+PiAgfTsKPgo+IFRoYXQgbG9jayBkb2Vzbid0IGxvb2sgcmlnaHQu
IElzIGl0IGEgbGVmdG92ZXIgZnJvbSBhIHJlYmFzZT8KCk9oLCBnb29kIGNhdGNoLiBJIHdvbmRl
ciBob3cgaXQgZ290IHRoZXJlLi4KCgpNaWNoYcWCLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2F0aDEwawo=
