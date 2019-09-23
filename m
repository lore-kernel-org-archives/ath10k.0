Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCUL2-0004OP-Ec
 for ath10k@lists.infradead.org; Mon, 23 Sep 2019 19:49:39 +0000
Received: by mail-wm1-x343.google.com with SMTP id y21so10592130wmi.0
 for <ath10k@lists.infradead.org>; Mon, 23 Sep 2019 12:49:33 -0700 (PDT)
From: =?UTF-8?q?Tomislav=20Po=C5=BEega?= <pozega.tomislav@gmail.com>
Subject: [PATCH 5/5] ath10k: pull_svc_rdy code-style fix
Date: Mon, 23 Sep 2019 21:49:25 +0200
Message-Id: <1569268165-1639-5-git-send-email-pozega.tomislav@gmail.com>
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

RHJvcCB1bm5lZWRlZCBsaW5lcyBieSBtb3Zpbmcgc2tiIGRhdGEgaW4gYm90aCBtYWluIGFuZCAx
MHggV01JCnB1bGwgc2VydmljZSByZWFkeSBldmVudCBvcGVyYXRpb25zLgoKU2lnbmVkLW9mZi1i
eTogVG9taXNsYXYgUG/FvmVnYSA8cG96ZWdhLnRvbWlzbGF2QGdtYWlsLmNvbT4KLS0tCiBkcml2
ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3dtaS5jIHwgICAgNiArKy0tLS0KIDEgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvd21pLmMgYi9kcml2ZXJzL25ldC93aXJlbGVz
cy9hdGgvYXRoMTBrL3dtaS5jCmluZGV4IDU5ZDJkMmEuLjhhYjE3OGMgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvd21pLmMKKysrIGIvZHJpdmVycy9uZXQvd2ly
ZWxlc3MvYXRoL2F0aDEway93bWkuYwpAQCAtNTM0NSwxMyArNTM0NSwxMiBAQCBzdGF0aWMgaW50
IGF0aDEwa193bWlfYWxsb2NfaG9zdF9tZW0oc3RydWN0IGF0aDEwayAqYXIsIHUzMiByZXFfaWQs
CiBhdGgxMGtfd21pX21haW5fb3BfcHVsbF9zdmNfcmR5X2V2KHN0cnVjdCBhdGgxMGsgKmFyLCBz
dHJ1Y3Qgc2tfYnVmZiAqc2tiLAogCQkJCSAgIHN0cnVjdCB3bWlfc3ZjX3JkeV9ldl9hcmcgKmFy
ZykKIHsKLQlzdHJ1Y3Qgd21pX3NlcnZpY2VfcmVhZHlfZXZlbnQgKmV2OworCXN0cnVjdCB3bWlf
c2VydmljZV9yZWFkeV9ldmVudCAqZXYgPSAodm9pZCAqKXNrYi0+ZGF0YTsKIAlzaXplX3QgaSwg
bjsKIAogCWlmIChza2ItPmxlbiA8IHNpemVvZigqZXYpKQogCQlyZXR1cm4gLUVQUk9UTzsKIAot
CWV2ID0gKHZvaWQgKilza2ItPmRhdGE7CiAJc2tiX3B1bGwoc2tiLCBzaXplb2YoKmV2KSk7CiAJ
YXJnLT5taW5fdHhfcG93ZXIgPSBldi0+aHdfbWluX3R4X3Bvd2VyOwogCWFyZy0+bWF4X3R4X3Bv
d2VyID0gZXYtPmh3X21heF90eF9wb3dlcjsKQEAgLTUzODcsMTMgKzUzODYsMTIgQEAgc3RhdGlj
IGludCBhdGgxMGtfd21pX2FsbG9jX2hvc3RfbWVtKHN0cnVjdCBhdGgxMGsgKmFyLCB1MzIgcmVx
X2lkLAogYXRoMTBrX3dtaV8xMHhfb3BfcHVsbF9zdmNfcmR5X2V2KHN0cnVjdCBhdGgxMGsgKmFy
LCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiLAogCQkJCSAgc3RydWN0IHdtaV9zdmNfcmR5X2V2X2FyZyAq
YXJnKQogewotCXN0cnVjdCB3bWlfMTB4X3NlcnZpY2VfcmVhZHlfZXZlbnQgKmV2OworCXN0cnVj
dCB3bWlfMTB4X3NlcnZpY2VfcmVhZHlfZXZlbnQgKmV2ID0gKHZvaWQgKilza2ItPmRhdGE7CiAJ
aW50IGksIG47CiAKIAlpZiAoc2tiLT5sZW4gPCBzaXplb2YoKmV2KSkKIAkJcmV0dXJuIC1FUFJP
VE87CiAKLQlldiA9ICh2b2lkICopc2tiLT5kYXRhOwogCXNrYl9wdWxsKHNrYiwgc2l6ZW9mKCpl
dikpOwogCWFyZy0+bWluX3R4X3Bvd2VyID0gZXYtPmh3X21pbl90eF9wb3dlcjsKIAlhcmctPm1h
eF90eF9wb3dlciA9IGV2LT5od19tYXhfdHhfcG93ZXI7Ci0tIAoxLjcuMC40CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlz
dAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
