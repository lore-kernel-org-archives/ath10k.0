Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74C3C433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 14:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHmKd/nObYRB219K7d+6aRHCvt2f/xDksJ1Q9N/bgn8=; b=blUC9+IUFm/haG
	1R8rO6dBde7TM4BJ14619hdo4kcp3+jFd8bn5kzHeP3d6EBjk9nBq7O8qw45aaqOV03ulDe6glTmk
	uZ5Cjxt2GP2Kjp09Xm8Lkg5a2B8s9ybD6eJKL4Ur9MsfPx0DZgGYtGDYHzP3PBTAtcdDnOdWQC4Q9
	MGwkhRvcnwcSP8ESAK+zG4D99grDgTvjJOZPY04Xt+6MkAW9GoZiaE3sZjfAB2WLThDXJemyJENPo
	9EoHYKLS+RJyZiIb5jK1++jEbaVdJ+MwSPf6M+nsLBjLvYompmA0exOpyES+T2+8i80sCUvshEaS3
	YFxYtWtfxLxWpUivF6Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAuZM-00FJek-Gn; Fri, 21 Jan 2022 14:07:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAuZJ-00FJdg-TG
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 14:07:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 70C9261780;
 Fri, 21 Jan 2022 14:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B08EC340E1;
 Fri, 21 Jan 2022 14:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642774028;
 bh=E358gVBvpYRiXpR5uMMPrfGSF57FiMxCET8DC/9PViA=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=U86cZZ//XaCLxFFtM2z8qq+TMbpEBUM9xKBKsaZvlF2HIHpSJjgxJ29WhYhVDUk/N
 1Rn/qiON9Bf7L6qeqE5AkwgmaB5Hm97Ch+TD6S/3UNlerggXThvirGZw8E47Z0gvgI
 +bzPGrj2hfu+KulSlGVsvuebYq2IYKbR5qjPMnJldar2ZrM59eHx/R18jIWej1k3Lm
 MZLdCeJZ4agsJR4hCDTmLUUttjmfCUQw8yT03moM+efszBTMS2GYubcGbNDbcO3xRI
 IFFn+nWQy687L98q/9pp3wcwR23UPIHhJU9/YWqT9iLqYPv1tsFN6HTHgZMQPEOC8W
 9O+QtvyEj2dTQ==
From: Kalle Valo <kvalo@kernel.org>
To: Yanase Yuki <dev@zpc.sakura.ne.jp>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA9984 hw1.0: Add Buffalo WTR-M2133HP specific
 BDF
References: <20200414014636.GA877@dev-email>
Date: Fri, 21 Jan 2022 16:07:05 +0200
In-Reply-To: <20200414014636.GA877@dev-email> (Yanase Yuki's message of "Tue, 
 14 Apr 2020 10:46:36 +0900")
Message-ID: <87v8yd9o8m.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_060710_019246_9DAD6388 
X-CRM114-Status: GOOD (  12.24  )
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

Yanase Yuki <dev@zpc.sakura.ne.jp> writes:

> This file is Buffalo WTR-M2133HP specific BDF extracted
> from stock firmware.
>
> Required information:
>
> * description for what hardware this is:
>   - it is a IPQ4019 based board
>     - one QCA40xx radio is used as 2.4GHz radio
>     - one QCA40xx radio is used as 5GHz radio
>     - one QCA9984 radio is used as 5GHz radio
>
> * origin of the board file
>   - extracted from stock firmware
>
> * ids to be used with the board file
>   - bus=pci,bmi-chip-id=0,bmi-board-id=6,variant=Buffalo-WTR-M2133HP
>     - md5sum: e0651e456063c46fee881a0e5edc3f9c
>     - sha1sum: 2d6f344bbe4e4a20eb97c5fdc791eb01030d133c

Thanks, added to QCA9984/hw1.0/board-2.bin:

New:
bus=pci,bmi-chip-id=0,bmi-board-id=6,variant=Buffalo-WTR-M2133HP

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 16 in total

https://github.com/kvalo/ath10k-firmware/commit/26dfc831dda622431383bd21ff79f1c4889ac8c6

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
