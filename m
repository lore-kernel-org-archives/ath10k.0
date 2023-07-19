Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B47C001B0
	for <ath10k@archiver.kernel.org>; Wed, 19 Jul 2023 15:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3xMphRGhoGA3M1RU2dqUlOZEUS84nd4jtqgPWSgriWc=; b=DIzT7z05k5ooGC
	nqy+tV5bK1u+OVLJwG6ER5e6jSIQoXgN6OoQmwFQYMZqLzrzuRuC2GJE4mE+UJ+GnHTF3Eo0dn+sx
	m/qCvl1Xm2H0s5cDzZ3Qca8QJx6S52A/e78ejtUULsIAAahezuj6k7PVUbTvbJfEj1dR2yTsQb8TT
	Ebyax8LOlIAUEexkR7EmoREj7MEycImaME8B+hRC+EyqbINn1MUS9EnVDQgTGxmC7NrXXA9OgLFeN
	L6NMGIKVQlqW2DdQxjWhlfP2eMVldWJVgM1RKmTr513P572MM7yEORJQ1HA8fXl/biPyQZL2l5T/n
	QKpbmpZNYIcnC8TEjdeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM8xq-007uGe-2Q;
	Wed, 19 Jul 2023 15:19:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM8xo-007uFv-0I
	for ath10k@lists.infradead.org;
	Wed, 19 Jul 2023 15:19:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5CAB1616DD;
	Wed, 19 Jul 2023 15:19:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E90EC433C8;
	Wed, 19 Jul 2023 15:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689779978;
	bh=qWoqUMDK/mFdb+tf6CcZMXG/+lqonDirQpQm9CWUVv8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=iiXsgvCkK0BZscvdBU6Hy9JwCOL7jwPLYn+Fgo+2zqtXwg2CfQVE08+4mMoOat5tj
	 GEyIWCY67KNlKR1rqPLqCefUSa0yapJhujiMyqwZHbTwG64xUHvvUbZkICMY4h6WsB
	 NQpDNbdL+Kgiq++DIGb79suKKbBQBUsTyGOcqUnaWHNOXlfsp8LFQb+fnoL/YgSSic
	 jzeFA1+RIvOPTlI4U5880JtC8glevfijT0wdIuJ8EiHqdfD6JR3p42qQiWTvx4XrLw
	 etY0MmkOSGCdKhMAnkIRQQ+xcIQiRli3vAaRHwCSQqyStt/dPjtWheB+glP7VxvqAe
	 QfVTKjnD1g7/Q==
From: Kalle Valo <kvalo@kernel.org>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: Giammarco Marzano <giammarco.marzano@gmail.com>,  Georgios Kourachanis
 <geo.kourachanis@gmail.com>,  ath10k@lists.infradead.org
Subject: Re: [v2] ath10k-firmware: QCA4019 hw1.0: Add ZTE MF289F rev.
 AT1/AT2 (2.4G/5.8G) specific BDF
References: <CAJE2SDdBgf0FCAtT2m6Pz7xccuo7cTbPjmStskfn9iNBkYNc3Q@mail.gmail.com>
	<878rfvlia2.fsf@kernel.org>
	<af2f29b3-23a8-bf7f-c805-cc0563504125@gmail.com>
Date: Wed, 19 Jul 2023 18:19:35 +0300
In-Reply-To: <af2f29b3-23a8-bf7f-c805-cc0563504125@gmail.com> (Christian
	Lamparter's message of "Sat, 1 Jul 2023 17:07:57 +0200")
Message-ID: <871qh453p4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_081940_219508_91FCA6C8 
X-CRM114-Status: GOOD (  21.08  )
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

> On 3/17/23 12:38, Kalle Valo wrote:
>> Giammarco Marzano <giammarco.marzano@gmail.com> writes:
>> 
>>> this file is for add definition for ZTE MF289F.
>>>
>>> The device is currently under review as PR on OpenWRT:
>>> https://github.com/openwrt/openwrt/pull/10418
>>>
>>> Please ignore my email of 3 August, this board binary add support for
>>> 5Ghz on AT2 version with correct calibration data.
>>>
>>> * description for what hardware this is:
>>>
>>>    - it is a IPQ4019 based board
>>>    - one QCA4019 radio is used as 2.4GHz radio
>>>    - one QCA4019 radio is used as 5Ghz radio in AT2 revision
>>>    - one QCA9984 radio is used as 5GHz radio in AT1 revision
>>>
>>> * origin of the board file: taken from stock firmware image
>>>
>>> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>>>
>>>    - QCA4019 hw1.0
>>>
>>>      + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=zte,mf289f
>>>        md5sum: 175139f44d2ae01c2b23e093d571e962
>>>      + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=zte,mf289f
>>>        md5sum: 175139f44d2ae01c2b23e093d571e962
>>>
>>>
>>> * attach the actual board file (board.bin)
>>>
>>>    - The name of the file is equal to the first id string in the board-2.bin
>>>      (minus the ".bin")
>> Note: There was only board file attached but the text listed two.
>
> I can tell you what happen. This is thanks to the following OpenWrt
> Pull Request: <https://github.com/openwrt/openwrt/pull/13019>
>
> But back to Giammarco Marzano mail:
> His bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=zte,mf289f.bin
> contained a packed "board-2.bin". So, the board-2.bin ended up
> within the linux-firmware's board-2.bin:
>
> <https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/ath10k/QCA4019/hw1.0/board-2.bin>
> See at offset 14c360. There's an QCA-ATH10K-BOARD string. I don't
> think ath10k supports board-2.bin within board-2.bin.

Yeah, board-2.bin within board-2.bin is not supported :)

> I've added the extracted the two board files within and attached
> them including the note to this mail after the === separator.
> (also fixed the md5sums)

Thanks for catching and fixing this. I should have been more careful.

> ===
>
> * description for what hardware this is:
>
>   - it is a IPQ4019 based board
>   - one QCA4019 radio is used as 2.4GHz radio
>   - one QCA4019 radio is used as 5Ghz radio in AT2 revision
>   - one QCA9984 radio is used as 5GHz radio in AT1 revision
>
> * origin of the board file: taken from stock firmware image
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA4019 hw1.0
>
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=zte,mf289f
>       md5sum: f0243c9d7b45bb0ffe3e58c27e71fe80
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=zte,mf289f
>       md5sum: e0fd5376d24f0c2c3c49ba2a7fc37376
>
>
> * attach the actual board file (board.bin)
>
>   - The name of the file is equal to the first id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=zte,mf289f

Changed:
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=zte,mf289f

Deleted:

1 board image(s) added, 1 changed, 0 deleted, 148 in total

https://github.com/kvalo/ath10k-firmware/commit/0bf43f8decd3ae5bb9f27c3a44f54b3fa23aaa31

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
