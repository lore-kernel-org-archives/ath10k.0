Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-02.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1diCEd-00079J-DL
 for ath10k@lists.infradead.org; Thu, 17 Aug 2017 04:16:45 +0000
MIME-Version: 1.0
Subject: Re: [2/6] ath10k: refactor firmware crashdump code to coredump.c
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <150278538298.22482.10986802411848917689.stgit@potku.adurom.net>
References: <150278538298.22482.10986802411848917689.stgit@potku.adurom.net>
Message-ID: <59aabd5bf8a143a1b0a281bdb694db75@euamsexm01a.eu.qualcomm.com>
Date: Thu, 17 Aug 2017 06:15:52 +0200
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

S2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21tLmNvbT4gd3JvdGU6Cgo+IEluIHByZXBhcmF0
aW9uIHRvIGFkZCBSQU0gZHVtcCBzdXBwb3J0LiBObyBmdW5jdGlvbmFsIGNoYW5nZXMsIG9ubHkg
bW92aW5nIGNvZGUKPiBhbmQgcmVuYW1pbmcgZnVuY3Rpb24gbmFtZXMuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21tLmNvbT4KCldpdGggb25seSB0aGlz
IHBhdGNoIGFwcGxpZWQsIGFuZCBDT05GSUdfREVWX0NPUkVEVU1QIGRpc2FibGVkLCB0aGVyZSdz
IGEgYnVpbGQgZXJyb3I6Cgpkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2NvcmVkdW1w
LmM6MjQ6MzA6IGVycm9yOiByZWRlZmluaXRpb24gb2Yg4oCYYXRoMTBrX2NvcmVkdW1wX25ld+KA
mQogc3RydWN0IGF0aDEwa19md19jcmFzaF9kYXRhICphdGgxMGtfY29yZWR1bXBfbmV3KHN0cnVj
dCBhdGgxMGsgKmFyKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCkluIGZpbGUgaW5j
bHVkZWQgZnJvbSBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2NvcmVkdW1wLmM6MTc6
MDoKZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9jb3JlZHVtcC5oOjExNDoxMDg6IG5v
dGU6IHByZXZpb3VzIGRlZmluaXRpb24gb2Yg4oCYYXRoMTBrX2NvcmVkdW1wX25ld+KAmSB3YXMg
aGVyZQpkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2NvcmVkdW1wLmM6MTMwOjU6IGVy
cm9yOiByZWRlZmluaXRpb24gb2Yg4oCYYXRoMTBrX2NvcmVkdW1wX3N1Ym1pdOKAmQogaW50IGF0
aDEwa19jb3JlZHVtcF9zdWJtaXQoc3RydWN0IGF0aDEwayAqYXIpCiAgICAgXgpJbiBmaWxlIGlu
Y2x1ZGVkIGZyb20gZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9jb3JlZHVtcC5jOjE3
OjA6CmRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvY29yZWR1bXAuaDoxMDk6ODM6IG5v
dGU6IHByZXZpb3VzIGRlZmluaXRpb24gb2Yg4oCYYXRoMTBrX2NvcmVkdW1wX3N1Ym1pdOKAmSB3
YXMgaGVyZQoKLS0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvOTkwMTI0My8K
Cmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRh
dGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
