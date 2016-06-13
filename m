Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCKbm-0004fy-BV
 for ath10k@lists.infradead.org; Mon, 13 Jun 2016 05:40:23 +0000
Received: by mail-wm0-x22e.google.com with SMTP id v199so62015281wmv.0
 for <ath10k@lists.infradead.org>; Sun, 12 Jun 2016 22:39:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1465563164-783-1-git-send-email-me@bobcopeland.com>
References: <1465563164-783-1-git-send-email-me@bobcopeland.com>
From: Michal Kazior <michal.kazior@tieto.com>
Date: Mon, 13 Jun 2016 07:39:56 +0200
Message-ID: <CA+BoTQkg+uea_YzUgrVBPhA8uRxNpd29Kd1y1tvt0a-JyOSLQw@mail.gmail.com>
Subject: Re: [PATCH] ath10k: fix potential null dereference bugs
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
To: Bob Copeland <me@bobcopeland.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTAgSnVuZSAyMDE2IGF0IDE0OjUyLCBCb2IgQ29wZWxhbmQgPG1lQGJvYmNvcGVsYW5kLmNv
bT4gd3JvdGU6Cj4gU21hdGNoIHdhcm5zIGFib3V0IGEgbnVtYmVyIG9mIGNhc2VzIGluIGF0aDEw
ayB3aGVyZSBhIHBvaW50ZXIgaXMKPiBudWxsLWNoZWNrZWQgYWZ0ZXIgaXQgaGFzIGFscmVhZHkg
YmVlbiBkZXJlZmVyZW5jZWQsIGluIGNvZGUgaW52b2x2aW5nCj4gYXRoMTBrIHByaXZhdGUgdmly
dHVhbCBpbnRlcmZhY2UgcG9pbnRlcnMuCj4KPiBGaXggdGhlc2UgYnkgbWFraW5nIHRoZSBkZXJl
ZmVyZW5jZSBoYXBwZW4gbGF0ZXIuCj4KPiBBZGRyZXNzZXMgdGhlIGZvbGxvd2luZyBzbWF0Y2gg
d2FybmluZ3M6Cj4KPiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL21hYy5jOjM2NTEg
YXRoMTBrX21hY190eHFfaW5pdCgpIHdhcm46IHZhcmlhYmxlIGRlcmVmZXJlbmNlZCBiZWZvcmUg
Y2hlY2sgJ3R4cScgKHNlZSBsaW5lIDM2NDkpCj4gZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0
aDEway9tYWMuYzozNjY0IGF0aDEwa19tYWNfdHhxX3VucmVmKCkgd2FybjogdmFyaWFibGUgZGVy
ZWZlcmVuY2VkIGJlZm9yZSBjaGVjayAndHhxJyAoc2VlIGxpbmUgMzY1OSkKPiBkcml2ZXJzL25l
dC93aXJlbGVzcy9hdGgvYXRoMTBrL2h0dF90eC5jOjcwIF9fYXRoMTBrX2h0dF90eF90eHFfcmVj
YWxjKCkgd2FybjogdmFyaWFibGUgZGVyZWZlcmVuY2VkIGJlZm9yZSBjaGVjayAndHhxLT5zdGEn
IChzZWUgbGluZSA1MikKPiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2h0dF90eC5j
Ojc0MCBhdGgxMGtfaHR0X3R4X2dldF92ZGV2X2lkKCkgd2FybjogdmFyaWFibGUgZGVyZWZlcmVu
Y2VkIGJlZm9yZSBjaGVjayAnY2ItPnZpZicgKHNlZSBsaW5lIDczNikKPiBkcml2ZXJzL25ldC93
aXJlbGVzcy9hdGgvYXRoMTBrL3R4cnguYzo4NiBhdGgxMGtfdHhyeF90eF91bnJlZigpIHdhcm46
IHZhcmlhYmxlIGRlcmVmZXJlbmNlZCBiZWZvcmUgY2hlY2sgJ3R4cScgKHNlZSBsaW5lIDg0KQo+
IGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvd21pLmM6MTgzNyBhdGgxMGtfd21pX29w
X2dlbl9tZ210X3R4KCkgd2FybjogdmFyaWFibGUgZGVyZWZlcmVuY2VkIGJlZm9yZSBjaGVjayAn
Y2ItPnZpZicgKHNlZSBsaW5lIDE4MjUpCgpGV0lXIGFsbCBvZiB0aGVzZSBhcmUgZmFsc2UgcG9z
aXRpdmVzLiBJIHRoaW5rIHRoaXMgd2FzIGFscmVhZHkKcG9pbnRlZCBvdXQgc29tZSB0aW1lIGFn
by4gVGhlIGRydl9wcml2IHN0dWZmIGlzIG1lcmVseSBhbiBvZmZzZXQgKHNlZQpob3cgaWVlZTgw
MjExX3ZpZiBhbmQgaWVlZTgwMjExX3N0YSBhcmUgZGVmaW5lZCkgYW5kIHRoZSBhY2NvcmRpbmcK
c3RydWN0dXJlIGlzIGFsd2F5cyBjaGVja2VkIGJlZm9yZWhhbmQuCgoKTWljaGHFggoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcg
bGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
