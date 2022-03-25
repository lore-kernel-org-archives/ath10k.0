Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFEDC433F5
	for <ath10k@archiver.kernel.org>; Fri, 25 Mar 2022 10:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Mime-Version:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uP3UwzBfUdeUcv7JEmBhmgykG6jVp9Czk67EXUyaLUg=; b=AaW6HEX2cyHiXH
	OGy5qeQ4EkH1HQ+gDSEu4k3c1oauN5psPCSFIrFm+SfbOiKGe887DrXxRlY3F2VlBLbX/kqj+P6k2
	0Fuu4Tq/Ib/TSAxTkc0LuavlAE5uYVsKs7n3H+4p7csalumwUWZF/UGffLKkFalVbpISZaKO0pHcd
	VR7C7YeJtlMB9vMGvHpAfxvzkN/RdzzKCJXkdqBVaKb8SYxjXCSwp7lKq/qmDrLF+lbA/peztSTgg
	09TT7NCsu7q3s/dGZiLejW0Yw79zwtCJm2ZhgjCBV9DwMPXzCmOBSLyZ/qo5ACh/oxSZgieNoW7QF
	KoZoPA1KXdiHBgupbq1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXhIT-001l9P-U0; Fri, 25 Mar 2022 10:35:58 +0000
Received: from out203-205-251-59.mail.qq.com ([203.205.251.59])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXh0J-001fTo-3l
 for ath10k@lists.infradead.org; Fri, 25 Mar 2022 10:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1648203429; bh=6EJzo8Zj5NxbWpGQQX0f8UM3xesz2x134df+LYYpe8U=;
 h=From:To:Subject:Date;
 b=WGOl4hFbUQ59elJuNjWECugbdwabVqTRR7+X8TKfWexCOQtH/p6ofILO0ZntAZXT+
 WxfbHwseS6vSlyZMviiZ0fuVA2NpXt0iRhnfqBWgonlVg5rpdd6z3MZL8nda+Kgwok
 aIvylBtskDl8LUeJDYXii9MgICdAdP9yvfSq2lLY=
X-QQ-FEAT: c2tmyB/8aFHUfZq1QDNYaEiBcVndZ0Rc
X-QQ-SSF: 000000000000006000000000000000A
X-QQ-XMAILINFO: MHgIBY//xn2MON7hux/nUgF6q/kO7F2YzFxBdJD6GaCPDPkjTGh13g5P71AFhM
 nLGGKAaYJ5tB6/kDu+k1H445KZUcEip2jqTcaUpkcLvAAUZ1/LaPj+sFKsu4OPBmFHGY4akrFUj4k
 rG0FPsELGg8QdWVm8zQHI0XJv1Rjef1AMAu9uuT1IwcAuW9raHp0eWiSHHx6Prz6P31eNu3NbrSko
 XMik6UJjRmv5b1xVz3jEQW+2sd2E20oNPo1E0AdyQHqvLS42naGJOO4Sd8ArezFwia4C5kB6BlNQW
 HqRq8vkCk5hyG889PqCghpDSVks27Nakdx+0+B10mNrT4THNZ+k/9mOcyoxG95OFFmJKNxBsA2w3I
 5Sfo/tKZWh3NwvfjCHARhg7xzeI5RgrHdMaKfGPZF1TwxL58sOuwW7bQII2cB4wLU+ekfplt/o4AF
 FfXvmHHGIMGgIlmbWv4KMMwSoiJk+3M8qH3wjoo49+flM72b/QMW7Xf9CIbkSEQjj/qanx3lxexrE
 2ImEF9AkPefIlSx3+3kQTctWncQ1TaigHVWp/ld6gv/Zb/79vYhrePuB8r/k/xbi2hkv4EINYzrsv
 EjGWBUpr3NIma9qIQXDTB7V+jAKqdQyyfHd3PKJ+IHjEjysn9w5r/zuBXUmFGa5YUBCSMF9CBk7iI
 SDatvMHhRLOmd0T5KVE8HTMCw0q9kbJxglY89XVEu/2+imsJuIxSNFSJHLJaPOmzYAkvS0scNPnH7
 GLgVqGAjo8DQ8Kv8WxmGaEgOOYNlZVCN5Me+NnY/fkyIckqIZP3XzsoEWM3+Paqr2WnmSIy50HyuN
 tDVlO4DQjDmXjVCHPrTbDDdQ16Na+2IoI6K9HOY8Ur074PAYsU2D65DqjPZp03ZF8pNF6zEktcxOD
 WPhTT4Yx3Y=
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 111.175.201.132
X-QQ-STYLE: 
X-QQ-mid: webmail332t1648203428t4255587
From: "=?gb18030?B?1cXF9A==?=" <1805692831@qq.com>
To: "=?gb18030?B?YXRoMTBr?=" <ath10k@lists.infradead.org>
Subject: ath10k-firmware: QCA4019 hw1.0: Update Qxwlan E2600AC c2 specific BDFs
Mime-Version: 1.0
Date: Fri, 25 Mar 2022 18:17:08 +0800
X-Priority: 3
Message-ID: <tencent_890F07B1E479A19CA33C496B5DF86D63EF05@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_031711_493405_A3847CCD 
X-CRM114-Status: GOOD (  11.36  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="gb18030"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

SGksCk1vZGlmaWVkIHRoZSByYWRpbyBmcmVxdWVuY3kgaGFyZHdhcmUgcGFydCBvZiBlMjYwMGFj
IGMyLApuZWVkIHRvIGNvb3BlcmF0ZSB3aXRoIHRoZSBtb2RpZmllZCBib2FyZC5iaW4gZmlsZSwg
dGhlIGRldmljZQpjYW4gd29yayBub3JtYWxseS4KCgoKRm9yIHRoZSBxdWVzdGlvbnMgZnJvbSB0
aGUgd2lraSBwYWdlOgoKKiBkZXNjcmlwdGlvbiBmb3Igd2hhdCBoYXJkd2FyZSB0aGlzIGlzOgoK
LSBpdCBpcyBhIElQUTQwMTkgYmFzZWQgYm9hcmQgKEFQLURLMDQgYW5kIEFQLURLMDcpCi0gb25l
IFFDQTQweHggcmFkaW8gaXMgdXNlZCBhcyAyLjQgR0h6IHJhZGlvCi0gb25lIFFDQTQweHggcmFk
aW8gaXMgdXNlZCBhcyA1IEdIeiByYWRpbwotIG9uZSBRQ0E0MHh4IHJhZGlvIGlzIHVzZWQgYXMg
NSBHSHogcmFkaW8KCiogb3JpZ2luIG9mIHRoZSBib2FyZCBmaWxlIChkaWQgeW91IGNyZWF0ZSBp
dCB5b3Vyc2VsZiBvciB3aGVyZSB5b3UgZG93bmxvYWRlZCkKCi0gVGhlIGJvYXJkIGZpbGUocykg
d2hlcmUgZXh0cmFjdGVkIGZyb20gdGhlIFF4d2xhbiBmaXJtd2FyZS4gCi0gVGhlIGZpbGVzIGlu
IHRoaXMgZW1haWwgYXJlOgoqIGJvYXJkX3dpZmkwXzJnLmJpbgoqIGJvYXJkX3dpZmkwXzVnLmJp
bgoqIGJvYXJkX3dpZmkxXzVnLmJpbgoKKiBpZHMgdG8gYmUgdXNlZCB3aXRoIHRoZSBib2FyZCBm
aWxlIChBVEgxMEtfQkRfSUVfQk9BUkRfTkFNRSBpbiBhdGgxMGspCgotIFFDQTQwMTkgaHcxLjAK
CisgYnVzPWFoYixibWktY2hpcC1pZD0wLGJtaS1ib2FyZC1pZD0yMCx2YXJpYW50PVF4d2xhbi1F
MjYwMEFDLUMyYmluCnNoYTI1NnN1bToKYTNiMzY4N2MxZDgwZGM5MmI1ZDc4YjFhYTIwNWYxNDYz
YmQxMWY0ZWZjMjlmNzMxMWJkYWFiYzI4YzFkM2ViMgorYnVzPWFoYixibWktY2hpcC1pZD0wLGJt
aS1ib2FyZC1pZD0yMSx2YXJpYW50PVF4d2xhbi1FMjYwMEFDLUMyYmluCnNoYTI1NnN1bToKMTEz
ODk0ZTBkMWU0ZTdmZWVlZDY5YzQ4MWYxZWZhYWRlNTExZDA1ZGI3MWUxMjVjZjBiMzJhOTJiM2Q1
MDUyMwpzaGEyNTZzdW06CjUzMjg3MTNlNjRlYzhjY2IzYjA0MGVhODQ4NmY3N2JjOTY2MmEzOTBl
NWZkMjMxNDU4MzMyMTU5YzEzMTJmMGUKCgoKKiBhdHRhY2ggdGhlIGFjdHVhbCBib2FyZCBmaWxl
IChib2FyZC5iaW4pCgotIFRoZSBuYW1lIG9mIHRoZSBmaWxlcyBhcmUgZXF1YWwgdG8gdGhlIGlk
IHN0cmluZyBpbiB0aGUgYm9hcmQtMi5iaW4gKG1pbnVzIHRoZSAiLmJpbiIpCgoKS2luZCByZWdh
cmRzLCAK1cXF9ApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
