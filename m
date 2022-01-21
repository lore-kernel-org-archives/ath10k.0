Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE552C433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 14:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4iBUhwlHD0y/ok7oM/PCtBbTYJKwpmITOHIZ61Wspw=; b=CtVRaNqCkRTe2E
	IlBYFKI7P6axwHcU9uaQfz/KluAyU/fwhwGBM20W+mwm8MFWcOHUfznnUFAmw2/khc9p49PsA74WZ
	nsICECJ0g+nmZt4NmDbrgV935XZh5HV1njmW8lvAscWzqkBzMN0b9vO3tNIEB3yD4DgdHvDMh0ObM
	FXDiH0UmiulpCKnWiyzoi3V1/wGefpx3fna9AbCCtc4kPiYDpkkuuDwfk8lNRj+O8VG4sU8v7xHbF
	qWO5roNRn0eVqg3xnvrHtdheB0mn3BtmyozNhRMPxv7CVTSPxLPnV0+p9buK1NH7NPtyaz5ajllIF
	6R0LxwX8kRmUyvGJZvVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAuU5-00FGxL-57; Fri, 21 Jan 2022 14:01:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAuU2-00FGwF-SB
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 14:01:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 684DD61705;
 Fri, 21 Jan 2022 14:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA83C340E1;
 Fri, 21 Jan 2022 14:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642773701;
 bh=jroxzGpf8WECz9O3Ro/qidXhQEwLgc0cCotcv5abmPg=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=SHloDMqQmkyLT/S0YNZNgXyS18HcBvJzkUWL5FHRmypLRJwmIQW1oEictjTq1RJfo
 /lpjF8D5dGgXUFznwvS11cyX1nmUWhDejIFqFUCUoyIBlaqjgtsr8rNDjqIUxilV1G
 /6f5+PV6uPHiLhUeFU879ErHjoOX9CTYLN7GlvOuxwimUl1axziUjoM6r8pLrXWR6Y
 PzJasnG8aKBgrDtc4aS6BfJ7Z5Q2DyF0rpQsWL8hFntaN5dY/g9KunwKZFzl+Aq0c3
 r/knDFHoJFUt1SkyQmNnEGDNQ0wbURFVfoYC+nU2SeFOFTT9p5ILVgfcdZApZujLjl
 dB04D3v09pEYw==
From: Kalle Valo <kvalo@kernel.org>
To: <steven.lin@senao.com>
Cc: <ath10k@lists.infradead.org>
Subject: Re: ath10k-firmware: QCA9888 hw2.0: Add EnGenius EAP2200 specific BDFs
References: <77B9977A4169C341AD4CDD465CB1B812BC44E4DF@snex01.senao.com>
Date: Fri, 21 Jan 2022 16:01:39 +0200
In-Reply-To: <77B9977A4169C341AD4CDD465CB1B812BC44E4DF@snex01.senao.com>
 (steven lin's message of "Mon, 2 Sep 2019 08:55:22 +0000")
Message-ID: <87czklb324.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_060142_971276_F4422C5B 
X-CRM114-Status: GOOD (  16.47  )
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

PHN0ZXZlbi5saW5Ac2VuYW8uY29tPiB3cml0ZXM6Cgo+IFRoZSBzdXBwb3J0IGZvciB0aGlzIGRl
dmljZSB3YXMgYWRkZWQgYSB3aGlsZSBhZ28gdG8gT3BlbldydC4gVGhpcyBBUAo+IHJlcXVpcmVz
IHR3byBzcGVjaWFsIEJERnMgdG8gZ2V0IHRoZSBXaS1GaSBQSFlzIHdvcmtpbmcgKGNvcnJlY3Rs
eSkuCj4gVGhlIGJtaS1ib2FyZC1pZD0ncyB3b3VsZCBjbGFzaCB3aXRoIG9uZSBvZiB0aGUgdGhl
IElQUTQwMVggQVAtREsKPiBib2FyZHMgYmVjYXVzZSBRQ0EgZG9lc24ndCBwcm92aWRlIHNwZWNp
YWwgSURzIGZvciBjdXN0b21lcnMgYW5kIHNlZW1zCj4gdG8gdXNlIHRoZSBBUC1ESyBib2FyZC1p
ZHMgaW4gdGhlIHdpZmkgZmlybXdhcmUgdG8gY2hhbmdlIGl0cwo+IGJlaGF2aW9yLgo+Cj4gTm93
IHRvIHRoZSBxdWVzdGlvbnMgZnJvbSB0aGUgd2lraSBwYWdlIFsxXToKPgo+ICrvgawJZGVzY3Jp
cHRpb24gZm9yIHdoYXQgaGFyZHdhcmUgdGhpcyBpczoKPiAtCWl0IGlzIGEgSVBRNDAxOSBiYXNl
ZCBib2FyZAo+IC0Jb25lIFFDQTQwMTkgcmFkaW8gaXMgdXNlZCBhcyAyLjRHSHogcmFkaW8KPiAt
CW9uZSBRQ0E0MDE5IHJhZGlvIGlzIHVzZWQgYXMgNUdIeiByYWRpbwo+IC0Jb25lIFFDQTk4ODgg
cmFkaW8gaXMgdXNlZCBhcyA1R0h6IHJhZGlvCj4KPiAqCW9yaWdpbiBvZiB0aGUgYm9hcmQgZmls
ZSAoZGlkIHlvdSBjcmVhdGUgaXQgeW91cnNlbGYgb3Igd2hlcmUgeW91IGRvd25sb2FkZWQpCj4g
LQl0YWtlbiBmcm9tIHN0b2NrIGZpcm13YXJlIGltYWdlCj4KPiAq74GsCWlkcyB0byBiZSB1c2Vk
IHdpdGggdGhlIGJvYXJkIGZpbGUgKEFUSDEwS19CRF9JRV9CT0FSRF9OQU1FIGluIGF0aDEwaykK
PiAtCSBRQ0E5ODg4IGh3Mi4wCj4KPiBtZDVzdW0gb2YgZWFjaCBuZXcgYm9hcmQgZmlsZSB0byBh
ZGQKPgo+ICsgYnVzPXBjaSxibWktY2hpcC1pZD0wLGJtaS1ib2FyZC1pZD0xNix2YXJpYW50PUVu
R2VuaXVzLUVBUDIyMDAKPiBtZDVzdW06IDI3MWU4ODY0MmMxNDFhNThlMTE1ODE5ZGU3NTY5OTRk
CgpUaGFua3MsIGFkZGVkIHRvIFFDQTk4ODgvaHcyLjAvYm9hcmQtMi5iaW46CgpOZXc6CmJ1cz1w
Y2ksYm1pLWNoaXAtaWQ9MCxibWktYm9hcmQtaWQ9MTYsdmFyaWFudD1Fbkdlbml1cy1FQVAyMjAw
CgpDaGFuZ2VkOgoKCkRlbGV0ZWQ6CgoxIGJvYXJkIGltYWdlKHMpIGFkZGVkLCAwIGNoYW5nZWQs
IDAgZGVsZXRlZCwgOCBpbiB0b3RhbAoKaHR0cHM6Ly9naXRodWIuY29tL2t2YWxvL2F0aDEway1m
aXJtd2FyZS9jb21taXQvN2FjMGViM2RlYzBhODIzZTA2ZWE2ZGUwYmFmNTA0M2NiODEwMGFlMgoK
LS0gCmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC13aXJlbGVzcy9s
aXN0LwoKaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1
bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRo
MTBrCg==
