Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CAD606A696
	for <ath10k@archiver.kernel.org>; Thu, 26 Nov 2026 08:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3i/GPqb+;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a/CxQNFM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RXKFX8iD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xaVcPCOyezxrM0sb+d8/47Ilh9xHOyd5HbtN93BsFTE=; b=3i/GPqb+mzgNrU
	0IJAZrOgCuSkgC+B7/hOwUUHslB939Uiywklymk9ySKehAPybj+TDN/gbZkO+BjBIXPgw83O8NuUT
	BVuCTu6QpYQ0fy/VBqsIjlkWf9WbvcuRg+HNA4vvLBBMmJxfcaWujDO5WQLcfP0cWtJmMDK98vj/D
	l36COW2xi8DwuHC0Bpfs/sa8E0XTxuhiQ0CTHspgOX+2XbjkZt1ZnxV+KRoZur/QNs9pRdFmno1yv
	qsP3BAMZNAHJyxoIVPNhmANogLt3+2h3iR1CwfoOM19+q6toQgDAnPJAANyvOCW9RcM8WympH3cFt
	9NBZ2iq0xwUnYWGvRI3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUil-0000000CMzm-38g5;
	Thu, 26 Nov 2026 08:20:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUii-0000000CMzA-3GEk
	for ath10k@lists.infradead.org;
	Thu, 26 Nov 2026 08:20:46 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B2vo2210735
	for <ath10k@lists.infradead.org>; Thu, 26 Nov 2026 08:20:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xaVcPCOyezxrM0sb+d8/47Ilh9xHOyd5HbtN93BsFTE=; b=a/CxQNFMriG9cGh0
	Uwrg1wb5SzG56ytKBsTmjizu7ksS/1Q0T4kwwJuAvd1obBh4CqTyVyYl1yZPcjZ1
	BGB0bbqCxYk5QEKY//XiJnzI+1COdtXkgoUqQ/njF/HxIimIG5QDWJoJ1oLHoJO5
	CjJmrh/Dau9D8pyz9SEIj1u2dXn3HJr8DSAf5lpRgOewV4Y/Ax8kdQggjZBQFPDn
	NgUIj3UFJVb5X5KitfSBdn07EYxbK8LZmUyKnJKsvAcPHyvIjtPA4Y/mNSIF78u2
	Szoy3udyy6VCumDjFWnlADcZK9aXLG/ihbcV+iJvRMJemHa2uTYw8Vv6Pn7w9pki
	1SAtlQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfa0bt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 26 Nov 2026 08:20:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so6475704a91.0
        for <ath10k@lists.infradead.org>; Thu, 26 Nov 2026 00:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795681242; x=1796286042; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xaVcPCOyezxrM0sb+d8/47Ilh9xHOyd5HbtN93BsFTE=;
        b=RXKFX8iDlVtVpOD7RI7gWMHG8nphBNM8dLaMDog1V4gvH5aoWLVe9AUsUa5B7Qqtr0
         2j8fEYqySKi9vhXWZ7P6DfSlHv+OV6bpspaAkqcuymyxXUMfpLTKIS+BpAhTTsOOYeUt
         2FzrlEKHJsLY72Xxi7Pbv7rpCDtV5IGP85cjSA8iMw1cVIFcVWfug36PzN3n2zLSHBhJ
         9YYM78NjLFu0fixLxsyuhHkconoQz7T87noA7pNlIykAcdOjmUev2sHyQxN51t2NjCHW
         TN5Z9H22VtUeRa1uSj2tFMGyuX/Q0V/Ydzyo5wOAtpmnjrKvGclSUSq0aQ7NG7SoOyyJ
         U6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681242; x=1796286042;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xaVcPCOyezxrM0sb+d8/47Ilh9xHOyd5HbtN93BsFTE=;
        b=GsDpX+gQNsJT8zUuB4Hr1MYT7Rlry1pvDH+uWpOlN5B+FyZrtw0hAP4rthe7Ta1Wgr
         JTS3x2j1CDotNcajrsPXeMLHu2nwtoddYp6tDYIBQY8Fur1LdStt0fLa1EIsChbvK6/x
         dJUDFI4pAc7U3CpDEc2aL5jtd3wfvmosRiw+VQyMfdkqrp87wrIv1ppwQcBgLNm8GEYH
         r/jdHMKwwSwTfpWUKZC9GdOrhhXHc05p4sETs/aZ2SJIrSba0JGZJE+4eu8XupKh9rS8
         nuwXJcq55p8A6bkxvw8QWuKP9d/0jX8Li53Qg06aaKjmZ1GmzSCGKQUtMmTZm1CclNOV
         M2lw==
X-Forwarded-Encrypted: i=1; AL+hErEwc9Mq0kE8xOdjKr2T22cfRikOxu0VhYa3sA0xaBvayJUrl3bbHXalmhdzZ1jJS/cExv0BAkg=@lists.infradead.org
X-Gm-Message-State: APuU4Z/gH9QV/Oc6HXUkqacgK+XDvYp967DNJLwN7Dg34D6pDoIqHXo6
	YIarUIc8OwW4x2WFOut6rcvYyKRop9Me0Uyhcs0hh3iXlZMy0BM6JAMje07R+HWGbOFqMaF6Fix
	yMf+XTP1DPz53Imlm8mHXkpE5BW3P4t0bmpa/E11DJgcXiHFtTSB38WuBONjYDPgs
X-Gm-Gg: AZFdTZfIZSU/sO6jlj3tuMNQsXrV9Mmimvx77Xre0+rOpPNB6JgAEcQrRoNkBwGvyu9
	38VXmFdo6wzVZK3Y/tqeDdA0jGufekyLS25U+Ew/rcscqXnayjg0OEzkuhXNjUomxfPME1L38Di
	WcmifFr0fJM0jFaaKJOFSxa0st7aaQWPAdjBHaV8SUgOHY7Ca+1ghXRezGqIE9hq7APG/KxUGA+
	BR30AzvGHTuI2mJhmSgTeoUxXqKge46cRse7ISxZAaygaBoquYf9VOcj7kjgNKqCV6YqKjs/gqL
	DkgRgRRw3Spt1ZrdnV8LqcPgcDu4HU0bVRszNE7e51i+kbvOXNS0qCDFW75+x1Jnxc4/I+RRckx
	MnpPs9KVyQB9GUpSdNQfmVgEAho/V/FR1tSPgDwEB7d6i09xmJ38qSsng8wzfKKRFc33ocRnLl8
	ZFicug
X-Received: by 2002:a17:90b:390b:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b41c56f34amr13137423a91.0.1795681242333;
        Thu, 26 Nov 2026 00:20:42 -0800 (PST)
X-Received: by 2002:a17:90b:390b:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b41c56f34amr13137407a91.0.1795681241797;
        Thu, 26 Nov 2026 00:20:41 -0800 (PST)
Received: from [10.239.104.253] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm34518094a91.15.2026.11.26.00.20.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:20:41 -0800 (PST)
Message-ID: <187a8ba4-3c90-4fd8-80a4-6d2994786f0a@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:20:37 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 08/10] wifi: ath10k: trigger recovery on
 corrupted HTC bundle lookahead
To: Kang Yang <kang.yang@oss.qualcomm.com>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
 <20261120-recovery-v4-v4-8-53d6a04490e0@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261120-recovery-v4-v4-8-53d6a04490e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wmJV2FSXuA7oOAfF6zl5GhqGW9Atste4
X-Proofpoint-GUID: wmJV2FSXuA7oOAfF6zl5GhqGW9Atste4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMSBTYWx0ZWRfX72N7djgHzGpP
 r0U911NVj1rLEeT4dKZJRWtWC+XOVqs/IWoix5WMU7PtmG8MaF3JOxYAHjAxe0OudnfW1otozI3
 tm4a6LsDJs7fxNxGWHQg2sXq3aOOkSM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMSBTYWx0ZWRfXyUB3M6lOWcMN
 SkvXcY6+6fkbmle9S+TaAmgC1SCotXRp0JGRtynxDe5t/SfHo+7f0au6tZ/MJlf0aQITUB2SoBP
 7FwViXLNtkkMwXJ+BlydKfujYVJ1DJJG/qQSg1628sA97Sn003aTgKaoeAR+WjMZuITt1BeR71L
 AZ9zfz4bbgxEZcDso0COaqDs+QWvMlaOhH8B3ihlYVAlV2xFTWuOcUsipIwbN2zucPkndvkUncL
 Ii3S52HqEUmbk7mkQCnNIsactOypVj/fOrNsC2PBqIiyvrczV65osDeokmCsMjpK0OrpxOWcujy
 okju1iwLKJHmhkrcXB7OXb74d3VQiNvvqKOY3PULg1XN6kJb0CRezFkfaL+aILeLH2xWPMdOXCX
 H6KJmPWtmW6PRI59mMRHNj54Qapa/bgnbZLWTTjb84zeAIqupoULGYoZ9JEsCMhhYcsVGmq5wD4
 TW6DBdRRazIC+uxUOMQ==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b07ebdb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ZdyoNSFhri5ofBwUGgcA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_002044_947611_2552E5F0 
X-CRM114-Status: GOOD (  22.58  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/20/2026 4:41 PM, Kang Yang wrote:
> When firmware crashes, the SDIO interrupt handler may read a
> corrupted RX lookahead whose header reports more messages than
> ar->htc.max_msgs_per_htc_bundle. The driver then prints errors such
> as:
> 
>   HTC bundle length 2322 exceeds maximum 32
>   failed to allocate a bundle: -12
>   failed to get pending recv messages: -12
>   failed to process pending SDIO interrupts: -12
> 
> The handler returns -ENOMEM without consuming the mailbox lookahead
> or checking the firmware-crash CPU interrupt. The SDIO interrupt
> therefore remains asserted and ath10k_sdio_irq_handler() repeatedly
> processes the same invalid lookahead.
> 
> Stress-test logs show that this interrupt storm can continue for
> 15 to 20 seconds before the firmware watchdog allows the crash
> interrupt to be observed and recovery to start. RX remains stalled
> and user traffic times out during this interval.
> 
> ath10k_sdio_mbox_rx_alloc() already triggers recovery when the
> lookahead payload length exceeds ATH10K_HTC_MBOX_MAX_PAYLOAD_LENGTH.
> A bundle count above max_msgs_per_htc_bundle is the same class of
> corrupted lookahead.
> 
> Start recovery as soon as the invalid bundle count is detected so the
> HIF is reinitialized instead of waiting for the firmware watchdog.
> ath10k_core_start_recovery() does nothing when a recovery is already
> pending, which would leave the interrupt storm running, so also mask
> the target interrupts.
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
> 
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/sdio.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
> index 748ba6749339..fdf19ce4b55b 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -497,6 +497,8 @@ static int ath10k_sdio_mbox_rx_process_packets(struct ath10k *ar,
>  	return ret;
>  }
>  
> +static int ath10k_sdio_disable_intrs(struct ath10k *ar);
> +
>  static int ath10k_sdio_mbox_alloc_bundle(struct ath10k *ar,
>  					 struct ath10k_sdio_rx_data *rx_pkts,
>  					 struct ath10k_htc_hdr *htc_hdr,
> @@ -513,6 +515,11 @@ static int ath10k_sdio_mbox_alloc_bundle(struct ath10k *ar,
>  			    "HTC bundle length %u exceeds maximum %u\n",
>  			    le16_to_cpu(htc_hdr->len),
>  			    max_msgs);
> +		ath10k_core_start_recovery(ar);
> +		/* Recovery is a no-op if already pending, so also mask the
> +		 * target interrupts to stop the IRQ storm.
> +		 */

bad block comment style, please check all such instances in this series

> +		ath10k_sdio_disable_intrs(ar);
>  		return -ENOMEM;
>  	}
>  
> 


