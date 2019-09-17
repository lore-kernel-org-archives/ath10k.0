Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAKmQ-0007nD-8B
 for ath10k@lists.infradead.org; Tue, 17 Sep 2019 21:12:59 +0000
Received: by mail-ed1-f69.google.com with SMTP id c90so2958577edf.17
 for <ath10k@lists.infradead.org>; Tue, 17 Sep 2019 14:12:53 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH 3/4] mac80211: fix low throughput in push pull mode
In-Reply-To: <8e4cd872d082c6bce598c87411a2125f@codeaurora.org>
References: <1568639388-27291-1-git-send-email-yiboz@codeaurora.org>
 <1568639388-27291-3-git-send-email-yiboz@codeaurora.org>
 <6684ceecde399edeb31c594f889a403440c78142.camel@sipsolutions.net>
 <8e4cd872d082c6bce598c87411a2125f@codeaurora.org>
Date: Tue, 17 Sep 2019 23:12:51 +0200
Message-ID: <87lfumiq3w.fsf@toke.dk>
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
To: Yibo Zhao <yiboz@codeaurora.org>, Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

WWlibyBaaGFvIDx5aWJvekBjb2RlYXVyb3JhLm9yZz4gd3JpdGVzOgoKPiBPbiAyMDE5LTA5LTE2
IDIzOjI3LCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+PiBXaXRob3V0IHJlYWxseSBsb29raW5nIGF0
IHRoZSBjb2RlIC0KPj4gCj4+PiBJZiBzdGF0aW9uIGlzIGluZWxpZ2libGUgZm9yIHRyYW5zbWlz
c2lvbiBpbiAKPj4+IGllZWU4MDIxMV90eHFfbWF5X3RyYW5zbWl0KCksCj4+PiBubyBwYWNrZXQg
d2lsbCBiZSBkZWxpdmVyZWQgdG8gRlcuIER1cmluZyB0aGUgdGVzdHMgaW4gcHVzaC1wdWxsIG1v
ZGUgCj4+PiB3aXRoCj4+PiBtYW55IGNsaWVudHMsIGFmdGVyIHNldmVyYWwgc2Vjb25kcywgbm90
IGEgc2luZ2xlIHN0YXRpb24gaXMgYW4gCj4+PiBlbGlnaWJsZQo+Pj4gY2FuZGlkYXRlIGZvciB0
cmFuc21pc3Npb24gc2luY2UgZ2xvYmFsIHRpbWUgaXMgc21hbGxlciB0aGFuIGFsbCB0aGUKPj4+
IHN0YXRpb24ncyB2aXJ0dWFsIGFpcnRpbWUuIEFzIGEgY29uc2VxdWVuY2UsIHRoZSBUeCBoYXMg
YmVlbiBibG9ja2VkIAo+Pj4gYW5kCj4+PiB0aHJvdWdocHV0IGlzIHF1aXRlIGxvdy4KPj4gCj4+
IFlvdSBzaG91bGQgcmV3cml0ZSB0aGlzIHRvIGJlLCBlcm0sIGEgYml0IG1vcmUgdW5kZXJzdGFu
ZGFibGUgaW4KPj4gbWFjODAyMTEgY29udGV4dC4gSSBhc3N1bWUgeW91J3JlIHNwZWFraW5nICht
b3N0bHk/KSBhYm91dCBhdGgxMGssIGJ1dCAKPj4gSQo+PiBoYXZlIHZlcnkgbGl0dGxlIGNvbnRl
eHQgdGhlcmUuICJwdXNoIHB1bGwgbW9kZSI/ICJmaXJtd2FyZSI/IFRoZXNlCj4+IHRoaW5ncyBh
cmUgbm90IHNvbWV0aGluZyBtYWM4MDIxMSBrbm93cyBhYm91dC4KPiBIaSBKb2hhbm5lcywKPgo+
IFRoYW5rcyBmb3IgeW91ciBraW5kbHkgcmVtaW5kZXIuIFdpbGwgcmV3cml0ZSB0aGUgY29tbWl0
IGxvZy4KPgo+PiAKPj4+IENvLWRldmVsb3BlZC1ieTogWWlibyBaaGFvIDx5aWJvekBjb2RlYXVy
b3JhLm9yZz4KPj4gCj4+IFRoYXQgYWxzbyBzZWVtcyB3cm9uZywgc2hvdWxkIGJlIFRva2UgSSBn
dWVzcywgdW5sZXNzIHlvdSBpbnRlbmRlZCBmb3IgCj4+IGEKPj4gRnJvbTogVG9rZSB0byBiZSBw
cmVzZW50Pwo+IERvIHlvdSBtZWFuIGl0IHNob3VsZCBiZSBzb21ldGhpbmcgbGlrZToKPgo+IENv
LWRldmVsb3BlZC1ieTogVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHRva2UuZGs+Cj4g
U2lnbmVkLW9mZi1ieTogWWlibyBaaGFvIDx5aWJvekBjb2RlYXVyb3JhLm9yZz4KPiBTaWduZWQt
b2ZmLWJ5OiBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gPHRva2VAdG9rZS5kaz4KPgo+IEFtIEkg
dW5kZXJzdGFuZGluZyByaWdodD8KCkkgdGhpbmsgdGhlIHJpZ2h0IHRoaW5nIGhlcmUsIGFzIHdp
dGggdGhlIHByZXZpb3VzIHBhdGNoLCBpcyB0byBqdXN0CmRyb3AgbXkgc2lnbi1vZmY7IHlvdSdy
ZSB3cml0aW5nIHRoaXMgcGF0Y2gsIGFuZCBJJ2xsIGFkZCBhY2svcmV2aWV3cyBhcwphcHByb3By
aWF0ZS4gQW5kIGluIHRoYXQgY2FzZSwgd2VsbCwgbm8gbmVlZCB0byBoYXZlIGNvLWRldmVsb3Bl
ZC1ieQp5b3Vyc2VsZiB3aGVuIHlvdXIgbmFtZSBpcyBvbiB0aGUgcGF0Y2ggYXMgYXV0aG9yIDop
CgotVG9rZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
