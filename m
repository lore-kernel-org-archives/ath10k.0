Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WmGt9-0006Qk-Kk
 for ath10k@lists.infradead.org; Mon, 19 May 2014 06:17:32 +0000
Received: by mail-wi0-f174.google.com with SMTP id r20so3529332wiv.1
 for <ath10k@lists.infradead.org>; Sun, 18 May 2014 23:17:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87fvkb89f5.fsf@kamboji.qca.qualcomm.com>
References: <1399638957-20449-1-git-send-email-michal.kazior@tieto.com>
 <1399638957-20449-5-git-send-email-michal.kazior@tieto.com>
 <87fvkb89f5.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 19 May 2014 08:17:04 +0200
Message-ID: <CA+BoTQkTiiSeiDfJku-jGmBFB_J2_+fqCCq0mvLLGpOkWKVGQQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] ath10k: wake up everything on core restart
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

T24gMTUgTWF5IDIwMTQgMTU6MjEsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5jb20+
IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0ZXM6
Cj4KPj4gSXQgbWFrZXMgc2Vuc2UgdG8gZmluaXNoIGNvbXBsZXRpb25zIGFzIHRoZXkgbWF5Cj4+
IGJlIHdhaXRlZCBmb3Igd2hpbGUgaG9sZGluZyBjb25mX211dGV4IHRodXMKPj4gZGVsYXlpbmcg
aHcgcmVzdGFydC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIEthemlvciA8bWljaGFsLmth
emlvckB0aWV0by5jb20+Cj4+IC0tLQo+PiAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEw
ay9jb3JlLmMgfCAxMiArKysrKysrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRp
b25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBr
L2NvcmUuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvY29yZS5jCj4+IGluZGV4
IDNmNGQyOGYuLmJmN2MzMjMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0
aC9hdGgxMGsvY29yZS5jCj4+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsv
Y29yZS5jCj4+IEBAIC03MDksNiArNzA5LDE4IEBAIHZvaWQgYXRoMTBrX2NvcmVfcmVzdGFydChz
dHJ1Y3QgYXRoMTBrICphcikKPj4gICAgICAgc3Bpbl9sb2NrX2JoKCZhci0+ZGF0YV9sb2NrKTsK
Pj4gICAgICAgYXItPndtaS5kcm9wID0gdHJ1ZTsKPj4gICAgICAgd2FrZV91cCgmYXItPndtaS50
eF9jcmVkaXRzX3dxKTsKPj4gKwo+PiArICAgICBjb21wbGV0ZSgmYXItPnRhcmdldF9zdXNwZW5k
KTsKPj4gKyAgICAgY29tcGxldGUoJmFyLT5kZWJ1Zy5ldmVudF9zdGF0c19jb21wbCk7Cj4KPiBX
ZSBkcm9wcGVkIHRoaXMgcGF0Y2hzZXQgYWxyZWFkeSwgYnV0IGZvciB0aGUgZnV0dXJlLCB0aGlz
IHBhdGNoCj4gaW50cm9kdWNlcyBhIG5ldyB3YXJuaW5nOgo+Cj4gICAgZHJpdmVycy9uZXQvd2ly
ZWxlc3MvYXRoL2F0aDEway9jb3JlLmM6IEluIGZ1bmN0aW9uICdhdGgxMGtfY29yZV9yZXN0YXJ0
JzoKPj4+IGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvY29yZS5jOjcxNDoxNDogZXJy
b3I6ICdzdHJ1Y3QgYXRoMTBrJwo+Pj4gaGFzIG5vIG1lbWJlciBuYW1lZCAnZGVidWcnCj4gICAg
ICBjb21wbGV0ZSgmYXItPmRlYnVnLmV2ZW50X3N0YXRzX2NvbXBsKTsKPiAgICAgICAgICAgICAg
ICAgIF4KCkdvb2QgY2F0Y2guIEkgY29tcGxldGVseSBmb3Jnb3QgYXItPmRlYnVnIGlzIGluc2lk
ZSBhbiAjaWZkZWYgREVCVUcuCgoKPiBNYXliZSB0aGF0IGNvbXBsZXRlIGNhbGwgc2hvdWxkIGJl
IGluIGRlYnVnLmM/CgpXZWxsLCBlaXRoZXIgd2UgYWRkIGFuIGlmZGVmIGhlcmUgKGNvcmUuYyBA
IEw3MTQpLCBvciBhbiBpZmRlZiBpbgpkZWJ1Zy5oICsgZGVidWcuYy4uCgoKTWljaGHFggoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxp
bmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
