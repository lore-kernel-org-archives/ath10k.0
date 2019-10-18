Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLTHC-0003pZ-0H
 for ath10k@lists.infradead.org; Fri, 18 Oct 2019 14:30:47 +0000
Received: by mail-lj1-f198.google.com with SMTP id j10so1111920lja.21
 for <ath10k@lists.infradead.org>; Fri, 18 Oct 2019 07:30:41 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH v2 1/4] mac80211: Rearrange ieee80211_tx_info to make room
 for tx_time_est
In-Reply-To: <78035e38264feac9d15a761b009c89b9738b4de1.camel@sipsolutions.net>
References: <157115993755.2500430.12214017471129215800.stgit@toke.dk>
 <157115993866.2500430.13989567853855880476.stgit@toke.dk>
 <CA+iem5t6xghBocck864nDX2snWQ5O+v6_M2Jc9aCdn_hE+mFCA@mail.gmail.com>
 <87sgnqe4wg.fsf@toke.dk>
 <10b885b3238cede2d99c6134bebcc0c8ba6f6b10.camel@sipsolutions.net>
 <87imomdvsj.fsf@toke.dk>
 <9fc60b546b54b40357264d67536733251cf39ebe.camel@sipsolutions.net>
 <87d0eudufu.fsf@toke.dk>
 <78035e38264feac9d15a761b009c89b9738b4de1.camel@sipsolutions.net>
Date: Fri, 18 Oct 2019 16:30:38 +0200
Message-ID: <877e52dt2p.fsf@toke.dk>
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
cm90ZToKPj4gCj4+ID4gV2UgY2FuIGFsc28gcGxheSB3aXRoIHRoZSB1bml0cyBvZiB0aGUgYWly
dGltZSwgZS5nLiBtYWtpbmcgdGhhdCBhCj4+ID4gbXVsdGlwbGUgb2YgMiBvciA0IHVzPyBTZWVt
cyB1bmxpa2VseSB0byBtYXR0ZXIgbXVjaD8KPj4gCj4+IFN1cmUsIHRoYXQncyBhIGdvb2QgcG9p
bnQhIEluY3JlbWVudHMgb2YgNHVzIG1lYW5zIHdlIGNhbiBmaXQgNG1zIGlzIDEwCj4+IGJpdHMs
IGxlYXZpbmcgcGxlbnR5IG9mIHNwYWNlIGZvciBBQ0sgSURzIChob3BlZnVsbHkpLgo+Cj4gSWYg
eW91IGRvIG5lZWQgbW9yZSBiaXRzIChlLmcuIHRvIGJlIG9uIHRoZSBzYWZlIHNpZGUgYW5kIGhh
dmUgc3BhY2UgZm9yCj4gOG1zKSB5b3UgY291bGQgYWxzbyBzdGVhbCBiaXRzIG91dCBvZiAnYmFu
ZCcgKHdlIG9ubHkgbmVlZCAzIEkgdGhpbmspCj4gYW5kICdod19xdWV1ZScgKG5vdCBzdXJlIHdo
YXQgdGhlIGxpbWl0IHJlYWxseSBpcywgYnV0IHRoZXJlIGFyZW4ndCBtYW55Cj4gdXNlcnMsIHNl
ZW1zIGxpa2Ugb25seSBpd2x3aWZpL2R2bSBhbmQgaHdzaW0gY2FyZSwgYW5kIHRob3NlIGNlcnRh
aW5seQo+IGRvbid0IG5lZWQgPjMyIHF1ZXVlcykuCj4KPiBPZiBjb3Vyc2UgaWYgeW91IGxlYXZl
IG1vcmUgYml0cyBmb3IgbGF0ZXIgdGhhdCdzIGdvb2QgdG9vIDstKQoKWWVhaCwgbGV0J3MgbGVh
dmUgdGhhdCBmb3IgbGF0ZXIuIEFmdGVyIGFsbCwgd2l0aCB0aGUgbGltaXRzIHdlCmN1cnJlbnRs
eSBoYXZlIGNvbmZpZ3VyZWQsIGlmIGEgc2luZ2xlIHBhY2tldCB0YWtlcyB1cCA0MDk2IHVzLCB0
aGF0CndpbGwgdHJpZ2dlciB0aGUgcGVyLXN0YXRpb24gcXVldWUgdGhyb3R0bGluZyBpbiBpdHNl
bGYsIHNvIEkgdGhpbmsKd2UnbGwgYmUgZmluZSAoZmFtb3VzIGxhc3Qgd29yZHMpLgoKLVRva2UK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsg
bWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
