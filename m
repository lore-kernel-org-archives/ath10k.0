Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gM2E1-0002YK-Pd
 for ath10k@lists.infradead.org; Mon, 12 Nov 2018 02:45:20 +0000
Subject: Re: [EXTERNAL] Re: [PATCH] ath10k: Disable 4addr source port learning
 in 10.4 FW by default
References: <20181109061121.4184-1-murugana@codeaurora.org>
 <0d74b002-e36d-8169-34e8-59338eac6918@newmedia-net.de>
 <00fd01d4798e$1c0d2f10$54278d30$@codeaurora.org>
From: Sebastian Gottschall <s.gottschall@newmedia-net.de>
Message-ID: <18df2020-f8c4-b9f7-cf9c-63802ea02429@newmedia-net.de>
Date: Mon, 12 Nov 2018 03:44:53 +0100
MIME-Version: 1.0
In-Reply-To: <00fd01d4798e$1c0d2f10$54278d30$@codeaurora.org>
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
To: murugana@codeaurora.org, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

aGludCBmb3IgYSBwb3NzaWJsZSBmaXgKCgpkaXNhYmxlXzRhZGRyX3NyY19scm4gaXMgbm90IHNl
dCBpbiAxMF80IHZkZXYgcGFyYW1ldGVyIG1hcC4gc28gdGhpcyAKZmVhdHVyZSBjYW5ub3Qgd29y
awoKCi0tLSB3bWkuY8KgwqDCoMKgwqDCoCAoUmV2aXNpb24gNDIxNCkKKysrIHdtaS5jwqDCoMKg
wqDCoMKgIChBcmJlaXRza29waWUpCkBAIC05NzIsNiArOTcyLDcgQEAKIMKgwqDCoMKgwqDCoMKg
IC5tZXJ1X3ZjID0gV01JX1ZERVZfUEFSQU1fVU5TVVBQT1JURUQsCiDCoMKgwqDCoMKgwqDCoCAu
cnhfZGVjYXBfdHlwZSA9IFdNSV9WREVWX1BBUkFNX1VOU1VQUE9SVEVELAogwqDCoMKgwqDCoMKg
wqAgLmJ3X25zc19yYXRlbWFzayA9IFdNSV9WREVWX1BBUkFNX1VOU1VQUE9SVEVELAorwqDCoMKg
wqDCoMKgIC5kaXNhYmxlXzRhZGRyX3NyY19scm4gPSBXTUlfVkRFVl9QQVJBTV9VTlNVUFBPUlRF
RCwKIMKgfTsKCiDCoHN0YXRpYyBzdHJ1Y3Qgd21pX3ZkZXZfcGFyYW1fbWFwIHdtaV8xMF80X3Zk
ZXZfcGFyYW1fbWFwID0gewpAQCAtMTA0OSw2ICsxMDUwLDcgQEAKIMKgwqDCoMKgwqDCoMKgIC5i
d19uc3NfcmF0ZW1hc2sgPSBXTUlfMTBfNF9WREVWX1BBUkFNX0JXX05TU19SQVRFTUFTSywKIMKg
wqDCoMKgwqDCoMKgIC5pbmNfdHNmID0gV01JXzEwXzRfVkRFVl9QQVJBTV9UU0ZfSU5DUkVNRU5U
LAogwqDCoMKgwqDCoMKgwqAgLmRlY190c2YgPSBXTUlfMTBfNF9WREVWX1BBUkFNX1RTRl9ERUNS
RU1FTlQsCivCoMKgwqDCoMKgwqAgLmRpc2FibGVfNGFkZHJfc3JjX2xybiA9IFdNSV8xMF80X1ZE
RVZfUEFSQU1fRElTQUJMRV80X0FERFJfU1JDX0xSTiwKIMKgfTsKCkFtIDExLjExLjIwMTggdW0g
MDg6MTMgc2NocmllYiBtdXJ1Z2FuYUBjb2RlYXVyb3JhLm9yZzoKPiBIaSBTZWJhc3RpYW4sCj4K
Pj4gYWZ0ZXIgdGVzdGVkIDIgV0RTIGRldmljZXMgKG9uZSBXRFMgQVAsIG9uZSBXRFMgU1RBKSB3
aXRoIDk5ODQgKG5ldGdlYXIKPj4gcjc4MDApIGkgZm91bmQgb3V0IHRoYXQgdGhlIGlzc3VlIHBl
cnNpc3RzLiBndGsgcmVrZXlpbmcgZmFpbHMsIHNvIGRpc2Nvbm5lY3QgYW5kCj4+IHJlY29ubmVj
dCBhZnRlciA2MCBtaW51dGVzLgo+IEFyZSB5b3UgdXNpbmcgdGhlIGxhdGVzdCBGVyAxMC40LTMu
Ni4wLjEtMDAwMDMgZm9yIDk5ODQgKCBtYWlubHkgb24gdGhlIEFQIHNpZGUgKSA/Cj4KPiAoaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZmlybXdhcmUvbGlu
dXgtZmlybXdhcmUuZ2l0L2NvbW1pdC8/aWQ9YTAwZTYxYjkyMDMxODY1NjFkYzkwZGUxZmY3ZWQ0
ZDVmNWU5MjBkNSkKPgo+IFRoYW5rcywKPiBTYXRoaXNoa3VtYXIKPgo+Cj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QK
YXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hdGgxMGsK
