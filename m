Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E535EB64DA
	for <ath10k@archiver.kernel.org>; Wed, 19 Jul 2023 15:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FdQy/QwVUrCmlY2oKDSwOu5U7v2DcA68G+wPxXfKq+0=; b=h7ayiXC7E0NGZu
	edddMEyxC8LcI6od1sw+8F751PJ6QL2zo+nWx4kSqZf9GtGMOvA3DyflOddwqCPM9esl0uc3mP3H3
	RWL6Drk/L1TgW1SD0UMK72VOR9kRh+K7wFPqWHtwaNZgYNq17D4IhX/NjQoSkuXuzH/yU5FElxE1G
	kbnggkqUG6MV+TCqktyRajn7JUGyg+gw62yq7mBJmQNpYOhDP1Ueu9MxMac9dZ6QKXt5IZrzJtOhv
	17WIMEFZPy4p+lsEjxpMGVrqNo5AZYl3wniDkGcXGWZH4RW+AyHq3gcxFBEdUAb5yXkTL8lqsgVPk
	o9IZIZJssrO2x0y2NtZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM8uW-007tUu-30;
	Wed, 19 Jul 2023 15:16:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM8uT-007tTf-1r
	for ath10k@lists.infradead.org;
	Wed, 19 Jul 2023 15:16:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6BD066171D;
	Wed, 19 Jul 2023 15:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06601C433C7;
	Wed, 19 Jul 2023 15:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689779771;
	bh=kxJUGT9ZtXnTUxBEL3vaCxDQg3LFzYUuNYcGwK4SvFg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=BJ/ytioPc/HvF3KEOcnTiNWIB3pouHA5cWx546+N32QyPeu9oJ3laAhwXqQ/HwxoM
	 N4h4bc/cpMGxzf59480ozH56ogG4cNmCXvj95rQgl2imWXVWhkLsGPelbNlNEFFxZp
	 KFS/RQLYFmhRhEumUfu/Ln/V47eGMiZgr49zYOJ37/98f6yMgujb8M28c60xyRaN4d
	 9IT8Kg97TwwAU+7gcezIwA6EX4Zh7CWhUPmekwiAYzmnxCtSss4SxNiUZGJTPMgFci
	 KmQDw2m+JnxYxVpY+Oj0vHUclb9yZZrT8tPwebd6S3d+Oqf/oE7ICov74N9jZnrjjz
	 UvihtP4zuu6xQ==
From: Kalle Valo <kvalo@kernel.org>
To: Marios Koutsoukis <marioskoutsoukis2006@gmail.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA9984 hw1.0: Board file for Xiaomi AIoT AC2350
References: <CAOmumepFH4kBxZJT-aaBr_ywiFaoWfRBr+pYHT2wiB_1PRFuFw@mail.gmail.com>
Date: Wed, 19 Jul 2023 18:16:08 +0300
In-Reply-To: <CAOmumepFH4kBxZJT-aaBr_ywiFaoWfRBr+pYHT2wiB_1PRFuFw@mail.gmail.com>
	(Marios Koutsoukis's message of "Tue, 20 Jun 2023 03:48:32 +0300")
Message-ID: <875y6g53uv.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_081613_668809_5A9C3D30 
X-CRM114-Status: GOOD (  13.81  )
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

Marios Koutsoukis <marioskoutsoukis2006@gmail.com> writes:

> Hello!
> This is my first time "posting" on a mailing list, sorry for any mistakes.
>
> --Description for what hardware this is:
>
> The Xiaomi AIoT AC2350 is a QCA9563 based router with:
> -an ath9k soc-integrated 2.4GHz radio
> -an ath10k QCA9984 hw1.0 5GHz radio (connected via PCI)
>
> --Origin of the board file
> (did you create it yourself or where you downloaded):
>
> Extracted from xiaomi's official chinese firmware
> (the only one available for download)
>
> --Ids to be used with the board file
> (ATH10K_BD_IE_BOARD_NAME in ath10k):
>
> QCA9984 hw1.0
>
> --Md5sum of each new board file to add:
>
> -bus=pci,bmi-chip-id=0,bmi-board-id=16
> md5: 844fc89edf9dcf88aef0d7e7afc58a15

Is there a reason why there is no variant attribute? I'm worried that
this will conflict with other products using bmi-board-id 16.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
