Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from villa.puc.rediris.es ([2001:720:418:ca00::7])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZYt32-0003rv-98
 for ath10k@lists.infradead.org; Mon, 07 Sep 2015 09:49:14 +0000
Received: from [84.88.62.208] (helo=leo)
 by villa.puc.rediris.es with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <jbaranda@cttc.es>) id 1ZYt2X-0003Xs-UY
 for ath10k@lists.infradead.org; Mon, 07 Sep 2015 11:48:43 +0200
Received: from [84.88.61.34] (pcjbaranda.cttc.es [84.88.61.34])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by leo (Postfix) with ESMTPSA id 4CF811FE10
 for <ath10k@lists.infradead.org>; Mon,  7 Sep 2015 11:48:37 +0200 (CEST)
Message-ID: <55ED5D78.6090007@cttc.es>
Date: Mon, 07 Sep 2015 11:48:40 +0200
From: Jorge Baranda <jbaranda@cttc.es>
MIME-Version: 1.0
Subject: Setting up a VHT ad-hoc connection with ath10k
References: <F52F175DFC537F48A43937B50B44BCA28205CDDC@EXCHANGE.mediaspot.local>
 <CALhHN=psNe5hh3GuA=z0AC6-Gy-fRTkxUe3+Pop3OMyBwPpshQ@mail.gmail.com>
 <F52F175DFC537F48A43937B50B44BCA28205DA67@EXCHANGE.mediaspot.local>
 <CALhHN=rXxHKr-8vdctszWY=yitmpDbKZDpX=omqP1OAHuQoAxw@mail.gmail.com>
 <F52F175DFC537F48A43937B50B44BCA28205DAB5@EXCHANGE.mediaspot.local>
 <CALhHN=rebT-S3x149RQDUU3QbofUV73wkkmVPuqFzJjrHyMO_A@mail.gmail.com>
In-Reply-To: <CALhHN=rebT-S3x149RQDUU3QbofUV73wkkmVPuqFzJjrHyMO_A@mail.gmail.com>
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
To: ath10k@lists.infradead.org

RGVhciBhbGwsCgpSZWNlbnRseSwgSSBib3VnaHQgc29tZSBXTEU5MDBWWCBjYXJkcyBhbmQgZXF1
aXBwZWQgc2V2ZXJhbCBjb21wdXRlcnMgCndpdGggc3VjaCBjYXJkcy4KSSB3YW50IHRvIGNoZWNr
IHRoZSBjYXBhYmlsdGllcyBvZiB0aGVzZSBjYXJkcywgc28gSSBoYXZlIHRob3VnaHQgb2YgCmVz
dGFibGlzaGluZyBhbiBBRC1IT0MgODAyLjExYWMgbGluayBpbiBvcmRlciB0byBkbyBzby4KSSBo
YXZlIGJlZW4gYWJsZSB0byBlc3RhYmxpc2ggYW5kIEFELUhPQyBjb25uZWN0aW9uIGJldHdlZW4g
dHdvIG9mIHRoZXNlIApjYXJkcywgYnV0IEkgYW0gc3VyZSBJIGFtIG5vdCBlc3RhYmxpc2hpbmcg
YW4gODAyLjExYWMgY29ubmVjdGlvbiAKYmVjYXVzZSB0aGUgaXdsaXN0IHRvb2wgb25seSByZXBv
cnRzIGJpdCByYXRlcyB1cCB0byA1NE1iL3MgZm9yIHRoZSAKZXN0YWJsaXNoZWQgY29ubmVjdGlv
bi4KSSB3b3VsZCBiZSB2ZXJ5IGdyYXRlZnVsIGlmIHNvbWVvbmUgY291bGQgcHJvdmlkZSBtZSBz
b21lIGhpbnRzIG9uIApjb25maWd1cmluZyB0aGVzZSBjYXJkcyB0byB3b3JrIHVzaW5nIHRoZSA4
MDIuMTFhYyBhbmQgdG8gY2hlY2sgdGhhdCB0aGUgCmNvbm5lY3Rpb24gdXNpbmcgc3VjaCBwcm90
b2NvbCBoYXMgYmVlbiBlc3RhYmxpc2hlZC4KClRoYW5rIHlvdSB2ZXJ5IG11Y2ggaW4gYWR2YW5j
ZSBmb3IgeW91ciB0aW1lIGFuZCBhdHRlbnRpb24sCgpXaXRoIGtpbmQgcmVnYXJkcywKCi0tIApK
b3JnZSBCYXJhbmRhClJlc2VhcmNoIEVuZ2luZWVyLCBNU2MKam9yZ2UuYmFyYW5kYUBjdHRjLmVz
CgpDZW50cmUgVGVjbm9sw7JnaWMgZGUgVGVsZWNvbXVuaWNhY2lvbnMgZGUgQ2F0YWx1bnlhIChD
VFRDKQpBdi4gQ2FybCBGcmllZHJpY2ggR2F1c3MsIDcKMDg4NjAgQ2FzdGVsbGRlZmVscywgQmFy
Y2Vsb25hIChTcGFpbikKVGVsOiArMzQgOTMgNjQ1IDI5IDAwICBFeHQ6IDIxNzEKRmF4LiArMzQg
OTMgNjQ1IDI5IDAxCnd3dy5jdHRjLmVzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEw
awo=
