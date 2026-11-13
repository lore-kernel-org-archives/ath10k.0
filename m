Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F237606A33A
	for <ath10k@archiver.kernel.org>; Fri, 13 Nov 2026 08:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I69wqmCA;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IJkwIpow;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VWVKln3+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AMALuKXYYeOHhrt6J1xAtR0yTwRAkt3HFPpuKTAqGR4=; b=I69wqmCAm5MH6e
	QSv+JBjzCUZCckh3dqc1KriRVsJpJFSsLTYNXngXRvtQeAqxzYl8nJEiuNmtHvc1qcNJngTi4u+Ah
	2TqP56Q/g0eDYaeBk0CBDtewt/pGGbhsovJCVRZufvhST91Azwjv4NvfripD2sASleQCYSWy7KsFZ
	Zd+iSHSCqikBaSwj7y4VDNnXzMFtmKRKV6gsBsHAWTqENJcX0C2TdIeM8bhWxNvRylSQRPzPLV3uK
	YUdcwFL3v7uKOknF+27CZgigNrZyQT6VntLtIrNn8YN6ReX0+lz/UZ9saun3fSvtDMccFqSaT6hjD
	zgRHR25NwLh0fIgoRqTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmzk-0000000C9Qg-4BsT;
	Fri, 13 Nov 2026 08:50:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmzg-0000000C9Pd-1BRl
	for ath10k@lists.infradead.org;
	Fri, 13 Nov 2026 08:50:50 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VA2m074791
	for <ath10k@lists.infradead.org>; Fri, 13 Nov 2026 08:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AMALuKXYYeOHhrt6J1xAtR0yTwRAkt3HFPpuKTAqGR4=; b=IJkwIpow9ogfW2fQ
	m3W35OepDyE2IeMAUlBf8ddxQ4b3vqu7LR6Tv8iVitU5xIPaC5Dwry3rLcQJAz9o
	b64qjlUPvfqpFJ2tgkbpf7xWzznxNzINa2BOUylA1zVRZQIEteo8kVShgsQ1bCqi
	xe4L9XU8YaJAfXME6vaQQqdgBy/eKknTC/ZIb5/0mlVMLAOi289HWavCiFalOYZR
	czkPVWOEzzJVff7MCqBUfUBDTRWAng+RwLSNyUO9fA3FFENOLnb9VGXeopvvnZSB
	lJuKNSb1ZAWcVTYUbVh1j8jnyYGjjJkAe/UhsTBJ99eKP4/v5HrqoEH0xfvzzJAM
	N2IYYw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufhk0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 13 Nov 2026 08:50:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f322ef7d3so170349985a.0
        for <ath10k@lists.infradead.org>; Fri, 13 Nov 2026 00:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794559847; x=1795164647; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMALuKXYYeOHhrt6J1xAtR0yTwRAkt3HFPpuKTAqGR4=;
        b=VWVKln3+cIgBIUJVL+1//tM58+Gt1cK4MYPMdT7uh7V8V3CSZUd8XP/BFYVUdvxV4d
         nKKKJLKkKk0y4yJx0Vm4pNHFLEPoR0BfFHcXdp5YH/6VTNDytrCrS/SoiPQpJ+I9w3MW
         j6P7e4+k7aIw/ePfIwfvxJ5hsjSEKPmt0AKNDtJTeKU8EUpLLr901fMOsVhhvzRCSg7D
         L8w0b2bZm6xQ/I8kWixA5nujUEdCnvk7EASKpqNcKDYjHC4wrZ411bdeG5MDB4iVXXYt
         8vkHFsKJjQ6KBmjwaeYZJTSqXvOHYRvYbsjOae6P/KrfCQtTohMfrLlPIdQli2H5IaPn
         Hgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559847; x=1795164647;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMALuKXYYeOHhrt6J1xAtR0yTwRAkt3HFPpuKTAqGR4=;
        b=yZhPm9SsnQ6yvc40wMXsRi0YsTIMrMHI/Uo7F/p6rdaWPBFE+SQPFQLmD5Tk19ibxs
         9zvX9DZ1C4fgLnowF5WO7pv+Vfv7+tVFZtFqcRVRemtbsT1epLt9R7YUFX9koOffsCB7
         bfEKAK9XaA/g46rBoXWhyshNayaaE28/s49iQYjVrKmfxEEs0XJtn+yGpTllhoQCMhic
         R2g21Jj7t2BPHR7UArSl03BY9z6UMjhF3COmj5CliT87PlicDbZTR8tCf3fSohkDNJCd
         +0304O0MW6qQyb7zkWNDty2r5bVPCj3os/5VAUFJdjkqxldbe+qD0CTl5gIk6IaZnW17
         yhqg==
X-Forwarded-Encrypted: i=1; AL+hErHZX69NYEcm8ThS5tczGGqPJlETLo8U4xhzAKkoTv78nEMtLfeQ+j7bdAW+WT1NtobExYStQis=@lists.infradead.org
X-Gm-Message-State: APuU4Z8oh7RYnWjXyOUEh1L2h6IbmNhPfq1ugla7NyQ3ngsNx7rbIj+F
	YdLVuWa2QHbWlkUSB2q/LmUVkrPhTGD8hyqU6lba8Wt0EYF9ruii5E3BhPeiF88ZroyfVh/yTyG
	fZDEk6a1W6sd4kOsHKseDmAmd0XxYtHrvny/kUgifzWA/uWafaJpza4diQNPniLa3
X-Gm-Gg: AYBFou07/6HAux7kvpuhwRaFz5bOhmjFQkw7EL5DeNhZLxxgZ9hcG09aIrllfunPy8b
	rS9S7y8kF4khdD8Gu37e6wV64BYXPk2U6lkxnGbQD7pgbuRcLlDaMXUhwO5jL5SLDRDLR+Fues4
	3Dy9EqHsy8HRd3f8iFjLXm6dPkE8iUQ5ECzNhO9z7bf4KXer7vLoUbGQ7lUnFgNk9eHJENyTofA
	2fUkWQdBM+QC097MmxhSezVfuMKWr+zXYq5BbxYZMA/35ST+g5pfasUPxhIZy5gMjUlmcdtItnQ
	g7gZtLU9aGegP3QqY5sFIvSWYV5xRB7dwH/YMjZgdFJqgY3+ZhbaAdjhWnfXCkhrG39BWKsVU0G
	i409MocnELZBRjTxAHipiEw/7Bbaap7PEeBx1KfiibKYhxqpP/TTWMy75YQZ5v5ZyVsTUDMx6W1
	FN7os4aYmhQ16i4GQkOLFlLAwdwGb81qm+Iwg5y1G8Q3XzQ5JBuewlgpjoQybYXSzHknCwqdcKr
	CUtKv6ncAfdKZj69QatWH2R71trYHO7/ByF7h1ls7ZbdpJlIw==
X-Received: by 2002:a05:620a:458a:b0:93e:ee21:70ec with SMTP id af79cd13be357-9494bd1c166mr307094785a.80.1794559846535;
        Fri, 13 Nov 2026 00:50:46 -0800 (PST)
X-Received: by 2002:a05:620a:458a:b0:93e:ee21:70ec with SMTP id af79cd13be357-9494bd1c166mr307092785a.80.1794559846074;
        Fri, 13 Nov 2026 00:50:46 -0800 (PST)
Received: from [192.168.1.17] (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb566cec2esm28891835e9.1.2026.11.13.00.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 00:50:45 -0800 (PST)
Message-ID: <9a9a6139-2a0c-4166-a17a-b4fc6eee75e7@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 09:50:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath10k: add USB device ID for Atheros QCA9377-7
To: Tomas Paukrt <tomaspaukrt@email.cz>, ath10k@lists.infradead.org,
        jeff.johnson@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
References: <5Jj.Zbdh.4ausKfY}jbL.1csLRX@seznam.cz>
Content-Language: fr
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
In-Reply-To: <5Jj.Zbdh.4ausKfY}jbL.1csLRX@seznam.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2sQ4-6mURlpUAhkGQ67c1WGhcyP6YHpA
X-Proofpoint-ORIG-GUID: 2sQ4-6mURlpUAhkGQ67c1WGhcyP6YHpA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfX0XakaDTqd/wu
 MClKb0vQ7EQ766WU4pkZFSD6+wGiCyFE1M/bNMSieVJgJ+cxUn27LMoB4L/3a5egXAxZzVDN5uJ
 zLEoAGxHXvX6zyS1+AfDRfXqgGTQUHm99QtHUzaMOs0q06Lv9ovrvilY/+SsEEMBWaR+DUeaTh7
 dKKINTyFOHGoaQgx+IfZsvebaaoq6WUvYKlIdZLQjegv3SOuuuig5vOmHC3HjnyURuCWaZxrjmU
 VEHzsNiujHm8WxhgRmmf2QORVedkv3MIMeIAKHSW6EFIOeyVR5yupoLYcH8j381E9W96uP8ANz4
 /FDH/S6rIHEBX8aTC9bmByqKO2sLauzWuWCOZyCEL0yShrP5sOjCidGkJ+Wx5MHOtWVqCdMcfkS
 NdrHIiIlQCbAKA7UTqlIEjIn2yFlcQUj+BLlsoI5yaLRMEU+wgqFZxJFGtqM/xPXWOK7qplFcDJ
 YXABghiABFe2OMiZKAQ==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6cf67 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=gxwPz3L0vLWTIjLkPhMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNSBTYWx0ZWRfXwfB8ep6A1+I+
 MCtAXWnDeFNhovCN0WBkbg4ijLaTOMN5VgEMX7fiF5U2d2hF4VhAbq+Fn2YQmLHmTY/Q6yBeDUb
 ukfs8J7lcEJvgb+qmininJSWA1HPG0I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_005048_361945_CE1BC749 
X-CRM114-Status: GOOD (  15.25  )
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



Le 05/09/2024 à 08:59, Tomas Paukrt a écrit :
> Add USB device ID for modules based of Atheros QCA9377-7 chipset like
> 8devices BLUE bean or SparkLAN WUBQ-159ACN.
> 
> Tested-on: QCA9377 hw1.1 USB 0.0.0.111
> 
> Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>

The VID/PID matches QCA9377 (WiFi5 - 80211.ac)

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>   drivers/net/wireless/ath/ath10k/usb.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/ath/ath10k/usb.c
> index 3b51b7f..60441ff 100644
> --- a/drivers/net/wireless/ath/ath10k/usb.c
> +++ b/drivers/net/wireless/ath/ath10k/usb.c
> @@ -1106,6 +1106,7 @@ static int ath10k_usb_pm_resume(struct usb_interface *interface)
>   
>   /* table of devices that work with this driver */
>   static struct usb_device_id ath10k_usb_ids[] = {
> +	{USB_DEVICE(0x0cf3, 0x9378)}, /* Atheros QCA9377-7 */
>   	{USB_DEVICE(0x13b1, 0x0042)}, /* Linksys WUSB6100M */
>   	{ /* Terminating entry */ },
>   };


