Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D483606EBB2
	for <ath10k@archiver.kernel.org>; Fri, 13 Nov 2026 16:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=um1clHtV;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H+CoVCc0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W/gWpO14
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HUnXlBqyFvpu4qanRZyKH/ebVH02DO8XkAFnnlXJUyg=; b=um1clHtVvoT7Iq
	ViH1L646kUkJ2ajTNJQAWfbImtSI3nU73FPh0VjqLKct+SUnLUiDTk4Lzqj3qTZ5SgtMXxRmw3Itv
	DC1Bzbh7rkuy7+Jgyk14500y7mROrwbsfHfkHF5eTeR2bf4F1+q5c4WmUQMBJW+jSnHZpJGvZG+JX
	G8jtecTbt5uwoqtjBfZGIkMu1ExnwfCSuWBEZBjkFiCV/7Jo9iAnE2ZtlqT2qwnIte+UauY/wTEIv
	YoJAswU+Jy7T55GCiQROK0Zb/6N3TshbtgWAHgxRlMQb9A1MFYxiqCtujsGqG8MR+XmzOdFqBcQ0m
	yOIR1e/NbRdVfg5v2TDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRu0J-0000000DWtw-24HJ;
	Fri, 13 Nov 2026 16:19:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRu0G-0000000DWt5-3DdD
	for ath10k@lists.infradead.org;
	Fri, 13 Nov 2026 16:19:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR5YF737244
	for <ath10k@lists.infradead.org>; Fri, 13 Nov 2026 16:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUnXlBqyFvpu4qanRZyKH/ebVH02DO8XkAFnnlXJUyg=; b=H+CoVCc0fzXgTQG7
	NWJgbcZj1laU4Wc5tO6wF8eVFX48GlkBKQQkXexNhNaDPhq0BS8/fRhSQdkdnJtE
	CQvA4TWlWF6XcZB20SoNBxoUgVpsyCspA53Xd7bpzuN7aoUOG/KW/BqWHEloDDb2
	ytKhMQdFSS/kcA9+O/yLOT6L6Uo0JtApOc0mBbAXCJGL6Pk8DHyi0bkSIgEbK960
	Upzm4NsUoqXsBH9if/V7FlAS+KWMwey0sAF6594K+qRo5zZfcxMc4rnPkvMrkPV8
	JRYu0pJXhbT7iPC4D8n/k+Kpx1M05JGmzB8dTccw2VG0kSmSgM8C0rsk+hJBu0yE
	KkDVmg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37ja3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 13 Nov 2026 16:19:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so326949385a.2
        for <ath10k@lists.infradead.org>; Fri, 13 Nov 2026 08:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794586791; x=1795191591; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HUnXlBqyFvpu4qanRZyKH/ebVH02DO8XkAFnnlXJUyg=;
        b=W/gWpO14h0wc6SIE6CTg02QYo98pXiDqFESRGNr265M9kNc6LscT8jtRI4RZdV+AYP
         tbW6mN1UUoG4ZXregSWQFINBNMgrGcsLuMs8VZH2dQEgiZu5srUJ1fIRVg0QvaHUUTzT
         WcNPku3QJDx4ihQ1BiIDrw4Lve0+LtO4z3I/8SypiP5nUV6zezKzFX0jBZ7NqAcmGzon
         WQW8nMLkdv1oEf7oY2YSCgKCGiip1n7Wfpx8iAEZYvbOIR+9F1pkFPH/jpo0dmkEJ8qX
         UseHnphKc4xhjbH0FT8/FdoVYtOHhPSkWccWPcuftICzytcEtF/0PLJEYcFx/Xb8t/PH
         k9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586791; x=1795191591;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HUnXlBqyFvpu4qanRZyKH/ebVH02DO8XkAFnnlXJUyg=;
        b=apV/Zcc18PWS80rrA+8o7xTz1ezFEsMgBRRItLpLivGxqNX/R4WqvwrEd8tL5TjCwx
         H1la6PkUGMo+slQZM17qChOcM/xSNkNF7H1Sfa+0A3GfQPdOXqLEaSG3cq3g+j5/jRYq
         AzUDhXeghGM5q4lWBAQAKiWL0reR4x2G+uwfyo6E2FRUgIJKNETdIuPqcy81JWYNq6t5
         aBKtBXhache91LZiItDeLCAliOTJmIGZe8E6Md1rAPgTeZUm9EzG2FJbFo1CJdP5Bp+J
         O/dU858nxvSCXH7/HI+TX7u2fAFzAa6pB1K7ZpFFq8sR4O0Lwkw/b2foh7UyeolIBOTt
         pEpQ==
X-Forwarded-Encrypted: i=1; AL+hErFoJkha7GGAu+SyVfu3l6Ukw51VxjQtwCMzD/xNv93Fr6LGnk0/zrSrux/dVPA+qlDYGKwZ3BI=@lists.infradead.org
X-Gm-Message-State: APuU4Z+oQFYiFikA89ERTcJja3yxl7Jc+uy9iTDPVDbSwFMoNVHOq47Y
	ocNn7J3+0iA3CRmwR7gctjpQZd1YGxUt7HZ2VTb7zMnCRENP6OqwvAe20ajeJYxwxEX5M3tdBTq
	F5newuQ+kzZb44WFCP2nhiMRF6iPhT310AnJsZkJRM4lvT7bpzDvpXapzWUHayn2bj0ji+MXw
X-Gm-Gg: AYBFou1lKXtvfICxeaC6hOMr2MSJS4lTWQDaDjPBXjXAZHNLofZFlf75EQ95zaxKaAE
	eZt8mVJAKaWqcopxmqvQPMvt9agtDMTwsjPY8L0XRL65Wo41s3ucQ5jey2cirYQqw45kKb9BOpX
	QEIbHYnfw0dR1vz2mwvm9xXtLh2W2qXFBmEpqt7SlWzIEim47IXmcrio/5Agky+5L447n3to1G0
	8IgzvEH8wjPqgFc7aNyrrtHaEidBleVwehT8xenuZohcYOM6yzh/2S4MMz/hLGTunlyw8Ma8GmF
	qKEQl524hczXS6BDYWOJ4kUHPjmuRXaQjEastBuoqK9RhAc74uBMhmyYqXgSwa0zHY95KSF8Q94
	Ku4NJpMFS9OzGOVFFNicyzAB3/CquKIaLsa9y4z/EM8o5ddtVZisE3ExRHZopNvsSr+pn8pS9OC
	JIal9jAwBS7yKsDURIabPizIXr/pTZ6DBV+fQDAqsK2l3GmZ4xcQa3cEkvwRlNMP+EEA2GmoRb8
	k/91BtbVQP7kqIQf2LU8Wa/DMsds1uLOzAyJgDoxAZQajyjfQ==
X-Received: by 2002:a05:620a:17a2:b0:945:f5c0:a63f with SMTP id af79cd13be357-9494b9c59c6mr497082785a.5.1794586791133;
        Fri, 13 Nov 2026 08:19:51 -0800 (PST)
X-Received: by 2002:a05:620a:17a2:b0:945:f5c0:a63f with SMTP id af79cd13be357-9494b9c59c6mr497077185a.5.1794586790563;
        Fri, 13 Nov 2026 08:19:50 -0800 (PST)
Received: from [192.168.1.17] (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5b93csm117938066b.5.2026.11.13.08.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 08:19:49 -0800 (PST)
Message-ID: <097baf2a-a514-4439-88df-8519d4b13bbb@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 17:19:46 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: add hw_params for Atheros QCA9377-7
To: Tomas Paukrt <tomaspaukrt@email.cz>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <5b0.ZbQt.6HOR0C2EfXi.1csPuN@seznam.cz>
Content-Language: fr
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
In-Reply-To: <5b0.ZbQt.6HOR0C2EfXi.1csPuN@seznam.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2NSBTYWx0ZWRfXwQ3u2d9UQK9J
 YsGXQLyYmtMx+jV2qoScfYAbsMi3+hTuUCzD+2vzU0SR+uifW5mbyMUxBVfth2Hdu7UWZEA41hR
 wwX+ZcTxl/Wn/LmcFBhpJTWvuE76x8c=
X-Proofpoint-ORIG-GUID: FlplHuivxe3Ttrr8mwI6EIUeh3SegUkm
X-Proofpoint-GUID: FlplHuivxe3Ttrr8mwI6EIUeh3SegUkm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2NSBTYWx0ZWRfXw2xcgGj4MZfn
 zbgGOkfICXuONoD06qk7KJw6JcxuM6Cwe3bJI2dYwi95bpOdywauuslGw228yxfiqsXgqoTUgwt
 TfnI0qTsnfXZnwDSOnXu8x+JuXvFGeLJiQk81o9VCFPtKD2U+eB8FnLDOxMEI5HAYpeyDZ55aiG
 HmXh4brbzmvr266J8Xe6L7BIeNcWd8ThsXdo62MnjOuJuzp/e9eNHIAdejfG/SgM5YoNI2T0Ecm
 yJf9j+l0sVIi3AHUVLF4OgyEuCib8s/1J7ZZ2z6XL7HyijSs+mOt6/A0wh0F/lMQItu+svFB3qK
 RgOLuCSYg9o9QiGhGSwf6Fi267h9AR+rNJHsCPY8ZiFp7HdCw6QDmI8oooQRH+IH/oVK2hVm1pD
 u7qezusHJ0Dd6T+Lq/piyy5m1WCa0k2lJChevFptL/k+JMP11YXcQbbQjp6XN1N1iB2x8n++P5j
 ipRT9dKzAkS8oOjLdtg==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af738a7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=MnlbyKH6xQ6dLdSUnEAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_081952_921984_4AA93122 
X-CRM114-Status: GOOD (  14.39  )
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



Le 05/09/2024 à 14:03, Tomas Paukrt a écrit :
> Add hw_params for modules based on Atheros QCA9377-7 chipset like
> 8devices BLUE bean or SparkLAN WUBQ-159ACN.
> 
> Tested-on: QCA9377 hw1.1 USB 0.0.0.111
> 
> Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>

Looks good to me, this mostly match the PCI version, except for fast 
diag download whichis disabled here.

ATH10K/USB anyway experimental, so I assume it does not hurt adding this.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>   drivers/net/wireless/ath/ath10k/core.c | 42 ++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index b329428..e2ababf 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -629,6 +629,48 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>   	},
>   	{
>   		.id = QCA9377_HW_1_1_DEV_VERSION,
> +		.dev_id = 0x9378,
> +		.bus = ATH10K_BUS_USB,
> +		.name = "qca9377 hw1.1 usb",
> +		.patch_load_addr = QCA9377_HW_1_0_PATCH_LOAD_ADDR,
> +		.uart_pin = 6,
> +		.otp_exe_param = 0,
> +		.channel_counters_freq_hz = 88000,
> +		.max_probe_resp_desc_thres = 0,
> +		.cal_data_len = 8124,
> +		.fw = {
> +			.dir = QCA9377_HW_1_0_FW_DIR,
> +			.board_size = QCA9377_BOARD_DATA_SZ,
> +			.board_ext_size = QCA9377_BOARD_EXT_DATA_SZ,
> +		},
> +		.rx_desc_ops = &qca988x_rx_desc_ops,
> +		.hw_ops = &qca6174_ops,
> +		.hw_clk = qca6174_clk,
> +		.target_cpu_freq = 176000000,
> +		.decap_align_bytes = 4,
> +		.spectral_bin_discard = 0,
> +		.spectral_bin_offset = 0,
> +		.vht160_mcs_rx_highest = 0,
> +		.vht160_mcs_tx_highest = 0,
> +		.n_cipher_suites = 8,
> +		.ast_skid_limit = 0x10,
> +		.num_wds_entries = 0x20,
> +		.target_64bit = false,
> +		.rx_ring_fill_level = HTT_RX_RING_FILL_LEVEL,
> +		.shadow_reg_support = false,
> +		.rri_on_ddr = false,
> +		.hw_filter_reset_required = true,
> +		.fw_diag_ce_download = false,
> +		.credit_size_workaround = false,
> +		.tx_stats_over_pktlog = false,
> +		.dynamic_sar_support = false,
> +		.hw_restart_disconnect = false,
> +		.use_fw_tx_credits = true,
> +		.delay_unmap_buffer = false,
> +		.mcast_frame_registration = false,
> +	},
> +	{
> +		.id = QCA9377_HW_1_1_DEV_VERSION,
>   		.dev_id = QCA9377_1_0_DEVICE_ID,
>   		.bus = ATH10K_BUS_SDIO,
>   		.name = "qca9377 hw1.1 sdio",


