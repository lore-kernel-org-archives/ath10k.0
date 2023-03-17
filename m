Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D44C6FD1D
	for <ath10k@archiver.kernel.org>; Fri, 17 Mar 2023 11:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OmFNYcP5dpaG2tcsFmMU2IaPO6VNQeabjbFd4hGrCWM=; b=24Bhaqawieb0o5
	eZCyHFHjtl/M2y/BuDnBUS0EHCqK8YgjzfocpOy5c4l/EvPRk61sWtNqBmxvRMCDbsaCx7rU2yZG3
	ZHwwpCHy/JT+xZeDt6XtdXh4yIJFkzUuiUn+n+6uIIYGySMgMXl3OscFhq65UzUSAzQhTdIx6icNU
	FmnffvqYPDwSipplg1yGhxZZ3xNGH4KprDOTmE04nFjoAbaieC11fyUn6fXIjk2XXwaK1Aa7mR8jc
	UK9UcLMIAMd+5VaDig4mPxgg8hN6io8hr5u+1nCPvu8HJe499sugD4eBbS4Cs/yQ2C3Qu/E603iZr
	L5Bl4VVAIDaUx/yMZ6IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8S3-0026jf-1n;
	Fri, 17 Mar 2023 11:40:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8S0-0026iP-1c
	for ath10k@lists.infradead.org;
	Fri, 17 Mar 2023 11:40:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D922CB82560;
	Fri, 17 Mar 2023 11:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D46CC433D2;
	Fri, 17 Mar 2023 11:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679053245;
	bh=gP1R/FRq3r/Xz1kJ3JlEN59iRHFgwa1JE38yCbBwzEA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ak5VAVmUuzK5Tnc1L55LtBDKnsra9QAI9rbSG0MSXMEq9RpcIMvLovZo3W8x/4a/s
	 xM3jumq4NRrk4YlJrnsDClPPzTwxyReeqH9j8pbSSBcqxOZb33eP8mLFY+p7zWOD5y
	 tg5OcljTB+uTunR2qufvrIm0FKsDsakkWJn4P8k+zVXbt+3FpaHCGrhRgcrs5BrT09
	 vg0lPXE54l+Ve2w7T3FkdyfHWSswpGUeU1pSBTnIiKmAbXoWZFUND4RWEaqyvP4Y42
	 9cWMAuEler9H3o8KUZRa/t8U773Nyy8QiDR+oJDPK8e15K0Co0Y9YHDmdy1nfZgl6g
	 scEdxL2tq491w==
From: Kalle Valo <kvalo@kernel.org>
To: INAGAKI Hiroshi <musashino.open@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Sony NCP-HG100/Cellular specific BDFs
References: <0c3ad727-6f67-846a-f3a6-5028fe3ffd06@gmail.com>
Date: Fri, 17 Mar 2023 13:40:41 +0200
In-Reply-To: <0c3ad727-6f67-846a-f3a6-5028fe3ffd06@gmail.com> (INAGAKI
	Hiroshi's message of "Sun, 28 Aug 2022 15:11:40 +0900")
Message-ID: <87wn3fk3ly.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_044048_681965_8E4D4873 
X-CRM114-Status: GOOD (  14.31  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

SU5BR0FLSSBIaXJvc2hpIDxtdXNhc2hpbm8ub3BlbkBnbWFpbC5jb20+IHdyaXRlczoKCj4gVGhl
c2UgZmlsZXMgYXJlIFNvbnkgTkNQLUhHMTAwL0NlbGx1bGFyIHNwZWNpZmljIEJERnMgZXh0cmFj
dGVkIGZyb20KPiBzdG9jayBmaXJtd2FyZS4KPgo+Cj4gUmVxdWlyZWQgaW5mb3JtYXRpb246Cj4K
PiAqIGRlc2NyaXB0aW9uIGZvciB3aGF0IGhhcmR3YXJlIHRoaXMgaXM6Cj4KPiDCoCAtIGl0IGlz
IGEgSVBRNDAxOSBiYXNlZCBib2FyZAo+IMKgwqDCoCAtICIvQ2VsbHVsYXIiIG1vZGVsIGlzIGEg
dmFyaWFudCB3aXRoIGEgV1dBTiBtb2R1bGUgb2YgTkNQLUhHMTAwLCB0aGUKPiDCoMKgwqDCoMKg
wqAgc2FtZSBib2FyZCBmaWxlcyBtYXkgYmUgdXNlZCBpbiAiL1dMQU4iIG1vZGVsIGJ1dCB1bmNv
bmZpcm1lZC4gU28KPiDCoMKgwqDCoMKgwqAgSSBzZW50IHRoZXNlIGZpbGVzIGFzIGZvciAiL0Nl
bGx1bGFyIiBtb2RlbC4KPiDCoCAtIG9uZSBRQ0E0MHh4IHJhZGlvIGlzIHVzZWQgYXMgMi40R0h6
IHJhZGlvCj4gwqAgLSBvbmUgUUNBNDB4eCByYWRpbyBpcyB1c2VkIGFzIDVHSHogcmFkaW8KPgo+
ICogb3JpZ2luIG9mIHRoZSBib2FyZCBmaWxlcwo+Cj4gwqAgLSBleHRyYWN0ZWQgZnJvbSBzdG9j
ayBmaXJtd2FyZQo+Cj4gKiBpZHMgdG8gYmUgdXNlZCB3aXRoIHRoZSBib2FyZCBmaWxlcwo+Cj4g
wqAgLSBidXM9YWhiLGJtaS1jaGlwLWlkPTAsYm1pLWJvYXJkLWlkPTIwLHZhcmlhbnQ9U29ueS1O
Q1AtSEcxMDAtQ2VsbHVsYXIKPiDCoMKgwqAgc2hhMjU2c3VtOgo+IDZhNGJlNTYxMTFiY2E1ZDJj
ZmVkYjgzZDI2NjdmNGUwZjM0ZDMxZWI2NDE4NTY1MTBmMzcwYjUzYTIyMzgxOWIKPiDCoCAtIGJ1
cz1haGIsYm1pLWNoaXAtaWQ9MCxibWktYm9hcmQtaWQ9MjEsdmFyaWFudD1Tb255LU5DUC1IRzEw
MC1DZWxsdWxhcgo+IMKgwqDCoCBzaGEyNTZzdW06Cj4gMDIyNjZjYTdjNzcwZGFjNzczMjQ1MWM0
YTc0Yjg1Y2I4OTVkN2UyZDYxNmUxOTAyOWVmM2ZmZTQ0YzA0MGUwOQo+Cj4gKiBhdHRhY2ggdGhl
IGFjdHVhbCBib2FyZCBmaWxlIChib2FyZC5iaW4pCj4KPiDCoCAtIFRoZSBuYW1lcyBvZiB0aGUg
ZmlsZXMgYXJlIGVxdWFsIHRvIHRoZSBpZCBzdHJpbmcgaW4gdGhlIGJvYXJkLTIuYmluCj4gwqDC
oMKgIChtaW51cyB0aGUgIi5iaW4iKQoKVGhhbmtzLCBhZGRlZCB0byBRQ0E0MDE5L2h3MS4wL2Jv
YXJkLTIuYmluOgoKTmV3OgpidXM9YWhiLGJtaS1jaGlwLWlkPTAsYm1pLWJvYXJkLWlkPTIwLHZh
cmlhbnQ9U29ueS1OQ1AtSEcxMDAtQ2VsbHVsYXIKYnVzPWFoYixibWktY2hpcC1pZD0wLGJtaS1i
b2FyZC1pZD0yMSx2YXJpYW50PVNvbnktTkNQLUhHMTAwLUNlbGx1bGFyCgpDaGFuZ2VkOgoKCkRl
bGV0ZWQ6CgoyIGJvYXJkIGltYWdlKHMpIGFkZGVkLCAwIGNoYW5nZWQsIDAgZGVsZXRlZCwgMTI2
IGluIHRvdGFsCgpodHRwczovL2dpdGh1Yi5jb20va3ZhbG8vYXRoMTBrLWZpcm13YXJlL2NvbW1p
dC84NDg0MzA0ZTEzNTQ2YWQ0NDI2ZjljZTFkMmRlYzk5MDc1NDBlYjlmCgotLSAKaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCgpodHRwczov
L3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3Vi
bWl0dGluZ3BhdGNoZXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
