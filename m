Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A49FC74A5B
	for <ath10k@archiver.kernel.org>; Fri, 17 Mar 2023 11:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gxFo0Yb8kXJC5qwDq2HlU5QBPuYPa6T1D0YhikT2GBw=; b=B56aw2Aygek2oA
	kzBbvs6WdMgtQ39qwQWyPv3l+MDSaJeXrpTBKMOvdbMclh2x13ciQXAx2doNm7J50sElQo3LHbtXR
	PQw7cVuuIKiCaIzYmxFV8BVYr0Vnj2wN2JVCMLN2HcKQrur9Oae2MnMU7VuKpgCW3d9OObnXIQoIc
	20nLbjs4lc9Uwjx1ICCOwZ8oEV8CdI6fvV9GQ0eXMp6L0fWiN9bAP7aREjj5O6+eisqoi0EM1JhU7
	ex1ZJ+a4LfYQzIsTKMBKzs0JQ2H6Bg1Pfs3DoJOgQIg7rFsC71NH0KIEKL7Egx4LbMZzADcD06EoX
	ZlQ0QMVu3sgoEKjFNo9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8fy-0028PH-2C;
	Fri, 17 Mar 2023 11:55:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd8fv-0028OD-1l
	for ath10k@lists.infradead.org;
	Fri, 17 Mar 2023 11:55:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 806A962282;
	Fri, 17 Mar 2023 11:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B01C433D2;
	Fri, 17 Mar 2023 11:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679054109;
	bh=SQCpgmtlDWwq4EMyAtfzVpB1i3CTS6xAgAoHg9gdmLo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=bhsMPTno3YC4fmytecKIJS+5uD2jP9gWLkpCjbFpnQuaSDsNEZRcpbeouC1kjvUnI
	 dFkp5R6YNIhu7Ktfa73m7EpIlLgzrrnrOrt1en3Sq6sFbvuSHnks7ATfyr2vKi9MrC
	 iE+DdNNolybrR0+J6j7+EdoG7qkPX/S9+DF8aGaQSIr1uyyaqzVn4NeRkRnJKkxORx
	 clNQn6CW7CPz1LqMou7H5m0EPIl9ddIqnPtEIPdvP2r8uHpEYFCvydnhS/dtDCxebI
	 gTxqYuHXJLXyJbwOkZ+XmeWWk0hcdUHgORSCNHTpA1+LDkgz3JCjeuNdQXBt3bZywF
	 Kfa2auWZFV2Xw==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ath10k@lists.infradead.org,  "open list\:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
Subject: Re: ath10k-firmware: WCN3990: Add board file for the Lenovo Yoga C630 laptop
References: <CAA8EJpqrHuTaN-bB6XoB7ZWNvfggNtMts3bBQwqMH8RpO1E3QQ@mail.gmail.com>
Date: Fri, 17 Mar 2023 13:55:07 +0200
In-Reply-To: <CAA8EJpqrHuTaN-bB6XoB7ZWNvfggNtMts3bBQwqMH8RpO1E3QQ@mail.gmail.com>
	(Dmitry Baryshkov's message of "Fri, 7 Oct 2022 15:22:02 +0300")
Message-ID: <87o7oriodg.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_045511_626567_D2C546E9 
X-CRM114-Status: GOOD (  16.58  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> We'd like to ask for inclusion of the board file for the Lenovo Yoga
> C630 laptop. It is
> a WfA laptop using the Snapdragon SDM850 SoC.
> Following the questions from the ath10k wiki page:
>
> * description for what hardware this is
> - It is an SDM845-based platform (SDM850)
> - It uses wcn3990 chip as a WiFi and BT radio
> - For the reference: [    8.727834] ath10k_snoc 18800000.wifi: qmi
> chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40030001
>
> * origin of the board file
>   - They come from the original Windows partition, thus being a part
> of Windows drivers.
>
> * ids to be used with the board file
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Lenovo_C630
>
> Note, the device comes with the board_id not changed from 0xff.
> Following the example of Chromebook boards we are adding the
> calibration variant.
>
> * md5sum of each new board file to add
>
> $ md5sum *
> 6cd260ad261193fb8b3ddf5293d0103f
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Lenovo_C630.bin
>
> $ sha256sum *
> ff96e5295cc3e3fd86f04049058396cd69cd7f1bc44ef4784f13ffe48ef42a8d
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Lenovo_C630.bin

Thanks, added to WCN3990/hw1.0/board-2.bin:

New:
bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Lenovo_C630

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 21 in total

https://github.com/kvalo/ath10k-firmware/commit/8aa55df10c78598c8eef4a6de957474c8802ced8

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
