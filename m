Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XRxV9-000257-Si
 for ath10k@lists.infradead.org; Thu, 11 Sep 2014 06:05:04 +0000
Received: by mail-wi0-f169.google.com with SMTP id cc10so583254wib.4
 for <ath10k@lists.infradead.org>; Wed, 10 Sep 2014 23:04:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87sijz5u6q.fsf@kamboji.qca.qualcomm.com>
References: <1409827005-3777-1-git-send-email-michal.kazior@tieto.com>
 <87sijz5u6q.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 11 Sep 2014 08:04:36 +0200
Message-ID: <CA+BoTQnc9Vvedo5bwzvoRbEAiu=xcTbagEmxUDJ=9+Uva_UbWg@mail.gmail.com>
Subject: Re: [PATCH v3] ath10k: fix debugfs_create_dir() checking
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

T24gMTAgU2VwdGVtYmVyIDIwMTQgMTg6MTQsIEthbGxlIFZhbG8gPGt2YWxvQHFjYS5xdWFsY29t
bS5jb20+IHdyb3RlOgo+IE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JAdGlldG8uY29tPiB3
cml0ZXM6ClsuLi5dCj4+IFNpbmNlIG1pbmUgaXMganVzdCBhbiBleHRyYSBwcmVjYXV0aW9uIGZl
ZWwgZnJlZQo+PiB0byBkcm9wIGFsbCBidXQgdGhlIGZpcnN0IHBhcmFncmFwaCBvZiBteSBjb21t
aXQKPj4gbWVzc2FnZSBpZiB5b3Ugd2FudCB0by4KPgo+IFRoYW5rcywgSSBqdXN0IGxlZnQgdGhl
IGZpcnN0IHBhcmFncmFwaCBsaWtlIHlvdSByZWNvbW1lbmRlZC4gQWxzbyBJIGhhZAo+IGEgY29u
ZmxpY3Qgd2l0aCB0aGlzIHBhdGNoLCBwbGVhc2UgZG91YmxlIGNoZWNrIG15IHJlc29sdXRpb24g
aW4KPiBhdGgtbmV4dC10ZXN0Ogo+Cj4gaHR0cHM6Ly9naXRodWIuY29tL2t2YWxvL2F0aC9jb21t
aXQvYmVlNmQ2NTVlZWZlNDg4Yjc2OTk4YzljMDAxOGE0ZTZiMDgyOGRlNgoKTG9va3MgZ29vZCwg
dGhhbmtzIQoKCk1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
