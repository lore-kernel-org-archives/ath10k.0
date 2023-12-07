Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743A3C4167B
	for <ath10k@archiver.kernel.org>; Thu,  7 Dec 2023 12:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTqhrx4f5G9sPyJH1ILOEbdx5eUhxRIjfhLsh7kfbRU=; b=uiXXIXVkoiQIqDQy3QeJyOAtAy
	P33QJmsWlOhCXNLa4z5WKqq5WsL9y8h7kYWf0G8WZhzh+BfxIaJfvAibF1RdFK5M5z3Mv3Gfql0ox
	DrdHWhbMZYiYgtfiW28fFRrrsMJc2nQhw+rL1ku1DyzIew9IMJXLdhZS1V48Vtxi1q9D23hA52/6o
	lIOC2h5AEk3UNFfNWep8slam6UW8o/kl01xBo5jRlJTN+it2FpVJeBtrkViqEiWugxoMeBdRPBU73
	Kun3gv3L1rqVJu4gnfkwPwQhC4isXTqO23Pu7pNAPxOuhb3WaBRIEvEyeCKo3u0iPwFWYmgcA+1S6
	P0Z4qm7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBDMl-00ClkB-1f;
	Thu, 07 Dec 2023 12:20:31 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBDMi-00CljP-2R
	for ath10k@lists.infradead.org;
	Thu, 07 Dec 2023 12:20:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EA8DBCE234D;
	Thu,  7 Dec 2023 12:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FE0C433C8;
	Thu,  7 Dec 2023 12:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701951623;
	bh=oIj5pZSPw2WHfjNLedJjcFvShC1BCqKg+Skipj79lrk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=YAckEC9ucPtXArhH0uqDU3ObVBCrRRs63UR6eSTpJp6Br0pZJ98z6ZPfez5FRuayn
	 GnsXaJ1md7vvz+NO4C5nJdp+9oFTfHSMI9ArjzN3X8XM5H6FXQl1mYd1ZEhvOKxATQ
	 apTHP7wePN9mi5Ma71qnl4F7gnUwSYOJmzOmSHJQ5LiUNO97xscgIkzuevZn1Vz6fi
	 ustXyEimXUySzgnRlJX85CC4fJYS5rpC7PJ/Av0CfuYXM6PX0Vs25lRD9EHBwW8pEu
	 /EDeapY+bew8LsH7sGqxQz/aOOV7kHXTAbsOdyhrBatNnzgG4QLHC/v4nmELhXfgWC
	 U/RfYZjZUOkkA==
From: Kalle Valo <kvalo@kernel.org>
To: Xingyuan Mo <hdthky0@gmail.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  ath10k@lists.infradead.org
 (open list:QUALCOMM ATHEROS ATH10K WIRELESS DRIVER)
Subject: Re: [PATCH] wifi: ath10k: fix NULL pointer dereference in
 ath10k_wmi_tlv_op_pull_mgmt_tx_compl_ev()
References: <20231207100709.12231-1-hdthky0@gmail.com>
Date: Thu, 07 Dec 2023 14:20:20 +0200
In-Reply-To: <20231207100709.12231-1-hdthky0@gmail.com> (Xingyuan Mo's message
	of "Thu, 7 Dec 2023 18:07:09 +0800")
Message-ID: <871qbyp5kr.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_042028_975406_2C90E6F8 
X-CRM114-Status: UNSURE (   6.03  )
X-CRM114-Notice: Please train this message.
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Xingyuan Mo <hdthky0@gmail.com> writes:

> We should check whether the WMI_TLV_TAG_STRUCT_MGMT_TX_COMPL_EVENT tlv is
> present before accessing it, otherwise a null pointer deference error will
> occur.

I cannot take patches without s-o-b, please read:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#signed-off-by_missing

Also you need to Cc linux-wireless so that patchwork sees the patch:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

