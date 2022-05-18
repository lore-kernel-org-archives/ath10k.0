Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D37BC433EF
	for <ath10k@archiver.kernel.org>; Wed, 18 May 2022 11:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p5m3VWnAK8B+6hs6P/JDvvYCfH95wUJYOWb5re13szY=; b=Y5xplFv/BYTWrx
	Ze18S54YkjIx0b6aTxaRv7K1rrOpUDkSWXvgI0w82sJmAuU5m+w/wYjVRHz3ftOTbxYSxiMjv3DA4
	frvMTNltFYo0QjGKBQxNlaXl31W4s69zxdhgxTvz+iqnDtx9OEb9I1wP4w6rFhX4RLFHKvLQciHh+
	vNMMdTBnU2biD38kvwCCcHtihm3BThjKNEW6aEfd+/4eFPEyvEOtOa/tdBU5ZD2uRRaC5xMI6U9EF
	S4mXHbk/9hmrleYgrms1AQhyEKNtzMFwSDPOPLY9xy2RPjYGa2CE89Q66G3Pppelg6Vt5QUVRY39V
	Ka064pkBhhEovNfx7dBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrIDT-001hTJ-TJ; Wed, 18 May 2022 11:51:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrIDR-001hRi-FR
 for ath10k@lists.infradead.org; Wed, 18 May 2022 11:51:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C5BCAB81E7C;
 Wed, 18 May 2022 11:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8091C385A5;
 Wed, 18 May 2022 11:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652874702;
 bh=5GDUY24WXfAMyf+2XZQZKQ76IXjoUT8LXs2oxyTy6I4=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=JCMGY4MTaDDRzuYURKo4ro/+FTljhmbZv9nwn4kZNGdorDDrMMDrNMVXK7IvmYVag
 fNjri4dLe1IM0A58083TgEzhEATZtRgVmKOaosSzCurIzqQ1B6rKwxWwU9L3b4Wnnd
 R+8LErgh0Ugzjru4R5ro/r6+6S2N8FUYef91EPswEpztUUNswqOJMJVaNbyPvOxmV1
 516yU/lIzc1jx/u90E12p1MICDjWn2nFkorTnDnZ7gWGPUF4JcNuS0LbG/SEQBXws0
 L5ksqjR67mFhiLbbmEraok3c9hH32x8WgIRt9nNYtyHkMQTQLc6HyXCS8H3zbIMJYF
 78X33UlnuOHVg==
From: Kalle Valo <kvalo@kernel.org>
To: Enrico Mioso <mrkiko.rs@gmail.com>
Cc: ath10k@lists.infradead.org,  Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [V2] ath10k-firmware: QCA9888 hw2.0: add GL.iNet GL-B2200
 specific board file
References: <2131f701-ff71-8fbb-353b-e40338b3e80d@gmail.com>
Date: Wed, 18 May 2022 14:51:39 +0300
In-Reply-To: <2131f701-ff71-8fbb-353b-e40338b3e80d@gmail.com> (Enrico Mioso's
 message of "Mon, 2 May 2022 13:21:53 +0200 (CEST)")
Message-ID: <87leuz2h4k.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_045145_704826_EC5DC0EA 
X-CRM114-Status: GOOD (  18.00  )
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

Enrico Mioso <mrkiko.rs@gmail.com> writes:

> I would like to add a board file for the PCI-E Wi-Fi interface present
> on the GL.iNet GL-B2200 mesh router, a device added a while ago to
> OpenWRt.
>
> * Hardware description:
>
> This device seems based on IPQ4019 / AP-DK04.1-C3.
> Three radios are used:
> - one QCA4019 radio is used for 2.4 GHZ operation (submitted on a previous message)
> - one QCA4019 radio is used for 5 GHZ for operating on lower part of 5
> GHZ spectrum (submitted on a previous message)
> - a QCA9888V2 interface connected over PCI-E to operate on higher part
> of the 5 GHZ spectrum (contained in this message)
>
> * origin of the board files:
>
> The board file was provided by the manifacturer, who provided the
> original patch to support the device in OpenWRt.
>
> * ids to be used with the board files
>
> + bus=pci,bmi-chip-id=0,bmi-board-id=16,variant=GL-B2200
> SHA256: 7016cac25e5d35cf037f2f6aa63c03bd124fb521ec40c7843eb9d8424afa1a20
>
> * attached files:
>
> The names of the files are equal to the ID strings in the board-2.bin
> files, minus the .bin extension of course.

Thanks, added to QCA9888/hw2.0/board-2.bin:

New:
bus=pci,bmi-chip-id=0,bmi-board-id=16,variant=GL-B2200

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 12 in total

https://github.com/kvalo/ath10k-firmware/commit/b'302f5e8de61f53fd48a64455758e07700647818e'

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
