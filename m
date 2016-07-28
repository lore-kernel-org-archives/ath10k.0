Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from omr1.cc.ipv6.vt.edu ([2607:b400:92:8300:0:c6:2117:b0e]
 helo=omr1.cc.vt.edu)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bSdXX-0005o9-CH
 for ath10k@lists.infradead.org; Thu, 28 Jul 2016 05:07:24 +0000
Received: from mr1.cc.vt.edu (inbound.smtp.ipv6.vt.edu
 [IPv6:2607:b400:92:9:0:9d:8fcb:4116])
 by omr1.cc.vt.edu (8.14.4/8.14.4) with ESMTP id u6S571Vn009098
 for <ath10k@lists.infradead.org>; Thu, 28 Jul 2016 01:07:01 -0400
Received: from mail-lf0-f69.google.com (mail-lf0-f69.google.com
 [209.85.215.69])
 by mr1.cc.vt.edu (8.14.7/8.14.7) with ESMTP id u6S56tZ4027309
 for <ath10k@lists.infradead.org>; Thu, 28 Jul 2016 01:07:01 -0400
Received: by mail-lf0-f69.google.com with SMTP id 33so8820058lfw.1
 for <ath10k@lists.infradead.org>; Wed, 27 Jul 2016 22:07:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQkw29PvZXqvX5oe2-cyvNURMY3G-SKsv6FqxD7BN2yyHw@mail.gmail.com>
References: <CAFc9h7vkdFcns6zaeO0mAVPGAqcY62t5D2gNY5d6GkW=pwjVTA@mail.gmail.com>
 <CA+BoTQkw29PvZXqvX5oe2-cyvNURMY3G-SKsv6FqxD7BN2yyHw@mail.gmail.com>
From: Gaurang Ramesh Naik <gaurang@vt.edu>
Date: Thu, 28 Jul 2016 01:06:54 -0400
Message-ID: <CAFc9h7vxPkTuU2rpxCP_oN825V7cJNTVSK2JxhDbDRNKsv9Wpg@mail.gmail.com>
Subject: Re: Use Channel Switch Announcement (CSA) without DFS
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

VGhhbmsgeW91IHNvIG11Y2ghIEV4YWN0bHkgd2hhdCBJIHdhcyBsb29raW5nIGZvci4KCk9uIFRo
dSwgSnVsIDI4LCAyMDE2IGF0IDE6MDIgQU0sIE1pY2hhbCBLYXppb3IgPG1pY2hhbC5rYXppb3JA
dGlldG8uY29tPiB3cm90ZToKPiBPbiAyOCBKdWx5IDIwMTYgYXQgMDA6NDIsIEdhdXJhbmcgUmFt
ZXNoIE5haWsgPGdhdXJhbmdAdnQuZWR1PiB3cm90ZToKPj4gSGkgQWxsLAo+Pgo+PiBJcyBpdCBw
b3NzaWJsZSB0byB1c2UgQ1NBIHdoZW4gdGhlIEFQIG9wZXJhdGVzIG9uIGNoYW5uZWwgdGhhdCBk
byBub3QKPj4gcmVxdWlyZSBERlM/IENhbiBJIHRyaWdnZXQgQ1NBIGZyb20gdGhlIEFQIGluIHNv
bWUgd2F5Pwo+Cj4gWW91IGNhbiBhc2sgaG9zdGFwZCB2aWEgaG9zdGFwZF9jbGkgdG86Cj4KPiAg
Y2hhbl9zd2l0Y2ggNSA1MTgwCj4KPiBUaGlzIHdpbGwgc3RhcnQgQ1NBIHdpdGggQ1MgY291bnQ9
NSB0byBmcmVxdWVuY3kgNTE4MC4gSWYgeW91IHR5cGUKPiBjaGFuX3N3aXRjaCB3aXRob3V0IGFy
Z3VtZW50IEkgYmVsaWV2ZSB5b3Ugc2hvdWxkIGdldCBoZWxwL3VzYWdlIG9uCj4gdGhlIGNvbW1h
bmQuCj4KPgo+IE1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
