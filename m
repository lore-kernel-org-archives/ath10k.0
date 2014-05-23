Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x231.google.com ([2a00:1450:400c:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnmrK-0005yW-Vh
 for ath10k@lists.infradead.org; Fri, 23 May 2014 10:37:55 +0000
Received: by mail-wg0-f49.google.com with SMTP id m15so4681283wgh.32
 for <ath10k@lists.infradead.org>; Fri, 23 May 2014 03:37:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <877g5cvlay.fsf@kamboji.qca.qualcomm.com>
References: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
 <1400143324-14911-1-git-send-email-michal.kazior@tieto.com>
 <1400143324-14911-4-git-send-email-michal.kazior@tieto.com>
 <87oayovr1m.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmJTsh3Kcwmqx19WAzoBhYrhkQaPT_S=JFVPptkVaaKyw@mail.gmail.com>
 <87bnuovq6x.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQn_V5zGA18qGMNrWYy_-fBQzBi1=EmzMs=0SLvk1LBVJQ@mail.gmail.com>
 <877g5cvlay.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 23 May 2014 12:37:32 +0200
Message-ID: <CA+BoTQntX+hAXfR-BOxeKn_qjF6A17RT--Ohg89JhkrUOarsxA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] ath10k: drain tx before restarting hw
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

T24gMjMgTWF5IDIwMTQgMTI6MzEsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5jb20+
IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0ZXM6
Cj4KPj4+IFN1cmUsIGJ1dCBJIHN0aWxsIHRoaW5rIGl0J3MgYSBiaXQgdWdseS4gVGhlIHJpZ2h0
IHdheSB0byBmaXggdGhpcyB3b3VsZAo+Pj4gYmUgdG8gYWRkIGl0IHRvIGluY2x1ZGUvbG9ja2Rl
cC5oLCBpbnN0ZWFkIG9mIGFkZGluZyBjdXN0b20gY2hlY2tzIHRvIGEKPj4+IGRyaXZlci4KPj4K
Pj4gR29vZCBwb2ludC4gSSB3b25kZXIgaWYgaXQncyBnZW5lcmljIGVub3VnaCB0byBqdXN0aWZ5
Lgo+Cj4gTm8gaWRlYS4gQnV0IG5vIG1hdHRlciB3aGF0IGl0IHdpbGwgdGFrZSBzb21lIHRpbWUg
dG8gZ2V0IGl0IGFjY2VwdGVkLAo+IHNvIHdlIG5lZWQgdG8gc29sdmUgdGhpcyBpbiBhIGZhc3Rl
ciB3YXkgc28gdGhhdCBJIGNhbiBhcHBseSB0aGlzIHBhdGNoLgo+Cj4+PiBCdXQgZG9lcyB0aGlz
IGNoZWNrIGV2ZW4gbWFrZSBzZW5zZT8gVGhlcmUncyBub3RoaW5nIHByZXZlbnRpbmcKPj4+IHRv
IGFub3RoZXIgdGhyZWFkIHRvIHRha2UgbG9jayBqdXN0IGFmdGVyIHRoZSBXQVJOX09OKCksIHJp
Z2h0Pwo+Pgo+PiBUaGVyZSdzIG5vdGhpbmcgd3Jvbmcgd2l0aCBvdGhlciB0aHJlYWQgaG9sZGlu
ZyBpdC4gQWN0dWFsbHkgdGhhdCdzCj4+IHRoZSByZWFzb24gZm9yIHRoaXMgdmVyeSBjaGVjay4K
Pj4KPj4gVGhlIHBvaW50IGlzIHRvIHByZXZlbnQgYXRoMTBrX2RyYWluX3R4KCkgYmVpbmcgY2Fs
bGVkIHdoaWxlIGNhbGxlcgo+PiAoY3VycmVudCB0aHJlYWQpIGhvbGRzIGNvbmZfbXV0ZXguIElm
IGl0IHdlcmUgdG8gaG9sZCBjb25mX211dGV4IHRoZW4KPj4gY2FuY2VsX3dvcmtfc3luYygpIGNh
biBkZWFkbG9jayBhcyBib3RoIHdvcmtlcnMgaXQgdHJpZXMgdG8gc3RvcCB0cnkKPj4gdG8gZ2V0
IGEgaG9sZCBvZiB0aGUgbG9jayB0b28uCj4KPiBBaCwgbm93IEkgdW5kZXJzdGFuZC4KPgo+IFdo
YXQgaWYgd2UganVzdCBkcm9wIHRoZSBXQVJOX09OKCkgZnJvbSB0aGlzIHBhdGNoIGp1c3Qgc28g
dGhhdCBJIGNhbgo+IGFwcGx5IHRoZSBwYXRjaCBhbmQgd2UgYWRkIGEgcHJvcGVyIGNvZGUgZm9y
IGNoZWNraW5nIHRoZSBtdXRleCBpbiBhCj4gZm9sbG93dXAgcGF0Y2g/IEFyZSB5b3Ugb2sgd2l0
aCB0aGF0PwoKSSdtIG9rYXkgd2l0aCB0aGlzIGFzIGxvbmcgYXMgd2UgYXQgbGVhc3QgaGF2ZSBh
IGNvbW1lbnQgc3RhdGluZyB0aGF0CmNvbmZfbXV0ZXggbXVzdCBub3QgYmUgaGVsZCB3aGlsZSBj
YWxsaW5nIHRoZSBmdW5jdGlvbiB0byBhdm9pZApkZWFkbG9ja3MuCgoKTWljaGHFggoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcg
bGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
