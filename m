Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1btvMY-0003YZ-Mp
 for ath10k@lists.infradead.org; Tue, 11 Oct 2016 11:36:51 +0000
MIME-Version: 1.0
Subject: Re: [v2,1/2] ath10k: clean up HTT tx buffer allocation and free
From: Kalle Valo <kvalo@qca.qualcomm.com>
In-Reply-To: <1475743188-12007-1-git-send-email-mohammed@qca.qualcomm.com>
References: <1475743188-12007-1-git-send-email-mohammed@qca.qualcomm.com>
Message-ID: <c617b703956d4a038349494b87f65d0a@euamsexm01a.eu.qualcomm.com>
Date: Tue, 11 Oct 2016 13:36:22 +0200
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
To: Mohammed Shafi Shajakhan <mohammed@qti.qualcomm.com>
Cc: mohammed@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

TW9oYW1tZWQgU2hhZmkgU2hhamFraGFuIDxtb2hhbW1lZEBxdGkucXVhbGNvbW0uY29tPiB3cm90
ZToKPiBGcm9tOiBNb2hhbW1lZCBTaGFmaSBTaGFqYWtoYW4gPG1vaGFtbWVkQHF0aS5xdWFsY29t
bS5jb20+Cj4gCj4gY2xlYW51cCAnYXRoMTBrX2h0dF90eF9hbGxvYycgYnkgaW50cm9kdWNpbmcg
dGhlIEFQSSdzCj4gJ2F0aDEwa19odHRfdHhfYWxsb2MvZnJlZV97Y29udF90eGJ1ZiwgdHhkb25l
X2ZpZm99IGFuZAo+IHJlLXVzZSB0aGVtIHdoZXJlZXZlciBuZWVkZWQKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBNb2hhbW1lZCBTaGFmaSBTaGFqYWtoYW4gPG1vaGFtbWVkQHF0aS5xdWFsY29tbS5jb20+
CgpBcHBsaWVzIGJ1dCBmYWlscyB0byBidWlsZDoKCmRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9h
dGgxMGsvaHR0X3R4LmM6IEluIGZ1bmN0aW9uIOKAmGF0aDEwa19odHRfdHhfZnJlZeKAmToKZHJp
dmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9odHRfdHguYzo0MjQ6MTk6IGVycm9yOiDigJhz
dHJ1Y3QgYXRoMTBrX2h0dOKAmSBoYXMgbm8gbWVtYmVyIG5hbWVkIOKAmHR4cnhfY29tcGxfdGFz
a+KAmQptYWtlWzVdOiAqKiogW2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsvaHR0X3R4
Lm9dIEVycm9yIDEKbWFrZVs0XTogKioqIFtkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBr
XSBFcnJvciAyCm1ha2VbM106ICoqKiBbZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoXSBFcnJvciAy
Cm1ha2VbMl06ICoqKiBbZHJpdmVycy9uZXQvd2lyZWxlc3NdIEVycm9yIDIKbWFrZVsxXTogKioq
IFtkcml2ZXJzL25ldF0gRXJyb3IgMgptYWtlWzFdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hl
ZCBqb2JzLi4uLgptYWtlOiAqKiogW2RyaXZlcnNdIEVycm9yIDIKCjIgcGF0Y2hlcyBzZXQgdG8g
Q2hhbmdlcyBSZXF1ZXN0ZWQuCgo5MzYzODYzIFt2MiwxLzJdIGF0aDEwazogY2xlYW4gdXAgSFRU
IHR4IGJ1ZmZlciBhbGxvY2F0aW9uIGFuZCBmcmVlCjkzNjM4NjEgW3YyLDIvMl0gYXRoMTBrOiBS
ZW1vdmUgZXh0cmFuZW91cyBlcnJvciBtZXNzYWdlIGluIHR4IGFsbG9jCgotLSAKaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wYXRjaC85MzYzODYzLwoKRG9jdW1lbnRhdGlvbiBhYm91dCBz
dWJtaXR0aW5nIHdpcmVsZXNzIHBhdGNoZXMgYW5kIGNoZWNraW5nIHN0YXR1cwpmcm9tIHBhdGNo
d29yazoKCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9j
dW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
dGgxMGsK
