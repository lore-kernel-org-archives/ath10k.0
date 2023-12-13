Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A24BC4332F
	for <ath10k@archiver.kernel.org>; Wed, 13 Dec 2023 20:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98lukoNBw6fhWNDa2SxpMcydjo1sjKiYLT9wVXM3PxE=; b=i5SEohDAbEF1mms51Xv+nO/hud
	lktmWA6sBW+fNL3OQOAaCrqKg3rgGDjnAFsb+N35BZ9/+HW+bJzzFejYgCwzmBFxuJ7CNZfBmgbTd
	splNQAqmXBMKaiytdwQ2jj3ydu5JmXXR13usNWdkmz/UJear9JiAn4QqjAoZqR5JdPUVxh057iOFX
	uO6HP/ibPzVgMLN97qogcIrkMyb6/0WOJ+WfCDMyl4hwuXIh2Z6qhi5JAa1FatW6pG62kv15eWU4H
	W9vjyPcs4u35Y9RXGiYRpWN7InSxfYB1JkHVFTJT82kUqlqDVzLLScGD+MgI1vIwtiSmgmuGs4Psx
	4dnptoYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDVhu-00Fx2u-2u;
	Wed, 13 Dec 2023 20:19:50 +0000
Received: from omta36.uswest2.a.cloudfilter.net ([35.89.44.35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDVhr-00Fx25-3A
	for ath10k@lists.infradead.org;
	Wed, 13 Dec 2023 20:19:49 +0000
Received: from eig-obgw-6003a.ext.cloudfilter.net ([10.0.30.151])
	by cmsmtp with ESMTPS
	id DSfirWqoxhqFdDVhprzB0A; Wed, 13 Dec 2023 20:19:45 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id DVhorCb0hAKScDVhorHCHR; Wed, 13 Dec 2023 20:19:44 +0000
X-Authority-Analysis: v=2.4 cv=N6w6qkxB c=1 sm=1 tr=0 ts=657a11e0
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=WzbPXH4gqzPVN0x6HrNMNA==:17
 a=OWjo9vPv0XrRhIrVQ50Ab3nP57M=:19 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19
 a=IkcTkHD0fZMA:10 a=e2cXIFwxEfEA:10 a=wYkD_t78qR0A:10 a=VwQbUJbxAAAA:8
 a=_Wotqz80AAAA:8 a=COk6AnOGAAAA:8 a=1Esk1x17uEsZNe3dHhQA:9 a=QEXdDO2ut3YA:10
 a=phs4urI-Bf8A:10 a=AjGcO6oz07-iQ99wixmX:22 a=buJP51TR1BpY-zbLSsyS:22
 a=TjNXssC_j7lpFel5tvFf:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=98lukoNBw6fhWNDa2SxpMcydjo1sjKiYLT9wVXM3PxE=; b=tm6zPjg1Djc4DWouBDS8NxqlFl
	+MTPv0p8Ypf3qJyaUufJApz7iOB3u+VyBzoojFmt/Tfrikqe6Ira0WeJ9Zv3w16hPDVHuXyNzsEbR
	/j3+nbLr2zsgDph8Cjo6kfEfr8qaRgrz8rvZn/92qiSWVvMqqNYp8QmaNceHD4BpBhDCOT6SvIkNH
	kHQac7WZsHpalfetvivcbjDJWK2x16vtBmFEGzpt0gvSU0pyG+ylxEEMX50Vt6TATJoncz9ylhAfW
	mrYrB0trAeJcxi/9VF1KlDzLrh1Ul4kI9HHMoL3zagfUAWIcDkNYfTWTSgIR27JLDgsCG2MijIivk
	k/bJv5WA==;
Received: from 187-162-21-192.static.axtel.net ([187.162.21.192]:36860 helo=[192.168.15.10])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <gustavo@embeddedor.com>)
	id 1rDVhn-003Rqk-2r;
	Wed, 13 Dec 2023 14:19:43 -0600
Message-ID: <a015d185-ece0-4608-821d-061d1296d4e7@embeddedor.com>
Date: Wed, 13 Dec 2023 14:19:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] wifi: ath10k: use flexible array in struct
 wmi_tdls_peer_capabilities
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231213-wmi_host_mem_chunks_flexarray-v1-0-92922d92fa2c@quicinc.com>
 <20231213-wmi_host_mem_chunks_flexarray-v1-5-92922d92fa2c@quicinc.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <20231213-wmi_host_mem_chunks_flexarray-v1-5-92922d92fa2c@quicinc.com>
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
X-Exim-ID: 1rDVhn-003Rqk-2r
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-21-192.static.axtel.net ([192.168.15.10]) [187.162.21.192]:36860
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 27
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGTerYACd4LRIA58qUGM5sQC6qIjAaI6MNcut4Xkr38LCv1soJAL3VPPTFkhGRfj+6SEmrS3CVpY+8VorEM5dLSd4CkzK467A/QveHgKtVWT4MR6MUay
 q0qm9r9FtmopsIlLQPaaDGtLraOYvismV+2NU1TDKkgEx2hPWiBQ4PHNsjTLU5/tAMg8xIvdiyXeu0MZoXoa85gSUaqbdy9NMlLH5Sc9oC2eIFVjccMasIJ8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_121948_040597_67E380F6 
X-CRM114-Status: GOOD (  16.22  )
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
> Currently struct wmi_tdls_peer_capabilities defines:
> 	struct wmi_channel peer_chan_list[1];
> 
> Per the guidance in [1] this should be a flexible array, and at one
> point Gustavo was trying to fix this [2], but had questions about the
> correct behavior when the associated peer_chan_len is 0.
> 
> I have been unable to determine if firmware requires that at least one
> record be present even if peer_chan_len is 0. But since that is the
> current behavior, follow the example from [3] and replace the
> one-element array with a union that contains both a flexible array and
> a single instance of the array element. This results in a struct that
> has the same footprint as the original, so no other driver changes are
> required.
> 
> No functional changes, compile tested only.
> 
> [1] https://docs.kernel.org/process/deprecated.html#zero-length-and-one-element-arrays
> [2] https://lore.kernel.org/linux-wireless/626ae2e7-66f8-423b-b17f-e75c1a6d29b3@embeddedor.com/
> [3] https://lore.kernel.org/linux-wireless/202308301529.AC90A9EF98@keescook/
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
--
Gustavo

> ---
>   drivers/net/wireless/ath/ath10k/wmi.h | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.h b/drivers/net/wireless/ath/ath10k/wmi.h
> index e16410e348ca..b64b6e214bae 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.h
> +++ b/drivers/net/wireless/ath/ath10k/wmi.h
> @@ -7162,7 +7162,13 @@ struct wmi_tdls_peer_capabilities {
>   	__le32 is_peer_responder;
>   	__le32 pref_offchan_num;
>   	__le32 pref_offchan_bw;
> -	struct wmi_channel peer_chan_list[1];
> +	union {
> +		/* to match legacy implementation allocate room for
> +		 * at least one record even if peer_chan_len is 0
> +		 */
> +		struct wmi_channel peer_chan_min_allocation;
> +		DECLARE_FLEX_ARRAY(struct wmi_channel, peer_chan_list);
> +	};
>   } __packed;
>   
>   struct wmi_10_4_tdls_peer_update_cmd {
> 

