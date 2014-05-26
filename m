Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x230.google.com ([2a00:1450:400c:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WorRL-0008H6-Kc
 for ath10k@lists.infradead.org; Mon, 26 May 2014 09:43:32 +0000
Received: by mail-we0-f176.google.com with SMTP id q59so7831831wes.35
 for <ath10k@lists.infradead.org>; Mon, 26 May 2014 02:43:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87y4xoswsa.fsf@kamboji.qca.qualcomm.com>
References: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
 <1400143324-14911-1-git-send-email-michal.kazior@tieto.com>
 <1400143324-14911-4-git-send-email-michal.kazior@tieto.com>
 <87y4xoswsa.fsf@kamboji.qca.qualcomm.com>
Date: Mon, 26 May 2014 11:43:07 +0200
Message-ID: <CA+BoTQm+HMaYa4hXaR-Y+YcJDoUXat_E+sUF3_-p5ZmccFwRXg@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] ath10k: drain tx before restarting hw
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

T24gMjYgTWF5IDIwMTQgMTE6NDAsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5jb20+
IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0ZXM6
Cj4KPj4gVGhpcyBtYWtlcyBzdXJlIG5vIGZ1cnRoZXIgdHggcmVxdWVzdHMgYXJlCj4+IHN1Ym1p
dHRlZCB0byBIVFQgYmVmb3JlIGRyaXZlciB0ZWFyZG93bi4KPj4KPj4gVGhpcyBzaG91bGQgcHJl
dmVudCBpbnZhbGlkIHBvaW50ZXIvTlVMTAo+PiBkZXJlZmVyZW5jZSBvbiBodHQgdHggcG9vbCBp
biBhdGgxMGtfaHR0X3R4KCkgaW4KPj4gc29tZSBjYXNlcyBvZiBoZWF2eSB0cmFmZmljLgo+Pgo+
PiBSZXBvcnRlZC1CeTogQmVuIEdyZWVhciA8Z3JlZWFyYkBjYW5kZWxhdGVjaC5jb20+Cj4+IFNp
Z25lZC1vZmYtYnk6IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPgo+PiAt
LS0KPj4gIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvbWFjLmMgfCAzMCArKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvd2lyZWxl
c3MvYXRoL2F0aDEway9tYWMuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvbWFj
LmMKPj4gaW5kZXggYjVkNzViOC4uNTc3YTNhNSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDEway9tYWMuYwo+PiArKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9h
dGgvYXRoMTBrL21hYy5jCj4+IEBAIC0yMjg5LDYgKzIyODksMjEgQEAgc3RhdGljIHZvaWQgYXRo
MTBrX3R4KHN0cnVjdCBpZWVlODAyMTFfaHcgKmh3LAo+PiAgLyoKPj4gICAqIEluaXRpYWxpemUg
dmFyaW91cyBwYXJhbWV0ZXJzIHdpdGggZGVmYXVsdCB2YXVsZXMuCj4+ICAgKi8KPj4gK3N0YXRp
YyB2b2lkIGF0aDEwa19kcmFpbl90eChzdHJ1Y3QgYXRoMTBrICphcikKPj4gK3sKPj4gKyAgICAg
Lyogd29ya2VycyBjYW4gaG9sZCBjb25mX211dGV4IC0tIGF2b2lkIGRlYWRsb2NrICovCj4+ICsg
ICAgIFdBUk5fT04obG9ja2RlcF9pc19oZWxkKCZhci0+Y29uZl9tdXRleCkpOwo+Cj4gQmFzZWQg
b24gdGhlIGRpc2N1c3Npb24gSSBtb2RpZmllZCB0aGUgZnVuY3Rpb24gdG8gdGhpcyBub3cuIEFy
ZSB5b3Ugb2sKPiB3aXRoIHRoYXQ/Cj4KPiAvKiBNdXN0IG5vdCBiZSBjYWxsZWQgd2l0aCBjb25m
X211dGV4IGhlbGQgYXMgd29ya2VycyBjYW4gdXNlIHRoYXQgYWxzby4gKi8KPiBzdGF0aWMgdm9p
ZCBhdGgxMGtfZHJhaW5fdHgoc3RydWN0IGF0aDEwayAqYXIpCj4gewo+ICAgICAgICAgLyogbWFr
ZSBzdXJlIHJjdS1wcm90ZWN0ZWQgbWFjODAyMTEgdHggcGF0aCBpdHNlbGYgaXMgZHJhaW5lZCAq
Lwo+ICAgICAgICAgc3luY2hyb25pemVfbmV0KCk7Cj4KPiAgICAgICAgIGF0aDEwa19vZmZjaGFu
X3R4X3B1cmdlKGFyKTsKPiAgICAgICAgIGF0aDEwa19tZ210X292ZXJfd21pX3R4X3B1cmdlKGFy
KTsKPgo+ICAgICAgICAgY2FuY2VsX3dvcmtfc3luYygmYXItPm9mZmNoYW5fdHhfd29yayk7Cj4g
ICAgICAgICBjYW5jZWxfd29ya19zeW5jKCZhci0+d21pX21nbXRfdHhfd29yayk7Cj4gfQo+Cj4g
RnVsbCBwYXRjaDoKPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9rdmFsby9hdGgvY29tbWl0L2UzYzUx
M2NkMDM4MDJlNzU4MDJhNmNlNWVmYmFkYWEwZGJmMDRiMjcKCkxvb2tzIGdvb2QsIHRoYW5rcyEK
CgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
