Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCUL4-0004ON-CX
 for ath10k@lists.infradead.org; Mon, 23 Sep 2019 19:49:40 +0000
Received: by mail-wr1-x434.google.com with SMTP id r5so15285483wrm.12
 for <ath10k@lists.infradead.org>; Mon, 23 Sep 2019 12:49:32 -0700 (PDT)
From: =?UTF-8?q?Tomislav=20Po=C5=BEega?= <pozega.tomislav@gmail.com>
Subject: [PATCH 4/5] ath10k: change sw version print format to hex
Date: Mon, 23 Sep 2019 21:49:24 +0200
Message-Id: <1569268165-1639-4-git-send-email-pozega.tomislav@gmail.com>
In-Reply-To: <1569268165-1639-1-git-send-email-pozega.tomislav@gmail.com>
References: <1569268165-1639-1-git-send-email-pozega.tomislav@gmail.com>
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
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, kvalo@codeaurora.org

U29mdHdhcmUgdmVyc2lvbiB3aXRoaW4gV01JIGV2ZW50IHJlYWR5IG1lc3NhZ2Ugd2FzIGRpc3Bs
YXllZAppbiBhIG5vdCB2ZXJ5IHVzZWZ1bCBkZWNpbWFsIGZvcm1hdC4gQ2hhbmdlIHRoaXMgaW5m
byB0byBiZSBzaG93bgppbiBhIGhleGFkZWNpbWFsIGZvcm1hdCBpbnN0ZWFkLgoKU2lnbmVkLW9m
Zi1ieTogVG9taXNsYXYgUG/FvmVnYSA8cG96ZWdhLnRvbWlzbGF2QGdtYWlsLmNvbT4KLS0tCiBk
cml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3dtaS5jIHwgICAgMiArLQogMSBmaWxlcyBj
aGFuZ2VkLCAxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway93bWkuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNz
L2F0aC9hdGgxMGsvd21pLmMKaW5kZXggMmQ0M2FkZi4uNTlkMmQyYSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway93bWkuYworKysgYi9kcml2ZXJzL25ldC93aXJl
bGVzcy9hdGgvYXRoMTBrL3dtaS5jCkBAIC01NjUwLDcgKzU2NTAsNyBAQCBpbnQgYXRoMTBrX3dt
aV9ldmVudF9yZWFkeShzdHJ1Y3QgYXRoMTBrICphciwgc3RydWN0IHNrX2J1ZmYgKnNrYikKIAl9
CiAKIAlhdGgxMGtfZGJnKGFyLCBBVEgxMEtfREJHX1dNSSwKLQkJICAgIndtaSBldmVudCByZWFk
eSBzd192ZXJzaW9uICV1IGFiaV92ZXJzaW9uICV1IG1hY19hZGRyICVwTSBzdGF0dXMgJWRcbiIs
CisJCSAgICJ3bWkgZXZlbnQgcmVhZHkgc3dfdmVyc2lvbiAweCUwOHggYWJpX3ZlcnNpb24gJXUg
bWFjX2FkZHIgJXBNIHN0YXR1cyAlZFxuIiwKIAkJICAgX19sZTMyX3RvX2NwdShhcmcuc3dfdmVy
c2lvbiksCiAJCSAgIF9fbGUzMl90b19jcHUoYXJnLmFiaV92ZXJzaW9uKSwKIAkJICAgYXJnLm1h
Y19hZGRyLAotLSAKMS43LjAuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
