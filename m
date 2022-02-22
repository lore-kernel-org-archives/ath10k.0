Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A775CC433F5
	for <ath10k@archiver.kernel.org>; Tue, 22 Feb 2022 20:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13DsKkcQw41XRLXzh3p5TxrN8jOGXkezPk13hRMTks0=; b=DM3HUgrvz2yoGx
	8v/fWBCWpIgK5wdrz6L5wfsnu8RQokjvFuc4lYOUJnXTat1jC83wuIy28PvT0u5PYskjlkaHE6vYR
	tzAsPZmvSvJCvQ8DURAZBdP6yH+xXuapAcSv/d+bNgwLLyxch1H2+hBKO6SvCkSKwSLbGhdl/OguP
	hDtb5uPJVKMBwlC0G+4OW//PdpYYQtnkfhXU1QFzfVXorzIQOVSWwuQIPAPcMJzPQ2/QGdlF5pA6V
	cxiwMrTYgm+tPamFH6mV946jQCgSPf+oyy3V6bG1yMDT0Nn2TUaJzorb8DerFxoPlOIHSFNSV1dwI
	3w2vr9FJdJnQUAnE/+eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMc9B-00BatE-Kb; Tue, 22 Feb 2022 20:52:33 +0000
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMc97-00BasM-T9
 for ath10k@lists.infradead.org; Tue, 22 Feb 2022 20:52:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645563149; x=1677099149;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RGf7UYwot34BV0nM/N1ZCdlnYIzevn7iRlhfia03PL0=;
 b=EBxfewEzbmI98CI2JhmMqMtMo0dZKReb2emRkjYXv2cZTcBX7H3v+zeZ
 HzVniN+mshAj5gMdWt/1Pi4u7WgcS5z6GQxntQfOvaMym7Qynq7Wdk4gX
 7twwCRgIlohM0u0V6CMFSYwqwvQXdzEIEDKinYihjGmnxsnMmM8boNUdw c=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 22 Feb 2022 12:52:28 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 12:52:28 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 22 Feb 2022 12:52:28 -0800
Received: from [10.48.243.226] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Tue, 22 Feb
 2022 12:52:27 -0800
Message-ID: <e32de43c-e00a-5766-e988-fe192d36d719@quicinc.com>
Date: Tue, 22 Feb 2022 12:52:27 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2] ath10k: fix pointer arithmetic error in trace call
Content-Language: en-US
To: Francesco Magliocca <franciman12@gmail.com>, <ath10k@lists.infradead.org>
CC: <dan.carpenter@oracle.com>, <rmanohar@qti.qualcomm.com>,
 <linux-wireless@vger.kernel.org>
References: <20220221122638.7971-1-franciman12@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220221122638.7971-1-franciman12@gmail.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_125230_028467_551ACAA3 
X-CRM114-Status: GOOD (  23.23  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 2/21/2022 4:26 AM, Francesco Magliocca wrote:
> Reading through the commit history, it looks like
> there is no special need why we must skip the first 4 bytes
> in this trace call:
> 
> trace_ath10k_htt_rx_desc(ar, (void*)rx_desc + sizeof(u32),
> 			 hw->rx_desc_ops->rx_desc_size - sizeof(u32));
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
> ---
>   drivers/net/wireless/ath/ath10k/htt_rx.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/htt_rx.c b/drivers/net/wireless/ath/ath10k/htt_rx.c
> index 9ad64ca84beb..e01efcd2ce06 100644
> --- a/drivers/net/wireless/ath/ath10k/htt_rx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_rx.c
> @@ -429,7 +429,7 @@ static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
>   				RX_MSDU_END_INFO0_LAST_MSDU;
>   
>   		/* FIXME: why are we skipping the first part of the rx_desc? */
> -		trace_ath10k_htt_rx_desc(ar, rx_desc + sizeof(u32),
> +		trace_ath10k_htt_rx_desc(ar, (void*)rx_desc + sizeof(u32),

since void pointer arithmetic is undefined in C99 would it be "better" 
to cast as u8 *? I realize that gcc has an extension to support this 
[1], but this usage will cause a warning when -Wpointer-arith is used.

[1] https://gcc.gnu.org/onlinedocs/gcc/Pointer-Arith.html

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
