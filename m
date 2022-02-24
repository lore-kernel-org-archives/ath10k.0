Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB51C433EF
	for <ath10k@archiver.kernel.org>; Thu, 24 Feb 2022 09:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CiZU5ZUJ1gW0yButZfDufu9D25mtWPwbNaGwXKM85HA=; b=y1FS43j5jlI2sf
	ANDTgYGJpmYVFXVr/PMNCNQsHZ9lZyEmqKILIhqxfCZX9YFoHcjZ0X9a00BSceGiLlyyaKUEz0Y23
	479/fpQxPs/Kin28yGAnl0usa6TUzdJPqZ2wFS4wofGi1MKhIWMS/LAPU4tww1R32QpZg+RUr73ek
	RjXX6oDc1Qp854Z3KdCVJUAJd+KkkMSN5md9ShMr9j84RovetU0+O7y03UJUYRPG+1oE0acxIQxpf
	abb3KItVIPu/eO7Ku6jkG+f0WylcGttGgVtih6e1IxRJGkRgBZHSvejgA3C6+6sQMFwdurVeAHlpS
	cP09mPZRcfPA305CZgBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNAIL-0000JX-9Z; Thu, 24 Feb 2022 09:20:17 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNA4O-00HUPb-EW
 for ath10k@lists.infradead.org; Thu, 24 Feb 2022 09:05:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E1ACDB82423;
 Thu, 24 Feb 2022 09:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2947CC340E9;
 Thu, 24 Feb 2022 09:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645693549;
 bh=CC5AEFMLTxhckHWBk6hNVR6HRUe2MZlQmHha6NARgFs=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=n9q/7wze2pqaRf1hOdY60Lg8OnOyrKuLq5mrIedNfqWb/6u5LwEAkaJAXD69lOQql
 1tYb9pNAuNMBh1FqdZYbiyLHbdtRRRjECR0Z5v1YvHSLEkoCAK/CzMejUdeVm746Dg
 Ft7WrfvXB8v88kDsCN8pJIXTKt+WDNcq6+X+3tahC/dLXmIT3IjA94O6xOJKZprECY
 NzB1bucdudP44mGrqs51OifgUhfZYU5X6aoWITxpNQOMErzUxVwMd0YUKWRctfwh6W
 qQDCIDOpjnMzQPNXpDQKP9/f4/CytMEdxBIcYu6EhiDmuWH9/f3DjrATXfyGyu9u46
 EAj4GyFnCZK2g==
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: fix pointer arithmetic error in trace call
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220221122638.7971-1-franciman12@gmail.com>
References: <20220221122638.7971-1-franciman12@gmail.com>
To: Francesco Magliocca <franciman12@gmail.com>
Cc: ath10k@lists.infradead.org, dan.carpenter@oracle.com,
 rmanohar@qti.qualcomm.com, linux-wireless@vger.kernel.org,
 Francesco Magliocca <franciman12@gmail.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164569354432.30378.1243222511176407812.kvalo@kernel.org>
Date: Thu, 24 Feb 2022 09:05:47 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_010552_727121_2C97FF6E 
X-CRM114-Status: GOOD (  18.52  )
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

Francesco Magliocca <franciman12@gmail.com> wrote:

> Reading through the commit history, it looks like
> there is no special need why we must skip the first 4 bytes
> in this trace call:
> 
> trace_ath10k_htt_rx_desc(ar, (void*)rx_desc + sizeof(u32),
>                          hw->rx_desc_ops->rx_desc_size - sizeof(u32));
> 
> found in the function ath10k_htt_rx_amsdu_pop in the file htt_rx.c
> 
> i think the original author
> (who is also the one who added rx_desc tracing capabilities
> in a0883cf7e75a) just wanted to trace the rx_desc contents,
> ignoring the fw_rx_desc_base info field
> (which is the part being skipped over).
> But the trace_ath10k_htt_rx_desc later added
> don't care about skipping it, so it may be good
> to uniform this call to the others in the file.
> But this would change the output of the trace and
> thus it may be a problem for tools that rely on it.
> Therefore I propose until further discussion
> to just keep it as it is and just fix the pointer arithmetic bug.
> 
> Add missing void* cast to rx descriptor pointer in order to
> properly skip the initial 4 bytes of the rx descriptor
> when passing it to trace_ath10k_htt_rx_desc trace function.
> 
> This fixes the pointer arithmetic error detected
> by Dan Carpenter's static analysis tool.
> 
> Fixes: 6bae9de622d3 ("ath10k: abstract htt_rx_desc structure")
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00157-QCARMSWPZ-1
> 
> Signed-off-by: Francesco Magliocca <franciman12@gmail.com>
> Link: https://lore.kernel.org/ath10k/20220201130900.GD22458@kili/
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

49ffac5907a8 ath10k: fix pointer arithmetic error in trace call

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220221122638.7971-1-franciman12@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
