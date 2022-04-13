Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B5DC433EF
	for <ath10k@archiver.kernel.org>; Wed, 13 Apr 2022 09:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L+af5XA9sRZBDIrHR0XjkNvUlwD2l/TVRFBgJ5T0v0Q=; b=T6Ypq7TXzCAfhY
	TTSid/sfUQbWKwKI4dYMnWGI7SOC/3RZetGDTFIwx6DfB8odDjZUHQqR9U7sQJkIlqCl5Gv01zuRz
	SkOrfmU1pVBRUgStSDtNbaPy/IpgoY+nC2f6Ioqq+xsFLTQHAMfyuKx+RZeUl3ajhMj5iMzAbbE94
	lPBitKncpfQwCxu3+km7H4BlEyYu+JgGo1+JDk9iQlOpJMUR5JsLZ9QO3GIdf353aVKAApsG372Ct
	pi3Qz11UMaBG1MQXNXzPc5WCU6oL+WsXztjc6VYiYlwhu+jOPx02txh7nPIqEHaL8MM/byCKb6DN1
	AP0SapCazG2JHpNsB/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neZ3H-000G3b-IY; Wed, 13 Apr 2022 09:12:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neZ3E-000G2c-Cj
 for ath10k@lists.infradead.org; Wed, 13 Apr 2022 09:12:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9E35C61AD2;
 Wed, 13 Apr 2022 09:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73B5FC385A4;
 Wed, 13 Apr 2022 09:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649841155;
 bh=evcW0WxNSAa+y1Y0/tU6Xc06ltwhDrpOXL9oE5IuoLk=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=f3wc0jKEHwyQdbtkBWeiRbvPnNu8jwmcOGTnDJDtxBEqJSm14Rgmt5uegp+rIkYsg
 fJn1ivJGxyzjq3j/7JUEDfzdENZ/mznT7NTUGDrzVIVE6r3VVKdcoNFBE7ZaW+W/9z
 8GczW52aby5VtPQDADixr4K5OcTd1lNAqES/IzodwGY89owcJAtBuU4e+7EaABHI5Q
 ckJDLv+kKT7ZPOZPtHBY2pLfDgOicX+RLFj4SQVlqZ3Ozzy8Q5oqC2Vq33pUHP8N21
 AFeMGCbVz8X6FiSCUmri3bR96jLuq7WqZy531ReQUXD8YJVaIkZkMgb3ufEsOsTOzq
 +Sl48j6HetMCA==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: WCN3990: Add firmware file for the Qualcomm
 Robotics RB3 / Dragonboard 845c
References: <CAA8EJpphUrxr5gtW0=-tZh-DrKXmHkfFxWMvYRpTUGuCesGCbw@mail.gmail.com>
Date: Wed, 13 Apr 2022 12:12:30 +0300
In-Reply-To: <CAA8EJpphUrxr5gtW0=-tZh-DrKXmHkfFxWMvYRpTUGuCesGCbw@mail.gmail.com>
 (Dmitry Baryshkov's message of "Sun, 3 Apr 2022 15:04:01 +0300")
Message-ID: <877d7tl535.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_021236_505103_71985713 
X-CRM114-Status: GOOD (  19.97  )
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

> Hi,
>
> We'd like to ask for inclusion of the board file for the Qualcomm
> Robotics RB3 Platform also known as Thunderomm Dragonboard 845c. It is
> a development platform based on the Qualcomm SDM845 SoC.
> Following the questions from the ath10k wiki page:
>
> * description for what hardware this is
> - It is an SDM845-based platform
> - It uses wcn3990 chip as a WiFi and BT radio
>
> * origin of the board file
>   - It comes from the BSP package distributed by Linaro
> (http://releases.linaro.org/96boards/dragonboard845c/qualcomm/firmware/RB3_firmware_20190529180356-v4.zip)
>
> * ids to be used with the board file
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Thundercomm_DB845C
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214
> bus=snoc,qmi-board-id=ff
>
> Note, the board comes with the board_id not changed from 0xff.
> Following the example of Chromebook boards we are adding the
> calibration variant to the DT [1].
> I'm asking to include both bdf files: with the variant part and
> without it (for the sake of backwards compatibility).
> However once the patch [1] is accepted it should be fine from my point
> of view if you decide to include just the with-variant patch into the
> public/distributed board database.
>
> * md5sum of each new board file to add
>
> $ md5sum *
> d8dc08c33402920792928c65262b4955  bus=snoc,qmi-board-id=ff,qmi-chip-id=30214.bin
> d8dc08c33402920792928c65262b4955
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Thundercomm_DB845C.bin
>
> $ sha256sum *
> 9bdf7859d8d6a6f41f6b55338b51723335bc9cc24a4d2e20ebaef234859d6fb3
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214.bin
> 9bdf7859d8d6a6f41f6b55338b51723335bc9cc24a4d2e20ebaef234859d6fb3
> bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Thundercomm_DB845C.bin

Thanks, added to WCN3990/hw1.0/board-2.bin:

New:
bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Thundercomm_DB845C
bus=snoc,qmi-board-id=ff,qmi-chip-id=30214

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 14 in total

https://github.com/kvalo/ath10k-firmware/commit/22218c422164d618aec37200eae36d85cde3f11e

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
