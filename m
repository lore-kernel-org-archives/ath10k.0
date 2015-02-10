Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-f175.google.com ([74.125.82.175])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YL41L-0001qP-Mt
 for ath10k@lists.infradead.org; Tue, 10 Feb 2015 06:10:05 +0000
Received: by mail-we0-f175.google.com with SMTP id x3so6442189wes.6
 for <ath10k@lists.infradead.org>; Mon, 09 Feb 2015 22:09:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54D8DA6F.7040805@candelatech.com>
References: <1423224354-24955-1-git-send-email-michal.kazior@tieto.com>
 <54D4E89A.7040602@candelatech.com>
 <CA+BoTQ=HqyGKOBdOmpWOn_VjH1UTWF9nN_PE0uanaGsdeJmB6Q@mail.gmail.com>
 <54D8DA6F.7040805@candelatech.com>
Date: Tue, 10 Feb 2015 07:09:36 +0100
Message-ID: <CA+BoTQk9C_7efUs6VTZrEz5ECxsvCgfA8ObrAXKjqMpTL8pggA@mail.gmail.com>
Subject: Re: [RFT] ath10k: restart fw on tx-credit timeout
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
To: Ben Greear <greearb@candelatech.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Matti Laakso <malaakso@elisanet.fi>

T24gOSBGZWJydWFyeSAyMDE1IGF0IDE3OjAzLCBCZW4gR3JlZWFyIDxncmVlYXJiQGNhbmRlbGF0
ZWNoLmNvbT4gd3JvdGU6Cj4gT24gMDIvMDgvMjAxNSAxMDoyNCBQTSwgTWljaGFsIEthemlvciB3
cm90ZToKPj4gT24gNiBGZWJydWFyeSAyMDE1IGF0IDE3OjE1LCBCZW4gR3JlZWFyIDxncmVlYXJi
QGNhbmRlbGF0ZWNoLmNvbT4gd3JvdGU6ClsuLi5dCj4+PiBBdCBsZWFzdCBpbiBteSB0ZXN0cywg
SSBjb3VsZCBjb250aW51ZQo+Pj4gdG8gcmVjZWl2ZSBuZXR3b3JrIHRyYWZmaWMgd2hpbGUgV01J
IHdhcyBibG9ja2VkLgo+Pgo+Pgo+PiBZZWFoLiBUcmFmZmljIHdvcmtzIHdpdGggdGhlIHR4LWNy
ZWRpdCBzdGFydmF0aW9uIGFzIHdlbGwgYnV0IHdoYXQKPj4gZ29vZCBpcyB0aGlzIGlmIHlvdSBo
YXZlIGluY29uc2lzdGVudCBkcml2ZXItZmlybXdhcmUgc3RhdGUgYWZ0ZXIKPj4gZmFpbGluZyB0
byBzZW5kIGEgZmV3IGNvbW1hbmRzPwo+Cj4KPiBJIGp1c3QgbWVudGlvbiBpdCBiZWNhdXNlIHNv
bWVvbmUgZGVidWdnaW5nIHRoZSBzeXN0ZW0gbWlnaHQKPiB3b25kZXIgd2h5IHRoZSBmaXJtd2Fy
ZSBpcyAnbG9ja2VkIHVwJyB3aGlsZSBpdCBpcyBzdGlsbCBwYXNzaW5nIHRyYWZmaWMuCgpJIG1p
Z2h0IGFzIHdlbGwgaW5jbHVkZSB0aGlzIGluZm8gaW4gdGhlIGNvbW1pdCBsb2cuCgoKPiBJZiBp
dCBpcyBqdXN0IHBvd2Vyc2F2ZSBpc3N1ZSwgY291bGQgeW91IGZvcmNlIChvdmVycmlkaW5nIHdt
aSB0eC1jcmVkaXRzCj4gbGltaXQpCj4gYSBmbHVzaCBhdCB0aGUgMSBzZWNvbmQgbWFyayBhbmQg
aG9wZSBpdCByZWNvdmVycyBieSAzIHNlY29uZCB0aW1lb3V0PwoKV2VsbCwgdGhlcmUncyBhIGNv
dXBsZSBvZiBwcm9ibGVtcyB3aXRoIHRoYXQuCgoxKSB5b3Ugc3VnZ2VzdCB0byBjYWxsIHdtaV9m
bHVzaCgpIHdoaWNoIGNhbGxzIHdtaV9jbWRfc2VuZCgpICp3aGlsZSoKaW4gd21pX2NtZF9zZW5k
KCksCjIpIHlvdSdyZSBvdXQgb2YgY3JlZGl0cywgaG93IGRvIHlvdSBpbnRlbmQgdG8gc3VibWl0
IGEgZnJhbWUsCjMpIHllcywgeW91IGNhbiBmb3JjZSBpdCwgYnV0IHRoYXQncyBzdXBlciB1Z2x5
LAo0KSBhbmQgdGhpcyBzdGlsbCBkb2Vzbid0IGd1YXJhbnRlZSB5b3UnbGwgZ2V0IHlvdXIgdHgt
Y3JlZGl0IGR1ZSB0bwpmaXJtd2FyZSBxdWlya2luZXNzLgoKKGJ1dCBtYXliZSB0aGUgbGF0ZXN0
IDEwLjIuNCBiZWhhdmVzIGRpZmZlcmVudGx5PyB3aG8ga25vd3MuLikKCk15IG9yaWdpbmFsIHN0
YWIgYXQgdGhpcyBpbnZvbHZlZCBhIHByb2FjdGl2ZSBmbHVzaGluZyBidXQgaXQgaGFkIGl0J3MK
cHJvYmxlbXMgKGRlbGF5ZWQgbWdtdCBmcmFtZXMsIGNvdWxkIHN0aWxsIGdldCBzdHVjayBpbiBy
YXJlIGNhc2VzKS4KCgpNaWNoYcWCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
