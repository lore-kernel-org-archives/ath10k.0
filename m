Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adX1C-0001fm-RW
 for ath10k@lists.infradead.org; Wed, 09 Mar 2016 05:50:47 +0000
Received: by mail-wm0-x22f.google.com with SMTP id p65so177478778wmp.1
 for <ath10k@lists.infradead.org>; Tue, 08 Mar 2016 21:50:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1457457934-8563-1-git-send-email-rmanohar@qti.qualcomm.com>
References: <1457457934-8563-1-git-send-email-rmanohar@qti.qualcomm.com>
Date: Wed, 9 Mar 2016 06:50:25 +0100
Message-ID: <CA+BoTQk89ObhC2U8BiYENN1oF0B1Tnqmy=PtFqSfhrHodYM_KQ@mail.gmail.com>
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
aS5xdWFsY29tbS5jb20+IHdyb3RlOgpbLi4uXQo+ICtpbnQgYXRoMTBrX2h0dF90eF9tZ210X2lu
Y19wZW5kaW5nKHN0cnVjdCBhdGgxMGtfaHR0ICpodHQsIGJvb2wgaXNfbWdtdCwKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgaXNfcHJlc3ApCj4gK3sKPiArICAgICAg
IHN0cnVjdCBhdGgxMGsgKmFyID0gaHR0LT5hcjsKPiArCj4gKyAgICAgICBsb2NrZGVwX2Fzc2Vy
dF9oZWxkKCZodHQtPnR4X2xvY2spOwo+ICsKPiArICAgICAgIGlmICghaXNfbWdtdCB8fCAhYXIt
Pmh3X3BhcmFtcy5tYXhfcHJvYmVfcmVzcF9kZXNjX3RocmVzKQo+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gMDsKPiArCj4gKyAgICAgICBpZiAoaXNfcHJlc3AgJiYKPiArICAgICAgICAgICBhci0+
aHdfcGFyYW1zLm1heF9wcm9iZV9yZXNwX2Rlc2NfdGhyZXMgPCBodHQtPm51bV9wZW5kaW5nX21n
bXRfdHgpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUJVU1k7Cj4gKwo+ICsgICAgICAgaHR0
LT5udW1fcGVuZGluZ19tZ210X3R4Kys7Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiAr
Cj4gK3ZvaWQgYXRoMTBrX2h0dF90eF9tZ210X2RlY19wZW5kaW5nKHN0cnVjdCBhdGgxMGtfaHR0
ICpodHQpCj4gK3sKPiArICAgICAgIGxvY2tkZXBfYXNzZXJ0X2hlbGQoJmh0dC0+dHhfbG9jayk7
Cj4gKwo+ICsgICAgICAgaHR0LT5udW1fcGVuZGluZ19tZ210X3R4LS07Cj4gK30KCk9oLCBhbmQg
dGhpcyBsb29rcyB1bmJhbGFuY2VkLiBZb3UgaW5jcmVtZW50IG9ubHkgd2hlbgpgYXItPmh3X3Bh
cmFtcy5tYXhfcHJvYmVfcmVzcF9kZXNjX3RocmVzYCBidXQgYWx3YXlzIGRlY3JlbWVudC4KCgpN
aWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
dGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
