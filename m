Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF72CC47DB3
	for <ath10k@archiver.kernel.org>; Thu, 18 Jan 2024 17:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=le1zjJIbWJzNyw/sI9c24dewS/cRUdNZEzjWw/lERjU=; b=gJMHtYdbS9jFMaC4Cs2v6CDdmO
	t5wzRZx6v5YqP0f+kqlaDtioox7hpSCsmVORw3okXlsudLvhFuJtorLqmdlQto+PqsPGwcMuXgWeM
	gqbesCknHHgZlpcoBD7J/hcjSERRnqkOUMz6uIuUHGRr6n3sIqegkQ4TL7lZeKbasdI2wTb+WqXWm
	RrjjTStnhaGguYM90uNCCK0UvTaV54F+2XqVXQROyDqpD5xaX81gsNfSJOEtA5lh9Gxgl+saZDGJ6
	PQQm8sUXBCv1GjWjl6SCPatPOaFZnE0+h6bn7212suB2evkmSTYzZrx5BWm6lI+diiQbcCEL5xmih
	TYOpVoMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQW3J-003NRc-1D;
	Thu, 18 Jan 2024 17:19:41 +0000
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rQW3H-003NJm-2n;
	Thu, 18 Jan 2024 17:19:39 +0000
Message-ID: <d4fc5d68-c6a0-46fc-a11c-a97a33ea27e0@infradead.org>
Date: Thu, 18 Jan 2024 09:19:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] wifi: ath10k: Fix htt_data_tx_completion kernel-doc
 warning
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240118-ath10k-kerneldoc-v1-0-99c7e8d95aad@quicinc.com>
 <20240118-ath10k-kerneldoc-v1-4-99c7e8d95aad@quicinc.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240118-ath10k-kerneldoc-v1-4-99c7e8d95aad@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 1/18/24 08:12, Jeff Johnson wrote:
> Currently kernel-doc reports:
> drivers/net/wireless/ath/ath10k/htt.h:911: warning: Cannot understand  * @brief target -> host TX completion indication message definition
>  on line 911 - I thought it was a doc line
> 
> This is because even though struct htt_data_tx_completion uses the
> kernel-doc marker "/**", it doesn't actual use kernel-doc syntax for
> the documentation. Rather than try to update this legacy driver
> documentation to use kernel-doc style, just replace the comment
> marker.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/net/wireless/ath/ath10k/htt.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/htt.h b/drivers/net/wireless/ath/ath10k/htt.h
> index eb0ce2f49315..603f6de62b0a 100644
> --- a/drivers/net/wireless/ath/ath10k/htt.h
> +++ b/drivers/net/wireless/ath/ath10k/htt.h
> @@ -906,7 +906,7 @@ struct htt_data_tx_completion_ext {
>  	__le16 msdus_rssi[];
>  } __packed;
>  
> -/**
> +/*
>   * @brief target -> host TX completion indication message definition
>   *
>   * @details
> 

-- 
#Randy

