Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eedw0-0004Ug-1E
 for ath10k@lists.infradead.org; Thu, 25 Jan 2018 09:35:06 +0000
Subject: Re: [PATCH 0/2] ath10: Add support for Ubiquiti-branded QCA988X
References: <20180124194218.11408-1-tobleminer@gmail.com>
 <87efmezf07.fsf@kamboji.qca.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <b0940be0-9c6e-6877-fb85-c42ddbf79767@dd-wrt.com>
Date: Thu, 25 Jan 2018 10:34:40 +0100
MIME-Version: 1.0
In-Reply-To: <87efmezf07.fsf@kamboji.qca.qualcomm.com>
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

dWJpcXVpdGkgZGlkIG5vdCBjaGFuZ2UgdGhlIHBjaSB2ZW5kb3IgYW5kIGRldmljZSBpZC4ganVz
dCB0aGUgc3VidmVuZG9yIAphbmQgc3ViZGV2aWNlIGlkIGlzIGluZGl2aWR1YWwgYW5kIHRoaXMg
aXMgbm90IHVudXN1YWwgZm9yIG1vc3QgdmVuZG9ycwphbGwgdWJpcXVpdGkgY2FyZHMgaGF2ZSAw
eDA3NzcKYW5kIHllcyBpIGtub3cgYWxsIHRoZXNlIGFpcm1heCBkZXZpY2VzIGFuZCBoYXZlIHRo
ZW0gYW5kIHJ1bm5pbmcgYXRoMTBrIApvbiBpdCB3aXRob3V0IGFueSBpc3N1ZQoKQW0gMjUuMDEu
MjAxOCB1bSAwNjoyNSBzY2hyaWViIEthbGxlIFZhbG86Cj4gVG9iaWFzIFNjaHJhbW0gPHRvYmxl
bWluZXJAZ21haWwuY29tPiB3cml0ZXM6Cj4KPj4gQSBsb3Qgb2YgbW9yZSBtb2Rlcm4gVWJpcXVp
dGkgQWlyTUFYIHdpcmVsZXNzIGRldmljZXMgY29udGFpbiBhIHJlYnJhbmRlZAo+PiBRQ0E5ODhY
IHdpdGggY2hhbmdlZCBQQ0kgdmVuZG9yIGFuZCBkZXZpY2UgaWQuCj4+IFRoaXMgcGF0Y2ggYWRk
cyBzdXBwb3J0IGZvciB0aG9zZSBjaGlwcyBieSB0cmVhdGluZyB0aGVtIGFzIFFDQTk4OFggcmV2
Mgo+PiByYWRpb3MuCj4+Cj4+IFRvYmlhcyBTY2hyYW1tICgyKToKPj4gICAgcGNpOiBBZGQgdmVu
ZG9yIGlkIG9mIFViaXF1aXRpIE5ldHdvcmtzCj4+ICAgIGF0aDEwazogQWRkIHN1cHBvcnQgZm9y
IFVpcXVpdGkgcmVicmFuZGVkIFFDQTk4OFggdjIKPiBQbGVhc2UgcmVzZW5kIChhcyB2MikgYW5k
IGluY2x1ZGUgbW9yZSBsaXN0cy9wZW9wbGU6Cj4KPiBhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+IGxpbnV4LXdpcmVsZXNzQHZnZXIua2VybmVsLm9yZwo+IEJqb3JuIEhlbGdhYXMgPGJoZWxn
YWFzQGdvb2dsZS5jb20+Cj4gbGludXgtcGNpQHZnZXIua2VybmVsLm9yZwo+CgotLSAKTWl0IGZy
ZXVuZGxpY2hlbiBHcsO8c3NlbiAvIFJlZ2FyZHMKClNlYmFzdGlhbiBHb3R0c2NoYWxsIC8gQ1RP
CgpOZXdNZWRpYS1ORVQgR21iSCAtIERELVdSVApGaXJtZW5zaXR6OiAgU3R1YmVud2FsZGFsbGVl
IDIxYSwgNjQ2MjUgQmVuc2hlaW0KUmVnaXN0ZXJnZXJpY2h0OiBBbXRzZ2VyaWNodCBEYXJtc3Rh
ZHQsIEhSQiAyNTQ3MwpHZXNjaMOkZnRzZsO8aHJlcjogUGV0ZXIgU3RlaW5ow6R1c2VyLCBDaHJp
c3RpYW4gU2NoZWVsZQpodHRwOi8vd3d3LmRkLXdydC5jb20KZW1haWw6IHMuZ290dHNjaGFsbEBk
ZC13cnQuY29tClRlbC46ICs0OTYyNTEtNTgyNjUwIC8gRmF4OiArNDk2MjUxLTU4MjY1NjUKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFp
bGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
