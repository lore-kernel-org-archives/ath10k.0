Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAX0N-0006eJ-Ny
 for ath10k@lists.infradead.org; Wed, 18 Sep 2019 10:16:13 +0000
Received: by mail-ed1-f71.google.com with SMTP id v5so4100511edr.9
 for <ath10k@lists.infradead.org>; Wed, 18 Sep 2019 03:16:07 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH 3/4] mac80211: fix low throughput in push pull mode
In-Reply-To: <595c99a36c4f3e3eb131894d85c09746@codeaurora.org>
References: <1568639388-27291-1-git-send-email-yiboz@codeaurora.org>
 <1568639388-27291-3-git-send-email-yiboz@codeaurora.org>
 <6684ceecde399edeb31c594f889a403440c78142.camel@sipsolutions.net>
 <8e4cd872d082c6bce598c87411a2125f@codeaurora.org> <87lfumiq3w.fsf@toke.dk>
 <595c99a36c4f3e3eb131894d85c09746@codeaurora.org>
Date: Wed, 18 Sep 2019 12:16:04 +0200
Message-ID: <871rwdj4ez.fsf@toke.dk>
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
To: Yibo Zhao <yiboz@codeaurora.org>
Cc: linux-wireless-owner@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

WWlibyBaaGFvIDx5aWJvekBjb2RlYXVyb3JhLm9yZz4gd3JpdGVzOgoKPiBPbiAyMDE5LTA5LTE4
IDA1OjEyLCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gd3JvdGU6Cj4+IFlpYm8gWmhhbyA8eWli
b3pAY29kZWF1cm9yYS5vcmc+IHdyaXRlczoKPj4gCj4+PiBPbiAyMDE5LTA5LTE2IDIzOjI3LCBK
b2hhbm5lcyBCZXJnIHdyb3RlOgo+Pj4+IFdpdGhvdXQgcmVhbGx5IGxvb2tpbmcgYXQgdGhlIGNv
ZGUgLQo+Pj4+IAo+Pj4+PiBJZiBzdGF0aW9uIGlzIGluZWxpZ2libGUgZm9yIHRyYW5zbWlzc2lv
biBpbgo+Pj4+PiBpZWVlODAyMTFfdHhxX21heV90cmFuc21pdCgpLAo+Pj4+PiBubyBwYWNrZXQg
d2lsbCBiZSBkZWxpdmVyZWQgdG8gRlcuIER1cmluZyB0aGUgdGVzdHMgaW4gcHVzaC1wdWxsIAo+
Pj4+PiBtb2RlCj4+Pj4+IHdpdGgKPj4+Pj4gbWFueSBjbGllbnRzLCBhZnRlciBzZXZlcmFsIHNl
Y29uZHMsIG5vdCBhIHNpbmdsZSBzdGF0aW9uIGlzIGFuCj4+Pj4+IGVsaWdpYmxlCj4+Pj4+IGNh
bmRpZGF0ZSBmb3IgdHJhbnNtaXNzaW9uIHNpbmNlIGdsb2JhbCB0aW1lIGlzIHNtYWxsZXIgdGhh
biBhbGwgdGhlCj4+Pj4+IHN0YXRpb24ncyB2aXJ0dWFsIGFpcnRpbWUuIEFzIGEgY29uc2VxdWVu
Y2UsIHRoZSBUeCBoYXMgYmVlbiBibG9ja2VkCj4+Pj4+IGFuZAo+Pj4+PiB0aHJvdWdocHV0IGlz
IHF1aXRlIGxvdy4KPj4+PiAKPj4+PiBZb3Ugc2hvdWxkIHJld3JpdGUgdGhpcyB0byBiZSwgZXJt
LCBhIGJpdCBtb3JlIHVuZGVyc3RhbmRhYmxlIGluCj4+Pj4gbWFjODAyMTEgY29udGV4dC4gSSBh
c3N1bWUgeW91J3JlIHNwZWFraW5nIChtb3N0bHk/KSBhYm91dCBhdGgxMGssIAo+Pj4+IGJ1dAo+
Pj4+IEkKPj4+PiBoYXZlIHZlcnkgbGl0dGxlIGNvbnRleHQgdGhlcmUuICJwdXNoIHB1bGwgbW9k
ZSI/ICJmaXJtd2FyZSI/IFRoZXNlCj4+Pj4gdGhpbmdzIGFyZSBub3Qgc29tZXRoaW5nIG1hYzgw
MjExIGtub3dzIGFib3V0Lgo+Pj4gSGkgSm9oYW5uZXMsCj4+PiAKPj4+IFRoYW5rcyBmb3IgeW91
ciBraW5kbHkgcmVtaW5kZXIuIFdpbGwgcmV3cml0ZSB0aGUgY29tbWl0IGxvZy4KPj4+IAo+Pj4+
IAo+Pj4+PiBDby1kZXZlbG9wZWQtYnk6IFlpYm8gWmhhbyA8eWlib3pAY29kZWF1cm9yYS5vcmc+
Cj4+Pj4gCj4+Pj4gVGhhdCBhbHNvIHNlZW1zIHdyb25nLCBzaG91bGQgYmUgVG9rZSBJIGd1ZXNz
LCB1bmxlc3MgeW91IGludGVuZGVkIAo+Pj4+IGZvcgo+Pj4+IGEKPj4+PiBGcm9tOiBUb2tlIHRv
IGJlIHByZXNlbnQ/Cj4+PiBEbyB5b3UgbWVhbiBpdCBzaG91bGQgYmUgc29tZXRoaW5nIGxpa2U6
Cj4+PiAKPj4+IENvLWRldmVsb3BlZC1ieTogVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tl
QHRva2UuZGs+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBZaWJvIFpoYW8gPHlpYm96QGNvZGVhdXJvcmEu
b3JnPgo+Pj4gU2lnbmVkLW9mZi1ieTogVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHRv
a2UuZGs+Cj4+PiAKPj4+IEFtIEkgdW5kZXJzdGFuZGluZyByaWdodD8KPj4gCj4+IEkgdGhpbmsg
dGhlIHJpZ2h0IHRoaW5nIGhlcmUsIGFzIHdpdGggdGhlIHByZXZpb3VzIHBhdGNoLCBpcyB0byBq
dXN0Cj4+IGRyb3AgbXkgc2lnbi1vZmY7IHlvdSdyZSB3cml0aW5nIHRoaXMgcGF0Y2gsIGFuZCBJ
J2xsIGFkZCBhY2svcmV2aWV3cyAKPj4gYXMKPj4gYXBwcm9wcmlhdGUuIEFuZCBpbiB0aGF0IGNh
c2UsIHdlbGwsIG5vIG5lZWQgdG8gaGF2ZSBjby1kZXZlbG9wZWQtYnkKPj4geW91cnNlbGYgd2hl
biB5b3VyIG5hbWUgaXMgb24gdGhlIHBhdGNoIGFzIGF1dGhvciA6KQo+PiAKPj4gLVRva2UKPiBT
b3JyeSwgSSB0aGluayBJIGhhdmUgbWlzc2VkIGNoZWNraW5nIHlvdXIgcmVwbHksIHBsZWFzZSBp
Z25vcmUgdGhlIAo+IHdyb25nIHNpZ25lZC1vZmYgaW4gUEFUQ0gtVjIuCgpXaGlsZSB5b3UncmUg
cmUtc3Bpbm5pbmcsIGNvdWxkIHlvdSBwbGVhc2UgYWRkIGEgY2hhbmdlbG9nIGZvciB0aGUKY2hh
bmdlcyB5b3UgbWFrZT8gTWFrZXMgaXQgZWFzaWVyIHRvIGtlZXAgdHJhY2sgOikKCllvdSBjYW4g
YWRkIGEgY292ZXItbGV0dGVyIHdpdGggYSBmdWxsIGNoYW5nZWxvZyBpbnN0ZWFkIG9mIGhhdmlu
ZyBhCnNlcGFyYXRlIGNoYW5nZWxvZyBmb3IgZWFjaCBwYXRjaDsgdGhhdCdzIHdoYXQgSSB1c3Vh
bGx5IGRvLi4uCgotVG9rZQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
