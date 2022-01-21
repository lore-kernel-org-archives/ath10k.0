Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587A7C433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 13:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=has/DHUok/prZaVe3O/HszEorIEQ+LYW6WjgSOFTWLU=; b=O0HsBPgRee6F1x
	f8CZ0Cf3j0gTXd14uNnmw+i5ej0Fb41Wizn78Gu3nf7CuLycTdO8DJltJwI+I2rPGxCiIxAzDpQRx
	6K1QF9JxyhAeq2E1Nkop3m6JqQuLeXmaUqGxIcPXWXHEMkS+OYpfVk6EXmS0iLq1vrePVzf/ljjKP
	Kp2mPXzPMmoRGLR4GIXNmYbXB+g1vrkN1BvzwWPaf24xDmD+xM+8OeZ1QqLUTi3Z/qJnL8yPRgPKg
	rKLMe1qJKEiY2Ow0HzqwSFs4thVoSDvZW1Cx4FrS+NkSGeLITSGm+AEiOEpLTje8eEOsHoHE4zGF/
	BeMv9F+hpY8+FQkD8X4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAtzH-00FAfx-6H; Fri, 21 Jan 2022 13:29:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAtzE-00FAe5-3B
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 13:29:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 963E66165F;
 Fri, 21 Jan 2022 13:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70DC1C340E3;
 Fri, 21 Jan 2022 13:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642771791;
 bh=Hi1Mz4x4YLalBzDFH5IlHqvIAK1AKsEPdRSZIhnmjo8=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=WI/ju34a6cf/3l/eyNp6n96WaURi3Z56bEouTEOnSkEIMwY4b5NKVaSruEwabTz7+
 kt2XdN3lZV0NXkZC/cWnUtDc2vv9e6qe1s+YDF9NxsipmI4uj7v2JLAmsDDaSeQbDQ
 +Ni3ZssopUIW7fmS5EPBI63pdlOz0iB7BY6RDU1aetplXEe3eQYPaYr1CJX7hSxxGx
 aruLva3qbJAB/Tsxtu6OqGpwq3bL919WSr4nPoV7e7hgIlmG7N/vE8zEsBlVKHKQIb
 Ze+ZC6qP6aoS4d12E3rIA/hgr4XsIuWMe757j6SkBYfkwTs6kpkbH9mViifER2e6Om
 TfPBHnrj3u2fw==
From: Kalle Valo <kvalo@kernel.org>
To: Fredrik Olofsson <fredrik.olofsson@anyfinetworks.com>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: QCA4018: Add D-Link DAP-2610 specific BDFs
References: <CADiFmNPs+_j4JwP2pLJv6xuqn=sZ-bK0R2SrCarNVOtGO8ARoA@mail.gmail.com>
Date: Fri, 21 Jan 2022 15:29:48 +0200
In-Reply-To: <CADiFmNPs+_j4JwP2pLJv6xuqn=sZ-bK0R2SrCarNVOtGO8ARoA@mail.gmail.com>
 (Fredrik Olofsson's message of "Thu, 9 Jan 2020 15:54:58 +0100")
Message-ID: <87r191dxo3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_052952_220921_A78D859C 
X-CRM114-Status: GOOD (  13.90  )
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

Fredrik Olofsson <fredrik.olofsson@anyfinetworks.com> writes:

> Please consider adding these board.bin files for the D-Link DAP-2610
> access point. They are used for OpenWrt in this pull request [1]
>
> * description for what hardware this is:
>   - it is a IPQ4018 based board
>   - one QCA40xx radio is used as 2.4GHz radio
>   - one QCA40xx radio is used as 5GHz radio
>
> * origin of the board file (did you create it yourself or where you downloaded):
> The files were extracted from the D-Link GPL bundle for this device [2], files:
> prebuild/lib/firmware/IPQ4019/hw.1/boarddata_0.bin
> prebuild/lib/firmware/IPQ4019/hw.1/boarddata_1.bin
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k):
> bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=dlink,dap-2610
> bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=dlink,dap-2610
>
> * md5sum:
> 91c45b6da40ac19b31fba62af59e4d3c
> bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=dlink,dap-2610.bin
> 48396921c773d5a3843d85dd0b3c2db2
> bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=dlink,dap-2610.bin

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=dlink,dap-2610
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=dlink,dap-2610

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 66 in total

https://github.com/kvalo/ath10k-firmware/commit/f6884355fd7a6d4f7649dd91d10c18fd1a93557c

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
