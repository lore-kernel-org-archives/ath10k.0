Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D09C4332F
	for <ath10k@archiver.kernel.org>; Wed, 13 Dec 2023 20:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UAQwQ7IEtUhKOpC9ppXTt8xH6jO7zZPX28hM2QTFvA=; b=F/XfX9LzlTtojn6OcUUyAZAsnJ
	bTOwyJfnLKqPTnljc1AQ1pR43Z0R8tlZJTwhsdDeI/i7ckBZZ+0pqcOF39mPIA0lihJcT3U1+REu4
	A5NueLCWc8PAkrZxMWVgQ7Ia+6kLwuCd+i6draJluFQIAIspae9O/zyZtV3DJDf7RYSNhFaUYMR8r
	L0DgnuGzcNRQA3L9OURHwHYLJGq9OKHGms9e8xLc/DBh5LyuK3gzhVex1oRqNnUt3ivpOyDCu5y44
	1fU+OH7p7JgjjOPaqIdX/KWKU8OEmI9XQTijehxcCwySPUszTUndfR2YGLoZ09IAhLjchWHNY2ZPi
	DZNbOuHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDVj8-00FxDj-0H;
	Wed, 13 Dec 2023 20:21:06 +0000
Received: from omta036.useast.a.cloudfilter.net ([44.202.169.35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDVj5-00FxDE-0J
	for ath10k@lists.infradead.org;
	Wed, 13 Dec 2023 20:21:04 +0000
Received: from eig-obgw-5008a.ext.cloudfilter.net ([10.0.29.246])
	by cmsmtp with ESMTPS
	id DTWcrB6W0gpyEDVj4rdUKO; Wed, 13 Dec 2023 20:21:02 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id DVj3rLYIYkUbtDVj3rjfS5; Wed, 13 Dec 2023 20:21:01 +0000
X-Authority-Analysis: v=2.4 cv=WpU4jPTv c=1 sm=1 tr=0 ts=657a122d
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=e2cXIFwxEfEA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=NTzXNMFqqmFafkXJ348A:9 a=QEXdDO2ut3YA:10 a=phs4urI-Bf8A:10
 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7UAQwQ7IEtUhKOpC9ppXTt8xH6jO7zZPX28hM2QTFvA=; b=x52FsXjfxbUcEeG9/WkQOhe+2y
	jct1laMvmnHlYE2wFSApdVD2VqsiYlBPyH4EAm7tA04/0pPCbZm23IaZNzHzcrc+FYSeE8vTmVUMp
	ZMsdVq2OrSPvRy6BH0pkMg9xHXfjopFoNawyVLlK7t/mocBLeTjdtQxUwpuG9GO/3mXLDjkNH7zLd
	OAfhFOX/l/leXxYamAy3tZB8V1NEm/lLeLEdaWF9owd5voG9iTx5y2We1sj4x1HNHRVfRg+iKmbYV
	ieuNz1ubExRMreRfX2hvnEJlvlVYXnUcwcRa725grxbpmxo2bm0JoJPodPIwwz0sB91REK3xvl+3/
	zNfHEv5w==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:36860 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1rDVj2-003Rqk-2d;
	Wed, 13 Dec 2023 14:21:00 -0600
Message-ID: <6f95ea62-ff20-4aea-817f-6c5f84ab5a97@embeddedor.com>
Date: Wed, 13 Dec 2023 14:21:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] wifi: ath10k: use flexible arrays
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231213-wmi_host_mem_chunks_flexarray-v1-0-92922d92fa2c@quicinc.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20231213-wmi_host_mem_chunks_flexarray-v1-0-92922d92fa2c@quicinc.com>
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
X-Exim-ID: 1rDVj2-003Rqk-2d
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10]) [187.162.21.192]:36860
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 39
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLUBfd99qxIc/Af2u3K79T0fJ1zRnkvjQ0aXXnO8eaLg/ptbv97jbz3jETHWehj3rI4DbhXscGwcGYr6lQNqHBmlTgerWQfia6/ftovhdpBkkrXZAJWY
 jTjGRAzxIgOXifX+GcfPUtt4kAbIZiGtXzy2TJluc8v1gKe+LfzQWBSjYwOvdBdpG5xmWsmjxLD+O0EfU2UMEK/pClyztdFksXtjGkSLGcfJdsRc8rrvAgKc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_122103_196745_0F3F0999 
X-CRM114-Status: UNSURE (   4.78  )
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



On 12/13/23 11:06, Jeff Johnson wrote:
> Clean up the last remaining zero-length and one-element arrays in
> ath10k to comply with:
> https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
> 
> With these cleanups done the ath10k-check script no longer reports any
> issues.

This is really great!

Thank you for taking care of this. :)
--
Gustavo

> 
> ---
> Jeff Johnson (6):
>        wifi: ath10k: use flexible array in struct wmi_host_mem_chunks
>        wifi: ath10k: use flexible arrays for WMI start scan TLVs
>        wifi: ath10k: remove struct wmi_pdev_chanlist_update_event
>        wifi: ath10k: remove unused template structs
>        wifi: ath10k: use flexible array in struct wmi_tdls_peer_capabilities
>        wifi: ath10k: remove duplicate memset() in 10.4 TDLS peer update
> 
>   drivers/net/wireless/ath/ath10k/wmi.c | 10 +++----
>   drivers/net/wireless/ath/ath10k/wmi.h | 55 +++++++++--------------------------
>   2 files changed, 17 insertions(+), 48 deletions(-)
> ---
> base-commit: 7133b072dfbfac8763ffb017642c9c894894c50d
> change-id: 20231212-wmi_host_mem_chunks_flexarray-78264e146731
> 

