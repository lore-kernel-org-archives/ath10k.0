Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMYOg-0002au-Ml
 for ath10k@lists.infradead.org; Wed, 27 Aug 2014 08:16:03 +0000
Received: by mail-wi0-f178.google.com with SMTP id hi2so5327196wib.17
 for <ath10k@lists.infradead.org>; Wed, 27 Aug 2014 01:15:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <878umaxujj.fsf@kamboji.qca.qualcomm.com>
References: <1408961963-3682-1-git-send-email-michal.kazior@tieto.com>
 <1408961963-3682-4-git-send-email-michal.kazior@tieto.com>
 <878umaxujj.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 27 Aug 2014 10:15:40 +0200
Message-ID: <CA+BoTQnM+CVnaFLAfGr=0QdRCCgSGUcGEGeDijh6nS6tYO5DyA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ath10k: make target endianess more explicit
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

T24gMjcgQXVndXN0IDIwMTQgMDk6MjYsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5j
b20+IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0
ZXM6Cj4KPj4gU29tZSBjb3B5IGVuZ2luZSBzdHJ1Y3R1cmVzIGFyZSB0YXJnZXQgc3BlY2lmaWMK
Pj4gYW5kIGFyZSB1cGxvYWRlZCB0byB0aGUgZGV2aWNlIGR1cmluZwo+PiBpbml0L2NvbmZpZ3Vy
YXRpb24uCj4+Cj4+IFRoaXMgYWxzbyBjbGVhbnMgdXAgYSBiaXQgZGlhZ19tZW1fcmVhZC93cml0
ZQo+PiBpbXBsaWNpdCBieXRlc3dhcCBtZXNzIGxlYXZpbmcgb25seQo+PiBkaWFnX2FjY2Vzc19y
ZWFkL3dyaXRlIHdpdGggYW4gaW1wbGljaXQgZW5kaWFuZXNzCj4+IGJ5dGVzd2FwLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4KPgo+
IFsuLi5dCj4KPj4gIHN0YXRpYyBpbnQgYXRoMTBrX3BjaV9kaWFnX3JlYWQzMihzdHJ1Y3QgYXRo
MTBrICphciwgdTMyIGFkZHJlc3MsIHUzMiAqdmFsdWUpCj4+ICB7Cj4+IC0gICAgIHJldHVybiBh
dGgxMGtfcGNpX2RpYWdfcmVhZF9tZW0oYXIsIGFkZHJlc3MsIHZhbHVlLCBzaXplb2YodTMyKSk7
Cj4+ICsgICAgIF9fbGUzMiB2YWwgPSAwOwo+PiArICAgICBpbnQgcmV0Owo+PiArCj4+ICsgICAg
IHJldCA9IGF0aDEwa19wY2lfZGlhZ19yZWFkX21lbShhciwgYWRkcmVzcywgJnZhbCwgc2l6ZW9m
KF9fbGUzMikpOwo+PiArICAgICAqdmFsdWUgPSBfX2xlMzJfdG9fY3B1KHZhbCk7Cj4+ICsKPj4g
KyAgICAgcmV0dXJuIHJldDsKPj4gIH0KPgo+IEZvciBjb25zaXN0ZW5jeSwgSSBmb2xkZWQgYSBw
YXRjaCBiZWxvdy4gSXMgdGhhdCBvaz8KPgo+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0
aC9hdGgxMGsvcGNpLmMKPiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3Bj
aS5jCj4gQEAgLTYyMCw3ICs2MjAsNyBAQCBzdGF0aWMgaW50IGF0aDEwa19wY2lfZGlhZ19yZWFk
MzIoc3RydWN0IGF0aDEwayAqYXIsIHUzMiBhZGRyZXNzLCB1MzIgKnZhbHVlKQo+ICAgICAgICAg
X19sZTMyIHZhbCA9IDA7Cj4gICAgICAgICBpbnQgcmV0Owo+Cj4gLSAgICAgICByZXQgPSBhdGgx
MGtfcGNpX2RpYWdfcmVhZF9tZW0oYXIsIGFkZHJlc3MsICZ2YWwsIHNpemVvZihfX2xlMzIpKTsK
PiArICAgICAgIHJldCA9IGF0aDEwa19wY2lfZGlhZ19yZWFkX21lbShhciwgYWRkcmVzcywgJnZh
bCwgc2l6ZW9mKHZhbCkpOwo+ICAgICAgICAgKnZhbHVlID0gX19sZTMyX3RvX2NwdSh2YWwpOwo+
Cj4gICAgICAgICByZXR1cm4gcmV0Owo+Cj4gaHR0cHM6Ly9naXRodWIuY29tL2t2YWxvL2F0aC9j
b21taXQvMTg1MGE0MTU4NzNjYjM0YTZmODRiNjk5ZGZiOWEyODNkZjMyNTJlYwoKSSdtIG9rYXkg
d2l0aCB0aGF0LCB0aGFua3MuCgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0
aDEwawo=
