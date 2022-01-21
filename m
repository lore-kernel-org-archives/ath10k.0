Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFBAC433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 14:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L+Hh9pZgp/FuvPZGjGPtzXJ2+fn6E0oBAHVurLif9kw=; b=xBoGY8EgV7Ht+v
	J7vpNHjOqf7r+ktKlnR8gwQB2EycZv3geETj6QRiNoJ6YVtOV+ZB+cMyvDs2VJWkrlFU8oOgtYplk
	wYji0CkFX+O6DbTmiTVH3iFKC+HG5WPMFKWFbhjcNglqiS1843V9p6gI7ereCTv2jtYKXxM8AYtyJ
	DOJhRzOmDMv0msTIR1p2ksXrhd9vHb1QBrC6SB3ygdgigOwUCUVh1Nk/MeJiswPETXqpwK3ZC0qD1
	btX3ryZzPh/BX+93fIXvMFynQjoORxpwmC5FRUhorVoVo/2kdgV3NTRxE4O+1kMCyaRk+aLTbUwFK
	tc+Q49j8d8O6TxtOlGNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAvIe-00FQOk-Ov; Fri, 21 Jan 2022 14:54:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAvIb-00FQNi-F6
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 14:53:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E36986160D;
 Fri, 21 Jan 2022 14:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE676C340E1;
 Fri, 21 Jan 2022 14:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642776836;
 bh=wzPmQ6RDKzU5jxVqo5Ls/yvBNt87qLJ1Qc2LHllct6I=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=bjpR6STtyhRjRnWQd9Rqahu8zrJOhYZwMkk7Ps7W9bsQd0T2M1RxOc2MBgFAfud77
 Rh/IKw7FqE1DC0O0hgDxWwU0XiSbTXX+1yAWeuYqWhHzPJm9nG1JqmR+7tBJNq12PC
 +Yd8JsHQHn/7pHz4/iIWLYEFo2BqNF5YcSMPuV8fq7b6o4KixhKRZM4ziAlUTg/L4Q
 YE+4ClXAIyrgZWKSk5wU2433fqULzLF6eCzAerL1HsakiB4PWXEY5MoTsgSio5G+6P
 ALwEp3OXPecEb2OO7fz5XsX4V5cH4N7d9gnleghvD7YprKn5ZgbpBsRgRwxL4nSqm6
 RMEgIQYWU2NpQ==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA9980 hw2.0: add ASRock G10 specific BDFs
References: <4031513.NO3PqbrPAa@debian64> <87zgnp9obf.fsf@kernel.org>
 <d865d506-f90d-9517-2c1f-26eb8a8ff14b@gmail.com>
Date: Fri, 21 Jan 2022 16:53:51 +0200
In-Reply-To: <d865d506-f90d-9517-2c1f-26eb8a8ff14b@gmail.com> (Christian
 Lamparter's message of "Fri, 21 Jan 2022 15:33:55 +0100")
Message-ID: <87a6fp9m2o.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_065357_613450_EF25AFEC 
X-CRM114-Status: GOOD (  21.65  )
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

Christian Lamparter <chunkeey@gmail.com> writes:

> Hi Kalle,
>
> On 21/01/2022 15:05, Kalle Valo wrote:
>> Christian Lamparter <chunkeey@gmail.com> writes:
>>
>>> this is a set of board.bin files for the ASRock G10,
>>> which I wish to be added to the ath10k-firmware repository.
>>>
>>> As per the current "Submitting board files" guidelines [1]:
>>>
>>> * description for what hardware this is:
>>>    - it is a IPQ8064 based board with
>>>      - one QCA9980 radio is used as 2.4 GHz radio
>>>      - one QCA9980 radio is used as 5 GHz radio
>>>
>>> * origin of the board file (did you create it yourself or where you downloaded
>>>    all files were extracted from official vendor firmware which was on the device.
>>>
>>> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>>>    - qca9980 hw2.0
>>>      + bus=pci,bmi-chip-id=1,bmi-board-id=1,variant=ASRock-G10
>>>      + bus=pci,bmi-chip-id=1,bmi-board-id=2,variant=ASRock-G10
>>> * md5sum of each new board file to add
>>>
>>> ae069744baeebfd6861e8080a92439ca  bus=pci,bmi-chip-id=1,bmi-board-id=1,variant=ASRock-G10
>>> 9e196846841a186e61ea208cc873384c  bus=pci,bmi-chip-id=1,bmi-board-id=2,variant=ASRock-G10
>>
>> There is no QCA9880 directory in ath10k-firmware, do you mean this
>> should be added to QCA988X/hw2.0/board-2.bin?
>
> It's a 9980 chip. This was 9984 predecessor.
>         ^ = Watch out for that 9! <https://www.qualcomm.com/products/qca9980>

Good that you pointed out that 9, I missed it.

> It would belong to the 99X0 directory of your ath10k-firmware repo:
> https://github.com/kvalo/ath10k-firmware/tree/master/QCA99X0/hw2.0

Ok, then I would prefer that the subject starts with:

ath10k-firmware: QCA99X0 hw2.0: ...

Ie. I can directly derive the directory name from the subject. But no
need to resend anything, this is just for the future.

> But there's one issue: there is no v2 board-2.bin in there yet.
>
> However the codeaurora's ath10k-firmware repo provides the board-2.bin here:
> https://source.codeaurora.org/quic/qsdk/oss/firmware/ath10k-firmware/plain/ath10k/QCA99X0/hw2.0/board-2.bin
>
> (this also includes the reference bmi-board-id for 2, 4 and 6. I guess this
> would help other people as well):
> https://source.codeaurora.org/quic/qsdk/oss/firmware/ath10k-firmware/plain/ath10k/QCA99X0/hw2.0
>
> So could you please add that board-2.bin from codeaurora

Done:

https://github.com/kvalo/ath10k-firmware/commit/2d8566686428430ebedfaea47e3782ac25901408

> and add the ASRock G10 specific variant to it? That would be sweet.

I'll do that next. Thanks for the thorough instructions, I appreciate it
a lot.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
