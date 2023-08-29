Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E29C6FA8F
	for <ath10k@archiver.kernel.org>; Tue, 29 Aug 2023 13:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8lIRaWgWIakEt5KUM7lGJ85fGC0Dm9msjhiUEYWa4sw=; b=tsn1JzQvD6kSGf
	smKYZln/ac+W/edEhhdHoIJNlHp9OmcvRZ+dpxZFtGPm3LZ/lchId/82CmM6KONVHsaDIDT5tiE/U
	i6gz66TrAxcZQHgikcqjBff4E+LZh4NcG5IyVuOUyTsYpoFr6xReIWxsVU+Ak36MGvOqx9PoF/LJa
	wMkJSzBSAq2T8zece5zLfU5rfP+ruH9w9PpaJImg/wJjeQ5vewqlvZq6WSICkQ/rpmG/ee81qVZQv
	WJ18dlG0ghlDVYPP9r3JqCnk0rHP1UEGB8vnLIxq89mtTh3XNkgJouSDzvms9TqF6k9exwJtvfThQ
	WMViG6tCcZ46NnvSncZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qayyw-00BdIM-0a;
	Tue, 29 Aug 2023 13:42:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qayyt-00BdGV-1H
	for ath10k@lists.infradead.org;
	Tue, 29 Aug 2023 13:42:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37T5vLEo031793;
	Tue, 29 Aug 2023 13:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=gaZKkYkou1U3yCZEvJPkLuWSrXOx2/F9Hb90sYTtJx0=;
 b=pk4ztNlXlqkwoA+MLtQgSsPgNx5xt7OhVdPdCi1esMzS3XkrpH/QkCtkZ4XwgA7pgGjG
 +dUpWuUPuHSDlD1qQmOXEuoKUE6FgwTwC8Fll79TfR4CkIr6DKMuUWaL5vIjc83expuG
 l6novHcegPLE6YRQLT4KiZ3xxHisL8DaBm3U56/Tp9Hy+YNrjGCbJ6K/I79oAWZyDFmZ
 PMl6ZXCMpbtx6LJMu210nkPsxQNT+hZUC9iDiYuKd+9ZjUKQVPMyksK/KMj5tuKicXbi
 dL1BJY7p/nOZnsB3w0fCITC0DiZ7k3bPOR1qTYzkGL9kxqDZ95k/vp74JkPP54oZeekk iQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3srvr82uuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 13:41:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37TDfwJt029970
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 13:41:58 GMT
Received: from [10.48.245.159] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 29 Aug
 2023 06:41:58 -0700
Message-ID: <494e0309-314b-4982-9575-61f8e690c237@quicinc.com>
Date: Tue, 29 Aug 2023 06:41:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: fix clang-specific fortify warning
Content-Language: en-US
To: Dmitry Antipov <dmantipov@yandex.ru>
CC: Kalle Valo <kvalo@kernel.org>, <ath10k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20230829093652.234537-1-dmantipov@yandex.ru>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230829093652.234537-1-dmantipov@yandex.ru>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7wYguPLUP895CchGz4upRJ06u--4kGNN
X-Proofpoint-ORIG-GUID: 7wYguPLUP895CchGz4upRJ06u--4kGNN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_10,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxlogscore=521 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 mlxscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2308290118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_064207_436961_BFD0311B 
X-CRM114-Status: GOOD (  22.69  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 8/29/2023 2:36 AM, Dmitry Antipov wrote:
> When compiling with clang 16.0.6 and CONFIG_FORTIFY_SOURCE=y, I've
> noticed the following (somewhat confusing due to absence of an actual
> source code location):
> 
> In file included from drivers/net/wireless/ath/ath10k/debug.c:8:
> In file included from ./include/linux/module.h:13:
> In file included from ./include/linux/stat.h:19:
> In file included from ./include/linux/time.h:60:
> In file included from ./include/linux/time32.h:13:
> In file included from ./include/linux/timex.h:67:
> In file included from ./arch/x86/include/asm/timex.h:5:
> In file included from ./arch/x86/include/asm/processor.h:23:
> In file included from ./arch/x86/include/asm/msr.h:11:
> In file included from ./arch/x86/include/asm/cpumask.h:5:
> In file included from ./include/linux/cpumask.h:12:
> In file included from ./include/linux/bitmap.h:11:
> In file included from ./include/linux/string.h:254:
> ./include/linux/fortify-string.h:592:4: warning: call to '__read_overflow2_field'
> declared with 'warning' attribute: detected read beyond size of field (2nd
> parameter); maybe use struct_group()? [-Wattribute-warning]
>                          __read_overflow2_field(q_size_field, size);
> 
> The compiler actually complains on 'ath10k_debug_get_et_strings()' where
> fortification logic inteprets call to 'memcpy()' as an attempt to copy
> the whole 'ath10k_gstrings_stats' array from it's first member and so
> issues an overread warning. This warning may be silenced by passing
> an address of the whole array and not the first member to 'memcpy()'.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

> ---
>   drivers/net/wireless/ath/ath10k/debug.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
> index f9518e1c9903..fe89bc61e531 100644
> --- a/drivers/net/wireless/ath/ath10k/debug.c
> +++ b/drivers/net/wireless/ath/ath10k/debug.c
> @@ -1140,7 +1140,7 @@ void ath10k_debug_get_et_strings(struct ieee80211_hw *hw,
>   				 u32 sset, u8 *data)
>   {
>   	if (sset == ETH_SS_STATS)
> -		memcpy(data, *ath10k_gstrings_stats,
> +		memcpy(data, ath10k_gstrings_stats,
>   		       sizeof(ath10k_gstrings_stats));
>   }
>   


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
