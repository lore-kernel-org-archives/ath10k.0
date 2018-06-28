Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from venus.chaos.hg.tu-darmstadt.de ([2001:41b8:83f:4242::b182])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYbvu-0008Bo-M6
 for ath10k@lists.infradead.org; Thu, 28 Jun 2018 18:46:20 +0000
Received: from Harry-3.hq (unknown
 [IPv6:2a02:908:1d2:7840:a865:a9bf:e565:4294])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: skorpy)
 by venus.chaos.hg.tu-darmstadt.de (Postfix) with ESMTPSA id 6227C44E3
 for <ath10k@lists.infradead.org>; Thu, 28 Jun 2018 20:46:00 +0200 (CEST)
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add ZyXEL WRE6606 specific BDFs
From: Skorpy <skorpy@darmstadt.ccc.de>
References: <ab6baeb5-3f07-78a0-e62e-4b4154b8c82d@darmstadt.ccc.de>
Message-ID: <f3c6b7e4-4e02-e341-03b0-e5fe4b7c4b8d@darmstadt.ccc.de>
Date: Thu, 28 Jun 2018 20:45:59 +0200
MIME-Version: 1.0
In-Reply-To: <ab6baeb5-3f07-78a0-e62e-4b4154b8c82d@darmstadt.ccc.de>
Content-Language: de-DE
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

SGksCgpUaGlzIGlzIGEgc2V0IG9mIGJvYXJkLmJpbiBmaWxlcyBmb3IgdGhlIFp5WEVMIFdSRTY2
MDYgUm91dGVyIFswXSwKd2hpY2ggSSB3aXNoIHRvIGJlIGFkZGVkIHRvIHRoZSBhdGgxMGstZmly
bXdhcmUgcmVwb3NpdG9yeS4KCgpBcyBwZXIgdGhlIGN1cnJlbnQgIlN1Ym1pdHRpbmcgYm9hcmQg
ZmlsZXMiIGd1aWRlbGluZXMgWzFdOgoKKiBkZXNjcmlwdGlvbiBmb3Igd2hhdCBoYXJkd2FyZSB0
aGlzIGlzOgoKICAgIC0gaXQgaXMgYSBJUFE0MDE4IGJhc2VkIGJvYXJkIFswXQogICAgLSBvbmUg
UUNBNDB4eCByYWRpbyBpcyB1c2VkIGFzIDIuNEdIeiByYWRpbwogICAgLSBvbmUgUUNBNDB4eCBy
YWRpbyBpcyB1c2VkIGFzIDVHSHogcmFkaW8KCiogb3JpZ2luIG9mIHRoZSBib2FyZCBmaWxlIChk
aWQgeW91IGNyZWF0ZSBpdCB5b3Vyc2VsZiBvciB3aGVyZSB5b3UKICAgIGRvd25sb2FkZWQpCgog
ICAgLSBBbGwgZmlsZXMgd2VyZSBleHRyYWN0ZWQgZnJvbSBvZmZpY2lhbCB2ZW5kb3IgZmlybXdh
cmUgd2hpY2ggd2FzIG9uCnRoZSBkZXZpY2UgZnJvbSB0aGUgZmFjdG9yeQogICAgLSBCb2FyZGZp
bGVzIGFsc28gaW5jbHVkZWQgaW4gdGhlIHZlbmRvciBmaXJtd2FyZSBpbWFnZSBvZiB0aGUgTkJH
NjYxNwoKKiBpZHMgdG8gYmUgdXNlZCB3aXRoIHRoZSBib2FyZCBmaWxlIChBVEgxMEtfQkRfSUVf
Qk9BUkRfTkFNRSBpbiBhdGgxMGspCiAgICAtIHFjYTQwMTkgaHcxLjAKICAgICAgKyBidXM9YWhi
LGJtaS1jaGlwLWlkPTAsYm1pLWJvYXJkLWlkPTI0LHZhcmlhbnQ9WnlYRUwtV1JFNjYwNgoKICAg
ICAgKyBidXM9YWhiLGJtaS1jaGlwLWlkPTAsYm1pLWJvYXJkLWlkPTI1LHZhcmlhbnQ9WnlYRUwt
V1JFNjYwNgoKKiBzaGEyNTZzdW0gb2YgZWFjaCBuZXcgYm9hcmQgZmlsZSB0byBhZGQKICAgICAt
IGJ1cz1haGIsYm1pLWNoaXAtaWQ9MCxibWktYm9hcmQtaWQ9MjQsdmFyaWFudD1aeVhFTC1XUkU2
NjA2CiAgICAgICBoYXMgc2hhMjU2c3VtOgoxYWVhZTQ5ODEyMTdiNjM4ODNlMjBlY2JhYjYzODBh
ZmY0MDQ5ODU0ODViZjFlODgxZmIwZmM4NzRmMmEwODgzCgogICAgIC0gYnVzPWFoYixibWktY2hp
cC1pZD0wLGJtaS1ib2FyZC1pZD0yNSx2YXJpYW50PVp5WEVMLVdSRTY2MDYKICAgICAgIGhhcyBz
aGEyNTZzdW06CjQ2OWU4MWZkMjU5M2NiYTQ0MmMwZDgxMGNlOTIzMDliYjkyZWFhNDJiYmRkYmJi
ZjRlYzA1MWZhYmQzNDVlY2YKCiogYXR0YWNoIHRoZSBhY3R1YWwgYm9hcmQgZmlsZSAoYm9hcmQu
YmluKQoKICAgIC0gVGhlIG5hbWUgb2YgdGhlIGZpbGVzIGFyZSBlcXVhbCB0byB0aGUgaWQgc3Ry
aW5nIGluIHRoZSBib2FyZC0yLmJpbgogICAgICAobWludXMgdGhlICIuYmluIikKCktpbmQgcmVn
YXJkcywKTWFnbnVzIEZyw7xobGluZwoKWzBdIDxodHRwczovL3dpa2lkZXZpLmNvbS93aWtpL1p5
WEVMX1dSRTY2MDY+CgpbMV0gPGh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL3Vz
ZXJzL2RyaXZlcnMvYXRoMTBrL2JvYXJkZmlsZXM+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
YXRoMTBrCg==
