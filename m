Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA72C4332F
	for <ath10k@archiver.kernel.org>; Wed, 13 Dec 2023 20:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ivsjgbcZ+u/prCi/Ekvtlg9X64fvHUt5Ju+nDMP4Ci4=; b=p3V1oznQVIJtiFSC/3+2nXR18o
	voeJxJYhCsdtkbJURa5zzz7f0nr8DvlNaGZ/ucJlq1+kuQlsAC9YQHGdujAVBVKuLSGnAiMQjUe/z
	NJ4tZmkdl0vnf2MGSoxQMejeuZxvM3PdKKr1oV/jZFnoi1CteHmEd9YsDSufxVjbEdNLF/12tLWxc
	hvZysgV01dSY6V+SAzGOINkg/jxd3MgxBjBPvgyX/9FcT+ijwNNgDkzMr9BaYRpsmJORq7v737oXu
	6mbICHRhPqBMMvp2ByU2oGOUqBb3k9DZK/aAdHix3JKijwhfo+/JdFrFOUdV0rzQxE+BL9QKFoQfL
	PHGRrgzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDVgR-00Fwpa-05;
	Wed, 13 Dec 2023 20:18:19 +0000
Received: from omta34.uswest2.a.cloudfilter.net ([35.89.44.33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDVgP-00FwpC-0J
	for ath10k@lists.infradead.org;
	Wed, 13 Dec 2023 20:18:18 +0000
Received: from eig-obgw-6009a.ext.cloudfilter.net ([10.0.30.184])
	by cmsmtp with ESMTPS
	id DTcUrKG0I8HteDVgOrdnZJ; Wed, 13 Dec 2023 20:18:16 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id DVgNrZQS4BOccDVgNrmIcm; Wed, 13 Dec 2023 20:18:15 +0000
X-Authority-Analysis: v=2.4 cv=J+25USrS c=1 sm=1 tr=0 ts=657a1187
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=e2cXIFwxEfEA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=9Bts-zK5aL38NWpKt6QA:9 a=QEXdDO2ut3YA:10 a=phs4urI-Bf8A:10
 a=AjGcO6oz07-iQ99wixmX:22 a=TjNXssC_j7lpFel5tvFf:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ivsjgbcZ+u/prCi/Ekvtlg9X64fvHUt5Ju+nDMP4Ci4=; b=UXe7jHaGC882615hkD8MEkjfYg
	aCwJeMeE+gO0IIa98aP3H/yALrWh8d4HAD6vQ6vRcNTkPLENwfufNk6kvUuOo4hi+Ahr/YlFgkVIK
	u8cYpg0GJDo5EfOKHJekMM3Z9YBQaYEfwO4I7vg3ovHkN4Vz447uV+ydNefMpIuFQxsdmS5I6xIXw
	Id6PTzVh9q7BbKJpcYuVCjdmsIMxnN+jmLdw6+jhHubbi5UzLtiz4CwtOMRatXjhyAqq7xA7Svl0k
	0/57GxoBH4GWPxAx0vzIv1CSErxzJvh3mHPpKI1bDCMuje9CLnX0MIMDBVx+XBzqFQ2ngHrrZRmaQ
	EE5C67fg==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:36860 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1rDVgM-003Rqk-2d;
	Wed, 13 Dec 2023 14:18:14 -0600
Message-ID: <c22dfa75-5e23-4af8-9ba4-4cede1854700@embeddedor.com>
Date: Wed, 13 Dec 2023 14:18:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] wifi: ath10k: remove struct
 wmi_pdev_chanlist_update_event
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231213-wmi_host_mem_chunks_flexarray-v1-0-92922d92fa2c@quicinc.com>
 <20231213-wmi_host_mem_chunks_flexarray-v1-3-92922d92fa2c@quicinc.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20231213-wmi_host_mem_chunks_flexarray-v1-3-92922d92fa2c@quicinc.com>
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
X-Exim-ID: 1rDVgM-003Rqk-2d
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10]) [187.162.21.192]:36860
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 15
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMihB+M0fX9IXHyQ3hlnt6QfCay8vok5zieo5pUw+UBhrByqFq7ry7sQt1QrpASYm8UJiT/55ZX7s95kRJi0h9+zPV11ZPf+hVs54qIUH7uJN10hzhh+
 8tFNRUmbVnJbH6UvaVi7Ys1F9NJ0qXOymeX+0G6kWzGQg23JaEoLqGe2MX9C03TB1ZzNavGvOd3yNmTmMEfoEOb4z0Qh6+7V+8ebH+f0lGca9gx5BAUQOllP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_121817_160008_915F0B57 
X-CRM114-Status: UNSURE (   8.81  )
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
> Currently struct wmi_pdev_chanlist_update_event defines:
> 	  struct wmi_channel channel_list[1];
> 
> Per the guidance in [1] this should be a flexible array. However
> during conversion it was discovered that this struct is not used, so
> just remove the entire struct.

Less code is always great. :)

> 
> No functional changes, compile tested only.
> 
> [1] https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
--
Gustavo

> ---
>   drivers/net/wireless/ath/ath10k/wmi.h | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
> index 52a409ff94e7..37a7d421bd86 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.h
> +++ b/drivers/net/wireless/ath/ath10k/wmi.h
> @@ -4256,13 +4256,6 @@ struct wmi_peer_sta_ps_state_chg_event {
>   	__le32 peer_ps_state;
>   } __packed;
>   
> -struct wmi_pdev_chanlist_update_event {
> -	/* number of channels */
> -	__le32 num_chan;
> -	/* array of channels */
> -	struct wmi_channel channel_list[1];
> -} __packed;
> -
>   #define WMI_MAX_DEBUG_MESG (sizeof(u32) * 32)
>   
>   struct wmi_debug_mesg_event {
> 

