Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYVCL-0001yZ-QU
 for ath10k@lists.infradead.org; Mon, 29 Sep 2014 07:16:42 +0000
Received: by mail-wi0-f172.google.com with SMTP id ex7so819703wid.11
 for <ath10k@lists.infradead.org>; Mon, 29 Sep 2014 00:16:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8761g94hm4.fsf@kamboji.qca.qualcomm.com>
References: <1411641230-18785-1-git-send-email-michal.kazior@tieto.com>
 <1411641230-18785-5-git-send-email-michal.kazior@tieto.com>
 <8761g94hm4.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 29 Sep 2014 09:16:14 +0200
Message-ID: <CA+BoTQmC7vec3OW8ZbCvkx761cMtUTT6f+UAVp7dMXj2hNRKUA@mail.gmail.com>
Subject: Re: [PATCH 4/4] ath10k: fix fw stats processing
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

T24gMjcgU2VwdGVtYmVyIDIwMTQgMTA6MDEsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29t
bS5jb20+IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3
cml0ZXM6Cj4KPj4gSWYgc3RhdCBkYXRhIGV4Y2VlZHMgd21pLWh0YyBidWZmZXIgbGltaXRzCj4+
IGZpcm13YXJlIHNwbGl0cyBpdCBpbnRvIG1hbnkgd21pIHN0YXRzIHVwZGF0ZQo+PiBldmVudHMg
d2hpY2ggYXJlIGRlbGl2ZXJlZCBpbiBhIHBpbmctcG9uZyBmYXNoaW9uCj4+IHRyaWdnZXJlZCBi
eSB3bWkgc3RhdHMgcmVxdWVzdCBjb21tYW5kLgo+Pgo+PiBTaW5jZSB0aGVyZSdzIG9ubHkgYW4g
aW1wbGljaXQgc3RhcnQtb2YtZGF0YSBhbmQKPj4gbm8gZW5kLW9mLWRhdGEgaW5kaWNhdGlvbnMg
dGhlIGRyaXZlciBoYXMgdG8KPj4gcGVyZm9ybSBzb21lIHRyaWNrZXJ5IHRvIGdldCBjb21wbGV0
ZSBzdGF0IGRhdGEuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5r
YXppb3JAdGlldG8uY29tPgo+Cj4gSSBmb2xkZWQgdGhlIHBhdGNoIGJlbG93IGluIGF0aC1uZXh0
LW5leHQuIFBsZWFzZSBjaGVjazoKPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9rdmFsby9hdGgvY29t
bWl0LzcwNzExMTJjNWRkYWZmNzYxY2Q3ZDliYjMxMTBjM2YzZDJmODNiYjgKWy4uLl0KCkkgdGhp
bmsgeW91IG1lYW50OgoKICBodHRwczovL2dpdGh1Yi5jb20va3ZhbG8vYXRoL2NvbW1pdC81MTIy
YTYwZjRmYmY1YTM4ZTcwYTE0NTc4ODU4YjM5MDU4ZWUzNjdhCgpJdCBsb29rcyBnb29kLiBUaGFu
a3MhCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
