Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLSog-0007CG-OI
 for ath10k@lists.infradead.org; Fri, 18 Oct 2019 14:01:20 +0000
Received: by mail-lj1-f197.google.com with SMTP id m22so1098641ljj.6
 for <ath10k@lists.infradead.org>; Fri, 18 Oct 2019 07:01:12 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH v2 1/4] mac80211: Rearrange ieee80211_tx_info to make room
 for tx_time_est
In-Reply-To: <9fc60b546b54b40357264d67536733251cf39ebe.camel@sipsolutions.net>
References: <157115993755.2500430.12214017471129215800.stgit@toke.dk>
 <157115993866.2500430.13989567853855880476.stgit@toke.dk>
 <CA+iem5t6xghBocck864nDX2snWQ5O+v6_M2Jc9aCdn_hE+mFCA@mail.gmail.com>
 <87sgnqe4wg.fsf@toke.dk>
 <10b885b3238cede2d99c6134bebcc0c8ba6f6b10.camel@sipsolutions.net>
 <87imomdvsj.fsf@toke.dk>
 <9fc60b546b54b40357264d67536733251cf39ebe.camel@sipsolutions.net>
Date: Fri, 18 Oct 2019 16:01:09 +0200
Message-ID: <87d0eudufu.fsf@toke.dk>
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
To: Johannes Berg <johannes@sipsolutions.net>, Kan Yan <kyan@google.com>
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, Kevin Hayes <kevinhayes@google.com>, make-wifi-fast@lists.bufferbloat.net, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, John Crispin <john@phrozen.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>

Sm9oYW5uZXMgQmVyZyA8am9oYW5uZXNAc2lwc29sdXRpb25zLm5ldD4gd3JpdGVzOgoKPiBPbiBG
cmksIDIwMTktMTAtMTggYXQgMTU6MzEgKzAyMDAsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3
cm90ZToKPgo+PiBXZWxsLCBsZXQncyB0cnkgdG8gZG8gdGhlIGFjdHVhbCBtYXRoLi4uIEEgZnVs
bC1zaXplICgxNTM4IGJ5dGVzKSBwYWNrZXQKPj4gdGFrZXMgfjIwNTAgbWljcm9zZWNvbmRzIHRv
IHRyYW5zbWl0IGF0IDYgTWJwcy4gQWRkaW5nIGluIG92ZXJoZWFkLCBpdCdzCj4+IGNlcnRhaW5s
eSBzdGlsbCBsZXNzIHRoYXQgNDA5NiB1cywgc28gMTIgYml0cyBpcyBwbGVudHkuCj4KPiBXaGF0
IGFib3V0IEEtTVNEVXM/IEJ1dCBJIGd1ZXNzIG1heGltdW0gY29udGlub3VzIHRyYW5zbWlzc2lv
bnMgYXJlIGF0Cj4gbW9zdCA0bXMgYW55d2F5LCBzbyBhIHNpbmdsZSBwYWNrZXQgc2hvdWxkIG5l
dmVyIGJlIGxvbmdlci4KCkFoIHllYWgsIHRob3NlIGNvdWxkIGJlIGEgYml0IGJpZ2dlciwgYnV0
IHllYWgsIDRtcyBzaG91bGQgYXQgbGVhc3QgYmUKZW5vdWdoLgoKPj4gVGhhdCBsZWF2ZXMKPj4g
Zm91ciBiaXRzIGZvciB0aGUgQUNLIHN0YXR1cyBJRCBpZiB3ZSBqdXN0IHNwbGl0IHRoZSB1MTY7
IGlmIHdlIG9ubHkKPj4gZXZlciBoYXZlICJhIGhhbmRmdWwiLCB0aGF0IHNob3VsZCBiZSBlbm91
Z2gsIG5vPwo+Cj4gSXQncyBob3cgbWFueSBhcmUgaW4gZmxpZ2h0IGF0IGEgdGltZSwgMTYgZG9l
c24ndCBzZWVtIGxpa2VseSB0byBoYXBwZW4sCj4gYnV0IEkgZG9uJ3QgcmVhbGx5IGtub3cgd2hh
dCBhcHBsaWNhdGlvbnMgYXJlIGRvaW5nIHdpdGggaXQgbm93Lgo+IFByb2JhYmx5IG9ubHkgd3Bh
X3MgZm9yIHRoZSBFQVBPTCBUWCBzdGF0dXMuCgpSaWdodC4gV2VsbCBpbiB0aGF0IGNhc2UsIGxl
dCdzIHRyeSBpdC4gQXMgbG9uZyBhcyB3ZSBmYWlsIGluIGEKcmVhc29uYWJsZSB3YXksIHdlIGNh
biBqdXN0IHNlZSBpZiB3ZSBydW4gaW50byBhbnl0aGluZyB0aGF0IGJyZWFrcz8gSQpndWVzcyBp
biB0aGlzIGNhc2UgdGhhdCBtZWFucyByZWplY3RpbmcgcmVxdWVzdHMgZnJvbSB1c2Vyc3BhY2Ug
aWYgd2UKcnVuIG91dCBvZiBJRHMgcmF0aGVyIHRoYW4gc2lsZW50bHkgd3JhcHBpbmcgYW5kIHJl
dHVybmluZyB3cm9uZyBkYXRhIDopCgo+PiBXZSBjb3VsZCBhbHNvIHNwbGl0IDUvMTEuIFRoYXQg
d291bGQgc3VwcG9ydCB1cCB0byAzMiBBQ0sgSURzLCBhbmQgd2UKPj4gY2FuIGp1c3QgdHJ1bmNh
dGUgdGhlIGFpcnRpbWUgYXQgMjA0OCB1cywgd2hpY2ggaXMgbm90IGEgYmlnIGRlYWwgSSdkCj4+
IHNheS4KPgo+IFdlIGNhbiBhbHNvIHBsYXkgd2l0aCB0aGUgdW5pdHMgb2YgdGhlIGFpcnRpbWUs
IGUuZy4gbWFraW5nIHRoYXQgYQo+IG11bHRpcGxlIG9mIDIgb3IgNCB1cz8gU2VlbXMgdW5saWtl
bHkgdG8gbWF0dGVyIG11Y2g/CgpTdXJlLCB0aGF0J3MgYSBnb29kIHBvaW50ISBJbmNyZW1lbnRz
IG9mIDR1cyBtZWFucyB3ZSBjYW4gZml0IDRtcyBpcyAxMApiaXRzLCBsZWF2aW5nIHBsZW50eSBv
ZiBzcGFjZSBmb3IgQUNLIElEcyAoaG9wZWZ1bGx5KS4KCkknbGwgcmV3b3JrIHRoZSBzZXJpZXMg
dG8gdXNlIHRoYXQgaW5zdGVhZCA6KQoKLVRva2UKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
YXRoMTBrCg==
