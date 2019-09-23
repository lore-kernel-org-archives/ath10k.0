Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCIdz-0004Kt-Fz
 for ath10k@lists.infradead.org; Mon, 23 Sep 2019 07:20:24 +0000
From: Yibo Zhao <yiboz@codeaurora.org>
Subject: [PATCH V3 0/4] Enable virtual time-based airtime scheduler support on
 ath10k
Date: Mon, 23 Sep 2019 15:19:57 +0800
Message-Id: <1569223201-1490-1-git-send-email-yiboz@codeaurora.org>
MIME-Version: 1.0
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
To: linux-wireless@vger.kernel.org
Cc: Yibo Zhao <yiboz@codeaurora.org>, ath10k@lists.infradead.org

VGhpcyBzZXJpZXMgZml4IHNvbWUgaXNzdWVzIHdoZW4gZW5hYmxpbmcgdmlydHVhbCB0aW1lLWJh
c2VkIGFpcnRpbWUgc2NoZWR1bGVyIG9uIGF0aDEway4KCkNoYW5nZXMgc2luY2UgdjI6CiAgQ2hh
bmdlcyBzdGF0aW9uIGFpcnRpbWUgd2VpZ2h0IHRvIGJlIHBlci1BQyBiYXNlZCB0byBhdm9pZCBz
eW5jIGlzc3VlCiAgUmVtb3ZlIENvLWRldmVsb3BlZC1ieSBhbmQgVG9rZSdzIHNpZ24tb2ZmIGFz
IFRva2Ugc3VnZ2VzdGVkCgpDaGFuZ2VzIHNpbmNlIHYxOgogIE1vZGlmeSB0aGUgYXV0aG9yIG9m
IENvLWRldmVsb3BlZC1ieSBhcyBKb2hhbm5lcyBzdWdnZXN0ZWQKClRva2UgSMO4aWxhbmQtSsO4
cmdlbnNlbiAoMSk6CiAgbWFjODAyMTE6IFN3aXRjaCB0byBhIHZpcnR1YWwgdGltZS1iYXNlZCBh
aXJ0aW1lIHNjaGVkdWxlcgoKWWlibyBaaGFvICgzKToKICBtYWM4MDIxMTogZGVmZXIgdHhxcyBy
ZW1vdmFsIGZyb20gcmJ0cmVlCiAgbWFjODAyMTE6IGZpeCBsb3cgdGhyb3VnaHB1dCBpbiBtdWx0
aS1jbGllbnRzIHNpdHVhdGlvbgogIG1hYzgwMjExOiBTeW5jIGFpcnRpbWUgd2VpZ2h0IHN1bSB3
aXRoIHBlciBBQyBzeW5jZWQgc3RhIGFpcnRpbWUKICAgIHdlaWdodCB0b2dldGhlcgoKIGluY2x1
ZGUvbmV0L21hYzgwMjExLmggICAgIHwgIDE2ICsrLQogbmV0L21hYzgwMjExL2NmZy5jICAgICAg
ICAgfCAgMjkgKysrKy0KIG5ldC9tYWM4MDIxMS9kZWJ1Z2ZzLmMgICAgIHwgIDQ4ICsrKysrKyst
CiBuZXQvbWFjODAyMTEvZGVidWdmc19zdGEuYyB8ICAxOCArLS0KIG5ldC9tYWM4MDIxMS9pZWVl
ODAyMTFfaS5oIHwgIDE3ICsrLQogbmV0L21hYzgwMjExL21haW4uYyAgICAgICAgfCAgIDggKy0K
IG5ldC9tYWM4MDIxMS9zdGFfaW5mby5jICAgIHwgIDI1ICsrKy0KIG5ldC9tYWM4MDIxMS9zdGFf
aW5mby5oICAgIHwgICA4ICstCiBuZXQvbWFjODAyMTEvdHguYyAgICAgICAgICB8IDI4MiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIDkgZmlsZXMgY2hhbmdl
ZCwgMzQ3IGluc2VydGlvbnMoKyksIDEwNCBkZWxldGlvbnMoLSkKCi0tIAoxLjkuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5n
IGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
