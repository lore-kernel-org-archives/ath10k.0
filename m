Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86736EE6B65
	for <ath10k@archiver.kernel.org>; Sat,  7 Feb 2026 05:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=burQTDt9ngKWDWYhPXQFB6cgI+nN3fu0HkPHhhv0dC4=; b=DatNXBmuKkdotGelQvE7AvHNdA
	NoS6/7csDXIB6Ni61XlI1h5HeRHSgIqjE5iddi8In6LRcShf5jFyPeEfmTIRO8vNCN2GFsmWFnEgL
	pxJiiF0xYVOl8yxLheVCxqj05L88zFSU1MeH+UN95ann3EOApiridjyfeFfGBv3/9LjZjr0jlLKrP
	pS9VzuP+UpkDNV3of2oYugLeRURxq0PDFyCflUV9xQurOxLveSmLPoe4EnY/vlUAPm8P6x/8V6lkr
	UXyo5QQEBGnf18Vr/Auf7ZnM1ZFCAgb1F2pG1UlnadI+jOAGUjbWfVoVKq2im2RqbJhRNnZk+2rsB
	FsJ/ppeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vobIR-0000000CA44-0nRU;
	Sat, 07 Feb 2026 05:55:55 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vobIO-0000000CA2t-0W2I
	for ath10k@lists.infradead.org;
	Sat, 07 Feb 2026 05:55:53 +0000
Received: from [10.59.18.202] (p57a7a819.dip0.t-ipconnect.de [87.167.168.25])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id CB5BB4C442FA4F;
	Sat, 07 Feb 2026 06:55:21 +0100 (CET)
Message-ID: <6a83fd12-edd8-4559-b7ba-75b074fa889f@molgen.mpg.de>
Date: Sat, 7 Feb 2026 06:55:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New warning `ath10k_pci 0000:3a:00.0: not found station for peer
 stats`
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <57671b89-ec9f-4e6c-992c-45eb8e75929c@molgen.mpg.de>
Content-Language: en-US
In-Reply-To: <57671b89-ec9f-4e6c-992c-45eb8e75929c@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_215552_311421_2C059385 
X-CRM114-Status: UNSURE (   7.22  )
X-CRM114-Notice: Please train this message.
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

[Cc: +Baochen]

Dear Linux folks,


Am 19.01.26 um 17:41 schrieb Paul Menzel:

> Since January 10th, I have started seeing the warning below in my Linux 
> logs, that reach back to September 24th, 2025:
> 
>      [   37.108902] ath10k_pci 0000:3a:00.0: not found station for peer stats
>      [   37.108906] ath10k_pci 0000:3a:00.0: failed to parse stats info tlv: -22
> 
> It started appearing with 6.19.0-rc4-00282-gb6151c4e60e5, the version 
> running before is 6.19.0-rc4-00003-g3609fa95fb0f, but I do not see 
> anything related in the commit list:
> 
>      git log --oneline 3609fa95fb0f...b6151c4e60e5
> 
> The warning log from `drivers/net/wireless/ath/ath10k/wmi-tlv.c` has 
> also been there since 2021.
> 
> Do you have an idea? Please find the output of `dmesg` attached.

Looking through the commit list from above again, commit a203dbeeca15 
(wifi: mac80211: collect station statistics earlier when disconnect) 
probably introduced the new behavior.


Kind regards,

Paul

