Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XOpRy-0003aN-Mj
 for ath10k@lists.infradead.org; Tue, 02 Sep 2014 14:52:51 +0000
Message-ID: <5405D9AB.60002@candelatech.com>
Date: Tue, 02 Sep 2014 07:52:27 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH v5] ath10k: save firmware debug log messages.
References: <1409239441-4878-1-git-send-email-greearb@candelatech.com>	<8738cam9by.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQk2CkmaZtZQ9iQyqU_9K3E_TYwetGNbsKpxYjbUvdL43g@mail.gmail.com>
In-Reply-To: <CA+BoTQk2CkmaZtZQ9iQyqU_9K3E_TYwetGNbsKpxYjbUvdL43g@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>, Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

CgpPbiAwOS8wMi8yMDE0IDA2OjUxIEFNLCBNaWNoYWwgS2F6aW9yIHdyb3RlOgo+IE9uIDIgU2Vw
dGVtYmVyIDIwMTQgMTU6MzgsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5jb20+IHdy
b3RlOgo+PiAoRHJvcHBpbmcgbGludXgtd2lyZWxlc3MpCj4+Cj4+IGdyZWVhcmJAY2FuZGVsYXRl
Y2guY29tIHdyaXRlczoKPj4KPj4+IEZyb206IEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRl
Y2guY29tPgo+Pj4KPj4+IFRoZXkgbWF5IGJlIGR1bXBlZCB0aHJvdWdoIHRoZSBmaXJtd2FyZSBk
dW1wIGRlYnVnZnMKPj4+IGZpbGUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQmVuIEdyZWVhciA8
Z3JlZWFyYkBjYW5kZWxhdGVjaC5jb20+Cj4+Cj4+IEJlZm9yZSBJIHN0YXJ0IGxvb2tpbmcgYXQg
dGhpcyBpbiBkZXRhaWw6IHRoaXMgbG9va3MgZnJhZ2lsZSBhbmQKPj4gY29tcGxpY2F0ZWQgZnJv
bSBhdGgxMGsgcG9pbnQgb2Ygdmlldy4gV2h5IG5vdCBqdXN0IHRha2UgYSBkdW1wIG9mIHRoZQo+
PiB3aG9sZSBmaXJtd2FyZSBtZW1vcnkgYW5kIHBvc3Rwcm9jZXNzIHRoaXMsIHdpdGggd2hhdGV2
ZXIgZWxzZSB3ZSBtaWdodAo+PiBuZWVkIGZyb20gdGhlIGZpcm13YXJlPyBUaGF0J3MgYSBsb3Qg
ZWFzaWVyIHRvIG1haW50YWluLgo+Cj4gSSBsaWtlIHRoZSBpZGVhIGFsdGhvdWdoIGl0IHN0aWxs
IG1ha2VzIHNlbnNlIHRvIGtlZXAgc29tZSBzb3J0IG9mIGEKPiBjaXJjdWxhciBidWZmZXIgZm9y
IHRoZSBkZWJ1ZyBtZXNnIGV2ZW50cyBkZWxpdmVyZWQgdmlhIHdtaSwgZG9lcyBpdAo+IG5vdD8K
ClVwc3RyZWFtIGZpcm13YXJlIGFscmVhZHkgY3JlYXRlcyBhbmQgc2VuZHMgZGJnbG9nIG1lc3Nh
Z2VzLCBhbmQgaXQgaXMgbmljZSB0byBzZWUKYSBoaXN0b3J5LiAgSXQgc2VuZHMgdGhlbSB0byBo
b3N0IGZhaXJseSBvZnRlbiwgc28ganVzdCBncmFiYmluZyB0aGUgbG9nCm9uIGNyYXNoIGNvdWxk
IG1pc3MgdXNlZnVsIGluZm8uCgpGb3IgdGhhdCBtYXR0ZXIsIEknZCBsaWtlIHRvIHJlYWQgZmly
bXdhcmUgZGVidWdsb2cgaWRzIG5vdCBqdXN0IG9uIGNyYXNoLAp3aGljaCBJIGNvdWxkIGVhc2ls
eSBkbyB3aXRoIHRoaXMgcGF0Y2ggYXMgdGhlIGJhc2lzIGJ5IGNyZWF0aW5nIGEgbmV3CmRlYnVn
ZnMgZmlsZSB0aGF0IGp1c3QgZHVtcHMgdGhlIGRlYnVnbG9nIGlkcy4KCkknbSBub3Qgc3VyZSB3
aGF0IEkgY291bGQgZG8gd2l0aCBhIGZ1bGwgcmFtIGR1bXAsIGJ1dCBwZXJoYXBzIFFDQSBkZXZz
CmhhdmUgc29tZXRoaW5nLiAgSXQgd291bGQgYXQgYSBtaW5pbXVtIHVzZSBhIGxvdCBtb3JlIFJB
TSB0byBzdG9yZSBpdC4KSSBqdXN0IG5lZWQgKGtub3cgaG93IHRvIGRlY29kZSkgdGhlIEJTUyBy
ZWdpb25zLCBkZWJ1Zy1sb2dzLCBhbmQgcmVnaXN0ZXJzLgoKVGhhbmtzLApCZW4KCj4KPgo+IE1p
Y2hhxYIKPgoKLS0gCkJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRlY2guY29tPgpDYW5kZWxh
IFRlY2hub2xvZ2llcyBJbmMgIGh0dHA6Ly93d3cuY2FuZGVsYXRlY2guY29tCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0
CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
