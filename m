Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e6iVf-000342-AX
 for ath10k@lists.infradead.org; Mon, 23 Oct 2017 19:35:42 +0000
Subject: Re: [PATCH] ath10k: rebuild crypto header in RX data frames
References: <150851690590.5158.11970481736247725763.stgit@potku.adurom.net>
 <c9bdd915-0667-eee0-3b52-1fdf15abf249@dd-wrt.com>
 <fb5f8df1-aa9a-2646-5f98-afc852acce5c@qti.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <3866abd1-e68c-ff83-0463-f4c4042a69b6@dd-wrt.com>
Date: Mon, 23 Oct 2017 21:35:09 +0200
MIME-Version: 1.0
In-Reply-To: <fb5f8df1-aa9a-2646-5f98-afc852acce5c@qti.qualcomm.com>
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
To: Vasanthakumar Thiagarajan <vthiagar@qti.qualcomm.com>, Kalle Valo <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

QW0gMjMuMTAuMjAxNyB1bSAxNjoyNCBzY2hyaWViIFZhc2FudGhha3VtYXIgVGhpYWdhcmFqYW46
Cj4gT24gU2F0dXJkYXkgMjEgT2N0b2JlciAyMDE3IDAxOjQxIEFNLCBTZWJhc3RpYW4gR290dHNj
aGFsbCB3cm90ZToKPj4gaSBzdWdnZXN0IHRoZSBmb2xsb3dpbmcgcGF0Y2ggb24gdG9wIG9mIHlv
dXJzLiBwbGVhc2UgdGVsbCBtZSBpZiBteSB0aG91Z2h0cyBhcmUgY29ycmVjdCBoZXJlLiBpdHMg
bWFpbmx5IGEgZ3Vlc3MKPiBJIGFncmVlIHdlIG5lZWQgdG8gdGFrZSBjYXJlIG9mIHRoaXMgZm9y
IG5ld2x5IGFkZGVkIGNpcGhlcnMgYXMgd2VsbC4gSG93IGFib3V0IG1ha2luZyBpdCBhcyBhIHNl
cGFyYXRlIHBhdGNoCj4gdG8gbWFrZSB0aGUgcGF0Y2ggYml0IHNtYWxsZXIgYW5kIHRvIHJlZHVj
ZSB0aGUgZGlmZmljdWx0aWVzIGluIGJhY2sgcG9ydGluZyBpdCBmb3IgY2lwaGVycyBzdXBwb3J0
ZWQgZm9yIGxvbmcKPiB0aW1lPwp0aGUgcGF0Y2ggZm9yIHRoZXNlIGJvdGggY2lwaGVycyBkb2Vz
bnQgbWFrZSBpdCBiaWdnZXIuIGp1c3QgYSBmZXcgCmxpbmVzLiB0aGUgbWFpbiBwcm9ibGVtIHJp
Z2h0IG5vdyBpcyB0aGF0IHRoZSBvcmlnaW5hbCBwYXRjaCB3aXRob3V0IG15IAplbmhhbmNlbWVu
dHMgaXNudCB3b3JraW5nLiBpdCBicmVha3MgZW5jcnlwdGlvbgo+IFZhc2FudGgKCgotLSAKTWl0
IGZyZXVuZGxpY2hlbiBHcsO8c3NlbiAvIFJlZ2FyZHMKClNlYmFzdGlhbiBHb3R0c2NoYWxsIC8g
Q1RPCgpOZXdNZWRpYS1ORVQgR21iSCAtIERELVdSVApGaXJtZW5zaXR6OiAgU3R1YmVud2FsZGFs
bGVlIDIxYSwgNjQ2MjUgQmVuc2hlaW0KUmVnaXN0ZXJnZXJpY2h0OiBBbXRzZ2VyaWNodCBEYXJt
c3RhZHQsIEhSQiAyNTQ3MwpHZXNjaMOkZnRzZsO8aHJlcjogUGV0ZXIgU3RlaW5ow6R1c2VyLCBD
aHJpc3RpYW4gU2NoZWVsZQpodHRwOi8vd3d3LmRkLXdydC5jb20KZW1haWw6IHMuZ290dHNjaGFs
bEBkZC13cnQuY29tClRlbC46ICs0OTYyNTEtNTgyNjUwIC8gRmF4OiArNDk2MjUxLTU4MjY1NjUK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsg
bWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
