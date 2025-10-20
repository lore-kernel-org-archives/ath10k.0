Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CE8CCD1A5
	for <ath10k@archiver.kernel.org>; Mon, 20 Oct 2025 19:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yzMuFEKLkLg4cUyPzJ8L8XlJRjRXyriI3UI6ZizNKkU=; b=zO9HCAFHP3A1ABy9JLQem3n2+7
	sysczC4Gq1UPncKUmzDq3YiGyF0UznNFZoHpqzvjk1MBaMi8LMAZacQwHDGqYPUqbOe9qJnyUYoV3
	BE39Pd7ZRHF6LCRagSLEc+AwzKvWxXrZnX2uiRqA9PvAsAJtD1qGvforMQOPEN9Oe/nt7Ez2weRmc
	qiDJZQQoxPWAryOkPBDsKb0PGZTJhs72RPv58o4cy5SY1MsLlvFrEfEmLt6ka9l0u928fKvE2iprC
	Ar7wqSr0WnFrGkJV6HvGxEx9NfiZF/lmRUzcmv/sVuFzrHUqnGRdEdRo5PvQHcwWGmzjITdYan21e
	YmjMeqcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvH4-0000000EjDu-0Jwm;
	Mon, 20 Oct 2025 19:10:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAvH3-0000000EjDI-1rGt
	for ath10k@bombadil.infradead.org;
	Mon, 20 Oct 2025 19:10:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yzMuFEKLkLg4cUyPzJ8L8XlJRjRXyriI3UI6ZizNKkU=; b=lnjbRNiCDgR2X12YmkDzLO55RO
	nUUaypMwVw5kcNFycOkK/gsToxsfTkqNJwHeyONDam7/Gh7Ut7PRZKfU/ctn284HYFYdz1N/unW3r
	i42aepv6M/oWZA9s7Z6sRRdxwzA+7SJC8yDsmDbvTOQCwxUE4T7TSvnl00TMDsyHBJcJ2zJHgDsBD
	ZIA36XxaZ/f1rWo/P5m/pl+SHVsQTtzJJLLNQ1+DNlsuHR3BXEkVumzqeztiDRx20oRbQOwL/dNOV
	EM7FzLIVRoCABQ0GDfZGSpuf5DXPNHNDgSE8zslfFAcREyjRDKqaO8mKGHp5khJL29pzBqFqEevlp
	tx+BpCMw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAuPI-000000008U8-32Zn
	for ath10k@lists.infradead.org;
	Mon, 20 Oct 2025 18:14:59 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KIxxam031533
	for <ath10k@lists.infradead.org>; Mon, 20 Oct 2025 19:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yzMuFEKLkLg4cUyPzJ8L8XlJRjRXyriI3UI6ZizNKkU=; b=bxxTWAlGFb+c3Odr
	5HAbLzMyAEILhm9zTyaUNFHHIH724DRNWdL/Gjpb7fYaHG6CwhEb1waxwY1gMA7L
	Yr5ZxZ+AydKHeOgprBSVj4iNkR/Hb61C0plNU+c01d26Q5ZhCyJiALNg2bU3yhad
	LZY99F30r+zuKaR8Er1QfuzhLHeiNtOow4/6isXxa8tT5ZgvXqRDRVWy5hEznBVu
	AU/3+kPGN6mZW3+PpDa+K+Lt6mooIVma7+Xks8ZXEtLLM3YMtm37qzqa6m8cWvwz
	hmoFbJ/Tu7/Ldt/oM8I19lG6Tquhk4zbdYYm45+XB42Sd1O/HeeQRAXVBxTvu3Mg
	HXdPJw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2gdwvgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 20 Oct 2025 19:10:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b60968d52a1so8913150a12.0
        for <ath10k@lists.infradead.org>; Mon, 20 Oct 2025 12:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987411; x=1761592211;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yzMuFEKLkLg4cUyPzJ8L8XlJRjRXyriI3UI6ZizNKkU=;
        b=DNiRx2KGtp9awnlbTyVMJM67r4b/SAHYMzpSYV5XFgjf1B0KiPMpr+daY5EhVxI7nV
         vEpHLwd1LI9tgTJ69jhlrYO2r1pEwDmE0WYBvYNV7Yr4VFPfFs4YRr3ZTZC4TZRSUEuk
         1RX2l0CIES0+iL/dKBoelTaTGIQH1gMD6izhzAtbL4ZxQUr55y4QdnXavDToBHeD6Cuw
         T4m18Oa4Q+65net5m76i9NS0flCGf4DGgJSVZ2TKngOCOwfq+znqlDmNHfrNkdTpUU9P
         GXSOt1u0RQeTnautAfknVWxLyd294vjlIRCtCiLNEgbGZudE+XllQ1sU9kFktg2yrLDa
         sAMg==
X-Gm-Message-State: AOJu0YyFB/Ph1EZRNboHtOv4oyMNhaH7boTqSUJQIWOfu90R6DJ/9dRj
	nZnVbuQSA2VxSm9NFRW43McigyrgwmDAn9II7Ui4iWhGaa7XfVecDJX2Z+VU46KGMKgS9pGDWu6
	NG1EbKfq2NNKFD/PXk/AkAftrFg3D4ks2VFa7MP0GHXgk6jce10ptuUnEPjOQQd3d
X-Gm-Gg: ASbGncusu7s4SbYDx/AGlRSkybfEtKdfL8xLeWT5cVAgiqvdcn3F6TlFMr5zaF1ZCoQ
	l+Oqgu+yExMwT2d2t+p4lAv0DudyNVv4CYjT4YYQOjwfsCYR4KE3j0EOGuvHUIVMGOxEIbEEgZj
	EcEFxxt3DtXThQ98uZWRd9Oh6a8S1cIc914pmCxrj1EvF0/uQdd5ufrKEewnQBDKc8+Q98nTSYy
	uwZREm7nQtL+b0ozC3nlyCngiZLgum2H8qsVCa7nJRjJHUkEnYlF8hiDhPCr+7JvY7ET047YLYD
	12802yg+XbK4PxgpBbn7LCGJSyf0vUO9uEQvUlKEqszeyLR1MBUASb68vlvD17tZhgOpKirzunG
	jFBXyBT4GKHTDaQcIodwkA7T3le0BTOfcRJMj4RdvJq7AnrBpHtL+6XddHQIECGXeMXDwW+U=
X-Received: by 2002:a05:6a20:42a3:b0:334:a82b:97d0 with SMTP id adf61e73a8af0-334a84cf411mr17501122637.22.1760987411131;
        Mon, 20 Oct 2025 12:10:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt/NPam4b5rrf4LmdQPIY4ADl573FSqQwAJ016hQUWxp2uqRMDdylgVudT1VdQyOPbZPC0nQ==
X-Received: by 2002:a05:6a20:42a3:b0:334:a82b:97d0 with SMTP id adf61e73a8af0-334a84cf411mr17501091637.22.1760987410686;
        Mon, 20 Oct 2025 12:10:10 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a7664a462sm8777498a12.8.2025.10.20.12.10.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:10:10 -0700 (PDT)
Message-ID: <5e0b80b9-8cd9-4e5d-a5c0-7fbea8325855@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 12:10:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath10k: Support for FTM TLV test commands
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20251020153759.407516-1-loic.poulain@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251020153759.407516-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfXzSMBGd2WHX3F
 j6LyTjubwmQxeu+ugxcySv8q+OMEEEL/3zDK8wNZVjFG4k8fSy/0Xq7HYqLr7GUVUQ2YazVT2Tk
 y0HH68p/dWZacUXqJbnWEIzPlN4b8Dk4zu9biwOCkeroE9AuYOmJgeyFBY+/4QxPyNV1g26D9f+
 Ro2tCIiFWoVoDWmtMpnYr4/f1obiYSoDoD2OxD4j06jbyTcRGa36s/+oyZ1eTat06KtAdIGR98X
 6jZi66InmwJSwBAWtrB8jxS9BJMrw8B2PahdlVGlcUAndor6vXJu0RPpPe8cJORyp2bUqBtWkQN
 Nay9W0vk01qIcd1T3Nl1K2DFHxxnOrAxsMi14ayBk/T9IcvxWQcJyNljW1p9BGueFe5/jgAix0B
 8N1PZlJJGz43MpbFA9UYekXe1XOPfw==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f6891b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Oq1PXzKV_Ju3vwlGj5AA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: Cm0ADG0VSCw3kADqheJrcz9vK16NrtHe
X-Proofpoint-ORIG-GUID: Cm0ADG0VSCw3kADqheJrcz9vK16NrtHe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_191457_033506_3D433A83 
X-CRM114-Status: UNSURE (   7.43  )
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

On 10/20/2025 8:37 AM, Loic Poulain wrote:
...
> +static void ath10k_tm_event_unsegmented(struct ath10k *ar, u32 cmd_id, struct sk_buff *skb)

i'm going to split this line to address the ath10k-check issue:
drivers/net/wireless/ath/ath10k/testmode.c:34: line length of 91 exceeds 90 columns

(for now ath10k/ath11k/ath12k prefer to not exceed 90 columns)

/jeff

