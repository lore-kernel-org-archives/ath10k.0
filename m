Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-2.mimecast.com ([207.211.31.81]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCfEI-0003z6-4e
 for ath10k@lists.infradead.org; Tue, 24 Sep 2019 07:27:30 +0000
Received: by mail-ed1-f72.google.com with SMTP id p55so510215edc.5
 for <ath10k@lists.infradead.org>; Tue, 24 Sep 2019 00:27:18 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH V3 4/4] mac80211: Sync airtime weight sum with per AC
 synced sta airtime weight together
In-Reply-To: <ffe79f35d4dcb50aa31dc04035855f79@codeaurora.org>
References: <1569223201-1490-1-git-send-email-yiboz@codeaurora.org>
 <1569223201-1490-5-git-send-email-yiboz@codeaurora.org>
 <87blvb5lb9.fsf@toke.dk> <ffe79f35d4dcb50aa31dc04035855f79@codeaurora.org>
Date: Tue, 24 Sep 2019 09:27:16 +0200
Message-ID: <87o8za40iz.fsf@toke.dk>
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
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

WWlibyBaaGFvIDx5aWJvekBjb2RlYXVyb3JhLm9yZz4gd3JpdGVzOgoKPiBPbiAyMDE5LTA5LTIz
IDE5OjAwLCBUb2tlIEjDuGlsYW5kLUrDuHJnZW5zZW4gd3JvdGU6Cj4KPj4+IC0JaWYgKHBhcmFt
cy0+YWlydGltZV93ZWlnaHQpCj4+PiAtCQlzdGEtPmFpcnRpbWVfd2VpZ2h0ID0gcGFyYW1zLT5h
aXJ0aW1lX3dlaWdodDsKPj4+ICsJaWYgKHBhcmFtcy0+YWlydGltZV93ZWlnaHQgJiYKPj4+ICsJ
ICAgIHBhcmFtcy0+YWlydGltZV93ZWlnaHQgIT0gc3RhLT5haXJ0aW1lX3dlaWdodCkgewo+PiAK
Pj4gVGhpcyBjaGVjayBkb2Vzbid0IHdvcmsgSSB0aGluaz8gWW91J3JlIG5vdCB1c2luZyB0aGUg
YXJyYXktYmFzZWQKPj4gc3RhLT5haXJ0aW1lX3dlaWdodFtdLCBhbmQgdGhlcmUgYXJlIGxvY2tp
bmcgaXNzdWVzIGJ5IGp1c3QgY2hlY2tpbmcKPj4gbGlrZSB0aGlzOyBzbyBtYXliZSBqdXN0IGtl
ZXAgdGhlIGlmKCkgb24gcGFyYW1zLT5haXJ0aW1lX3dlaWdodCwgYW5kIAo+PiBkbwo+PiB0aGUg
Y2hlY2tpbmcgaW5zaWRlIHRoZSBsb29wIHdoaWxlIGhvbGRpbmcgdGhlIGxvY2s/Cj4KPiBJdCBz
aG91bGQgYmUgYXJyYXktYmFzZWQgc3RhLT5haXJ0aW1lX3dlaWdodFtdIGFuZCBJIGFtIG1pc3Np
bmcgdGhhdCAKPiBwYXJ0IGR1cmluZyB0aGUgcG9ydGluZy4gQnV0IHlvdSBhcmUgcmlnaHQgYWJv
dXQgd2Ugc2hvdWxkIGNoZWNrIGl0IAo+IGluc2lkZSB0aGUgbG9vcCB3aXRoIHRoZSBsb2NrLgo+
Cj4+IAo+PiBPciBjb3VsZCB3ZSBqdXN0IHR1cm4gdGhlIHdlaWdodHMgaW50byBhdG9taWNzIHRv
IGF2b2lkIHRoZSBsb2NraW5nCj4+IGVudGlyZWx5Pwo+Cj4gQWN0dWFsbHksIHdlIHN0aWxsIG5l
ZWQgdGhlIGFjdGl2ZSB0eHEgbG9ja2luZyB0byBtYWtlIHN1cmUgdGhlIHR4cSBpcyAKPiBvbiB0
aGUgcmJ0cmVlLiBPdGhlcndpc2UsIG5vIG5lZWQgdG8gY2hhbmdlIGFpcnRpbWUgd2VpZ2h0IHN1
bS4KClRydWUuIEp1c3QgbW92aW5nIHRoZSBjaGVjayBpbnNpZGUgdGhlIGxvY2tpbmcgd2lsbCBi
ZSB0aGUgcmlnaHQgdGhpbmcKdG8gZG8sIHRoZW4uCgotVG9rZQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hdGgxMGsK
