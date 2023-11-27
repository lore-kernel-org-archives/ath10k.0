Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6B0C4167B
	for <ath10k@archiver.kernel.org>; Mon, 27 Nov 2023 16:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PW+uVLOz9Ey6eLhJ/DPxMflk3jnPY7atEwc5ZQhGKss=; b=qBsgwQb2SgTjRg
	Ux/WEuO4jYcFgc/01iKIyd9KnDrpc5SlmjhQnp7gvQQPpfM4p+SgDtc1TUJdciT7XIMfxRB0rNg+O
	S2G13gBuXN858S/vLQ7u8qhAbG6vyXrwZ8tRtCnOmZt3cnsRYMXx5d1nIj1iQ8ax/C9D87XkFLVtN
	rjwg5pIGPD98e2qcw0Jlf/xOTxRwdu8U+JjI1eMJPWg0ejo+ZDKKm/h49At7+zG+8b11Gg9X/msR8
	65YHFd1KL6nZxvPIMjbC+g4Rb2XlFlo/bug9uUY4FwFpm71xIj3W2bic3L1IhCO2zKR0KlI7IIi7R
	wTb8OHLLAI8e934vBhVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eVt-002zg3-0V;
	Mon, 27 Nov 2023 16:31:13 +0000
Received: from omta40.uswest2.a.cloudfilter.net ([35.89.44.39])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eVq-002zf4-2U
	for ath10k@lists.infradead.org;
	Mon, 27 Nov 2023 16:31:12 +0000
Received: from eig-obgw-5010a.ext.cloudfilter.net ([10.0.29.199])
	by cmsmtp with ESMTPS
	id 7Uf5r2de4L9Ag7eO8rdgXU; Mon, 27 Nov 2023 16:23:12 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 7eO6rTpWihDny7eO7r5CNn; Mon, 27 Nov 2023 16:23:11 +0000
X-Authority-Analysis: v=2.4 cv=fda+dmcF c=1 sm=1 tr=0 ts=6564c26f
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=yGeM7+xMb5a5VK1DGQx1ew==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=wYkD_t78qR0A:10 a=COk6AnOGAAAA:8
 a=Ln01kCxmXRaHJmvONIYA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=TjNXssC_j7lpFel5tvFf:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+Q7Pri0fJihW9QCH27OFmaRs5wYVEoLLYvRhIYgKafM=; b=caFWUgSLCTaYPsXEwcpS88m2tX
	Wae30zMmAoCLFoGLaGiozVIJlBLvvIoCg6iC7IbwjWF2Vgy/9iFq4q6tZbtG+uHbSrNTpBQmtS/uB
	udxzNMAzpsmSWp+trbQHVlOWY/9NExYuF0rXrC5A0ADTpzEVyBV4hMfHYlNg9/ng03rnpwTRWcNxp
	KxBUC1/OBl6qs/qq/5Q4+j8PA3AjmXI2UIN3SmyMUTV70kzuNu1KUnYOPhpwwTzsjM0PAIL0HRQ1f
	mr6hrmjU3BoNpYx1ZuQIymER6Xv+yUa78lQQfxuJmecO2wzK7/K7ZOZSfoev5GorSX/SzXG7TTXBf
	94flIJXg==;
Received: from 187.184.157.122.cable.dyn.cableonline.com.mx ([187.184.157.122]:35864 helo=[192.168.0.9])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1r7eO6-003aet-0l;
	Mon, 27 Nov 2023 10:23:10 -0600
Message-ID: <4f2a486c-c6de-43e4-8bb6-bdd3f819b0a9@embeddedor.com>
Date: Mon, 27 Nov 2023 10:23:07 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] wifi: ath11k: Use DECLARE_FLEX_ARRAY() for
 ath11k_htc_record
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kees Cook <keescook@chromium.org>, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231127-flexarray-htc_record-v1-0-6be1f36126fd@quicinc.com>
 <20231127-flexarray-htc_record-v1-4-6be1f36126fd@quicinc.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20231127-flexarray-htc_record-v1-4-6be1f36126fd@quicinc.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.184.157.122
X-Source-L: No
X-Exim-ID: 1r7eO6-003aet-0l
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187.184.157.122.cable.dyn.cableonline.com.mx ([192.168.0.9]) [187.184.157.122]:35864
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLU89GXkH3X+qh9f9xERsevtRPdgkxFALXeodecObcQNKEMBFyInrUsKl1MGTdYXcIjfqDeEFxaOueI6mof9zuzp6vI6jj4AEuRpJNJyhOkTuxK8dvPf
 MC14efHtn8om2Hc0HuWSdtrvLlNJySoDB4QtjnglgdccbFZ94CbufHtPEed1B7OGxWON6yf7y/+QPOIizrSsOLVDxvIBa9NrNFHC/SYvm3C3cMUdkdIkjM/7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_083110_834605_D30B7721 
X-CRM114-Status: UNSURE (   9.85  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org



On 11/27/23 10:14, Jeff Johnson wrote:
> Transform the zero-length array in ath11k_htc_record into a proper
> flexible array via the DECLARE_FLEX_ARRAY() macro. This helps with
> ongoing efforts to globally enable -Warray-bounds.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath11k/htc.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/htc.h b/drivers/net/wireless/ath/ath11k/htc.h
> index 84971cc9251c..e0434b29df70 100644
> --- a/drivers/net/wireless/ath/ath11k/htc.h
> +++ b/drivers/net/wireless/ath/ath11k/htc.h
> @@ -151,7 +151,7 @@ struct ath11k_htc_credit_report {
>   struct ath11k_htc_record {
>   	struct ath11k_htc_record_hdr hdr;
>   	union {
> -		struct ath11k_htc_credit_report credit_report[0];
> +		DECLARE_FLEX_ARRAY(struct ath11k_htc_credit_report, credit_report);
>   	};

Why not removing the `union` and just do a direct transformation [0] -> [ ] ?

--
Gustavo


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
