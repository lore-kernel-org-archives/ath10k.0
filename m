Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-1.mimecast.com ([205.139.110.61]
 helo=us-smtp-delivery-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLT91-0000IE-Ui
 for ath10k@lists.infradead.org; Fri, 18 Oct 2019 14:22:21 +0000
Received: by mail-lf1-f71.google.com with SMTP id m17so1314726lfl.11
 for <ath10k@lists.infradead.org>; Fri, 18 Oct 2019 07:22:16 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH v2 1/4] mac80211: Rearrange ieee80211_tx_info to make room
 for tx_time_est
In-Reply-To: <e2c54294fa5ac7b48e6099b47385a5f4df0859ce.camel@sipsolutions.net>
References: <157115993755.2500430.12214017471129215800.stgit@toke.dk>
 <157115993866.2500430.13989567853855880476.stgit@toke.dk>
 <CA+iem5t6xghBocck864nDX2snWQ5O+v6_M2Jc9aCdn_hE+mFCA@mail.gmail.com>
 <87sgnqe4wg.fsf@toke.dk>
 <10b885b3238cede2d99c6134bebcc0c8ba6f6b10.camel@sipsolutions.net>
 <87imomdvsj.fsf@toke.dk>
 <9fc60b546b54b40357264d67536733251cf39ebe.camel@sipsolutions.net>
 <87d0eudufu.fsf@toke.dk>
 <e2c54294fa5ac7b48e6099b47385a5f4df0859ce.camel@sipsolutions.net>
Date: Fri, 18 Oct 2019 16:22:14 +0200
Message-ID: <87a79ydtgp.fsf@toke.dk>
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
cmksIDIwMTktMTAtMTggYXQgMTY6MDEgKzAyMDAsIFRva2UgSMO4aWxhbmQtSsO4cmdlbnNlbiB3
cm90ZToKPgo+PiBSaWdodC4gV2VsbCBpbiB0aGF0IGNhc2UsIGxldCdzIHRyeSBpdC4gQXMgbG9u
ZyBhcyB3ZSBmYWlsIGluIGEKPj4gcmVhc29uYWJsZSB3YXksIHdlIGNhbiBqdXN0IHNlZSBpZiB3
ZSBydW4gaW50byBhbnl0aGluZyB0aGF0IGJyZWFrcz8gSQo+PiBndWVzcyBpbiB0aGlzIGNhc2Ug
dGhhdCBtZWFucyByZWplY3RpbmcgcmVxdWVzdHMgZnJvbSB1c2Vyc3BhY2UgaWYgd2UKPj4gcnVu
IG91dCBvZiBJRHMgcmF0aGVyIHRoYW4gc2lsZW50bHkgd3JhcHBpbmcgYW5kIHJldHVybmluZyB3
cm9uZyBkYXRhIDopCj4KPiBXZSBjYW4ndCByZWplY3QgZHVlIHRvIGhvdyB0aGlzIHdvcmtzLCBi
dXQgaWYgdGhlIGlkcl9hbGxvYygpIGZhaWxzIHRoZW4KPiB3ZSdsbCBqdXN0IG5vdCBnaXZlIGEg
c3RhdHVzIGJhY2sgdG8gdXNlcnNwYWNlIGxhdGVyLgoKT0ssIEkgZ3Vlc3Mgc29tZW9uZSB3aWxs
IG5vdGljZSBpZiB0aGF0IHN1ZGRlbmx5IHN0YXJ0cyBoYXBwZW5pbmcgYWxsCnRoZSB0aW1lIDsp
Cgo+PiA+ID4gV2UgY291bGQgYWxzbyBzcGxpdCA1LzExLiBUaGF0IHdvdWxkIHN1cHBvcnQgdXAg
dG8gMzIgQUNLIElEcywgYW5kIHdlCj4+ID4gPiBjYW4ganVzdCB0cnVuY2F0ZSB0aGUgYWlydGlt
ZSBhdCAyMDQ4IHVzLCB3aGljaCBpcyBub3QgYSBiaWcgZGVhbCBJJ2QKPj4gPiA+IHNheS4KPj4g
PiAKPj4gPiBXZSBjYW4gYWxzbyBwbGF5IHdpdGggdGhlIHVuaXRzIG9mIHRoZSBhaXJ0aW1lLCBl
LmcuIG1ha2luZyB0aGF0IGEKPj4gPiBtdWx0aXBsZSBvZiAyIG9yIDQgdXM/IFNlZW1zIHVubGlr
ZWx5IHRvIG1hdHRlciBtdWNoPwo+PiAKPj4gU3VyZSwgdGhhdCdzIGEgZ29vZCBwb2ludCEgSW5j
cmVtZW50cyBvZiA0dXMgbWVhbnMgd2UgY2FuIGZpdCA0bXMgaXMgMTAKPj4gYml0cywgbGVhdmlu
ZyBwbGVudHkgb2Ygc3BhY2UgZm9yIEFDSyBJRHMgKGhvcGVmdWxseSkuCj4+IAo+PiBJJ2xsIHJl
d29yayB0aGUgc2VyaWVzIHRvIHVzZSB0aGF0IGluc3RlYWQgOikKPgo+IE9LLgo+Cj4gVGhlcmUg
YXJlIHR3byBwbGFjZXMgdGhhdCBjYWxsIGlkcl9hbGxvYygpIHdpdGggYSBoYXJkY29kZWQgbGlt
aXQgb2YKPiAweDEwMDAwLCB5b3UnbGwgaGF2ZSB0byBmaXggdGhvc2UgdG8gaGF2ZSB0aGUgcmln
aHQgbGltaXQgYWNjb3JkaW5nIHRvCj4gdGhlIGJpdHMgeW91IGxlYXZlIGZvciB0aGUgQUNLIGlk
LgoKWXVwLCBmb3VuZCB0aG9zZS4gV2lsbCBzZW5kIGEgbmV3IHZlcnNpb24gb2YgdGhlIHNlcmll
cyBpbiBhIGJpdC4KCi1Ub2tlCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
