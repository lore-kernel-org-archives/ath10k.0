Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x234.google.com ([2a00:1450:400c:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wonmg-0002Ti-Te
 for ath10k@lists.infradead.org; Mon, 26 May 2014 05:49:19 +0000
Received: by mail-wg0-f52.google.com with SMTP id l18so7346930wgh.11
 for <ath10k@lists.infradead.org>; Sun, 25 May 2014 22:48:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1400850209.4358.31.camel@jlt4.sipsolutions.net>
References: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
 <1400143324-14911-1-git-send-email-michal.kazior@tieto.com>
 <1400143324-14911-4-git-send-email-michal.kazior@tieto.com>
 <87oayovr1m.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmJTsh3Kcwmqx19WAzoBhYrhkQaPT_S=JFVPptkVaaKyw@mail.gmail.com>
 <87bnuovq6x.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQn_V5zGA18qGMNrWYy_-fBQzBi1=EmzMs=0SLvk1LBVJQ@mail.gmail.com>
 <1400850209.4358.31.camel@jlt4.sipsolutions.net>
Date: Mon, 26 May 2014 07:48:56 +0200
Message-ID: <CA+BoTQmmYJ8Mjv1=w=ZijFzZ-FB+PyEV5SKtzvVW7A8_kirueg@mail.gmail.com>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Kalle Valo <kvalo@qca.qualcomm.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMjMgTWF5IDIwMTQgMTU6MDMsIEpvaGFubmVzIEJlcmcgPGpvaGFubmVzQHNpcHNvbHV0aW9u
cy5uZXQ+IHdyb3RlOgo+IE9uIEZyaSwgMjAxNC0wNS0yMyBhdCAxMTowNiArMDIwMCwgTWljaGFs
IEthemlvciB3cm90ZToKPgo+PiBUaGVyZSdzIG5vdGhpbmcgd3Jvbmcgd2l0aCBvdGhlciB0aHJl
YWQgaG9sZGluZyBpdC4gQWN0dWFsbHkgdGhhdCdzCj4+IHRoZSByZWFzb24gZm9yIHRoaXMgdmVy
eSBjaGVjay4KPj4KPj4gVGhlIHBvaW50IGlzIHRvIHByZXZlbnQgYXRoMTBrX2RyYWluX3R4KCkg
YmVpbmcgY2FsbGVkIHdoaWxlIGNhbGxlcgo+PiAoY3VycmVudCB0aHJlYWQpIGhvbGRzIGNvbmZf
bXV0ZXguIElmIGl0IHdlcmUgdG8gaG9sZCBjb25mX211dGV4IHRoZW4KPj4gY2FuY2VsX3dvcmtf
c3luYygpIGNhbiBkZWFkbG9jayBhcyBib3RoIHdvcmtlcnMgaXQgdHJpZXMgdG8gc3RvcCB0cnkK
Pj4gdG8gZ2V0IGEgaG9sZCBvZiB0aGUgbG9jayB0b28uCj4KPiBUaGF0IHNlZW1zIHBvaW50bGVz
cyAtIGxvY2tkZXAgd291bGQgd2FybiB5b3UgYWJvdXQgdGhhdCAqYW55d2F5Kgo+IGJlY2F1c2Ug
Y2FuY2VsX3dvcmtfc3luYygpIGFuZCBmcmllbmRzIGhhdmUgcHJvcGVyIGFubm90YXRpb25zLiBU
cnkgaXQKPiBzb21ldGltZSA6KQoKRG9lcyBpdCBzcGxhdCBldmVyeSB0aW1lIG9yIGp1c3QgYnkg
Y2hhbmNlIG9yIGFmdGVyIGEgZGVhZGxvY2s/CgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2F0aDEwawo=
