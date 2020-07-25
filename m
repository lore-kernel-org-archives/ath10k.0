Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.as201155.net ([185.84.6.188])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzMJA-0003qy-Bi
 for ath10k@lists.infradead.org; Sat, 25 Jul 2020 15:41:57 +0000
Subject: Re: [RFC 0/7] Add support to process rx packets in thread
References: <1595351666-28193-1-git-send-email-pillair@codeaurora.org>
 <20200721172514.GT1339445@lunn.ch> <20200725081633.7432-1-hdanton@sina.com>
 <8359a849-2b8a-c842-a501-c6cb6966e345@dd-wrt.com>
 <20200725145728.10556-1-hdanton@sina.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <2664182a-1d03-998d-8eff-8478174a310a@dd-wrt.com>
Date: Sat, 25 Jul 2020 17:41:48 +0200
MIME-Version: 1.0
In-Reply-To: <20200725145728.10556-1-hdanton@sina.com>
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
To: Hillf Danton <hdanton@sina.com>
Cc: Andrew Lunn <andrew@lunn.ch>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "dianders@chromium.org" <dianders@chromium.org>, David Laight <David.Laight@ACULAB.COM>, Rakesh Pillai <pillair@codeaurora.org>, "evgreen@chromium.org" <evgreen@chromium.org>, "kuba@kernel.org" <kuba@kernel.org>, Markus Elfring <Markus.Elfring@web.de>, "johannes@sipsolutions.net" <johannes@sipsolutions.net>, "davem@davemloft.net" <davem@davemloft.net>, "kvalo@codeaurora.org" <kvalo@codeaurora.org>

Cj4+IGkgYWdyZWUuIGkganVzdCBjYW4gc2F5IHRoYXQgaSB0ZXN0ZWQgdGhpcyBwYXRjaCByZWNl
bnRseSBkdWUgdGhpcwo+PiBkaXNjdXNzaW9uIGhlcmUuIGFuZCBpdCBjYW4gYmUgY2hhbmdlZCBi
eSBzeXNmcy4gYnV0IGl0IGRvZXNudCB3b3JrIGZvcgo+PiB3aWZpIGRyaXZlcnMgd2hpY2ggYXJl
IG1haW5seSB1c2luZyBkdW1teSBuZXRkZXYgZGV2aWNlcy4gZm9yIHRoaXMgaQo+PiBtYWRlIGEg
c21hbGwgcGF0Y2ggdG8gZ2V0IHRoZW0gd29ya2luZyB1c2luZyBuYXBpX3NldF90aHJlYWRlZCBt
YW51YWxseQo+PiBoYXJkY29kZWQgaW4gdGhlIGRyaXZlcnMuIChzZWUgcGF0Y2ggYmVsbG93KQo+
IEJ5IENPTkZJR19USFJFQURFRF9OQVBJLCB0aGVyZSBpcyBubyBuZWVkIHRvIGNvbnNpZGVyIHdo
YXQgeW91IGRpZCBoZXJlCj4gaW4gdGhlIG5hcGkgY29yZSBiZWNhdXNlIGRldmljZSBkcml2ZXJz
IGtub3cgYmV0dGVyIGFuZCBhcmUgcmVzcG9uc2libGUKPiBmb3IgaXQgYmVmb3JlIGNhbGxpbmcg
bmFwaV9zY2hlZHVsZShuKS4KeWVhaC4gYnV0IHRoYXQgYXBwcm9hY2ggd2lsbCBub3Qgd29yayBm
b3Igc29tZSBjYXNlcy4gc29tZSBzdHVwaWQgCmRyaXZlcnMgYXJlIHVzaW5nIGxvY2tpbmcgY29u
dGV4dCBpbiB0aGUgbmFwaSBwb2xsIGZ1bmN0aW9uLgppbiB0aGF0IGNhc2UgdGhlIHBlcmZvcm1h
bmNlIHdpbGwgcnVudG8gc2hpdC4gaSBkaXNjb3ZlcmVkIHRoaXMgd2l0aCB0aGUgCm12bmV0YSBl
dGggZHJpdmVyIChtYXJ2ZWxsKSBhbmQgbXQ3NiB0eCBwb2xsaW5nIChyeMKgIHdvcmtzKQpmb3Ig
bXZuZXRhIGlzIHdpbGwgY2F1c2UgdmVyeSBoaWdoIGxhdGVuY2llcyBhbmQgcGFja2V0IGRyb3Bz
LiBmb3IgbXQ3NiAKaXQgY2F1c2VzIHBhY2tldCBzdG9wLiBkb2VzbnQgd29yayBzaW1wbHkgKG9u
IGFsbCBjYXNlcyBubyBjcmFzaGVzKQpzbyB0aGUgdGhyZWFkaW5nIHdpbGwgb25seSB3b3JrIGZv
ciBkcml2ZXJzIHdoaWNoIGFyZSBjb21wYXRpYmxlIHdpdGggCnRoYXQgYXBwcm9hY2guIGl0IGNh
bm5vdCBiZSB1c2VkIGFzIGRyb3AgaW4gcmVwbGFjZW1lbnQgZnJvbSBteSBwb2ludCBvZiAKdmll
dy4KaXRzIGFsbCBhIHF1ZXN0aW9uIG9mIHRoZSBkcml2ZXIgZGVzaWduCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0
aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vYXRoMTBrCg==
