Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE11C4167D
	for <ath10k@archiver.kernel.org>; Wed, 13 Dec 2023 20:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HyjzJtPl2sUntsAoFxkWgAbY6M7c0HaPJqZRErlf6Y=; b=caH9k7ZGR/lRDcbmK6sWgLWVX/
	zXfDYmthb+cC50EKO/BfvKxsBybm+6wEfvq0pViKoSvkojI+aXYqtmfKpNijYsJAsunk53raXGZHD
	idFGFLldevzHjceKuEgtTNKYtuVqNoJtNeEbIMKJWQX9zDynzpnEmYhQ3C2GEUFy3s3ShxX9GzOVi
	g98OGq4GkjlzsJ6UZhiW/ccIhMZvA9ErTLmxrHATe/REHASCXXJ9ddDqjmxcWbMoSPnIV3hc462Qu
	L0mPFnFo1nhg3BncRms+8Oa2CQFO3JGuyE8VmAgXF0xY1V71xo+jG6rbicrZoNFe3Afs7fXjAbGd1
	8GCySpRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDVdP-00FwXT-2z;
	Wed, 13 Dec 2023 20:15:11 +0000
Received: from omta34.uswest2.a.cloudfilter.net ([35.89.44.33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDVdN-00FwWP-2d
	for ath10k@lists.infradead.org;
	Wed, 13 Dec 2023 20:15:11 +0000
Received: from eig-obgw-6002a.ext.cloudfilter.net ([10.0.30.222])
	by cmsmtp with ESMTPS
	id DScurJwjn8HteDVdArdlYx; Wed, 13 Dec 2023 20:14:56 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id DVd8rHCrGM0U2DVd9rwElV; Wed, 13 Dec 2023 20:14:55 +0000
X-Authority-Analysis: v=2.4 cv=BuKOfKb5 c=1 sm=1 tr=0 ts=657a10bf
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=e2cXIFwxEfEA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=uucgfnjzxiVboiWmI4QA:9 a=QEXdDO2ut3YA:10 a=phs4urI-Bf8A:10
 a=AjGcO6oz07-iQ99wixmX:22 a=TjNXssC_j7lpFel5tvFf:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1HyjzJtPl2sUntsAoFxkWgAbY6M7c0HaPJqZRErlf6Y=; b=F19Xfa/fVsko11ZYAAp+fLLgQE
	JKYZf7l5jeio10XKdoJ92Ca6CIbpzzE303mOM8CFzMLyyaaYFNqZorcLQrm3F//jBfGRyM9q+hRw8
	85yPu0ZLN1Q0GNj5Wq4d5zJLjkRV/9hcqK5MaeeRLZ1al/HZ7LJ/EKWPIn7LYl+BqV+NUym24eO5o
	nG1bZsdkm7VNFItpWobUGQCFEJpHzpWyw/14YxHbbaqfGjOfTZoVSKAIdLW2q9Om9sjw86EwnDRoZ
	XfY6tdpgITObdjqjbmfxrL3jq8ChxnJTW2Y4CE8dLMginTZCjjVGXAe4B8FzflF5iQ6CzIkJnywY1
	lugecQPQ==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:60998 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1rDVd8-003PFj-0p;
	Wed, 13 Dec 2023 14:14:54 -0600
Message-ID: <f5a23931-6c05-4eed-91a5-5b829ad3aa94@embeddedor.com>
Date: Wed, 13 Dec 2023 14:14:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] wifi: ath10k: use flexible array in struct
 wmi_host_mem_chunks
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231213-wmi_host_mem_chunks_flexarray-v1-0-92922d92fa2c@quicinc.com>
 <20231213-wmi_host_mem_chunks_flexarray-v1-1-92922d92fa2c@quicinc.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20231213-wmi_host_mem_chunks_flexarray-v1-1-92922d92fa2c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.21.192
X-Source-L: No
X-Exim-ID: 1rDVd8-003PFj-0p
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10]) [187.162.21.192]:60998
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfC8nWQVhjc/cong/D12Oo1yELutjzQfLFLZZUpltUsAO3JvroXukblLscJV7Ct6oRHC+IV/yPsgDwGmz6kHHzMKXo6pEk97mx7ruhUY2zt86l0VLtKHH
 InQROuvxdFBfcLpFcw/ZIC9ZA6HyjXrl2b24XPjyhU6GtOYiz+Hm/hrmTB6hLRb75A3sy6qrDlEcP3bv3tm/h6LjsDcMpeVjrlxm1fk/XCiGARQCxYE8Lflz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_121509_886995_5DD36517 
X-CRM114-Status: GOOD (  12.00  )
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



On 12/13/23 11:06, Jeff Johnson wrote:
> Currently struct wmi_host_mem_chunks defines:
> 	struct host_memory_chunk items[1];
> 
> Per the guidance in [1] this should be a flexible array. However there
> is a documented requirement:
> 	some fw revisions require at least 1 chunk regardless of count
> 
> To satisfy this requirement, follow the guidance from [2] and wrap the
> array in a union which contains both the flexible array and a single
> instance of the underlying struct. Since the footprint of the struct
> is unchanged, no additional driver changes are required.
> 
> No functional changes, compile tested only.
> 
> [1] https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
> [2] https://lore.kernel.org/linux-wireless/202308301529.AC90A9EF98@keescook/
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
--
Gustavo

> ---
>   drivers/net/wireless/ath/ath10k/wmi.h | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
> index 9146df98fcee..833ce0251a2c 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.h
> +++ b/drivers/net/wireless/ath/ath10k/wmi.h
> @@ -3069,7 +3069,10 @@ struct host_memory_chunk {
>   struct wmi_host_mem_chunks {
>   	__le32 count;
>   	/* some fw revisions require at least 1 chunk regardless of count */
> -	struct host_memory_chunk items[1];
> +	union {
> +		struct host_memory_chunk item;
> +		DECLARE_FLEX_ARRAY(struct host_memory_chunk, items);
> +	};
>   } __packed;
>   
>   struct wmi_init_cmd {
> 

