Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8snI-0002Ve-3c
 for ath10k@lists.infradead.org; Tue, 26 Mar 2019 20:35:37 +0000
Received: by mail-lf1-x142.google.com with SMTP id d18so9705967lfn.3
 for <ath10k@lists.infradead.org>; Tue, 26 Mar 2019 13:35:30 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174])
 by smtp.gmail.com with ESMTPSA id r24sm2756870ljr.63.2019.03.26.13.35.24
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Mar 2019 13:35:25 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id f23so12403129ljc.0
 for <ath10k@lists.infradead.org>; Tue, 26 Mar 2019 13:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190207014143.41529-1-briannorris@chromium.org>
 <20190325202706.GA68720@google.com>
 <CABvG-CWODF24BMeoCE98OK5fnGNgX0k3z5qTU8A0AD9ncH0jHw@mail.gmail.com>
 <CA+ASDXMRXMSFPXfzbG_2wKzBYAZmp2AVO1qsAJdALLOkPrVRCw@mail.gmail.com>
In-Reply-To: <CA+ASDXMRXMSFPXfzbG_2wKzBYAZmp2AVO1qsAJdALLOkPrVRCw@mail.gmail.com>
From: Brian Norris <briannorris@chromium.org>
Date: Tue, 26 Mar 2019 13:35:12 -0700
Message-ID: <CA+ASDXO+qTj4FLxSQXQ7wLHU-OuY0taFkdRfb0fkEEYQwZRY9A@mail.gmail.com>
Subject: Re: [PATCH] ath10k: pci: use mutex for diagnostic window CE polling
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
To: =?UTF-8?Q?Micha=C5=82_Kazior?= <kazikcz@gmail.com>
Cc: Carl Huang <cjhuang@codeaurora.org>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>, Wen Gong <wgong@codeaurora.org>

T24gTW9uLCBNYXIgMjUsIDIwMTkgYXQgMzoxNCBQTSBCcmlhbiBOb3JyaXMgPGJyaWFubm9ycmlz
QGNocm9taXVtLm9yZz4gd3JvdGU6Cj4gT24gTW9uLCBNYXIgMjUsIDIwMTkgYXQgMjoyMCBQTSBN
aWNoYcWCIEthemlvciA8a2F6aWtjekBnbWFpbC5jb20+IHdyb3RlOgo+ID4gRm9yIG9uZSwgeW91
J2xsIG5lZWQgdG8gZGVmZXIgYXRoMTBrX3BjaV9md19jcmFzaGVkX2R1bXAgdG8gYSB3b3JrZXIu
Cj4gPiBNYXliZSBpbnRvIGFyLT5yZXN0YXJ0X3dvcmsgd2hpY2ggdGhlIGR1bXAgZnVuY3Rpb24g
Y2FsbHMgbm93Lgo+Cj4gSG1tLCB0aGF0J3MgYW4gaWRlYSAtLSBhbHRob3VnaCBJJ20gbm90IHN1
cmUgaWYgSSdkIHN0ZWFsCj4gJ3Jlc3RhcnRfd29yaycsIG9yIGNyZWF0ZSBhIGRpZmZlcmVudCB3
b3JrIGl0ZW0gb24gdGhlIHNhbWUgcXVldWUuIEJ1dAo+IGVpdGhlciB3YXksIHdlJ2Qgc3RpbGwg
YWxzbyBoYXZlIHRvIGF2b2lkIGhvbGRpbmcgJ2RhdGFfbG9jaycsIGFuZCBhdAo+IHRoYXQgcG9p
bnQsIEknbSBub3Qgc3VyZSBpZiB3ZSdyZSBsb3NpbmcgZGVzaXJhYmxlIHByb3BlcnRpZXMgb2Yg
dGhlc2UKPiBmaXJtd2FyZSBkdW1wcyAtLSBpdCBhbGxvd3MgbW9yZSAic3R1ZmYiIHRvIGtlZXAg
Z29pbmcgb24gd2hpbGUgd2UncmUKPiBwcmVwYXJpbmcgdG8gZHVtcCB0aGUgZGV2aWNlIG1lbW9y
eSBzdGF0ZS4KClNvIElJVUMsIHdlIGRvbid0IHRvZGF5IGhhdmUsIGZvciBpbnN0YW5jZSwgYSBj
b21wbGV0ZSBndWFyYW50ZWUgdGhhdApDb3B5IEVuZ2luZXMgYXJlIHN0b3BwZWQgYXQgdGhpcyBw
b2ludCwgc28gdGhlc2UgbWVtb3J5IGR1bXBzIGFyZQp1c2VmdWwgbW9zdGx5IGJ5IHRoZSBpbXBs
aWVkIGZhY3QgdGhhdCBhIGNyYXNoZWQgZmlybXdhcmUgaXMgbm8gbG9uZ2VyCmRvaW5nIGFueXRo
aW5nIGFjdGl2ZS4KClNvIGFzIGxvbmcgYXMgd2UgZW5zdXJlIHRoZSBkcml2ZXIgaXMgcmV0YWlu
aW5nIGV4Y2x1c2lvbiBvbiBpdHMgb3duCnJlc291cmNlcyAoZS5nLiwgY29yZWR1bXAgYnVmZmVy
cykgd2hpbGUgcGVyZm9ybWluZyB0aGUgZHVtcCB3b3JrLAp0aGVuIHdlIHNob3VsZCBiZSBPSy4K
Cj4gPiBUbyBnZXQgcmlkIG9mIGRhdGFfbG9jayBmcm9tIGF0aDEwa19wY2lfZndfY3Jhc2hlZF9k
dW1wKCkgeW91J2xsIG5lZWQKPiA+IHRvIGF0IGxlYXN0IG1ha2UgZndfY3Jhc2hfY291bnRlciBp
bnRvIGFuIGF0b21pY190LiBUaGlzIGlzIGp1c3QgZnJvbQo+ID4gYSBxdWljayBnbGFuY2UuCj4K
PiBZZXMsIHdlJ2QgbmVlZCBhdCBsZWFzdCB0aGF0IG11Y2guIFdlJ2QgYWxzbyBuZWVkIHNvbWUg
b3RoZXIgZm9ybSBvZgo+IGxvY2tpbmcgdG8gZW5zdXJlIGV4Y2x1c2lvbiBiZXR3ZWVuIGFsbCB1
c2VycyBvZgo+IGFyLT5jb3JlZHVtcC5md19jcmFzaF9kYXRhIGFuZCBzaW1pbGFyLiBBdCB0aGUg
bW9tZW50LCB0aGF0J3MKPiAnZGF0YV9sb2NrJywgYnV0IEkgc3VwcG9zZSB3ZSBnZXQgYSBzaW1p
bGFyIGV4Y2x1c2lvbiBpZiBhbGwgdGhlCj4gZHVtcC9yZXN0YXJ0IHdvcmsgaXMgb24gdGhlIHNh
bWUgd29ya3F1ZXVlLgoKSSd2ZSBjb29rZWQgdXAgYSBzb2x1dGlvbiB3aXRoIGEgbmV3IGR1bXBf
e3dvcmssbXV0ZXh9IHRvIHByb3RlY3QgdGhlCmNvcmVkdW1wIGJ1ZmZlcnMgYW5kIGRvIHRoZSBk
dW1waW5nIHdvcmsuIEkgc3RpbGwga2VlcCB0aGUgJ2RhdGFfbG9jaycKb25seSBhcm91bmQgdGhl
IGZ3X2NyYXNoX2NvdW50ZXIuCgo+IEknbSBzdGlsbCBub3QgcXVpdGUgc3VyZSBpZiB0aGlzIGlz
IDUuMS1yYyBtYXRlcmlhbCwgb3IgSSBzaG91bGQganVzdAo+IHJldmVydCBmb3IgNS4xLgoKSSds
bCBwb3N0IHRoZSBhYm92ZSBzb29uIHdpdGggYSBnb2FsIG9mIDUuMS4gSWYgdGhhdCdzIG5vdCBj
b25zaWRlcmVkCmdvb2QgZW5vdWdoLCBpJ2xsIHBvc3QgYSByZXZlcnQgdG9vLgoKQnJpYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWls
aW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
