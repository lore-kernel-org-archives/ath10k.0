Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-bk0-x235.google.com ([2a00:1450:4008:c01::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEdP6-00087J-98
 for ath10k@lists.infradead.org; Wed, 28 Aug 2013 10:55:12 +0000
Received: by mail-bk0-f53.google.com with SMTP id d7so2056295bkh.40
 for <ath10k@lists.infradead.org>; Wed, 28 Aug 2013 03:54:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87txiajveo.fsf@kamboji.qca.qualcomm.com>
References: <1377066854-13981-1-git-send-email-michal.kazior@tieto.com>
 <1377507205-5386-1-git-send-email-michal.kazior@tieto.com>
 <1377507205-5386-2-git-send-email-michal.kazior@tieto.com>
 <87txiajveo.fsf@kamboji.qca.qualcomm.com>
Date: Wed, 28 Aug 2013 12:54:46 +0200
Message-ID: <CA+BoTQmW8F+e3YqLSoCWbYRSzZAM=Wy2GvGfbbW7iwVHtaesOQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] ath10k: synchronize tx/rx reporting to mac80211
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

T24gMjggQXVndXN0IDIwMTMgMDY6MjMsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29tbS5j
b20+IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3cml0
ZXM6Cj4KPj4gQWNjb3JkaW5nIHRvIG1hYzgwMjExIGRvY3MgdHggYW5kIHJ4IHJlcG9ydGluZwo+
PiByb3V0aW5lcyBtdXN0IG5vdCBydW4gY29uY3VycmVudGx5IHVubGVzcyB0aGV5IGFyZQo+PiBf
aXJxc2FmZSB2YXJpYW50cy4KPj4KPj4gVGhpcyBkb2Vzbid0IGZpeCBhbnkgdmlzaWJsZSBidWcg
YnV0IGlzIGFwcGFyZW50bHkKPj4gdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGFzIHBlciB0aGUgZG9j
dW1lbnRhdGlvbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIEthemlvciA8bWljaGFsLmth
emlvckB0aWV0by5jb20+Cj4KPiBJIGhhZCBhIHF1aWNrIGNoYXQgd2l0aCBKb2hhbm5lcyBhbmQg
U3VqaXRoIGFib3V0IHRoaXMuIFRoZSBjb25jdXJyZW5jeQo+IHJlcXVpcmVtZW50cyBhcmUgZm9y
IHRoZSBTVEEgUFMgcmFjZSBpbiBBUCBtb2RlIChzZWUKPiBpZWVlODAyMTFfaGFuZGxlX2ZpbHRl
cmVkX2ZyYW1lKCkpLgo+Cj4gSSB0aGluayB3ZSBzaG91bGQgZHJvcCB0aGlzIGZyYW1lLCByZXZp
c2l0IGxhdGVyIGFuZCBwcm9wZXJseSBhbmFseXNlCj4gaG93IHRvIGZpeCB0aGUgcmFjZS4gQnV0
IGl0IHdvdWxkIGJlIGdvb2QgYWRkIHRoaXMgdG8gdGhlIHRvZG8gbGlzdDoKPgo+IGh0dHA6Ly93
aXJlbGVzcy5rZXJuZWwub3JnL2VuL3VzZXJzL0RyaXZlcnMvYXRoMTBrI1RPRE8KCkkndmUgYWRk
ZWQgdGhpcyB0byB0aGUgVE9ETyBsaXN0LgoKSSdtIHdvcnJpZWQgdGhpcyBQUyBzdHVmZiBpcyBi
cm9rZW4gb24gYXRoMTBrIGFueXdheSBiZWNhdXNlIGF0aDEwawptb2RpZmllcyB0eCBza2J1ZmZz
IGZvciBRb1Mgd29ya2Fyb3VuZCAoUW9TIENvbnRyb2wgbXVzdCBiZSByZW1vdmVkCmJlZm9yZSBz
dWJtaXR0aW5nIHRvIEZXKS4KCgpNaWNoYcWCLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0
aDEwawo=
