Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VG0xl-0007D8-T4
 for ath10k@lists.infradead.org; Sun, 01 Sep 2013 06:16:43 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/7] ath10k: remove void pointer from struct
 ath10k_pci_compl
References: <20130830122905.31164.50662.stgit@localhost6.localdomain6>
 <20130830123021.31164.8374.stgit@localhost6.localdomain6>
 <522104B1.2070004@openwrt.org>
Date: Sun, 1 Sep 2013 09:16:14 +0300
In-Reply-To: <522104B1.2070004@openwrt.org> (Gabor Juhos's message of "Fri, 30
 Aug 2013 22:46:41 +0200")
Message-ID: <878uzh83td.fsf@kamboji.qca.qualcomm.com>
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
To: Gabor Juhos <juhosg@openwrt.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

R2Fib3IgSnVob3MgPGp1aG9zZ0BvcGVud3J0Lm9yZz4gd3JpdGVzOgoKPiAyMDEzLjA4LjMwLiAx
NDozMCBrZWx0ZXrDqXNzZWwsIEthbGxlIFZhbG8gw61ydGE6Cj4+IFZvaWQgcG9pbnRlcnMgYXJl
IGJhZCwgbW1rYXkuCj4+IAo+PiBObyBmdW5jdGlvbmFsIGNoYW5nZXMuCj4+IAo+PiBTaWduZWQt
b2ZmLWJ5OiBLYWxsZSBWYWxvIDxrdmFsb0BxY2EucXVhbGNvbW0uY29tPgo+PiAtLS0KPj4gIGRy
aXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvcGNpLmMgfCAgIDEyICsrKysrKy0tLS0tLQo+
PiAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9wY2kuaCB8ICAgIDIgKy0KPj4gIDIg
ZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+PiAKPgo+IDxz
bmlwPgo+Cj4+IEBAIC0xMDI2LDcgKzEwMjYsNyBAQCBzdGF0aWMgdm9pZCBhdGgxMGtfcGNpX3By
b2Nlc3NfY2Uoc3RydWN0IGF0aDEwayAqYXIpCj4+ICAJCQkJYnJlYWs7Cj4+ICAJCQl9Cj4+ICAK
Pj4gLQkJCXNrYiA9IChzdHJ1Y3Qgc2tfYnVmZiAqKWNvbXBsLT50cmFuc2Zlcl9jb250ZXh0Owo+
PiArCQkJc2tiID0gKHN0cnVjdCBza19idWZmICopY29tcGwtPnNrYjsKPgo+IFRoZSBjYXN0IGNh
biBiZSByZW1vdmVkIGZyb20gaGVyZSBhcyB3ZWxsLgoKT2gsIEkgaGFkIG1pc3NlZCB0aGF0LiBJ
J2xsIHNlbmQgdjIgdG8gZml4IHRoYXQuCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgotLSAK
S2FsbGUgVmFsbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
