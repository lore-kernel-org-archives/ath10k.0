Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cQWv9-0001d1-7N
 for ath10k@lists.infradead.org; Mon, 09 Jan 2017 10:11:20 +0000
MIME-Version: 1.0
Date: Mon, 09 Jan 2017 15:40:57 +0530
From: Tamizh chelvam <tamizhchelvam@codeaurora.org>
Subject: Re: [PATCH 2/4] cfg80211: Add new NL80211_CMD_SET_BTCOEX_PRIORITY to
 support BTCOEX
In-Reply-To: <1483623500.4394.18.camel@sipsolutions.net>
References: <1478610932-21954-1-git-send-email-c_traja@qti.qualcomm.com>
 <1478610932-21954-3-git-send-email-c_traja@qti.qualcomm.com>
 <1480949353.31788.27.camel@sipsolutions.net>
 <5e5e8971c96293a81e7cb37bcdfbd593@codeaurora.org>
 <1481645351.20412.34.camel@sipsolutions.net>
 <134cc8e58ecb804b6dda0137c4c37be8@codeaurora.org>
 <1481881024.27953.14.camel@sipsolutions.net>
 <ae82112880d55451342e7a6e5a47c33f@codeaurora.org>
 <1483354130.4596.5.camel@sipsolutions.net>
 <a5521b4e246de90ed8526891c84a97e5@codeaurora.org>
 <1483623500.4394.18.camel@sipsolutions.net>
Message-ID: <6f9711ed6f6fe170b915b67a054b985b@codeaurora.org>
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
To: Johannes Berg <johannes@sipsolutions.net>
Cc: c_traja@qti.qualcomm.com, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

SGkgSm9oYW5uZXMsCgpUaGFuayB5b3UgZm9yIHRoZSByZXBseS4KCk9uIDIwMTctMDEtMDUgMTk6
MDgsIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4+ID4gSU9XIC0gd2h5IGhhdmUgYWxsIHRoZXNlIGJp
dHMgcmF0aGVyIHRoYW4ganVzdCBvbmU/Cj4+IAo+PiBIYXJkd2FyZSBzdXBwb3J0cyBkYXRhIGFj
cm9zcyBhbGwgdGhlIGFjY2VzcyBjYXRlZ29yaWVzLCB0aGlzIGlzCj4+IGp1c3TCoCBtZWFudCBm
b3IgcHJpb3JpdGlzaW5nIHRoZSB0cmFmZmljLiBmLmUsIElmIHRoZSBmdy90YXJnZXQgaGFzCj4+
IGJvdGggd2xhbiBhbmQgYnQgdHJhZmZpYyBxdWV1ZWQgYW5kIGlmIFZPIGlzwqAgc2V0IGFzIHBy
aW9yaXR5LCB0aGVuCj4+IHdsYW4gVk8gcGFja2V0cyB3aWxsIGJlIHB1c2hlZCBvdXQgb2YgdGhl
IHJhZGlvIGZpcnN0IGFuZCB0aGVuIHRoZSBidAo+PiB0cmFmZmljLgo+IAo+IEV4YWN0bHkuIFNv
IGFzIGZhciBhcyAqY2FwYWJpbGl0aWVzKiBhcmUgY29uY2VybmVkLCB3aHkgZG8gd2UgbmVlZCBz
bwo+IG1hbnkgYml0cz8KPiAKSXMgaXQgZmluZSB0byBoYXZlIHNvbWV0aGluZyBsaWtlIHRoaXMK
CjEpIFdlIGNhbiBoYXZlIHRoaXMgYnRjb2V4X3ByaW9yaXR5IHZhbHVlIGFzIGEgb3B0aW9uYWwg
dmFsdWUgaW4gYnRjb2V4IAplbmFibGUgY29tbWFuZCBsaWtlIGJlbG93CgppdyBwaHlYIGJ0Y29l
eF9zdGF0ZSA8ZW5hYmxlfCBkaXNhYmxlPiBbcHJpcm9yaXR5KHZlbmRvciBzcGNpZmljIHZhbHVl
KV0KCjIpIE9yIHdlIGNhbiBoYXZlIHNlcGVyYXRlIGNvbW1hbmQgZm9yIGJ0Y29leF9wcmlvcml0
eSBhcyBiZWxvdwoKaXcgcGh5WCBzZXQgYnRjb2V4X3ByaW9yaXR5IDxwcmlvcml0eSAodmVuZG9y
IHNwY2lmaWMgdmFsdWUpPgoKSG9wZWZ1bGx5IHRoaXMgd2lsbCBnZXQgcmlkIG9mZiBhbGwgdGhl
IG5sODAyMTEgYml0cy4KCktpbmRseSBzdWdnZXN0IHlvdXIgdGhvdWdodHMuCgpUaGFua3MsClRh
bWl6aC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0
aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
