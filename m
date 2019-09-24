Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCdP5-0005tn-Vx
 for ath10k@lists.infradead.org; Tue, 24 Sep 2019 05:30:25 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 5/5] ath10k: pull_svc_rdy code-style fix
References: <1569268165-1639-1-git-send-email-pozega.tomislav@gmail.com>
 <1569268165-1639-5-git-send-email-pozega.tomislav@gmail.com>
Date: Tue, 24 Sep 2019 08:30:19 +0300
In-Reply-To: <1569268165-1639-5-git-send-email-pozega.tomislav@gmail.com>
 ("Tomislav \=\?utf-8\?Q\?Po\=C5\=BEega\=22's\?\= message of "Mon, 23 Sep 2019
 21:49:25 +0200")
Message-ID: <87d0fq5kic.fsf@codeaurora.org>
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
To: Tomislav =?utf-8?Q?Po=C5=BEega?= <pozega.tomislav@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

VG9taXNsYXYgUG/FvmVnYSA8cG96ZWdhLnRvbWlzbGF2QGdtYWlsLmNvbT4gd3JpdGVzOgoKPiBE
cm9wIHVubmVlZGVkIGxpbmVzIGJ5IG1vdmluZyBza2IgZGF0YSBpbiBib3RoIG1haW4gYW5kIDEw
eCBXTUkKPiBwdWxsIHNlcnZpY2UgcmVhZHkgZXZlbnQgb3BlcmF0aW9ucy4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFRvbWlzbGF2IFBvxb5lZ2EgPHBvemVnYS50b21pc2xhdkBnbWFpbC5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvd21pLmMgfCAgICA2ICsrLS0tLQo+
ICAxIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL3dtaS5jIGIvZHJpdmVy
cy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway93bWkuYwo+IGluZGV4IDU5ZDJkMmEuLjhhYjE3OGMg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway93bWkuYwo+ICsr
KyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvd21pLmMKPiBAQCAtNTM0NSwxMyAr
NTM0NSwxMiBAQCBzdGF0aWMgaW50IGF0aDEwa193bWlfYWxsb2NfaG9zdF9tZW0oc3RydWN0IGF0
aDEwayAqYXIsIHUzMiByZXFfaWQsCj4gIGF0aDEwa193bWlfbWFpbl9vcF9wdWxsX3N2Y19yZHlf
ZXYoc3RydWN0IGF0aDEwayAqYXIsIHN0cnVjdCBza19idWZmICpza2IsCj4gIAkJCQkgICBzdHJ1
Y3Qgd21pX3N2Y19yZHlfZXZfYXJnICphcmcpCj4gIHsKPiAtCXN0cnVjdCB3bWlfc2VydmljZV9y
ZWFkeV9ldmVudCAqZXY7Cj4gKwlzdHJ1Y3Qgd21pX3NlcnZpY2VfcmVhZHlfZXZlbnQgKmV2ID0g
KHZvaWQgKilza2ItPmRhdGE7Cj4gIAlzaXplX3QgaSwgbjsKPiAgCj4gIAlpZiAoc2tiLT5sZW4g
PCBzaXplb2YoKmV2KSkKPiAgCQlyZXR1cm4gLUVQUk9UTzsKPiAgCj4gLQlldiA9ICh2b2lkICop
c2tiLT5kYXRhOwoKQWN0dWFsbHkgSSBwcmVmZXIgdGhlIG9yaWdpbmFsIHN0eWxlLCBzbyB0aGF0
IHdlIGZpcnN0IGNoZWNrIHRoZSBkYXRhIGluCnNrYiBpcyB2YWxpZCBhbmQgb25seSB0aGVuIGFz
c2lnbiB0aGUgZGF0YSB0byBldi4KCi0tIApLYWxsZSBWYWxvCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vYXRoMTBrCg==
