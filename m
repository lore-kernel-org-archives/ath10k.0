Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D3EC74A5B
	for <ath10k@archiver.kernel.org>; Fri, 17 Mar 2023 11:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7TwmALR7WOTGkI3tSxYmvvJwzem+PrXe6CAMVskfdcw=; b=JzhGb25dKH+6Sg
	sN+OezjD1/l5W0jxWtnXCdbRRM1mdbSjgWJDjgF1vpsDKm9SHtlRD2QvvcI0k73OBALCBngL/dVhv
	GeCiiuuiih4jtzl4p1x8sN3TWTrLheHDsGbz7JgDJxxGth5yka2xvZSN6W4MChlHqoNwa5OBdjFcR
	+v8njrxrnjZeHW6xIs82UY0JNjCnBRmpRejp6G45X8nvshqNbgrn28FIXwZsYCO8WOAdP9JmFpdmY
	HNFwBVLeqXmMbIwZYTzi2ttBP8l5tnw9lYXdztDQmFt135q89K8P1LfdBM51tP5KteoeCD7Hh9nHF
	5NiiBMQzyo9opDohEmZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd84z-0021PA-1y;
	Fri, 17 Mar 2023 11:17:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd84x-0021Ob-0L
	for ath10k@lists.infradead.org;
	Fri, 17 Mar 2023 11:17:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 06FAE62285;
	Fri, 17 Mar 2023 11:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42B2C433EF;
	Fri, 17 Mar 2023 11:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679051816;
	bh=6yakOzuqBoDaykUytBuw+jPt1Zrw+H6oyoJiTpQnkkw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=KcjuibTrsvxtTIc9uwViDZqG0KkUGD4ie1JYRDJCRqr38PbJXAeUeePLPVnpNXXy1
	 acuCyspuTiylv78h2Dep+IJFbHek+LRExXbLfXCi+Qh2f/WxRf90TmWbdYz8xCahGj
	 UP7++onFWE9bviyZeCJjz7d+nXAd0nqMP4B7w9M+QGXMrIl0xqf8dvaekEJbasOfXF
	 YcVBSlx8N7Kr5kXT0O5Cwm+uUOIc0cM9PE/7tHucSJVVLVpS+oS4hMf+92VzIlq2W4
	 2uIN+V5JsJav+1kbUbpP+7X53HITknlJuOhDjbA3RrTdxUj7Rsya1aRKGr7uy22g4J
	 IWaiCaJ3VwMpw==
From: Kalle Valo <kvalo@kernel.org>
To: Kevin Fibich <kevin.fibich@googlemail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA6174 hw3.0: Surface Go 1 LTE/Wifi
References: <CAExMj0AYZt-iCY3EcOwttNYfReXk_VS0Eb-ev7OQWu_kdjSugA@mail.gmail.com>
Date: Fri, 17 Mar 2023 13:16:52 +0200
In-Reply-To: <CAExMj0AYZt-iCY3EcOwttNYfReXk_VS0Eb-ev7OQWu_kdjSugA@mail.gmail.com>
	(Kevin Fibich's message of "Wed, 8 Jun 2022 20:37:44 +0200")
Message-ID: <87a60bmxuj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_041659_184024_04ED2C3B 
X-CRM114-Status: GOOD (  12.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Kevin Fibich <kevin.fibich@googlemail.com> writes:

> Hi,
>
> please add this boardfile to support the LTE variant of Surface Go Gen 1.
>
> * description for what hardware this is:
>
> This boardfile is for the Wifi Module of the Microsoft Surface Go (Gen
> 1) LTE/Wifi Variant.
>
> * origin of the board file
>
> - Firmware Package downloaded from MS website
> - Link: https://microsoft.com/en-us/download/details.aspx?id=57601
> - Filename to download: SurfaceGo_Win10_18362_22.031.05160_LTE_0.msi
> - Extract via: msiexec /a <MSIFILE> /qb TARGETDIR=C:\temp
> - Filepath:
> C:\temp\SurfaceUpdate\Drivers\Network\Wifi\eeprom_ar6320_3p0_TX8_lte_clpc.bin
>
> * ids to be used with the board file
>
> - QCA6174 hw3.0
> - md5sum: 8f2895dd63a0c8f11e2d051f0ed4e0a8
> bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=3371.bin

Thanks, added to QCA6174/hw3.0/board-2.bin:

New:
bus=pci,vendor=168c,device=003e,subsystem-vendor=168c,subsystem-device=3371

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 90 in total

https://github.com/kvalo/ath10k-firmware/commit/fb75d97d72a79b18e96066925816cabe3062d58f

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
