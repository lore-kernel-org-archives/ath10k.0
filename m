Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4A6FCC9A2
	for <ath10k@archiver.kernel.org>; Tue, 10 Mar 2026 00:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eq3YR8SJMJVvMJ+9JHxKSwsUI6gefV1Keb8jWt7Lh3M=; b=mSngZE8NojzzwvoX3WtK7dBcNU
	ApeUG6Cx7RdPnDE9kP0+J8wdgYdFVNh6vtYBtzG7Sf35pe3vlRqjidoMiaH0vBUWkqX8ub89aRUAX
	RODnHuPohDcIJ6V7yFZskzb+2FLL3CDu+V2GTmlQ2hfYYRM31J6XX2ohpPsgbRdQRHOaTKRCgBQlS
	m9MKN6oWnOL7BO6PCEMlIIqw9VI1UbVAnjXeaKEnD9xgUg9M9sqWRTRtfiwYkbAsK5MAUPCs8vo/J
	VClM1lJoqsQ7hXQS0x8z/nuS52nOgzBZiPfZfi7qQxr/9L5/OufXBLq2ITAB6cJiccnYbBEvYTVzr
	8zCO+P1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkbG-00000008Myt-0Ye8;
	Tue, 10 Mar 2026 00:05:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkbE-00000008MyT-3bBT
	for ath10k@bombadil.infradead.org;
	Tue, 10 Mar 2026 00:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eq3YR8SJMJVvMJ+9JHxKSwsUI6gefV1Keb8jWt7Lh3M=; b=c0GIdJVLflfjPgMuR/PexqAS11
	Sx65bSbuwKm5dOJ91fOZpf3v3Q+jDZfwBm58lOIzwJRSOQ6ilDH3kkpjZnbn/RORE8Bg/GmPTaJBb
	T/i10MJkDTS7nu7/RQ4/N2iFDx6f83D6dKZMJBgJ4O2soRYPNSmFbz4jPcfvnA1uoAdyqpEkqW70S
	9c2Gkx7mkQ+qihOr6rSgT5qLXTe05i7mEMUE/bcDBHQ6lPZ7OpZ5lNGktlAuDO4Wr0Bl4PNsiBklF
	cIx1VKGQU3S0fWQN8GqhALTPi/BQlazfWTmed+mVzod/7yz20fK2A5k1Yrt8I8rdZUtZnzYTAey3d
	CpVx0d8Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkbA-0000000DNOn-39ZH
	for ath10k@lists.infradead.org;
	Tue, 10 Mar 2026 00:05:23 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBoWf859683
	for <ath10k@lists.infradead.org>; Tue, 10 Mar 2026 00:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eq3YR8SJMJVvMJ+9JHxKSwsU
	I6gefV1Keb8jWt7Lh3M=; b=Vr9LnGwXIh56NKbRnXZ9oGqugFUK4IhcHRzvq3a5
	Un6ZQ8s8T1noY+p3OJ7nIlI/pFkfv3cYoEM4U7/xltLCa4Z/F2sl289yNUEOLOBa
	Z3BMufsHHwruxHaeqjTrfm6GUyvtFJbg8+zVVlRX1F67+pZN2/f57ytt82EYhETZ
	OewgGpdBKuqvpKxd0OIc6KSPJV+25un2J5yp3XmPiFYJMQ+y92q1SsXDbwt6Jmi2
	8hHVAJIACjd7Y1J5B9g55NXaSqTp8r6jKNbRIKYDA86kvmEp8GZBpLP2wJWX4hO2
	SEac3DT7Y/5jRBWsKq2SbbWyH2StPJI5fzOoVYyq7M6BDA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbsss0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 10 Mar 2026 00:05:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd76ff19d5so1426326285a.0
        for <ath10k@lists.infradead.org>; Mon, 09 Mar 2026 17:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101117; x=1773705917; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eq3YR8SJMJVvMJ+9JHxKSwsUI6gefV1Keb8jWt7Lh3M=;
        b=evwmnmQ8gqLiHw43843oJD3rCrveMSFFH5GyNAUY8jipZmIRZinB73CxJDRF42ENy5
         uPDyiFzwCY4h3LQoeMzm9sOLXHxYEppCWxMBSPoVuPomaf1JnDXdv0qAg3u+DiUlvVdY
         QStwEuHO24wBqozBK7A6tzdrZkzgD8PFqdtHtnZqFEOPYWRF3gCNiVP/lkXNZ7+w23U2
         0dRVXok+42egrLMP9BWLtNbuXZJd8FrFGt67FVwALbssJF6vFPo93nBQ56vjmPRJ5+RK
         GAFSwV1zUqEOHZmqg9onMLnzfpe9gbYm5NMNG2PyoAU2H+MlQkhdSL4Gg01yysezOjNU
         Mn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101117; x=1773705917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eq3YR8SJMJVvMJ+9JHxKSwsUI6gefV1Keb8jWt7Lh3M=;
        b=ZAfcwzvEoXf2JD7NyPM8QbDoIwSA9nYQPgyMQ4eCUZCIaQfXGYIp/NFDNBD1Xs6+qS
         4BxXeTk1Gb1FnDSb0lTR51KO8So5GIiviqiQ61kBws2aUZ3FU16C0jVCPv0dwqH6UjNL
         bpBRWno7s6E7HAqjDsRVbBXFddT68sGX6j33QrUERXWIYE7pukOfkjWaBHd6Ft+t7Q6e
         rxmaPK6Pc7lty3DcPYHUcjYmr4/zWOU1UdalBTAl+VUSYrFaEXOaVM720C+Ow0DybJ2K
         CMj9M0SwVxSJnnYDxWj2Dp+yNPr8cETxN0EuyTQj8eQxC43wcoj4vp0nByxYgtgNuJ1y
         mVlg==
X-Forwarded-Encrypted: i=1; AJvYcCUcmhjQF0n3OsMvpVXTvq7O41mYhwha5vsXnmbSzn4o0sILY+U2mXequtOsq0V/R+BPRxdVoZg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxlL9CZSrR4TFvvZdXXymy5MQD6TVdoa0BqNjb8ta/gi3TvZi++
	AXSI4al2uKHMi2T/+9jxi0teP0GMiC2EwLbg3A7Osq0WtCrC7PMWYK0m9Q64mtdEtTq/DitS814
	qNt4bNah0B4KGib9efDGxS2HmSQOKb/jWeuW3K5OwuZZbcjMxM0BE1SB3twR8CiSn
X-Gm-Gg: ATEYQzxH6/IjZYlkgn+cOFrlTliq/q0krlZLivGexX64Tgu5v/0b6/cPi1O6YIhWK3d
	J9/UA+Y5iTb0HwuzzRp3LC1pzBydbeCiAhGSe+CYU+wXjkzi4ebjpSO8M1iN6LtmjurXxPE/OCI
	ZtX5TTY5Mtk7l2qc2uaW1Wjvsfrs6aBzQ+zoKmtzXBFjXQlC5AGzJh77Ug8DBQsclZe9+8e9MY1
	CvD0LCrY5+Pdnr7bjMcRi1uEBtgcHXRhtSgXIHQYIdSnVHHZQrhMEY4DoIbToFTYi5VPsjUX4zi
	VBklB2qsORWqQeIx3BEuoSjgF1bqovrpy5Wk18hZqCY284JKQzJLa6uKeLj1ESS/UYfJ4xqJbnS
	wYDz2g/UqNXadfs9M9ra8TGsyOXEqhMuAZkprq5OPYYCVXLXDETN9lZicfDSnsjs5smm6YHasLx
	qn8v/PB0gNfmbBeHGgRfCFyYdS4R3EP87av7I=
X-Received: by 2002:a05:620a:1901:b0:8ca:2e36:18b0 with SMTP id af79cd13be357-8cd6d4d5b1cmr1601782085a.39.1773101116988;
        Mon, 09 Mar 2026 17:05:16 -0700 (PDT)
X-Received: by 2002:a05:620a:1901:b0:8ca:2e36:18b0 with SMTP id af79cd13be357-8cd6d4d5b1cmr1601779485a.39.1773101116549;
        Mon, 09 Mar 2026 17:05:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d01cf6fsm2324914e87.11.2026.03.09.17.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:05:15 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:05:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 3/8] net: drivers: wireless: ath: Use the unified QMI
 service ID instead of defining it locally
Message-ID: <6mm6z62o6xlso7mxyelx5zho5iowh5zfa4tlbfsexrb6vohzjl@citw4jcjsgsn>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-4-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-4-daniel.lezcano@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69af603d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=n3fwWfvLsPu2TWPVUDwA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfXzRVB83FVaxiw
 sqvlrnBaT74p8zPVsC75CVJrA/QEJycjZBBP3Wh0oBrURNWs/qb2986uQ+3aTxpibFbAZg/koxD
 pkzINLhEQ+ndop4dBWKA/jZxrxMZFiHdMQptN9Bei0pGFoxUy+GKUBdwrjF3e3W5525AnDW9NsV
 QOK9hXJXpJja7HhoAE6iRmiQc8+NFoCAStHH78qsu5mPV06IFaaYeT4x4GbmNKa+OkP2TflI+fZ
 I9mfhXzfu0TnVj2Nwp/gPwbk8cgzDR8Cd8hEau/gMO6pGYPqqNIh69BzfD+W9TLXEoKKr1Dkwwl
 USd/3lJVcUoMB5iPBki2UNuFgBe4+NTUjG9maZIxggY+gG/m8cb4up1aBvnC0fl2PqNdcAAjJnY
 qdU8+BtZDlRUoIRSnWgfkGUqirkRnUe1OLrGceYv0H0o2fi0XCsofDnDdUdQRFajjJd1Fs3I7+W
 1Z6aVxp+usQ5ukdYlDQ==
X-Proofpoint-GUID: N-3Mbby58hNlM4S4zGMfxyG1zj8gBMgg
X-Proofpoint-ORIG-GUID: N-3Mbby58hNlM4S4zGMfxyG1zj8gBMgg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_000521_799809_D1C28C81 
X-CRM114-Status: GOOD (  15.40  )
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

On Tue, Mar 10, 2026 at 12:03:32AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/qmi.c          | 2 +-
>  drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h | 1 -
>  drivers/net/wireless/ath/ath11k/qmi.c          | 2 +-
>  drivers/net/wireless/ath/ath11k/qmi.h          | 1 -
>  drivers/net/wireless/ath/ath12k/qmi.c          | 2 +-
>  drivers/net/wireless/ath/ath12k/qmi.h          | 1 -
>  6 files changed, 3 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

