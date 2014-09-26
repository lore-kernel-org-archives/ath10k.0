Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x236.google.com ([2607:f8b0:400c:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XXTUH-0008R7-Tg
 for ath10k@lists.infradead.org; Fri, 26 Sep 2014 11:14:59 +0000
Received: by mail-vc0-f182.google.com with SMTP id le20so9381922vcb.27
 for <ath10k@lists.infradead.org>; Fri, 26 Sep 2014 04:14:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <871tqy63p9.fsf@kamboji.qca.qualcomm.com>
References: <1411641230-18785-1-git-send-email-michal.kazior@tieto.com>
 <871tqy63p9.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 26 Sep 2014 13:14:35 +0200
Message-ID: <CA+BoTQmJ-HprccxTO3UrX+NkhOMVt2i2X7p4k0b5bs6TVrKrpw@mail.gmail.com>
Subject: Re: [PATCH 0/4] ath10k: fix/cleanup fw stats
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

T24gMjYgU2VwdGVtYmVyIDIwMTQgMTM6MDYsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29t
bS5jb20+IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3
cml0ZXM6Cj4+IEhpLAo+Pgo+PiBUaGlzIGNsZWFucyB1cCBhbmQgZml4ZXMgZncgc3RhdHMgYWdn
cmVnYXRpb24uCj4+Cj4+Cj4+IE1pY2hhbCBLYXppb3IgKDQpOgo+PiAgIGF0aDEwazogc3BsaXQg
d21pIHN0YXRzIHBhcnNpbmcKPj4gICBhdGgxMGs6IHJlbmFtZSBmd19zdGF0cyByZWxhdGVkIHN0
dWZmCj4+ICAgYXRoMTBrOiByZXF1ZXN0IGZ3X3N0YXRzIG9uY2Ugb24gb3Blbgo+PiAgIGF0aDEw
azogZml4IGZ3IHN0YXRzIHByb2Nlc3NpbmcKPgo+IEkgZGlkbid0IHJldmlldyB0aGVzZSB5ZXQg
YnV0IEkgc2F3IG5ldyB3YXJuaW5nczoKPgo+IGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgx
MGsvZGVidWcuYzogSW4gZnVuY3Rpb24gJ2F0aDEwa19md19zdGF0c19maWxsJzoKPiBkcml2ZXJz
L25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2RlYnVnLmM6NTQwOjU6IHdhcm5pbmc6IGZvcm1hdCAn
JWx1JyBleHBlY3RzIGFyZ3VtZW50IG9mIHR5cGUgJ2xvbmcgdW5zaWduZWQgaW50JywgYnV0IGFy
Z3VtZW50IDUgaGFzIHR5cGUgJ3NpemVfdCcgWy1XZm9ybWF0XQoKT2gsIEkgZGlkbid0IHNlZSB0
aGlzIG9uZS4gSSBndWVzcyBpdCBzaG91bGQgYmUgJXp1LgoKCj4gZHJpdmVycy9uZXQvd2lyZWxl
c3MvYXRoL2F0aDEway93bWkuYzoxNTEzOiBXQVJOSU5HOiBlbHNlIGlzIG5vdCBnZW5lcmFsbHkg
dXNlZnVsIGFmdGVyIGEgYnJlYWsgb3IgcmV0dXJuCgpJJ20gYXdhcmUgb2YgdGhpcyBvbmUgYnV0
IHRoZSBjb2RlIGxvb2tzIG5pY2VyIHdpdGggdGhlIGBlbHNlYCB0byBtZSB0aG91Z2guCgoKTWlj
aGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRo
MTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
