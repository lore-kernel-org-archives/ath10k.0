Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22b.google.com ([2a00:1450:400c:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YVaAb-00038E-80
 for ath10k@lists.infradead.org; Wed, 11 Mar 2015 06:31:06 +0000
Received: by wggx12 with SMTP id x12so6782187wgg.13
 for <ath10k@lists.infradead.org>; Tue, 10 Mar 2015 23:30:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87twxsyiqn.fsf@kamboji.qca.qualcomm.com>
References: <87fv9hyz2r.fsf@kamboji.qca.qualcomm.com>
 <1425908197-16118-1-git-send-email-michal.kazior@tieto.com>
 <1425908197-16118-2-git-send-email-michal.kazior@tieto.com>
 <87twxsyiqn.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 11 Mar 2015 07:30:40 +0100
Message-ID: <CA+BoTQkm1Y80+PB9JsncgusS=Ny6FkEbSO4Hf3j_TOt6TgMv-g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ath10k: add hw connection monitor support
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

T24gMTAgTWFyY2ggMjAxNSBhdCAxNjoyOCwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21t
LmNvbT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+IHdy
aXRlczoKPgo+PiBTb21lIGZpcm13YXJlIHJldmlzaW9ucyAoZS5nLiBxY2E2MTc0IHdpdGggZnc3
MykKPj4gZG9uJ3QgZGVsaXZlciBiZWFjb25zIHRvIGhvc3QgcmVsaWFibHkuIFRoaXMKPj4gY2F1
c2VzIHJhbmRvbSBkaXNjb25uZWN0cyBldmVuIGluIHBlcmZlY3QKPj4gY29uZGl0aW9ucy4gVGhp
cyBpcyBtb3N0IHZpc2libGUgd2l0aAo+PiBtdWx0aS1jaGFubmVsIG9wZXJhdGlvbi4KPj4KPj4g
QWxsIGF2YWlsYWJsZSBmaXJtd2FyZSByZXZpc2lvbnMgc2VlbSB0byBzdXBwb3J0Cj4+IGJlYWNv
biBtaXNzIG9mZmxvYWRpbmcgc28gdGhlcmUgc2hvdWxkbid0IGJlIGFueQo+PiBwcm9ibGVtcy4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5j
b20+Cj4KPiBbLi4uXQo+Cj4+IEBAIC0yMTM5LDYgKzIyMDgsOCBAQCBzdGF0aWMgdm9pZCBhdGgx
MGtfYnNzX2Rpc2Fzc29jKHN0cnVjdCBpZWVlODAyMTFfaHcgKmh3LAo+PiAgICAgICBzcGluX2xv
Y2tfYmgoJmFydmlmLT5hci0+ZGF0YV9sb2NrKTsKPj4gICAgICAgYXJ2aWYtPmlzX3VwID0gZmFs
c2U7Cj4+ICAgICAgIHNwaW5fdW5sb2NrX2JoKCZhcnZpZi0+YXItPmRhdGFfbG9jayk7Cj4+ICsK
Pj4gKyAgICAgY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKCZhcnZpZi0+Y29ubmVjdGlvbl9sb3Nz
X3dvcmspOwo+PiAgfQo+Cj4gVGhlcmUgd2FzIGEgc2ltcGxlIGNvbmZsaWN0IGhlcmUsIHBsZWFz
ZSBjaGVjayB0aGUgcGVuZGluZyBicmFuY2ggZm9yIG15Cj4gcmVzb2x1dGlvbi4KCkxvb2tzIGdv
b2QsIHRoYW5rcyEKCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
