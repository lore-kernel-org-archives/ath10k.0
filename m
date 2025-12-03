Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8CBD15DB7
	for <ath10k@archiver.kernel.org>; Wed,  3 Dec 2025 17:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkT8GiaVt5e/+oncAlIHtMIHYjaklD3UgKCqOLHionY=; b=GFL0ss+BQFNAJxCrrzXYNVcy0X
	DoAX1VTzFYjRMRCh7yquED34yw1prSsFs7hAsJ2ki7F2zcca+dWgMjNqDrFmyBPvUfeXuTfp3Zsfm
	ky6OGHLDVtUuExxlX8V9ahAw0BC1uddlAUtOB24OpV++mAfBqTZfR9tMLx9MiEVCalZOHW36amscC
	+gm9EkOGQvgyTAH41TXSYcEgm14FnyiSuE9zprwTBggkILQkCAjZUkYLji5gNmknI1knsATPTfcG5
	6JD/iM/De8Z7dZGKP1tpZ+0WbBSZhvE4VTd5MYB2ypPQsHdrZRnlEbILTWGiwGS1Cql0TYmCJ4im6
	yLhfg7Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQqqB-00000006sLi-3OQ2;
	Wed, 03 Dec 2025 17:40:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQqq9-00000006sL6-2Q0J
	for ath10k@lists.infradead.org;
	Wed, 03 Dec 2025 17:40:34 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3GPrir2662799;
	Wed, 3 Dec 2025 17:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kkT8GiaVt5e/+oncAlIHtMIHYjaklD3UgKCqOLHionY=; b=GnZ+A9kLqaWgzxSQ
	685LRQax/RjDDjhjfHtIXlDq47A8KnGf30U9QdmjVPGeYMezpeVs71RAU/eXZvnj
	qfRUSARcHtOvrJVall/8NqI9xeQW1qVsNJwlp+2PgOYbfB7Vg1+XLp/MHiXFu8LM
	6/2jWixMyw2x3WVmxYygwcQ/PpJsY/Grw//hyGYyVo7OBa6Z5fLd6mKGiMygd21K
	OFO8lbZCpMblyLf9/lpu5Vam9eTkEG3kNSaeiD3GXKB9QDGSUcngzO1hA2IXj7rM
	4lInsZRVcKz7IstgYkgFlJnwG5qMqQ5LKF75jWjH+67iAJoUTnV1p1EB9IGZTwYC
	egrarw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atrppg8vb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Dec 2025 17:40:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5B3HeRK5001735
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Dec 2025 17:40:27 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 3 Dec
 2025 09:40:27 -0800
Message-ID: <cd1de91f-78ca-472b-9e7c-0c49e90ab833@quicinc.com>
Date: Wed, 3 Dec 2025 09:40:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: ath10k-firmware: QCA9888 hw2.0: Add Netgear LBR20 specific
 BDFs
To: Marcin Gajda <marcingajda@gmail.com>, <ath10k@lists.infradead.org>
References: <CAMwxiB41sDWgg94U0AckehzuwC1drdRiD19aJsdWJHPRU6TKfQ@mail.gmail.com>
 <CAMwxiB4iYrgfv4rUCcNLqr-x7cyoWb-UFX=yf-f33j9cbK=v+w@mail.gmail.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <CAMwxiB4iYrgfv4rUCcNLqr-x7cyoWb-UFX=yf-f33j9cbK=v+w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: h0oC5ebKbco1LynTVHuqv46-XXvq689h
X-Proofpoint-GUID: h0oC5ebKbco1LynTVHuqv46-XXvq689h
X-Authority-Analysis: v=2.4 cv=L+YQguT8 c=1 sm=1 tr=0 ts=6930760c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=sbmcSJHFqjLm5jUbl64A:9
 a=QEXdDO2ut3YA:10 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDE0MCBTYWx0ZWRfX2lhn85UOQ2ts
 HyciWIJyzrbe8tyCJ34Uh8W+BEVeHSTA1Rn4UAGJ08QZUsPxes4VnSkIS9FoFDqynEp7Q56u2OF
 xJkRNEW7/klFyS06xC9F1spl8VKGNN4TkgkhovrhnSZqmhQ7bE6FxThriENMm1/VXobYLtGsQJ7
 YEgoa06waEdzSs+pr2NXGGYWMjk8J7JUbGzqY7CORkr/KoThsIFBxdDC4/dRAlamp8LvDvp4YHU
 cfRCzP0jfg4rgQ3he/0jPunJL6ZOXz1b554uYIs9UITNkaylJvDI0yW0dMCmArfhMy2ZJMu7yTJ
 b2ecCZp1LzbsiHQfZYtX1AtbFlwklZzxrOB3TGAE9vJu20DnlzgOImMiNrZhg02iVKQ2oMY9cIo
 wCmkY41hwEuJb9Q67KYiKykzpt308w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_02,2025-12-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1011 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_094033_650984_D7916A62 
X-CRM114-Status: GOOD (  14.46  )
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

On 1/30/2024 3:01 AM, Marcin Gajda wrote:
> Dear Team,
> 
> The support for Netgear LBR20 will be added hopfully to OpenWrt ,
> work-in-process and testing.. This AP requires
> two special BDFs to get the Wi-Fi PHYs working (correctly).
> 
> * description for what hardware this is:
> 
>   - it is a QCA9888 based board used as 5GHz radio
> 
> * origin of the board file (did you create it yourself or where you
>   downloaded)
> 
>   - It is copied from orginal fw. povided by Netgear.
> 
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
> 
>   - QCA9888 hw2.0
> 
>     + bus=pci,bmi-chip-id=0,bmi-board-id=17,variant=Netgear-LBR20
>       sha256sum:
>       6D66B242D88EC8ED8FCBE31C5C9DF32A48B00B98B44E5E0BD4C5463E867F91CD
> 
> * attach the actual board file (board.bin)
> 
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")
> 
> Kind regards,
>         Marcin Gajda

Thanks, added to QCA9888/hw2.0/board-2.bin:

New:
bus=pci,bmi-chip-id=0,bmi-board-id=17,variant=Netgear-LBR20

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 19 in total

https://git.codelinaro.org/clo/ath-firmware/ath10k-firmware/-/commit/30b3920fdec0c5aa84131b72c928e765d0437511

