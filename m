Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x230.google.com ([2a00:1450:400c:c0c::230])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cmK7A-00043q-5J
 for ath10k@lists.infradead.org; Fri, 10 Mar 2017 12:57:51 +0000
Received: by mail-wr0-x230.google.com with SMTP id u48so64479012wrc.0
 for <ath10k@lists.infradead.org>; Fri, 10 Mar 2017 04:57:26 -0800 (PST)
Received: from [192.168.0.14] (agqd138.neoplus.adsl.tpnet.pl. [217.99.29.138])
 by smtp.gmail.com with ESMTPSA id
 n59sm12775689wrb.54.2017.03.10.04.57.24
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Mar 2017 04:57:25 -0800 (PST)
From: Jean-Luc Kalmus <jean-luc@picocela.com>
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: How to integrate the latest ath10k driver into an older kernel
 release ? 
Date: Fri, 10 Mar 2017 13:57:23 +0100
References: <F3E5DE47-C5E5-46B5-8E19-DF0DD43DBC9C@picocela.com>
In-Reply-To: <F3E5DE47-C5E5-46B5-8E19-DF0DD43DBC9C@picocela.com>
Message-Id: <8B6F3E29-15E3-423B-A1E4-F98F73D711B3@picocela.com>
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
To: ath10k@lists.infradead.org

SGksCkhvdyBjYW4gSSBpbnRlZ3JhdGUgdGhlIGxhdGVzdCBhdGgxMGsgZHJpdmVyIGludG8gTGlu
dXgga2VybmVsIHYzLjEwLjIwID8gCgpBY2NvcmRpbmcgdG8gdGhpcyB3aWtpIGh0dHBzOi8vYmFj
a3BvcnRzLndpa2kua2VybmVsLm9yZy9pbmRleC5waHAvRG9jdW1lbnRhdGlvbi9pbnRlZ3JhdGlv
biB0aGUgaW50ZWdyYXRpb24gcmVxdWlyZXMgdGhlIGJhY2twb3J0cy5naXQgYW5kIGxpbnV4LW5l
eHQuZ2l0IChvciBsaW51eC1uZXh0LWhpc3RvcnkuZ2l0IG9yIGxpbnV4LXN0YWJsZS5naXQpIHRy
ZWVzIHRvIGJlIG9uIGNvcnJlc3BvbmRpbmcgdGFncy4KSSBmb3VuZCB0aGF0IHRoZSBsYXRlc3Qg
dGFnIGluIHRoZSBiYWNrcG9ydHMuZ2l0IHRyZWUgaXMg4oCYYmFja3BvcnRzLTIwMTYwMzI04oCZ
LiBUaGVyZWZvcmUgdGhlIGxhdGVzdCBhdGgxMGsgZHJpdmVyIEkgY2FuIGludGVncmF0ZSBpcyBm
cm9tIHRoZSBrZXJuZWwgdGFnIG5leHQtMjAxNjAzMjQuCkkgdXNlZCB0aGUgY29tbWFuZDogLi9n
ZW50cmVlLnB5IC0tY29weS1saXN0IGNvcHktbGlzdCAgLS1pbnRlZ3JhdGUgLS1jbGVhbiAgfi9s
aW51eC1uZXh0LWhpc3RvcnkvIH4vbGludXgtMy4xMC4yMC8KCkhvd2V2ZXIsIHdoZW4gSSB0cmll
ZCB0byBpbnRlZ3JhdGUgZHJpdmVycyBmcm9tIHRoZSBsaW51eCB0YWcgbmV4dC0yMDE3MDMwOSB1
c2luZyBhIGJhY2twb3J0cyB0cmVlIG9uIGJhY2twb3J0cy0yMDE2MDMyNCwgdGhhdCByZXN1bHRl
ZCBpbiBwYXRjaGluZyBlcnJvcnMuCkhvdyB0byBkbyB0aGUgaW50ZWdyYXRpb24gaW4gdGhhdCBj
YXNlID8gCgpUaGUgc2FtZSBwcm9ibGVtIG9jY3VycyB3aGVuIHVzaW5nIHRoZSBtZXRob2QgZXhw
bGFpbmVkIGluIHRoaXMgd2lraSBwYWdlIGh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3Jn
L2VuL3VzZXJzL2RyaXZlcnMvYXRoMTBrL2JhY2twb3J0cyB1c2luZyB0aGUgYXRoLmdpdCB0cmVl
LgoKLS0KSmVhbi1MdWMgS2FsbXVzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
