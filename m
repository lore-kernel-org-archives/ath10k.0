Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e5ofw-0006VB-Jw
 for ath10k@lists.infradead.org; Sat, 21 Oct 2017 07:58:35 +0000
Subject: Re: [PATCH] ath10k: rebuild crypto header in RX data frames
References: <150851690590.5158.11970481736247725763.stgit@potku.adurom.net>
 <c9bdd915-0667-eee0-3b52-1fdf15abf249@dd-wrt.com>
 <CAGyitvP0wquoo_8_ma3rcj+riJ5Wgfo7+pmbUOx9pQRwFcQHYA@mail.gmail.com>
 <877evpdscc.fsf@kamboji.qca.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <1564413e-41d7-1ad9-261e-38515382b059@dd-wrt.com>
Date: Sat, 21 Oct 2017 09:58:04 +0200
MIME-Version: 1.0
In-Reply-To: <877evpdscc.fsf@kamboji.qca.qualcomm.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@qca.qualcomm.com>, Jasmine Strong <jas@eero.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

ZXZlbiBpZiBoZSB1c2VkIG15IHBhdGNoLiBteSBwYXRjaCBzaG91bGQgaGF2ZSBubyBpbmZsdWVu
Y2UgdG8gd3BhMiAKY2NtcC4gaXQganVzdCBhZGRzIHRoZSBuZXcgY2NtcCAyNTYgKyBnY21wIG1v
ZGVzCgpBbSAyMS4xMC4yMDE3IHVtIDA2OjQyIHNjaHJpZWIgS2FsbGUgVmFsbzoKPiBKYXNtaW5l
IFN0cm9uZyA8amFzQGVlcm8uY29tPiB3cml0ZXM6Cj4KPj4gV2hlbiB3ZSB0cmllZCB0aGlzIHBh
dGNoLCBpdCBjb21wbGV0ZWx5IGJyb2tlIGFsbCB3cGEyLWNjbXAtYWVzCj4+IHRyYWZmaWMuCj4g
V2hpY2ggcGF0Y2gsIFZhc2FudGgncyBvciBTZWJhc3RpYW4ncz8gSSBldmVuIHRlc3RlZCBteXNl
bGYsIHdpdGggYm90aAo+IENDTVAgYW5kIFRLSVAgb24gYm90aCBBUCBhbmQgY2xpZW50IG1vZGVz
LCBhbmQgZGlkbid0IHNlZSBzZWUgYW55Cj4gcHJvYmxlbXMuIFdoYXQga2luZCBvZiBzZXR1cCB5
b3UgaGF2ZT8KPgo+IEkgdGVzdGVkIG9uIGEgeDg2IGxhcHRvcCBhbmQgY3VycmVudCBhdGguZ2l0
IG1hc3RlciBicmFuY2g6Cj4KPiBhdGgxMGtfcGNpIDAwMDA6MDI6MDAuMDogcGNpIGlycSBtc2kg
b3Blcl9pcnFfbW9kZSAyIGlycV9tb2RlIDAgcmVzZXRfbW9kZSAwCj4gYXRoMTBrX3BjaSAwMDAw
OjAyOjAwLjA6IHFjYTk4OHggaHcyLjAgdGFyZ2V0IDB4NDEwMDAxNmMgY2hpcF9pZCAweDA0MzIw
MmZmIHN1YiAwMDAwOjAwMDAKPiBhdGgxMGtfcGNpIDAwMDA6MDI6MDAuMDoga2NvbmZpZyBkZWJ1
ZyAxIGRlYnVnZnMgMSB0cmFjaW5nIDEgZGZzIDEgdGVzdG1vZGUgMQo+IGF0aDEwa19wY2kgMDAw
MDowMjowMC4wOiBmaXJtd2FyZSB2ZXIgMTAuMi40LjcwLjY2IGFwaSA1IGZlYXR1cmVzIG5vLXAy
cCxyYXctbW9kZSxtZnAsYWxsb3dzLW1lc2gtYmNhc3QgY3JjMzIgYzJkZDJhZDUKPiBhdGgxMGtf
cGNpIDAwMDA6MDI6MDAuMDogYm9hcmRfZmlsZSBhcGkgMSBibWlfaWQgTi9BIGNyYzMyIGJlYmM3
YzA4Cj4KPiBBbmQgbXkgaG9zdGFwZC5jb25mOgo+Cj4gZHJpdmVyPW5sODAyMTEKPiBod19tb2Rl
PWEKPiBjaGFubmVsPTM2Cj4gaWVlZTgwMjExbj0xCj4gaW50ZXJmYWNlPXdsYW4wCj4gY3RybF9p
bnRlcmZhY2U9L3Zhci9ydW4vaG9zdGFwZAo+IGN0cmxfaW50ZXJmYWNlX2dyb3VwPWFkbQo+IHNz
aWQ9dGVzdC1wc2sKPiB3cGE9Mgo+IHdwYV9rZXlfbWdtdD1XUEEtUFNLCj4gd3BhX3BhaXJ3aXNl
PUNDTVAKPiB3cGFfcGFzc3BocmFzZT0xMjM0NTY3OAo+Cj4KCi0tIApNaXQgZnJldW5kbGljaGVu
IEdyw7xzc2VuIC8gUmVnYXJkcwoKU2ViYXN0aWFuIEdvdHRzY2hhbGwgLyBDVE8KCk5ld01lZGlh
LU5FVCBHbWJIIC0gREQtV1JUCkZpcm1lbnNpdHo6ICBTdHViZW53YWxkYWxsZWUgMjFhLCA2NDYy
NSBCZW5zaGVpbQpSZWdpc3RlcmdlcmljaHQ6IEFtdHNnZXJpY2h0IERhcm1zdGFkdCwgSFJCIDI1
NDczCkdlc2Now6RmdHNmw7xocmVyOiBQZXRlciBTdGVpbmjDpHVzZXIsIENocmlzdGlhbiBTY2hl
ZWxlCmh0dHA6Ly93d3cuZGQtd3J0LmNvbQplbWFpbDogcy5nb3R0c2NoYWxsQGRkLXdydC5jb20K
VGVsLjogKzQ5NjI1MS01ODI2NTAgLyBGYXg6ICs0OTYyNTEtNTgyNjU2NQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QK
YXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hdGgxMGsK
