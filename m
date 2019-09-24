Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCfZY-0006Nn-C8
 for ath10k@lists.infradead.org; Tue, 24 Sep 2019 07:49:24 +0000
Received: by mail-ot1-x344.google.com with SMTP id z6so662247otb.2
 for <ath10k@lists.infradead.org>; Tue, 24 Sep 2019 00:49:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87d0fq5kic.fsf@codeaurora.org>
References: <1569268165-1639-1-git-send-email-pozega.tomislav@gmail.com>
 <1569268165-1639-5-git-send-email-pozega.tomislav@gmail.com>
 <87d0fq5kic.fsf@codeaurora.org>
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Tue, 24 Sep 2019 09:49:18 +0200
Message-ID: <CAKR_QVK=XwLtaGgoLeU5-+XQP_-jVvAdWfkGvdyV9WNK_5QUng@mail.gmail.com>
Subject: Re: [PATCH 5/5] ath10k: pull_svc_rdy code-style fix
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

T24gMjQvMDkvMjAxOSwgS2FsbGUgVmFsbyA8a3ZhbG9AY29kZWF1cm9yYS5vcmc+IHdyb3RlOgo+
IFRvbWlzbGF2IFBvxb5lZ2EgPHBvemVnYS50b21pc2xhdkBnbWFpbC5jb20+IHdyaXRlczoKPgo+
PiBEcm9wIHVubmVlZGVkIGxpbmVzIGJ5IG1vdmluZyBza2IgZGF0YSBpbiBib3RoIG1haW4gYW5k
IDEweCBXTUkKPj4gcHVsbCBzZXJ2aWNlIHJlYWR5IGV2ZW50IG9wZXJhdGlvbnMuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IFRvbWlzbGF2IFBvxb5lZ2EgPHBvemVnYS50b21pc2xhdkBnbWFpbC5jb20+
Cj4+IC0tLQo+PiAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway93bWkuYyB8ICAgIDYg
KystLS0tCj4+ICAxIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvd21p
LmMKPj4gYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3dtaS5jCj4+IGluZGV4IDU5
ZDJkMmEuLjhhYjE3OGMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9h
dGgxMGsvd21pLmMKPj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway93bWku
Ywo+PiBAQCAtNTM0NSwxMyArNTM0NSwxMiBAQCBzdGF0aWMgaW50IGF0aDEwa193bWlfYWxsb2Nf
aG9zdF9tZW0oc3RydWN0IGF0aDEwawo+PiAqYXIsIHUzMiByZXFfaWQsCj4+ICBhdGgxMGtfd21p
X21haW5fb3BfcHVsbF9zdmNfcmR5X2V2KHN0cnVjdCBhdGgxMGsgKmFyLCBzdHJ1Y3Qgc2tfYnVm
Zgo+PiAqc2tiLAo+PiAgCQkJCSAgIHN0cnVjdCB3bWlfc3ZjX3JkeV9ldl9hcmcgKmFyZykKPj4g
IHsKPj4gLQlzdHJ1Y3Qgd21pX3NlcnZpY2VfcmVhZHlfZXZlbnQgKmV2Owo+PiArCXN0cnVjdCB3
bWlfc2VydmljZV9yZWFkeV9ldmVudCAqZXYgPSAodm9pZCAqKXNrYi0+ZGF0YTsKPj4gIAlzaXpl
X3QgaSwgbjsKPj4KPj4gIAlpZiAoc2tiLT5sZW4gPCBzaXplb2YoKmV2KSkKPj4gIAkJcmV0dXJu
IC1FUFJPVE87Cj4+Cj4+IC0JZXYgPSAodm9pZCAqKXNrYi0+ZGF0YTsKPgo+IEFjdHVhbGx5IEkg
cHJlZmVyIHRoZSBvcmlnaW5hbCBzdHlsZSwgc28gdGhhdCB3ZSBmaXJzdCBjaGVjayB0aGUgZGF0
YSBpbgo+IHNrYiBpcyB2YWxpZCBhbmQgb25seSB0aGVuIGFzc2lnbiB0aGUgZGF0YSB0byBldi4K
Pgo+IC0tCj4gS2FsbGUgVmFsbwo+CgpJdCBjYW1lIHRvIG15IG1pbmQgdGhhdCB0aGlzIG1pZ2h0
IGJlIHRoZSByZWFzb24gd2h5IHRoZSBjdXJyZW50CmRyaXZlciBkaWQgbm90IGdpdmUgbWUgd2Fy
bmluZyBhYm91dCB0b28gc2hvcnQgc2VydmljZSByZWFkeSBldmVudCwKYnV0IHRoZXJlIHdhcyBu
byB3YXJuaW5nIGFib3V0IGV2ZW50IGxlbmd0aCBpbiBlaXRoZXIgY2FzZS4KSSBldmVuIHRlc3Rl
ZCB0aGlzIHdpdGggY29tcGF0IHdpcmVsZXNzIGZyb20gMjAxMy4gYW5kIHRoZXJlIHRoZQpzaXR1
YXRpb24gd2FzIHRoZSBvcHBvc2l0ZTogaW4gYm90aCBjYXNlcyB0aGVyZSB3YXMgd2FybmluZyBh
Ym91dApzZXJ2aWNlIHJlYWR5IGxlbmd0aC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgx
MGsK
