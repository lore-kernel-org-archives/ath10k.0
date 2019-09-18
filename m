Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAWnJ-0001lr-E5
 for ath10k@lists.infradead.org; Wed, 18 Sep 2019 10:02:42 +0000
MIME-Version: 1.0
Date: Wed, 18 Sep 2019 18:02:40 +0800
From: Yibo Zhao <yiboz@codeaurora.org>
Subject: Re: [PATCH 3/4] mac80211: fix low throughput in push pull mode
In-Reply-To: <87lfumiq3w.fsf@toke.dk>
References: <1568639388-27291-1-git-send-email-yiboz@codeaurora.org>
 <1568639388-27291-3-git-send-email-yiboz@codeaurora.org>
 <6684ceecde399edeb31c594f889a403440c78142.camel@sipsolutions.net>
 <8e4cd872d082c6bce598c87411a2125f@codeaurora.org> <87lfumiq3w.fsf@toke.dk>
Message-ID: <595c99a36c4f3e3eb131894d85c09746@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Cc: linux-wireless-owner@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

T24gMjAxOS0wOS0xOCAwNToxMiwgVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIHdyb3RlOgo+IFlp
Ym8gWmhhbyA8eWlib3pAY29kZWF1cm9yYS5vcmc+IHdyaXRlczoKPiAKPj4gT24gMjAxOS0wOS0x
NiAyMzoyNywgSm9oYW5uZXMgQmVyZyB3cm90ZToKPj4+IFdpdGhvdXQgcmVhbGx5IGxvb2tpbmcg
YXQgdGhlIGNvZGUgLQo+Pj4gCj4+Pj4gSWYgc3RhdGlvbiBpcyBpbmVsaWdpYmxlIGZvciB0cmFu
c21pc3Npb24gaW4KPj4+PiBpZWVlODAyMTFfdHhxX21heV90cmFuc21pdCgpLAo+Pj4+IG5vIHBh
Y2tldCB3aWxsIGJlIGRlbGl2ZXJlZCB0byBGVy4gRHVyaW5nIHRoZSB0ZXN0cyBpbiBwdXNoLXB1
bGwgCj4+Pj4gbW9kZQo+Pj4+IHdpdGgKPj4+PiBtYW55IGNsaWVudHMsIGFmdGVyIHNldmVyYWwg
c2Vjb25kcywgbm90IGEgc2luZ2xlIHN0YXRpb24gaXMgYW4KPj4+PiBlbGlnaWJsZQo+Pj4+IGNh
bmRpZGF0ZSBmb3IgdHJhbnNtaXNzaW9uIHNpbmNlIGdsb2JhbCB0aW1lIGlzIHNtYWxsZXIgdGhh
biBhbGwgdGhlCj4+Pj4gc3RhdGlvbidzIHZpcnR1YWwgYWlydGltZS4gQXMgYSBjb25zZXF1ZW5j
ZSwgdGhlIFR4IGhhcyBiZWVuIGJsb2NrZWQKPj4+PiBhbmQKPj4+PiB0aHJvdWdocHV0IGlzIHF1
aXRlIGxvdy4KPj4+IAo+Pj4gWW91IHNob3VsZCByZXdyaXRlIHRoaXMgdG8gYmUsIGVybSwgYSBi
aXQgbW9yZSB1bmRlcnN0YW5kYWJsZSBpbgo+Pj4gbWFjODAyMTEgY29udGV4dC4gSSBhc3N1bWUg
eW91J3JlIHNwZWFraW5nIChtb3N0bHk/KSBhYm91dCBhdGgxMGssIAo+Pj4gYnV0Cj4+PiBJCj4+
PiBoYXZlIHZlcnkgbGl0dGxlIGNvbnRleHQgdGhlcmUuICJwdXNoIHB1bGwgbW9kZSI/ICJmaXJt
d2FyZSI/IFRoZXNlCj4+PiB0aGluZ3MgYXJlIG5vdCBzb21ldGhpbmcgbWFjODAyMTEga25vd3Mg
YWJvdXQuCj4+IEhpIEpvaGFubmVzLAo+PiAKPj4gVGhhbmtzIGZvciB5b3VyIGtpbmRseSByZW1p
bmRlci4gV2lsbCByZXdyaXRlIHRoZSBjb21taXQgbG9nLgo+PiAKPj4+IAo+Pj4+IENvLWRldmVs
b3BlZC1ieTogWWlibyBaaGFvIDx5aWJvekBjb2RlYXVyb3JhLm9yZz4KPj4+IAo+Pj4gVGhhdCBh
bHNvIHNlZW1zIHdyb25nLCBzaG91bGQgYmUgVG9rZSBJIGd1ZXNzLCB1bmxlc3MgeW91IGludGVu
ZGVkIAo+Pj4gZm9yCj4+PiBhCj4+PiBGcm9tOiBUb2tlIHRvIGJlIHByZXNlbnQ/Cj4+IERvIHlv
dSBtZWFuIGl0IHNob3VsZCBiZSBzb21ldGhpbmcgbGlrZToKPj4gCj4+IENvLWRldmVsb3BlZC1i
eTogVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHRva2UuZGs+Cj4+IFNpZ25lZC1vZmYt
Ynk6IFlpYm8gWmhhbyA8eWlib3pAY29kZWF1cm9yYS5vcmc+Cj4+IFNpZ25lZC1vZmYtYnk6IFRv
a2UgSMO4aWxhbmQtSsO4cmdlbnNlbiA8dG9rZUB0b2tlLmRrPgo+PiAKPj4gQW0gSSB1bmRlcnN0
YW5kaW5nIHJpZ2h0Pwo+IAo+IEkgdGhpbmsgdGhlIHJpZ2h0IHRoaW5nIGhlcmUsIGFzIHdpdGgg
dGhlIHByZXZpb3VzIHBhdGNoLCBpcyB0byBqdXN0Cj4gZHJvcCBteSBzaWduLW9mZjsgeW91J3Jl
IHdyaXRpbmcgdGhpcyBwYXRjaCwgYW5kIEknbGwgYWRkIGFjay9yZXZpZXdzIAo+IGFzCj4gYXBw
cm9wcmlhdGUuIEFuZCBpbiB0aGF0IGNhc2UsIHdlbGwsIG5vIG5lZWQgdG8gaGF2ZSBjby1kZXZl
bG9wZWQtYnkKPiB5b3Vyc2VsZiB3aGVuIHlvdXIgbmFtZSBpcyBvbiB0aGUgcGF0Y2ggYXMgYXV0
aG9yIDopCj4gCj4gLVRva2UKU29ycnksIEkgdGhpbmsgSSBoYXZlIG1pc3NlZCBjaGVja2luZyB5
b3VyIHJlcGx5LCBwbGVhc2UgaWdub3JlIHRoZSAKd3Jvbmcgc2lnbmVkLW9mZiBpbiBQQVRDSC1W
Mi4KCi0tIApZaWJvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
