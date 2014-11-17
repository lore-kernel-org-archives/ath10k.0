Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XqKYF-0000Lk-9E
 for ath10k@lists.infradead.org; Mon, 17 Nov 2014 11:33:00 +0000
Received: by mail-wi0-f178.google.com with SMTP id hi2so194585wib.5
 for <ath10k@lists.infradead.org>; Mon, 17 Nov 2014 03:32:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1416209393-24736-1-git-send-email-sujith@msujith.org>
References: <1416209393-24736-1-git-send-email-sujith@msujith.org>
Date: Mon, 17 Nov 2014 12:32:33 +0100
Message-ID: <CA+BoTQkpqVKVHFoXuTJtkTmFZA0XfU56nLRaVegWUr29z83_tQ@mail.gmail.com>
Subject: Re: [PATCH] ath10k: Block radar events when requested
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
To: Sujith Manoharan <sujith@msujith.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTcgTm92ZW1iZXIgMjAxNCAwODoyOSwgU3VqaXRoIE1hbm9oYXJhbiA8c3VqaXRoQG1zdWpp
dGgub3JnPiB3cm90ZToKPiBGcm9tOiBTdWppdGggTWFub2hhcmFuIDxjX21hbm9oYUBxY2EucXVh
bGNvbW0uY29tPgo+Cj4gVGhpcyBwYXRjaCBlbnN1cmVzIHRoYXQgcmVwb3J0aW5nIG9mIGEgcmFk
YXIgaW4gc2ltdWxhdGlvbgo+IGlzIG5vdCBkb25lIHdoZW4gZGV0ZWN0aW9uIGlzIGRpc2FibGVk
IGV4cGxpY2l0bHkgYnkKPiB1c2luZyB0aGUgZGVidWdmcyBrbm9iICdkZnNfYmxvY2tfcmFkYXJf
ZXZlbnRzJy4KPgo+IFNpZ25lZC1vZmYtYnk6IFN1aml0aCBNYW5vaGFyYW4gPGNfbWFub2hhQHFj
YS5xdWFsY29tbS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsv
ZGVidWcuYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBr
L2RlYnVnLmMgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2RlYnVnLmMKPiBpbmRl
eCA5MTQ3ZGQzLi5mYTFhY2NkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0
aC9hdGgxMGsvZGVidWcuYwo+ICsrKyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsv
ZGVidWcuYwo+IEBAIC0xNDM3LDcgKzE0MzcsOCBAQCBzdGF0aWMgc3NpemVfdCBhdGgxMGtfd3Jp
dGVfc2ltdWxhdGVfcmFkYXIoc3RydWN0IGZpbGUgKmZpbGUsCj4gIHsKPiAgICAgICAgIHN0cnVj
dCBhdGgxMGsgKmFyID0gZmlsZS0+cHJpdmF0ZV9kYXRhOwo+Cj4gLSAgICAgICBpZWVlODAyMTFf
cmFkYXJfZGV0ZWN0ZWQoYXItPmh3KTsKPiArICAgICAgIGlmICghYXItPmRmc19ibG9ja19yYWRh
cl9ldmVudHMpCj4gKyAgICAgICAgICAgICAgIGllZWU4MDIxMV9yYWRhcl9kZXRlY3RlZChhci0+
aHcpOwoKVGhlIHNpbXVsYXRlX3JhZGFyIGtub2IgaXMgbWVhbnQgdG8gYmUgdXNlZCB3aXRoCmRm
c19ibG9ja19yYWRhcl9ldmVudHMgYmVpbmcgdHJ1ZSBpbiB0aGUgZmlyc3QgcGxhY2Ugc28geW91
IGNhbiBlYXNpbHkKYmxvY2sgcmVhbCBERlMgZXZlbnRzIGFuZCBpbmplY3QgZmFrZSBvbmVzIGZv
ciB0ZXN0aW5nIG9mIERGUyB1cHBlcgpsYXllcnMgd2l0aCBhdGgxMGsuCgpZb3VyIHBhdGNoIGJy
ZWFrcyB0aGlzLiBXaHkgd291bGQgeW91IHdhbnQgdG8gZG8gdGhhdD8KCgpNaWNoYcWCCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGlu
ZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
