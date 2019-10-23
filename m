Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNDJM-0007lC-GU
 for ath10k@lists.infradead.org; Wed, 23 Oct 2019 09:52:18 +0000
Received: by mail-lf1-f71.google.com with SMTP id c13so4000682lfk.23
 for <ath10k@lists.infradead.org>; Wed, 23 Oct 2019 02:52:06 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH v4 4/4] mac80211: Use Airtime-based Queue Limits (AQL) on
 packet dequeue
In-Reply-To: <87tv7znact.fsf@toke.dk>
References: <157148503415.2989444.7391437309981941226.stgit@toke.dk>
 <157148503865.2989444.7118792679603045723.stgit@toke.dk>
 <CA+iem5sy16=xMZjJi1nKHrxP_xWHk-86G=ZLwtMMb04EOt5tQA@mail.gmail.com>
 <871rv5ovwr.fsf@toke.dk>
 <CA+iem5tZ95Jd9htLEdAJMubuFeWeUibK9MhTnTHLWNucX6_cRg@mail.gmail.com>
 <87tv7znact.fsf@toke.dk>
Date: Wed, 23 Oct 2019 11:52:02 +0200
Message-ID: <87lftbn60t.fsf@toke.dk>
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
To: Kan Yan <kyan@google.com>
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, Make-Wifi-fast <make-wifi-fast@lists.bufferbloat.net>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Johannes Berg <johannes@sipsolutions.net>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHJlZGhhdC5jb20+IHdyaXRlczoKCj4gS2Fu
IFlhbiA8a3lhbkBnb29nbGUuY29tPiB3cml0ZXM6Cj4KPj4+ID4+ICsgICAgICAgICAgICAgICBp
ZiAoaWVlZTgwMjExX2lzX2RhdGFfcW9zKGhkci0+ZnJhbWVfY29udHJvbCkpIHsKPj4+ID4+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHFjID0gaWVlZTgwMjExX2dldF9xb3NfY3RsKGhkcik7Cj4+
PiA+PiArICAgICAgICAgICAgICAgICAgICAgICB0aWQgPSBxY1swXSAmIDB4ZjsKPj4+ID4+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGFjID0gaWVlZTgwMjExX2FjX2Zyb21fdGlkKHRpZCk7Cj4+
PiA+PiArICAgICAgICAgICAgICAgfSBlbHNlIHsKPj4+ID4+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGFjID0gSUVFRTgwMjExX0FDX0JFOwo+Pj4gPj4gKyAgICAgICAgICAgICAgIH0KPj4+ID4K
Pj4+ID4gVGhlIHRpZC9hYyBpcyBpbmNvcnJlY3QgZWl0aGVyIGhlcmUgb3IgaW4gX19pZWVlODAy
MTFfdHhfc3RhdHVzKCkgd2hlbgo+Pj4gPiB0ZXN0ZWQgd2l0aCBhdGgxMGsuIFRoZSBhYyBpcyBz
ZXQgdG8gQUNfQkUgd2l0aCB0ZXN0IGRvbmUgdXNpbmcgQksKPj4+ID4gY2xhc3MgdHJhZmZpYywg
aGVuY2UgdGhlIHBlbmRpbmcgYWlydGltZSBnZXQgdXBkYXRlZCBmb3IgdGhlIHdyb25nCj4+PiA+
IHR4cS4KPj4+Cj4+PiBIdWgsIHdlbGwgdGhhdCB3b24ndCBkbywgb2J2aW91c2x5IDopCj4+Pgo+
Pj4gQW55IGlkZWEgd2h5IGl0IG1pZ2h0IGJlIHdyb25nPwo+Pgo+PiBzb21laG93ICBpZWVlODAy
MTFfaXNfZGF0YV9xb3MoKSByZXR1cm5zIGZhbHNlLiBCZXNpZGVzLCAgcW9zX2NvbnRyb2wKPj4g
ZmllbGQgZG9lc24ndCBzZWVtcyB0byBiZSBzZXQgaW4gaWVlZTgwMjExX2J1aWxkX2hkcigpLgo+
Pgo+Pj4gSG1tLCBJIGd1ZXNzIHdlIGNvdWxkIGp1c3QgZ2V0IHRoZSBhYyB1c2luZyBza2JfZ2V0
X3F1ZXVlX21hcHBpbmcoKS4KPj4+IEknbGwgc2VuZCBhbiB1cGRhdGUgd2l0aCB0aGlzIGZpeGVk
IGZvciB5b3UgdG8gdHJ5IDopCj4+IFRoYW5rcyBmb3IgdGhlIHF1aWNrIHVwZGF0ZS4gSXQgaXMg
Z2V0dGluZyBtdWNoIGJldHRlciwgYnV0Cj4+IHVuZm9ydHVuYXRlbHkgdGhlIHBlbmRpbmcgYWly
dGltZSBhY2NvdW50aW5nIHNvbWV0aW1lcyBpcyBzdGlsbCBub3QKPj4gY29ycmVjdCBhbmQgY2F1
c2UgdHhxIHN0dWNrIG9jY2FzaW9uYWxseS4KPgo+IE9LLCBzbyB0aGF0IGhhcyB0byBtZWFuIHRo
YXQgdGhlcmUgYXJlIHBhY2tldHMgZ2V0dGluZyBkcm9wcGVkIHNvbWV3aGVyZQo+IHdpdGhvdXQg
Z29pbmcgdGhyb3VnaCBpZWVlODAyMTFfcmVwb3J0X3VzZWRfc2tiKCkuIEFzc3VtaW5nIHlvdSdy
ZSBub3QKPiBoaXR0aW5nIHRoZSB1bmRlcmZsb3cgd2FybmluZ3MsIGp1c3Qgc2VlaW5nIHRoZSBj
b3VudGVyIG5vdCBnZXQgYmFjawo+IGRvd24gdG8gemVybz8KPgo+IENvdWxkIHlvdSBzZWUgaWYg
eW91IGNhbiBmaW5kIG91dCBpZiBhdGgxMGsgZG9lcyB0aGF0IGFueXdoZXJlPyBJJ2xsIGdvCj4g
aHVudGluZyBpbiBtYWM4MDIxMS4KPgo+IExvb2tpbmcgZm9yIGNhbGxzIHRvIGtmcmVlX3NrYigp
IG9yIGtmcmVlX3NrYl9saXN0KCkgc2hvdWxkIGhvcGVmdWxseQo+IHR1cm4gdXAgc29tZXRoaW5n
Li4uCgpBaGEhIFR1cm5zIG91dCBJIHdhcyBkb2luZyB0aGUgc3RhIGxvb2t1cCBjb21wbGV0ZWx5
IHdyb25nIGluCmllZWU4MDIxMV9yZXBvcnRfdXNlZF9za2IoKTsgc28gYW55dGhpbmcgZnJhbWVz
IHRoYXQgd2VyZSBkcm9wcGVkIGFuZAp3ZW50IHRocm91Z2ggdGhlcmUgd291bGQgbm90IGdldCBp
dHMgYWlydGltZSBzdWJ0cmFjdGVkIGNvcnJlY3RseS4gV2lsbApzZW5kIGEgdjYgd2l0aCBhIGZp
eCA6KQoKLVRva2UKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
