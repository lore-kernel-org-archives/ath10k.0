Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bVHMN-0007a7-N4
 for ath10k@lists.infradead.org; Thu, 04 Aug 2016 12:02:49 +0000
Received: by mail-it0-x242.google.com with SMTP id j124so19537412ith.3
 for <ath10k@lists.infradead.org>; Thu, 04 Aug 2016 05:02:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACiydb+PfbS+Hc79My2HFqdacFtik7_H8d3kFsrST6m1GnSAgA@mail.gmail.com>
References: <1463489221-24989-1-git-send-email-michal.kazior@tieto.com>
 <1467201146-6844-1-git-send-email-michal.kazior@tieto.com>
 <87zipt1kco.fsf@kamboji.qca.qualcomm.com>
 <CACiydb+yNc-UKVRFR-UxTq-YFBDpEDsa1qWNBGCHpe=_zv8o7g@mail.gmail.com>
 <CAA93jw6j0pBKnm3Fs=D7V1CUsBnhZKKymbk4=UQuFWKuEAs-+Q@mail.gmail.com>
 <CACiydb+PfbS+Hc79My2HFqdacFtik7_H8d3kFsrST6m1GnSAgA@mail.gmail.com>
From: Dave Taht <dave.taht@gmail.com>
Date: Thu, 4 Aug 2016 14:02:23 +0200
Message-ID: <CAA93jw6OBQg2NwJGU6kJLM6oc=8zHRR3qgknjNo=8vHETtcU_Q@mail.gmail.com>
Subject: Re: [PATCH] ath10k: disable wake_tx_queue for older devices
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
To: Roman Yeryomin <leroi.lists@gmail.com>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gVGh1LCBBdWcgNCwgMjAxNiBhdCAxMjowNyBQTSwgUm9tYW4gWWVyeW9taW4gPGxlcm9pLmxp
c3RzQGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gMSBBdWd1c3QgMjAxNiBhdCAxMjowNCwgRGF2ZSBU
YWh0IDxkYXZlLnRhaHRAZ21haWwuY29tPiB3cm90ZToKPj4gT24gTW9uLCBBdWcgMSwgMjAxNiBh
dCAxOjM1IEFNLCBSb21hbiBZZXJ5b21pbiA8bGVyb2kubGlzdHNAZ21haWwuY29tPiB3cm90ZToK
Pj4+IE9uIDcgSnVseSAyMDE2IGF0IDE5OjMwLCBWYWxvLCBLYWxsZSA8a3ZhbG9AcWNhLnF1YWxj
b21tLmNvbT4gd3JvdGU6Cj4+Pj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5j
b20+IHdyaXRlczoKPj4+Pgo+Pj4+PiBJZGVhbGx5IHdha2VfdHhfcXVldWUgc2hvdWxkIGJlIHVz
ZWQgcmVnYXJkbGVzcyBhcwo+Pj4+PiBpdCBpcyBhIHJlcXVpcmVtZW50IGZvciByZWR1Y2luZyBi
dWZmZXJibG9hdCBhbmQKPj4+Pj4gaW1wbGVtZW50aW5nIGFpcnRpbWUgZmFpcm5lc3MgaW4gdGhl
IGZ1dHVyZS4KPj4+Pj4KPj4+Pj4gSG93ZXZlciBzb21lIHNldHVwcyAodHlwaWNhbGx5IGxvdy1l
bmQgcGxhdGZvcm1zCj4+Pj4+IGhvc3RpbmcgUUNBOTg4WCkgc3VmZmVyIHBlcmZvcm1hbmNlIHJl
Z3Jlc3Npb25zCj4+Pj4+IHdpdGggdGhlIGN1cnJlbnQgd2FrZV90eF9xdWV1ZSBpbXBsZW1lbnRh
dGlvbi4KPj4+Pj4gVGhlcmVmb3JlIGRpc2FibGUgaXQgdW5sZXNzIGl0IGlzIHJlYWxseQo+Pj4+
PiBiZW5lZmljaWFsIHdpdGggY3VycmVudCBjb2RlYmFzZSAod2hpY2ggaXMgd2hlbgo+Pj4+PiBm
aXJtd2FyZSBzdXBwb3J0cyBzbWFydCBwdWxsLXB1c2ggdHggc2NoZWR1bGluZykuCj4+Pj4+Cj4+
Pj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29t
Pgo+Pj4+Cj4+Pj4gSSB0aGluayBpdCdzIHRvbyBsYXRlIHRvIHNlbmQgdGhpcyB0byA0LjcgYW55
bW9yZSAoYW5kIHRoaXMgZHVlIHRvIG15Cj4+Pj4gdmFjYXRpb24pLiBTbyBJJ20gcGxhbm5pbmcg
dG8gcXVldWUgdGhpcyB0byA0LjgsIGJ1dCBpZiB0aGUgZmVlZGJhY2sgaXMKPj4+PiBwb3NpdGl2
ZSB3ZSBjYW4gYWx3YXlzIHNlbmQgdGhpcyB0byBhIDQuNyBzdGFibGUgcmVsZWFzZS4KPj4+Pgo+
Pj4KPj4+IFNvcnJ5IGd1eXMsIGRyb3duZWQuCj4+PiBTbywgeWVzLCBhcHBseWluZyB0aGlzIHBh
dGNoIGRvZXMgdGhlIGpvYi4gVGhhdCBpcyBnZXRzIG1lIHRvIHRoZQo+Pj4gcmVzdWx0cyBzaW1p
bGFyIHRvCj4+PiBodHRwczovL2xpc3RzLm9wZW53cnQub3JnL3BpcGVybWFpbC9vcGVud3J0LWRl
dmVsLzIwMTYtTWF5LzA0MTQ0OC5odG1sCj4+Pgo+Pj4gR29pbmcgdG8gdHJ5IGxhdGVzdCBjb2Rl
IG9uIHNhbWUgc3lzdGVtLi4uCj4+Cj4+IENhbiB5b3UgdHJ5IGluY3JlYXNpbmcgdGhlIHF1YW50
dW0gdG8gMTUxNCwgYW5kIHJlZHVjaW5nIHRoZSBjb2RlbAo+PiB0YXJnZXQgdG8gNW1zPyAod2l0
aG91dCB0aGlzIHBhdGNoPykKPj4KPgo+IFNvIGl0IHdhcyAxNTE0IGFscmVhZHkuLi4KCmJhc2Vk
IG9uIHNvbWUgdGVzdGluZyBvZiAyMCwgY29kZWwgdGFyZ2V0IHNob3VsZCBiZSA1bXMgYW5kIGlz
bid0LgoKaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2NvbW1pdC81Y2FhMzI4ZTM4
MTFiN2NmYTMzZmQwMmM5MzI4MGZmYTYyMmRlYjBlCgo+IFJlZ2FyZHMsCj4gUm9tYW4KPgo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYXRoMTBrIG1h
aWxpbmcgbGlzdAo+IGF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsKCgoKLS0gCkRhdmUgVMOkaHQKTGV0
J3MgZ28gbWFrZSBob21lIHJvdXRlcnMgYW5kIHdpZmkgZmFzdGVyISBXaXRoIGJldHRlciBzb2Z0
d2FyZSEKaHR0cDovL2Jsb2cuY2Vyb3dydC5vcmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
dGgxMGsK
