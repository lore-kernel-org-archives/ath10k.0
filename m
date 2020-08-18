Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7xcR-0002i4-Er
 for ath10k@lists.infradead.org; Tue, 18 Aug 2020 09:09:30 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: fix the status check and wrong return
References: <20200814144844.1920-1-tangbin@cmss.chinamobile.com>
 <87y2mdjqkx.fsf@codeaurora.org>
 <e53ee8ca-9c2b-2313-6fd7-8f73ae33e1a2@cmss.chinamobile.com>
Date: Tue, 18 Aug 2020 12:08:42 +0300
In-Reply-To: <e53ee8ca-9c2b-2313-6fd7-8f73ae33e1a2@cmss.chinamobile.com> (Tang
 Bin's message of "Tue, 18 Aug 2020 09:42:03 +0800")
Message-ID: <87lficjp7p.fsf@codeaurora.org>
MIME-Version: 1.0
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
To: Tang Bin <tangbin@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, davem@davemloft.net, ath10k@lists.infradead.org, linux-kernel@vger.kernel.org

VGFuZyBCaW4gPHRhbmdiaW5AY21zcy5jaGluYW1vYmlsZS5jb20+IHdyaXRlczoKCj4g5ZyoIDIw
MjAvOC8xNyAyMjoyNiwgS2FsbGUgVmFsbyDlhpnpgZM6Cj4+PiBJbiB0aGUgZnVuY3Rpb24gYXRo
MTBrX2FoYl9jbG9ja19pbml0KCksIGRldm1fY2xrX2dldCgpIGRvZXNuJ3QKPj4+IHJldHVybiBO
VUxMLiBUaHVzIHVzZSBJU19FUlIoKSBhbmQgUFRSX0VSUigpIHRvIHZhbGlkYXRlCj4+PiB0aGUg
cmV0dXJuZWQgdmFsdWUgaW5zdGVhZCBvZiBJU19FUlJfT1JfTlVMTCgpLgo+PiBXaHk/IFdoYXQn
cyB0aGUgYmVuZWZpdCBvZiB0aGlzIHBhdGNoPyBPciB3aGF0IGhhcm0gZG9lcwo+PiBJU19FUlJf
T1JfTlVMTCgpIGNyZWF0ZT8KPgo+IFRoYW5rcyBmb3IgeW91IHJlcGx5LCB0aGUgYmVuZWZpdCBv
ZiB0aGlzIHBhdGNoIGlzIHNpbXBsaWZ5IHRoZSBjb2RlLAo+IGJlY2F1c2UgaW4KPgo+IHRoaXMg
ZnVuY3Rpb24sIEkgZG9uJ3QgdGhpbmsgdGhlIHNpdHVhdGlvbiBvZiAnZGV2bV9jbGtfZ2V0KCkg
cmV0dXJuCj4gTlVMTCcgZXhpc3RzLgo+Cj4gU28gcGxlYXNlIHRoaW5rIGFib3V0IGl0LCB0aGFu
a3MuCgpJIHRoaW5rIHlvdSBtaXNzZWQgbXkgY29tbWVudCBiZWxvdzoKCj4+IGRldm1fY2xrX2dl
dCgpIGNhbiByZXR1cm4gTlVMTCBpZiBDT05GSUdfSEFWRV9DTEsgaXMgZGlzYWJsZWQ6Cj4+Cj4+
IHN0YXRpYyBpbmxpbmUgc3RydWN0IGNsayAqZGV2bV9jbGtfZ2V0KHN0cnVjdCBkZXZpY2UgKmRl
diwgY29uc3QgY2hhciAqaWQpCj4+IHsKPj4gCXJldHVybiBOVUxMOwo+PiB9CgpTbyBJIHRoaW5r
IHRoaXMgcGF0Y2gganVzdCBjcmVhdGVzIGEgbmV3IGJ1ZyBhbmQgZG9lcyBub3QgaW1wcm92ZQph
bnl0aGluZy4KCi0tIApodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9w
ZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hdGgxMGsK
