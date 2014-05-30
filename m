Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x231.google.com ([2a00:1450:400c:c00::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WqKFL-0001gU-QV
 for ath10k@lists.infradead.org; Fri, 30 May 2014 10:41:13 +0000
Received: by mail-wg0-f49.google.com with SMTP id m15so1770940wgh.20
 for <ath10k@lists.infradead.org>; Fri, 30 May 2014 03:40:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87a99z4kqb.fsf@kamboji.qca.qualcomm.com>
References: <20140528091832.8030.93169.stgit@potku.adurom.net>
 <20140528091956.8030.46201.stgit@potku.adurom.net>
 <CA+BoTQnLPua6Mds+ywPY==9QtnHbuucVamDYpWnfwKiC7J=9dQ@mail.gmail.com>
 <87ha48693v.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=rNe_xcmp6yGsE1iGoRnGq_ZksfHg6JW_-U1iK3NszjQ@mail.gmail.com>
 <87ioon4m42.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmM1F4c34nzSZ4H+0qF=RLg6iA0mr1E=U3q-EoD+n8g_Q@mail.gmail.com>
 <87a99z4kqb.fsf@kamboji.qca.qualcomm.com>
Date: Fri, 30 May 2014 12:40:49 +0200
Message-ID: <CA+BoTQkbOMxQW+A9R1fRLffswYbXFjkOfvLnra2YfkRazx1-4g@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] ath10k: add testmode
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMzAgTWF5IDIwMTQgMTI6MzUsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5jb20+
IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0ZXM6
Cj4KPj4gT24gMzAgTWF5IDIwMTQgMTI6MDYsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29t
bS5jb20+IHdyb3RlOgo+Pj4gTWljaGFsIEthemlvciA8bWljaGFsLmthemlvckB0aWV0by5jb20+
IHdyaXRlczoKPj4+Cj4+Pj4gT24gMjkgTWF5IDIwMTQgMTQ6NTEsIEthbGxlIFZhbG8gPGt2YWxv
QHFjYS5xdWFsY29tbS5jb20+IHdyb3RlOgo+Pj4+Cj4+Pj4+IEJUVywgcGxlYXNlIGVkaXQgeW91
ciBxdW90ZXMuIEl0J3MgcGFpbiB0byBmaW5kIHlvdXIgY29tbWVudHMgZnJvbSBhIDcwMAo+Pj4+
PiBsaW5lIG1vbnN0ZXIgOikKPj4+Cj4+PiBUaGlzIHJlcXVlc3Qgc3RpbGwgc3RhbmRzLCBldmVu
IHRob3VnaCAxNzAgbGluZXMgaXMgbXVjaCBiZXR0ZXIgdGhhbiA3MDAKPj4+IGxpbmVzIDspCj4+
Cj4+IEkgaW50ZW5kZWQgdG8gdHJpbSBpdCB0aGlzIHRpbWUgYnV0IEkndmUgaGl0ICdzZW5kJyBi
ZWZvcmUgYWN0dWFsbHkKPj4gZG9pbmcgdGhhdC4uIHNvcnJ5IQo+Cj4gTm8gcHJvYmxlbSA6KQo+
Cj4+Pj4gV2UgY291bGQgYWxzbyBkZXBlbmQgb24gY21kX2lkIHRvIGFjY2VwdC9yZWplY3Qgc2ti
dWZmcyBpbgo+Pj4+IGF0aDEwa190bV9ldmVudF93bWkoKSBzaW5jZSwgYXQgbGVhc3QgZm9yIG5v
dywgdGhlcmUgYXJlbid0IGFueQo+Pj4+IHNwZWNpYWwgY2FzZXMgdG8gaGFuZGxlLiBCdXQgdGhl
bi4uIHdpbGwgd2UgcmVhbGx5IGV2ZXIgbmVlZCB0byBoYXZlIGEKPj4+PiBwYXNzdGhyb3VnaCAo
aS5lLiBwYXNzIGJ1ZmZlcnMgdG8gdXNlcnNwYWNlIGJ1dCBzdGlsbCBwcm9jZXNzIHRoZW0gaW4K
Pj4+PiB0aGUgZHJpdmVyIGFmdGVyd2FyZHMpPyBEb2VzIHRoYXQgZXZlbiBtYWtlIHNlbnNlPwo+
Pj4KPj4+IEkgdGhpbmsgdGhhdCdzIGdldHRpbmcgYSBiaXQgdG9vIGNvbXBsaWNhdGVkLiBCYXNp
Y2FsbHkgd2UganVzdCBuZWVkCj4+PiBhdGgxMGsgYWN0IGFzIGEgcGlwZSBmb3IgV01JIHBhY2tl
dHMuCj4+Cj4+IEhtbS4uCj4+Cj4+IFdpdGggdjEgY29kZSBpZiB5b3UgYXNzdW1lIFVURiBmaXJt
d2FyZSBzZW5kcyBhbiBTV0JBIGV2ZW50IHRoZW4KPj4gYXRoMTBrIHdvdWxkIHNlbmQgdGhlIHRl
c3Rtb2RlIGV2ZW50IEFORCB0cnkgdG8gYWN0dWFsbHkgaGFuZGxlIGl0IGFzCj4+IGlmIGl0IHdh
cyByZWd1bGFyIG9wZXJhdGlvbi4uIGJ1dCBob3cgaXMgdGhhdCBzdXBwb3NlZCB0byB3b3JrIGlm
IHlvdQo+PiBoYXZlIG5vIG1hYzgwMjExIGludGVyZmFjZSBzdHJ1Y3R1cmVzIGFyb3VuZCBhdCBh
bGw/IE15IHBvaW50IGlzCj4+IGF0aDEwa190bV9ldmVudF93bWkoKSBzaG91bGQgX2NvbnN1bWVf
IGJ1ZmZlcnMgYW5kIHRoZSBjYWxsZXIgc2hvdWxkCj4+IG5vdCBwcm9jZXNzZXMgY29uc3VtZWQg
YnVmZmVycyAoYXNzdW1pbmcgeW91IHdhbnQgdG8ga2VlcAo+PiBhdGgxMGtfdG1fZXZlbnRfd21p
IGNhbGwgd2hlcmUgaXQgaXMgbm93LCBpLmUuIGJlZm9yZSBzd2l0Y2gtY2FzZSkuCj4KPiBJIHNl
ZSB5b3VyIHBvaW50IG5vdywgdGhhbmtzIGZvciBiYW5naW5nIGl0IHRvIG15IHRoaWNrIGhlYWQg
d2l0aCBhCj4gc2xlZGdlIGhhbW1lciA6KQo+Cj4gSSdsbCByZXRoaW5rIHRoaXMgcGFydCBhbmQg
dHJ5IHRvIHNvbHZlIGl0IGZvciB2Mi4gVGhlIHJlYXNvbiBJIHdvdWxkCj4gbGlrZSB0byBhdm9p
ZCB5b3VyIGNvbnN1bWluZyBpZGVhIGlzIHRoYXQgYXQgc29tZSBwb2ludCB3ZSBtaWdodCB3YW50
IHRvCj4gZW5hYmxlIHRoaXMgV01JIHBpcGUgYWxzbyBpbiAibm9ybWFsIG1vZGUiLgoKSSdtIG5v
dCByZWFsbHkgc3VyZSB3aGF0IHlvdSBtZWFuIGJ5IHRoYXQuIENhbiB5b3UgZ2l2ZSBhbiBleGFt
cGxlCndoZXJlIHRoaXMgcGFzcy10aHJvdWdoIGJlaGF2aW91ciB3b3VsZCBiZSBkZXNpcmVkLCBw
bGVhc2U/CgoKTWljaGHFggoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
