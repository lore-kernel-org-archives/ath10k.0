Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x231.google.com ([2a00:1450:4008:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOmcq-0004W9-N7
 for ath10k@lists.infradead.org; Wed, 25 Sep 2013 10:47:21 +0000
Received: by mail-bk0-f49.google.com with SMTP id r7so2162844bkg.8
 for <ath10k@lists.infradead.org>; Wed, 25 Sep 2013 03:46:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1380101891-18312-9-git-send-email-bartosz.markowski@tieto.com>
References: <1380101891-18312-1-git-send-email-bartosz.markowski@tieto.com>
 <1380101891-18312-9-git-send-email-bartosz.markowski@tieto.com>
Date: Wed, 25 Sep 2013 12:46:58 +0200
Message-ID: <CA+BoTQ=p5_V7CDJsv3xZPAPM0y-rc_Ck7LAjX8=Wf1QXujC2JQ@mail.gmail.com>
Subject: Re: [PATCH 08/13] ath10k: bring back the WMI path for mgmt frames
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

T24gMjUgU2VwdGVtYmVyIDIwMTMgMTE6MzgsIEJhcnRvc3ogTWFya293c2tpCjxiYXJ0b3N6Lm1h
cmtvd3NraUB0aWV0by5jb20+IHdyb3RlOgo+IEBAIC0xNDk3LDE2ICsxNDk3LDIzIEBAIHN0YXRp
YyB2b2lkIGF0aDEwa190eF9odHQoc3RydWN0IGF0aDEwayAqYXIsIHN0cnVjdCBza19idWZmICpz
a2IpCj4gICAgICAgICAgICAgICAgIGdvdG8gZXhpdDsKPiAgICAgICAgIH0KPgo+IC0gICAgICAg
aWYgKGllZWU4MDIxMV9pc19tZ210KGhkci0+ZnJhbWVfY29udHJvbCkpCj4gLSAgICAgICAgICAg
ICAgIHJldCA9IGF0aDEwa19odHRfbWdtdF90eCgmYXItPmh0dCwgc2tiKTsKPiAtICAgICAgIGVs
c2UgaWYgKGllZWU4MDIxMV9pc19udWxsZnVuYyhoZHItPmZyYW1lX2NvbnRyb2wpKQo+ICsgICAg
ICAgaWYgKGllZWU4MDIxMV9pc19tZ210KGhkci0+ZnJhbWVfY29udHJvbCkpIHsKPiArICAgICAg
ICAgICAgICAgaWYgKHRlc3RfYml0KEFUSDEwS19GV19GRUFUVVJFX0hBU19XTUlfTUdNVF9UWCwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIGFyLT5md19mZWF0dXJlcykpCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcmV0ID0gYXRoMTBrX3dtaV9tZ210X3R4KGFyLCBza2IpOwoKRHVl
IHRvIHJlY2VudCBjaGFuZ2VzIChXTUkgY29tbWFuZHMgY2FuIGJsb2NrL3NsZWVwKSB0aGlzIGNh
bm5vdCBiZQpzby4gYXRoMTBrX3R4X2h0dCgpIGlzIGNhbGxlZCBmcm9tIGFuIGF0b21pYyBjb250
ZXh0LgoKSSdtIHNlZWluZyAyIGFwcm9hY2hlcyBoZXJlOgogYSkgbWFuYWdlbWVudCBmcmFtZSBx
dWV1ZSwKIGIpIHVzZSBpZWVlODAyMTFfe3N0b3Asd2FrZX1fcXVldWVzKCkKCkknbSB3b3JyaWVk
IChiKSBjb3VsZCBkZWdyYWRlIHRocm91Z2hwdXQuIFdNSSBlbmRwb2ludCBoYXMgb25seSAyIEhU
QwpjcmVkaXRzIG1lYW5pbmcgbWFuYWdlbWVudCBmcmFtZSBidXJzdHMgd2lsbCBsb2NrIG91dCBk
YXRhIGZyYW1lIHR4LgoKCk1pY2hhxYIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBr
Cg==
