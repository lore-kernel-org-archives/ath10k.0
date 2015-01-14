Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-we0-x22e.google.com ([2a00:1450:400c:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBKWB-0004N6-NZ
 for ath10k@lists.infradead.org; Wed, 14 Jan 2015 09:45:40 +0000
Received: by mail-we0-f174.google.com with SMTP id k48so7694646wev.5
 for <ath10k@lists.infradead.org>; Wed, 14 Jan 2015 01:45:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54B56D00.4010401@candelatech.com>
References: <54AEF595.9030205@candelatech.com>
 <CA+BoTQk86cnC1eRwqAbbnkMe7rDTvctH8o-JPvM3yT56nEes6g@mail.gmail.com>
 <54B00807.9060909@candelatech.com>
 <CA+BoTQ=Q-J0x1AbNNVAuwgTq1Ar8D=pki2=pWW=9upWp06h2rQ@mail.gmail.com>
 <54B56D00.4010401@candelatech.com>
Date: Wed, 14 Jan 2015 10:45:14 +0100
Message-ID: <CA+BoTQ=7BDPUs+B4-wBp5RRhKpvjHcTtbo=CFqj6e62rA+HnGA@mail.gmail.com>
Subject: Re: Anyone seeing tx-credits 'hang'?
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

T24gMTMgSmFudWFyeSAyMDE1IGF0IDIwOjA3LCBCZW4gR3JlZWFyIDxncmVlYXJiQGNhbmRlbGF0
ZWNoLmNvbT4gd3JvdGU6ClsuLi5dCj4KPiBJIG1hbmFnZWQgdG8gZ2V0IHNvbWUgYmV0dGVyIGRl
YnVnIG91dCBvZiB0aGUgZmlybXdhcmUuCj4KPiBJIGFtIGhhdmluZyBhIGhlbGwgb2YgYSB0aW1l
IGZpZ3VyaW5nIG91dCBob3cgdGhlIGNvZGUgZmxvd3MgdGhyb3VnaCBhbGwKPiBvZiB0aGUgY2Fs
bGJhY2tzIChpbiBib3RoIGZpcm13YXJlIGFuZCBkcml2ZXIpLCBidXQgaXQgYXBwZWFycyB0aGlz
IGlzIHdoYXQgaGFwcGVuZWQ6Cj4KPiAoSSBoYXZlIGluc3RydW1lbnRlZCB0cmFuc2Zlci1pZCBp
biBib3RoIGZpcm13YXJlIGFuZCBkcml2ZXIpCj4KPiBmaXJtd2FyZSBzZW50IHdtaSBtZXNzYWdl
IHdpdGggdHJhbnNmZXItaWQgb2YgNzIuCj4ga2VybmVsIHJlY2VpdmVkIHRoaXMgdHJhbnNmZXIt
aWQKPiBmaXJtd2FyZSdzIGxhc3Qgc2VuZC1jYWxsYmFjayB0cmFuc2ZlciBJRCBpcyA3MS4KPgo+
IFNvLCBpdCBzZWVtcyB0aGF0IGVpdGhlciBhdGgxMGsgZGlkIG5vdCBkbyB0aGUgdHJhbnNmZXIt
Y29tcGxldGUgbG9naWMsCj4gZGlkIGl0IGluY29ycmVjdGx5LCBvciB0aGUgZmlybXdhcmUgZGlk
IG5vdCBub3RpY2UgaXQgd2FzIGRvbmUuCj4KPiBJIGNhbm5vdCBmaW5kIHdoZXJlIHRoZSB0cmFu
c2ZlciBjb21wbGV0ZSBjb2RlIHRoYXQgc2hvdWxkIGJlIHVwZGF0aW5nCj4gZmlybXdhcmUgaXMg
YXQuICBJZiB5b3Uga25vdywgY2FuIHlvdSBwb2ludCBtZSB0byBpdD8KCkkgdGhpbmsgdGhlIHNl
bmQtY2FsbGJhY2sgc2hvdWxkIGJlIGNhbGxlZCB3aGVuIENFIGlzIHNpbXBseSBkb25lCmRvaW5n
IGl0J3Mgc3R1ZmYuIFRoZXJlJ3Mgbm8gbmVlZCBmb3IgdGhlIG90aGVyIHNpZGUgdG8gYWNrIGFu
eXRoaW5nCmV4cGxpY2l0bHkgKGl0IGp1c3QgbmVlZHMgdG8gaGF2ZSBhIGZyZWUgYnVmZmVyIG9u
IGl0J3Mgc2lkZSBzbyBDRSBjYW4KY29weSBpdCBvdmVyKS4KCk9yIG1heWJlIGl0IGlzIHRoZSBI
T1NUX0lTX0NPUFlfQ09NUExFVEVfTUFTSz8gTm90IHJlYWxseSBzdXJlLgoKCk1pY2hhxYIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWls
aW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
