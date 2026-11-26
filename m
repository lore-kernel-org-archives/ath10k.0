Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66489606A31C
	for <ath10k@archiver.kernel.org>; Thu, 26 Nov 2026 08:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HKdKp/V9;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B9Y1lsMK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i+6APTHV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2hMqRpK1MgAk6PiKz4K8A/o73UtnqzeUiIYqjDgbKrk=; b=HKdKp/V9iYsZsS
	tsLLZ2045wyn//2INE89Gnur3TDJ5pjvOH65DbiegsT/G80Xd6MW7PAui86768Q4H3Sl7bWRiN7NY
	7bLX6Nni/H3gTfiXYqy4aLp/5AaxX4WGJ438t+1BX6YPUGlElCM7K18AGw0SL8EZG9/yOB/rfmI3G
	EAGp9GEcqq1VEmUcZSXFW+hZt4+N4JJXJwxWDGQPtxfILiAdzJ7488Yc2SCcrby5lFF/xh+81Tlbn
	GrLwzhPqX8siTp91Ip5vzEFY6fJaKUFg5//s3KMqvJRsRS0YLdqfZmHi9nh0s2Lbp+/qj67KvYxmz
	Pm4xVZl63uNptCq0xOJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUee-0000000CMXW-3DzT;
	Thu, 26 Nov 2026 08:16:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUec-0000000CMWd-27BQ
	for ath10k@lists.infradead.org;
	Thu, 26 Nov 2026 08:16:32 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B8ex919534
	for <ath10k@lists.infradead.org>; Thu, 26 Nov 2026 08:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2hMqRpK1MgAk6PiKz4K8A/o73UtnqzeUiIYqjDgbKrk=; b=B9Y1lsMKHwnmyDqV
	Qocphua3FpMjdRo3xNMKZbL5Df9gZ+Zlo6R3IwOAxBszc/Mu2lH60OagkIzpsoFa
	Ay72Rvv4fvpENox6mW8KaETEcGg7bjpMMc9bue9Nt37A+r2tBHL2Xoy4gqHzzxzT
	J0qJFpuE08d1NmgqkUGcUGUU5KN9vKLPXYNrAj3yFCfsGyCI/Gdnf1C8r5hAV4ld
	aXrzVzoLitLT75NsXG/6QYVc8RJenjq/GFhqD9bvTIwB1k/doBQDM5Vgr5IPnMYY
	rVaieTzvNYI4Wn+0+ajvv8Nl0I5IvyqUvNqVCc4oj2NbW9wboYaPuGqT7BDtJmVv
	9bV9Cw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y23y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 26 Nov 2026 08:16:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so5339940a91.1
        for <ath10k@lists.infradead.org>; Thu, 26 Nov 2026 00:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795680988; x=1796285788; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2hMqRpK1MgAk6PiKz4K8A/o73UtnqzeUiIYqjDgbKrk=;
        b=i+6APTHVj3PFWNOd1ZOjsxZAY84LtsKa2pCqy8/sj16ZdOhiLcXZfYdcDSVXNCn0FP
         tgmycP2VIFUolbg0WFJ8i/IcgirWpXyUfxM5z8Up3bzjmMQH9RjjSzzyXpAMzcg9ODJu
         nAo43mkV8Vot/afmqLTsIuP0OTfxSbJS3nTk6I4igV/tkMmpbyR9lbxi65tTPTmh+apn
         MD4yZ0neTen+XksJsn7a+1JDio1g6Y9wGLaQhBtWw+EcRxEEXEq80ZSYOYSs12Xpstdn
         Rgu82S4f88xpqzKrm2kS5pZnPTJqb0YlBnNEc7xrVuWTqNltC3R23BmTNHAGyCZK+7YY
         OrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795680988; x=1796285788;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2hMqRpK1MgAk6PiKz4K8A/o73UtnqzeUiIYqjDgbKrk=;
        b=IHHvAwUfiByrTAGGvvI/PnltX2GH+2wvRlMV4U1R15jEK5/VbROUk7GUFA1h0Bjcvz
         OaZIUIMJhSKpxP4IHrENzVGxor+1UvCUs8IgZ/1nZD++6/1o7UiWfRflraIoR4wy6kLt
         8EltPzboHtp0sfIieyBEutneNB5IvChAyYbdPEJLomXblxA9uzlYa5dr561lLg88/uoj
         rz33/C8ytDE84YTq7R+xmxh8gNAofpP25LUx1tZRN1hHduBMbiH3fZneZfdgRD2bfaMu
         I+xp4+MYzhslf/fcC0vgMaArBOtjuLGGNuDHYSCzMo9cutIlXtcBpSa+Z67XYUV7zIR2
         lw+g==
X-Forwarded-Encrypted: i=1; AL+hErF2kKlvkgXhNnteqUllBOBo8lF9fx4qcFvKOMYXum9DaR6/pki1vhTfUTjJ9hnzeqoz6EpG+iA=@lists.infradead.org
X-Gm-Message-State: APuU4Z+rUdV4EP21waGxfwc3gzevwQaoPsNQYX50ECfdEcpFG/6o+krn
	sOUZmUHDPIF9wARwl4CuhhPN8ftKIurrW7b2vn0GIYWER9wJ8fkRy6/i2n11k5aW6rpXIrljW8G
	D9yHQjVsWfJ/1wFlQwMez44rs4fezRXJvHaMgafbtnIFT/TdlF5lQl/0uLupoxo1O
X-Gm-Gg: AZFdTZd4LvkFOrLEJ3s1rgV1Mh7sM3zWj735JvLKYtwUD+FqCQF3ZcwkkgGqvvWmiYp
	8GL61pOfptv+bxLpDisCInZisPBAkimUFLVGK/lZZ3GgDmpagvsdNtqhN5VQATrdqTviPeCQaJf
	KxVt3gvF3YM4kC29V5nS/MRTAquaHLwbyN0HEffKtwthlX9D6aEMWMuMdEKGqVzBhLoGYTACJme
	SFkWPgPXGTyAnJMzskXyxFzFIZR/B5xdA+4i/Dda45sJLNfdIiQO2W+/KPo958UQrYz7PAvQEma
	g2+kw9mq2m3wMrtg2ogBKd1ldNUmh0YcVunUwKjvgHjcw49QiNvgPQXuei2+jyb5d/QGGC5omtW
	3iQEQaKRh6MbJUl8z/w+/Zw/A6uq07HFqKs4aM49lIHumHoGjBnGBoQPE4I3Qebb9k1LUgiJNXo
	pgoe1j
X-Received: by 2002:a17:90a:c10e:b0:3b0:ada3:b505 with SMTP id 98e67ed59e1d1-3b41c8fe1d6mr20875752a91.19.1795680988394;
        Thu, 26 Nov 2026 00:16:28 -0800 (PST)
X-Received: by 2002:a17:90a:c10e:b0:3b0:ada3:b505 with SMTP id 98e67ed59e1d1-3b41c8fe1d6mr20875722a91.19.1795680987817;
        Thu, 26 Nov 2026 00:16:27 -0800 (PST)
Received: from [10.239.104.253] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4dfbe54a2sm10713182a91.17.2026.11.26.00.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:16:27 -0800 (PST)
Message-ID: <5e83a95f-72fc-4a5c-877a-9238f76df192@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:16:23 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 01/10] wifi: ath10k: fix SDIO aux workqueue
 starvation in recovery detection
To: Kang Yang <kang.yang@oss.qualcomm.com>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com>
 <20261120-recovery-v4-v4-1-53d6a04490e0@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261120-recovery-v4-v4-1-53d6a04490e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMSBTYWx0ZWRfX3greOOIoP+7W
 fQ3dYbaREvE5XBhoy9+VwtfmsmhyP6IulDY/p5tb5JywUbPEY2/GxyI1CcrtoUAn5YpPUDHPhLm
 K7S/g0VGpzIyTOYRa6/BGH7HoJGanX4xoepsGp9kF2pK1266mi4noHJOfzkzr0yZQwGYIQxQuXH
 +OlaxcOZFeiNQM+qh9oe9RF+y/e9P5XBDML4JBPL8nN1yR5ezfGb7qrFXL3vlNFkXehZk7s+2tp
 E5WYp2vsq2yTXmv9ucTI4vjWBF3OR3tV5syoDssVLdGRMdKiISARTWgFUIjxLxVWycCqcCoQgOI
 RCpFnOKEndDDe1jTaPs7sRq/gUsypKXUCVeXgTsxQLqdO4nppv/sLaUdSCbF+GpD6sPPzk0MtgD
 /fRRItgOXHIRLi6A14TjjBq6GzitnokGcOWxiAWL2XxJ0p8NALj6FknYGVEFQKavNwCjE5QgxV+
 7wp/IaOlgISm67HUBEQ==
X-Proofpoint-GUID: 79McpWtJEwS9Xokvq1jDJZ5ziaVnx0NA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMSBTYWx0ZWRfX6N5AUXapqd4A
 sJp/k6dYKEbhLLX6Y5tbZ6l8r5MFpL8W0RVPfFc33W26FJk22aSGL5HYz9B7zo/eDK7oT880pH5
 D5zCSU0iwI6v3VX/m83d32PsOqpt5mk=
X-Proofpoint-ORIG-GUID: 79McpWtJEwS9Xokvq1jDJZ5ziaVnx0NA
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b07eadd cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKR0-_iPvwzX1PQTlCgA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_001630_577948_A6E47FDB 
X-CRM114-Status: GOOD (  12.44  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/20/2026 4:41 PM, Kang Yang wrote:

> @@ -8170,9 +8177,13 @@ static void ath10k_reconfig_complete(struct ieee80211_hw *hw,
>  		ar->state = ATH10K_STATE_ON;
>  		ieee80211_wake_queues(ar->hw);
>  
> +		/* Cancel the deadline monitor first so it cannot declare the
> +		 * device wedged after recovery has completed.
> +		 */
> +		cancel_delayed_work_sync(&ar->recovery_check_work);

If recovery monitor runs between "state = ON" and the cancel. It then wedges a device that
has just recovered. The sync cancel only waits for it to finish, after which
pending_recovery is cleared while the state stays WEDGED.

would be better to move cancel_delayed_work_sync() and the pending_recovery reset in front
of the `ar->state == ATH10K_STATE_RESTARTED` check? Then either the monitor has already
run and the check fails, or it is cancelled and can no longer race with the transition to ON.

> +
>  		/* Clear recovery state. */
>  		complete(&ar->driver_recovery);
> -		atomic_set(&ar->fail_cont_count, 0);
>  		atomic_set(&ar->pending_recovery, 0);
>  
>  		if (ar->hw_params.hw_restart_disconnect) {
> 


