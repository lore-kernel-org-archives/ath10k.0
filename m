Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70622C43458
	for <ath10k@archiver.kernel.org>; Fri,  3 Jul 2026 03:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Di5bK38iUyM7oXEH8y3ao0I6FWmFAVhzxIH40kS4bQQ=; b=4u0hHSFU65d/S9TqLpq5LQsQKl
	Yg1BOeo5189qd5uIluOqJFBIj1tjI31SAcrIOJTxuOZ/kRXnjdLFy8BfI3AukMjF+8TDt2koNW647
	26Mb+k72zuVieSo8KwgU7TGPVolMEaHeCRRwTKgwfAnP2S+0Kk+/4Ys6YimdHHXrJBiEXN0KWnOX5
	2pgk5O1FTKJp9tRmLQ98MdtoWK/Ev9am64AaWe6tsPZZhoP1yxfHcmD0PAWlERmP8Lb7KZKp0JgPF
	E0WRzSE1VuFyV9ERKiySjlOAAD0d4neVVPED8vaeilIyb0Cbe2HFPSO0GfhAgdQ55XiwRb+w9WNIw
	jy7uUy2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfUub-00000005xEk-1iiU;
	Fri, 03 Jul 2026 03:49:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfUuY-00000005xEO-3PCy
	for ath10k@lists.infradead.org;
	Fri, 03 Jul 2026 03:49:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6632s2102638197
	for <ath10k@lists.infradead.org>; Fri, 3 Jul 2026 03:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Di5bK38iUyM7oXEH8y3ao0I6FWmFAVhzxIH40kS4bQQ=; b=eUlNMGseu+mwRh/w
	SSGtlBQYDitQ/80MFt5eZywkX06cEYzQwwiKXiv1uxAq2lUVumXZuruKLJeUXwkc
	eSr/EAkifNZx8Ul5o4oNlTZ+eFOAxskVl9ibc/wT3p5+jC4DDaKFNUfHHtoQL04X
	q1elBArodmkZNjhRkhAi6sEeP/rfybSdjP2n9MUKYI8d/YEopISbEkBSE0oG1my5
	9CdM9IUjAqBNAKZC/Wi0ZZh1WEmp6MRkdyYex3xgd4PvWPbBukyFx1zt1DW9VNjB
	RkHHF/sljw1hfWA75Vr2R8TzT2KKxV6DSWLovbf4Oz2J33F7h7VX+baa0SoLA2dP
	exBmhg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qfc3g7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 03 Jul 2026 03:49:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c6bbd0afffso3177895ad.0
        for <ath10k@lists.infradead.org>; Thu, 02 Jul 2026 20:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783050593; x=1783655393; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Di5bK38iUyM7oXEH8y3ao0I6FWmFAVhzxIH40kS4bQQ=;
        b=SMas45D5fx8MYWPLNmJ9hsesYYUQY1vRrtGlLze6wd/mZoPqo1U9LsQIdIraqU5HxJ
         2xaMWyylF2D5TM9YR9UCmodes278P3t93VOKPvpjlUw/74nr+faJA0ywprNR46BfP7IT
         kdLBpnICOZdo9d9ew4tp7jBRLEAS/YOn1MfWPWuMouZ3D6Spwq6dYz7+EMGr6D6HLJB1
         HJFsjNu3ssjUAVf4ZLHjvRMp4uep85TV5H9qZfBgOB8j1eH8qfnZLPm2EvcYGZzS4stW
         P1bwQmiNiqUxuuSllSY84F0mWiMs629b/gEpuGpPkQrCpfJrYhpDsVtmSEk0fKr6QH9g
         w6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783050593; x=1783655393;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Di5bK38iUyM7oXEH8y3ao0I6FWmFAVhzxIH40kS4bQQ=;
        b=s+Ohq0zNOYk2hywLPbOIiVh/PO/89wuFY1fFxq9yXL/FdF/eqBowrUuYZY+4wdViZp
         WPIVW019Oh9AgVTiClXe/+oIsmWL4VsnDJAUFEyrBiSeu4iu3y81Kcwn304qWElcgoVp
         NziCMDimHrGShCPiN/oKlB3DZcbPXe3ZUD1U/V9TIpNNRyCjqQLEIrg6CvZCBP9R8DEA
         S9xx3VNaZSaORLyWLmQRoRTE6+geLtpXO60Zdvjia0z2nYxQoQaN1e8HcAPHmeH8blOj
         ZtZT23jkjBbw12SBuFl+I+oRsx0FM7CE98iLKVPOX2wj10c7hzM3nXX+NWf+F79JStEM
         L5LA==
X-Forwarded-Encrypted: i=1; AHgh+RpOzWp7E46XvYV2boW14yek4nhf4XfGCyLHYBwU00/8942hjGW9jCuZ0LMPBbpNj1IKJyLH4Yk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwuWoiFW7rlEU1A8H2AjSv9CSWDqNfRr5Ypm9zOi4Vo60lPQQTK
	mN9wm5oBATZekA/INXHLfebGtSTB0VUOoEGFGv6pLDSpYkVfztLLjd/Sfm+3KvLcQZUSTKLhyIv
	1lISI507M+EH9wHgroqaatrC8JEGGC9AL6y68QtCX/ULLwjjc6I4COBSR9kUfKmeG
X-Gm-Gg: AfdE7clDyOCdtTc5I+BCWC1L/WrKvVwEWyVk3hfvovC8sLdtzzDEG4HSbZWSfBApUvU
	rVwJxGTVmxw4RZJ0UvKh2flhTLMWtz9FqQhcd0HtM8EQ++uRGN2boBv5DnB3aoBEkex0xd3zqr+
	Z09R99rTa8qfL6gQFuGm80ViSbvVO4sfWCiO17s3JF0jxDcVFsWPJ0lu95adr8YfG3QJssoyRrF
	L67gGNS+XXAM9/a5TBpd6JvFa8kDETfOQGbuivZOoNA4Qtron0UAN3HQ+RXbWho1ZGdxZbE14V1
	GZsSObU3p/uy06UIWCzrsp2vupRCGhzA/JND+29NzlVAvuL1CsHH9BON/ls3Wh2shR2+bO4PB8w
	KfOET7IYvrywaWdEViTn07MlNOVBtaFG2qLOmT+L0LhMZdyjLTi4=
X-Received: by 2002:a17:902:fc43:b0:2ca:481:de45 with SMTP id d9443c01a7336-2ca7e67cc82mr101177195ad.6.1783050593558;
        Thu, 02 Jul 2026 20:49:53 -0700 (PDT)
X-Received: by 2002:a17:902:fc43:b0:2ca:481:de45 with SMTP id d9443c01a7336-2ca7e67cc82mr101176825ad.6.1783050593087;
        Thu, 02 Jul 2026 20:49:53 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c870effsm17429431c88.12.2026.07.02.20.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 20:49:52 -0700 (PDT)
Message-ID: <d9bf4d8e-41c4-4f4f-9e32-08bb41a7da3a@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 09:19:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath10k: fix skb leak on incomplete msdu
 during rx pop
To: Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>,
        ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260623064355.1876743-1-manikanta.pubbisetty@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260623064355.1876743-1-manikanta.pubbisetty@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WeJtSmKbSfxzpA3aE4EauGsGmIDzd09u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDAzMyBTYWx0ZWRfX3sQ6CqR6DyVY
 p8xKGbAbsyxlmzi+5ek715I4+WhcKQJxp7vS0RDMkGefoKhb6vQYjUaeYYqPW3TlQIwxfitNj3P
 /bG7OTpQfgFCL7qGmWCU8nlZGiQhEOpxoz+Nqx/W+e8ScEJ3tT5bsfyjCmES5+hyAD49mAIibML
 QHUEj8/xvNKN0Wv2TpxiXSX7sJRS5H2d+yr7TzDZXSbcpgOQNXcW3WdF3hvAomg25v+x1ZZoA01
 Hp6Srr5ocmitk8gDTg1fxvU/OCkwxirtnuKf3gR354jIOJm8p0bTMkPllTb5OP0h8AmdTSKfiOS
 /0oAuLGl6sxGPhGXiwXqnHQEOLGkaxZj8fI8e86fR+FAMlS1GZlsP8L4vgnAZZc26/YYpsbtHdK
 3oT2k03olqvHeXWwNqRnNbsmMM/Vs2536tuDm1YOoen3UhHPcMAW3DAwd4CDGAwzTe54ggzotgl
 qiO8eY5h7a9omMs038Q==
X-Authority-Analysis: v=2.4 cv=dvXrzVg4 c=1 sm=1 tr=0 ts=6a473162 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=PSAErUXHYyYb-UPQJNEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: WeJtSmKbSfxzpA3aE4EauGsGmIDzd09u
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDAzMyBTYWx0ZWRfX4uQJacLWKVgy
 W/sWkZ9/FvvX0WJH+YFxfptZjZK1cREPRRtA+ombo5h2TrtNjGPY+ohNM0oPUhnRB3jiBZfIZTg
 eaHGdZcrd5xJ3tZzCJ/RePBjw9CXno0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_204954_874219_6C97648E 
X-CRM114-Status: UNSURE (   9.91  )
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

On 6/23/2026 12:13 PM, Manikanta Pubbisetty wrote:
> When ath10k_htt_rx_pop_paddr32_list() or
> ath10k_htt_rx_pop_paddr64_list() encounters an incomplete frame
> (RX_ATTENTION_FLAGS_MSDU_DONE not set), it returns -EIO without
> purging the skb list built up so far, leaking any skbs already
> queued in the list.
> 
> Other early-exit paths within these same functions already call
> __skb_queue_purge() before returning an error. Add it before the
> -EIO return as well to be consistent and prevent the leak.
> 
> Tested-on: WCN3990 hw1.0 WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
> 
> Fixes: c545070e404b ("ath10k: implement rx reorder support")
> Fixes: 3b0b55b19d1d ("ath10k: Add support for 64 bit HTT in-order indication msg")
> Signed-off-by: Manikanta Pubbisetty <manikanta.pubbisetty@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

