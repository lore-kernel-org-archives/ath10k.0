Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x236.google.com ([2a00:1450:4010:c04::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZS1Xu-0003BB-0p
 for ath10k@lists.infradead.org; Wed, 19 Aug 2015 11:28:42 +0000
Received: by lbbtg9 with SMTP id tg9so1073193lbb.1
 for <ath10k@lists.infradead.org>; Wed, 19 Aug 2015 04:28:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87614ba5du.fsf@kamboji.qca.qualcomm.com>
References: <1439982533-26824-1-git-send-email-michal.kazior@tieto.com>
 <87614ba5du.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 19 Aug 2015 13:28:19 +0200
Message-ID: <CA+BoTQ=GhE4zg-7_VXs8RAHzE-he8iP5kvfmci=5b1snJd+hXQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: add missing mutex unlock on failpath
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

T24gMTkgQXVndXN0IDIwMTUgYXQgMTM6MjMsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29t
bS5jb20+IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3
cml0ZXM6Cj4KPj4gS2VybmVsIHdvdWxkIGNvbXBsYWluIGFib3V0IGxlYXZpbmcgYSBoZWxkIGxv
Y2sKPj4gYWZ0ZXIgZ29pbmcgYmFjayB0byB1c2Vyc3BhY2UgYW5kIHdvdWxkCj4+IHN1YnNlcXVl
bnRseSBkZWFkbG9jay4KPj4KPj4gRml4ZXM6IGUwNGNhZmJjMzhjNyAoImF0aDEwazogZml4IHBl
ZXIgbGltaXQgZW5mb3JjZW1lbnQiKQo+PiBSZXBvcnRlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFu
LmNhcnBlbnRlckBvcmFjbGUuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgS2F6aW9yIDxt
aWNoYWwua2F6aW9yQHRpZXRvLmNvbT4KPgo+IGNvbW1pdCBlMDRjYWZiYzM4YzcgaXMgY3VycmVu
dGx5IGdvaW5nIHRvIDQuMy1yYzEgKGl0J3MgaW4KPiB3aXJlbGVzcy1kcml2ZXJzLW5leHQgY3Vy
cmVudGx5KS4gSSB0aGluayB3ZSBzaG91bGQgc2VuZCB0aGlzIHRvIDQuMyBhcwo+IHdlbGwsIHJp
Z2h0PwoKSXQgZG9lcyBtYWtlIHNlbnNlIHRvIGRvIHNvLCB5ZXMuCgoKTWljaGHFggoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcg
bGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
