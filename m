Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36756C433EF
	for <ath10k@archiver.kernel.org>; Wed,  9 Mar 2022 00:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfL8qAanPFT+qjdshkNLa8EqxvXgS1Nk8ayeX4usxH4=; b=k6P6Fib5d0F2sOTPQ2Q2ED7rUk
	8+kQglESvT9P2uUQ82Utcj+GyynxH/UBkggIig/+Rf41FI5cskfuK6tfYVt+/pZPpUdDRYTSw+pPb
	t8o6ZYA7RSVH8Xem5LWtTIBGhy+FozZyXXBKFbmIYZfd/oNom/xR/buPOPlUxPh2BpwQ/+kBYu/RT
	GlAUTzkeYbqYnSIQR3W3Hp5NVVVSXzg9YwQ0W2CRWn5Qe4zqGjzETe+AGtgycxAF/Iv7/3twM0vJQ
	3CSuAEMIoTxXmZj9sQCp9+Rq9NeBgl/7dhjPp1V9FGzUa0JEsR3jnaEmuJ+dFikBMYuTNS6p1kodn
	yrmCdrOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRjpO-006gXK-Me; Wed, 09 Mar 2022 00:05:18 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRjpL-006gVt-2K
 for ath10k@lists.infradead.org; Wed, 09 Mar 2022 00:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1646784315; x=1678320315;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=keyAJb6A5NPJJZZCWIJLthBI4AdiJa40DZ7S3GIHMrU=;
 b=fI3f9urQUc7LbFl+gzqZ43raK0D5Dje6tlHVE8sbvZpFKTRbp4rDbsja
 tLAiBa9Cc6HGgy2a55Zy0jDt1+7p5eYUoy+lYRJGa3P29WBdOkj+z20Kk
 Gg1AAhK6kHVdumluoc75i/0tQZFxSGRNp5ilm4WZAaGFZaP8w4NGCekq4 s=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 08 Mar 2022 16:05:12 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 16:05:11 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 8 Mar 2022 16:05:11 -0800
Received: from [10.111.182.121] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Tue, 8 Mar 2022
 16:05:10 -0800
Message-ID: <b69308a5-0d29-6b48-833c-f3eacfe03b08@quicinc.com>
Date: Tue, 8 Mar 2022 16:05:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] ath10k: Fix error handling in ath10k_setup_msa_resources
Content-Language: en-US
To: Miaoqian Lin <linmq006@gmail.com>, Kalle Valo <kvalo@kernel.org>, "David
 S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, "Rakesh
 Pillai" <pillair@codeaurora.org>, <ath10k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
References: <20220308070238.19295-1-linmq006@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220308070238.19295-1-linmq006@gmail.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_160515_225604_E4EF67DF 
X-CRM114-Status: GOOD (  15.36  )
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

On 3/7/2022 11:02 PM, Miaoqian Lin wrote:
> The device_node pointer is returned by of_parse_phandle()  with refcount

Kalle, can you fix this nit when you apply?  remove extra space after ()

> incremented. We should use of_node_put() on it when done.
> 
> This function only calls of_node_put() in the regular path.
> And it will cause refcount leak in error path.
> 
> Fixes: 727fec790ead ("ath10k: Setup the msa resources before qmi init")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>   drivers/net/wireless/ath/ath10k/snoc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> index 9513ab696fff..f79dd9a71690 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -1556,11 +1556,11 @@ static int ath10k_setup_msa_resources(struct ath10k *ar, u32 msa_size)
>   	node = of_parse_phandle(dev->of_node, "memory-region", 0);
>   	if (node) {
>   		ret = of_address_to_resource(node, 0, &r);
> +		of_node_put(node);
>   		if (ret) {
>   			dev_err(dev, "failed to resolve msa fixed region\n");
>   			return ret;
>   		}
> -		of_node_put(node);
>   
>   		ar->msa.paddr = r.start;
>   		ar->msa.mem_size = resource_size(&r);

Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
