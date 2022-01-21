Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2046C433EF
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 14:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AjrD2xYpZhfn92hd33K1y80sO4VZu+RKz4vIEdwV5sU=; b=jptHQ0ycO7PHnu
	oigO/iANJFOu1lka2bhVpZEWr5keeayWMbLLB2qOH92nBd5Z3AZPDTUgdMLUAaGb1EcuzGo9mJomJ
	K//3/KD6lIOilIyvmDsh5nPN3nEkDDvqXlUG8b/5atH5EW5RwHvkw0pf6t1PbsFZrDlar2yATfp54
	LawSQpQYTAEyRyWNi59RQxzNhVhBtDjL3867l0EskTdKoyI2JhzgJsTAwcPUQn93Wu3CEKjs7ZSm5
	rWPfIzZFfUb7vSVjAq2mHTzrFqniukVASLMpCM/GqP0k+TYuYxgM0ChZUncRcBqPnaE0k+zxQpqR+
	WHqiWtmRWBUH44C9dMvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAuVP-00FHVF-1t; Fri, 21 Jan 2022 14:03:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAuVL-00FHSR-RK
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 14:03:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 87F54B81F88;
 Fri, 21 Jan 2022 14:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B18A7C340E1;
 Fri, 21 Jan 2022 14:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642773781;
 bh=oVomT/OGtuiUH8S7hya96CjanEuVtYtQSsF+x5KALzM=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=TIc98pTX66jlxsttOVaCZcIWy/epXOsBgPqZHscPUAHz2l4v5yPD+rud7765mUHlP
 3/+U6eQKCeZjP7SAGolhRGF7DQvjtcryvno7Rcid8awhT+luRNPbCZfhlQfwFCMoYm
 vu7u6s6LlbgTH1gJdOVLANWtKUnkWmoQdasqXVJkVVQuf8ullyPqt2PAz+IcLYMhCL
 tMp/YkIPTc0R7O0CZIxb+D2u8Q6AI6mvDqsMuX6lOzQRGc9WEHcPeuiAo3Apo1sDSR
 Be2K3rzWMQo62gPDP0egj7Lhw6OD5nTnoy/d7Xo+miQiK9dXiqKZ/KFDbmWWAhR7hb
 lgDplvnIpDrHQ==
From: Kalle Valo <kvalo@kernel.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA9888 hw2.0: Add Plasma Cloud PA2200 specific
 BDFs
References: <2511616.X9hSmTKtgW@sven-edge>
Date: Fri, 21 Jan 2022 16:02:59 +0200
In-Reply-To: <2511616.X9hSmTKtgW@sven-edge> (Sven Eckelmann's message of "Sun, 
 22 Nov 2020 11:30:16 +0100")
Message-ID: <874k5xb2zw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_060304_057472_DE039BE7 
X-CRM114-Status: GOOD (  16.08  )
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

Sven Eckelmann <sven@narfation.org> writes:

> The support for this device is currently prepared for OpenWrt. This AP requires 
> three special BDFs to get the Wi-Fi PHYs working (correctly).
>
> Now to the questions from the wiki page [1]:
>
> * description for what hardware this is:
>
>   - it is a IPQ4019 based board
>   - one QCA40xx radio is used as 2.4GHz radio
>   - one QCA9888 radio is used as 5GHz radio (channel 36-64)
>   - one QCA40xx radio is used as 5GHz radio (channel 100-165)
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
>   - was provided by vendor in patch send to me for the OpenWrt support
>     (Sun, 27 Jan 2019 22:23:37 +0800)
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - BoardNames[0]: 'bus=pci,bmi-chip-id=0,bmi-board-id=16,variant=PlasmaCloud-PA2200'
>     BoardLength[0]: 12064
>     BoardCRC32[0]: b5855151
>     BoardMD5[0]: 271e88642c141a58e115819de756994d
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA9888/hw2.0/board-2.bin:

New:
bus=pci,bmi-chip-id=0,bmi-board-id=16,variant=PlasmaCloud-PA2200

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 10 in total

https://github.com/kvalo/ath10k-firmware/commit/085c231d48a7247e531e757479f6746b60a97c86


-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
