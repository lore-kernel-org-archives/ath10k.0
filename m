Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adWx4-0007u5-0A
 for ath10k@lists.infradead.org; Wed, 09 Mar 2016 05:46:30 +0000
Received: by mail-wm0-x22d.google.com with SMTP id l68so161865738wml.0
 for <ath10k@lists.infradead.org>; Tue, 08 Mar 2016 21:46:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1457457934-8563-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1457457934-8563-1-git-send-email-rmanohar@qti.qualcomm.com>
Date: Wed, 9 Mar 2016 06:46:05 +0100
Message-ID: <CA+BoTQmxg7vK6KBENrx+P3vK_nYV4-h_yiavEBQi1oFTAANR=w@mail.gmail.com>
Subject: Re: [PATCH v4] ath10k: move mgmt descriptor limit handle under mgmt_tx
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
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Rajkumar Manoharan <rmanohar@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gOCBNYXJjaCAyMDE2IGF0IDE4OjI1LCBSYWprdW1hciBNYW5vaGFyYW4gPHJtYW5vaGFyQHF0
aS5xdWFsY29tbS5jb20+IHdyb3RlOgpbLi4uXQo+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNz
L2F0aC9hdGgxMGsvaHR0X3J4LmMKPiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRo
MTBrL2h0dF9yeC5jCj4gQEAgLTIzMjYsNyArMjMyNiwxMiBAQCB2b2lkIGF0aDEwa19odHRfdDJo
X21zZ19oYW5kbGVyKHN0cnVjdCBhdGgxMGsgKmFyLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgICAgICAgICB9Cj4KPiAtICAg
ICAgICAgICAgICAgYXRoMTBrX3R4cnhfdHhfdW5yZWYoaHR0LCAmdHhfZG9uZSk7Cj4gKyAgICAg
ICAgICAgICAgIHN0YXR1cyA9IGF0aDEwa190eHJ4X3R4X3VucmVmKGh0dCwgJnR4X2RvbmUpOwo+
ICsgICAgICAgICAgICAgICBpZiAoIXN0YXR1cykgewo+ICsgICAgICAgICAgICAgICAgICAgICAg
IHNwaW5fbG9ja19iaCgmaHR0LT50eF9sb2NrKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBh
dGgxMGtfaHR0X3R4X21nbXRfZGVjX3BlbmRpbmcoaHR0KTsKPiArICAgICAgICAgICAgICAgICAg
ICAgICBzcGluX3VubG9ja19iaCgmaHR0LT50eF9sb2NrKTsKPiArICAgICAgICAgICAgICAgfQpb
Li4uXQo+IEBAIC0zOTc4LDE0ICszOTc2LDEzIEBAIHN0YXRpYyB2b2lkIGF0aDEwa19tYWNfb3Bf
dHgoc3RydWN0IGllZWU4MDIxMV9odyAqaHcsCj4gICAgICAgICB0eHBhdGggPSBhdGgxMGtfbWFj
X3R4X2hfZ2V0X3R4cGF0aChhciwgc2tiLCB0eG1vZGUpOwo+ICAgICAgICAgaXNfaHR0ID0gKHR4
cGF0aCA9PSBBVEgxMEtfTUFDX1RYX0hUVCB8fAo+ICAgICAgICAgICAgICAgICAgIHR4cGF0aCA9
PSBBVEgxMEtfTUFDX1RYX0hUVF9NR01UKTsKPiArICAgICAgIGlzX21nbXQgPSAodHhwYXRoID09
IEFUSDEwS19NQUNfVFhfSFRUX01HTVQpOwoKQXJlIHlvdSBzdXJlIHlvdSB3YW50IHRvIGJlIGNv
dW50aW5nIG51bGxmdW5jcyBoZXJlIGluIGFzIHdlbGwgKGFuZApwb3NzaWJseSBvdGhlciBmcmFt
ZXMgdGhhdCBlbmQgdXAsIGZvciB3aGF0ZXZlciByZWFzb24sIG9uIGh0dC1tZ210CnR4LXBhdGg/
KQoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
