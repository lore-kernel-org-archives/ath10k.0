Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x235.google.com ([2a00:1450:4008:c01::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WGRjA-0002Ls-OC
 for ath10k@lists.infradead.org; Thu, 20 Feb 2014 11:23:41 +0000
Received: by mail-bk0-f53.google.com with SMTP id my13so585120bkb.12
 for <ath10k@lists.infradead.org>; Thu, 20 Feb 2014 03:23:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87lhx7xhno.fsf@kamboji.qca.qualcomm.com>
References: <1392629563-31046-1-git-send-email-michal.kazior@tieto.com>
 <1392629563-31046-6-git-send-email-michal.kazior@tieto.com>
 <87lhx7xhno.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 20 Feb 2014 12:23:10 +0100
Message-ID: <CA+BoTQ=yRjvA9ZN6Dizp-Vf8_GRJE79uMfsVXNaNaidUchukfQ@mail.gmail.com>
Subject: Re: [RFC/RFT 5/7] ath10k: batch htt tx/rx completions
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTkgRmVicnVhcnkgMjAxNCAxNjoxMCwgS2FsbGUgVmFsbyA8a3ZhbG9AcWNhLnF1YWxjb21t
LmNvbT4gd3JvdGU6Cj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+IHdy
aXRlczoKPgo+PiBIVFQgUnggZW5kcG9pbnQgcHJvY2Vzc2VzIGJvdGggZnJhbWUgcngKPj4gaW5k
aWNhdGlvbnMgYW5kIGZyYW1lIHR4IGNvbXBsZXRpb24gaW5kaWNhdGlvbnMuCj4+Cj4+IFRob3Nl
IGNvbXBsZXRpb25zIHR5cGljYWxseSBjb21lIGluIGJhdGNoZXMgYW5kCj4+IG1heSBiZSBtaXhl
ZCBzbyBpdCBtYWtlcyBzZW5zZSB0byBkZWZlciBwcm9jZXNzaW5nCj4+IGhvcGluZyB0byBnZXQg
YSBidW5jaCBvZiB0aGVtIGFuZCB0YWtlIGFkdmFudGFnZQo+PiBvZiBob3QgY2FjaGVzLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWwgS2F6aW9yIDxtaWNoYWwua2F6aW9yQHRpZXRvLmNvbT4K
Pgo+IFsuLi5dCj4KPj4gQEAgLTI3MCw3ICsyNzQsNyBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCBz
a19idWZmICphdGgxMGtfaHR0X3J4X25ldGJ1Zl9wb3Aoc3RydWN0IGF0aDEwa19odHQgKmh0dCkK
Pj4gICAgICAgaW50IGlkeDsKPj4gICAgICAgc3RydWN0IHNrX2J1ZmYgKm1zZHU7Cj4+Cj4+IC0g
ICAgIHNwaW5fbG9ja19iaCgmaHR0LT5yeF9yaW5nLmxvY2spOwo+PiArICAgICBsb2NrZGVwX2Fz
c2VydF9oZWxkKCZodHQtPnJ4X3JpbmcubG9jayk7Cj4KPiBUaGVyZSBhcmUgc29tZSBsb2NraW5n
IGNoYW5nZXMgd2hpY2ggSSB0aGluayB3b3VsZCBiZSBiZXR0ZXIgdG8gaGF2ZSBpbgo+IGEgc2Vw
YXJhdGUgcGF0Y2guCgpJIGRvbid0IHRoaW5rIGl0IG1ha2VzIG11Y2ggc2Vuc2UuIEl0IHNlZW1z
IHNpbGx5IHRvIG1vdmUgYSBmZXcgbGluZXMKaW4gb25lIHBhdGNoIHRvIG1vdmUgc29tZSBvZiB0
aG9zZSBsaW5lcyBhZ2FpbiBpbiBhbm90aGVyIG9uZS4KCgo+PiAgICAgICBjYXNlIEhUVF9UMkhf
TVNHX1RZUEVfTUdNVF9UWF9DT01QTEVUSU9OOiB7Cj4+ICsgICAgICAgICAgICAgc3RydWN0IGh0
dF9yZXNwICpyZXNwID0gKHN0cnVjdCBodHRfcmVzcCAqKXNrYi0+ZGF0YTsKPj4gICAgICAgICAg
ICAgICBzdHJ1Y3QgaHR0X3R4X2RvbmUgdHhfZG9uZSA9IHt9Owo+PiAgICAgICAgICAgICAgIGlu
dCBzdGF0dXMgPSBfX2xlMzJfdG9fY3B1KHJlc3AtPm1nbXRfdHhfY29tcGxldGlvbi5zdGF0dXMp
Owo+Pgo+PiAtICAgICAgICAgICAgIHR4X2RvbmUubXNkdV9pZCA9Cj4+IC0gICAgICAgICAgICAg
ICAgICAgICBfX2xlMzJfdG9fY3B1KHJlc3AtPm1nbXRfdHhfY29tcGxldGlvbi5kZXNjX2lkKTsK
Pj4gKyAgICAgICAgICAgICB0eF9kb25lLm1zZHVfaWQgPSBfX2xlMzJfdG9fY3B1KHJlc3AtPm1n
bXRfdHhfY29tcGxldGlvbi5kZXNjX2lkKTsKPgo+IEkgZG9uJ3Qgc2VlIGFueSBjaGFuZ2VzIGhl
cmUuCgpSaWdodC4gSSdsbCBjdXQgdGhpcyBodW5rIG91dC4KCgpNaWNoYcWCCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0
CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
