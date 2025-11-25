Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB83D0E6F1
	for <ath10k@archiver.kernel.org>; Tue, 25 Nov 2025 14:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGiwTpNXLbFpjJZpDWsxtZ5m7PWHYuQFZ45Lny0LXjc=; b=YIAQIl+aqzqYOhB51UH+vmRtlP
	y8iLjhEx+rStVS+rfirFJ8Ud0wPtqo+ZcysXhZQ6RTneXyiZOFY7dGXfrrU3/apTDQyFCCPpU7Nq5
	Q7NL+uhjRzRXKFoyDhgmS6vUB1yWHACYiwprfQuhxmcPArEh3740KtEzA57FbQFwWpdymx0j+FyHA
	wd22haK3WN62PwhbQXKHXQnI/0DQPq6uVi1o2S3qoEcWshDzsxst4KZrCbyRVX26KvXVgduT7IsAw
	6JQ0jAk2s8Pt7LJvdoz7SEHV0VY7dFlXwGkzeB/mRDRcOiHBMSBVypCSyn6IdHPeHBwcYph4SCgx7
	W5Q+ydtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNuFK-0000000DS6i-38VM;
	Tue, 25 Nov 2025 14:42:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNuFI-0000000DS6M-12Ys
	for ath10k@lists.infradead.org;
	Tue, 25 Nov 2025 14:42:22 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5APE0Yj93706640
	for <ath10k@lists.infradead.org>; Tue, 25 Nov 2025 14:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QGiwTpNXLbFpjJZpDWsxtZ5m
	7PWHYuQFZ45Lny0LXjc=; b=QkqsvkamoioRLoTPiH+BFPO+NFd4MlTFdH04DBZ0
	ieXoLFG/nmpwbjBLU13avleDcVdB68GGXqqBQDODFySbYIwrXvSwVfNEkYonJxoB
	vY4mdD4QW8r1FlSdZjH74sFAtKeCPQikEVdcqVdkP8s91HTo5XDtkK97BSwWVzb7
	7avs30zshdPDW7aXrBQCXeKv9eVONYgvv2w1SkoqPY1F8qKznEYuAFxGbsdDzIqh
	l+vn/2Lfu33eQ3jSI9mN3MrJQjgNkTfZpTiU1RCVXQ4vDOx4n+6Jwbhug2+Az7Qi
	oBTGUwsxqJCtmtgRA2Xy9xpYazB4c5Yq/SwB0pVQLeLn3g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4andufr3ud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 25 Nov 2025 14:42:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2f0be2cf0so1887936885a.0
        for <ath10k@lists.infradead.org>; Tue, 25 Nov 2025 06:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764081738; x=1764686538; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QGiwTpNXLbFpjJZpDWsxtZ5m7PWHYuQFZ45Lny0LXjc=;
        b=Gj1kCcn8iERT/byfxAq3EZL512qveLxjP3Zq/RXUM+AIMlheLIfcUPFgeWT7GouKlM
         oecwLOuiP5OZvZRxKWZXpG0VpQDW4J9XWZWvofCP13WRHNkqhi5OYGTIS7JTLzAgCajQ
         DQLqITfxkojN0pf4aHXRLYuDfVQt8hiJxjZVNjE76wvwrN5CX/spep42k0w3xeHhT0EW
         2y1dfzUmH6+aZKi3nnc0YrPj0BPwcxN5M+Oa1idnzjNUE3V00Eiz1AjdsVUOH4UtrU9g
         bEj3mxxCEDZehTbWNQsw6oWZ2IL+Ho/sgGg834ZDV2R5h8g4aUKSlzi3IVBkN6eIY/ZM
         m+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764081738; x=1764686538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QGiwTpNXLbFpjJZpDWsxtZ5m7PWHYuQFZ45Lny0LXjc=;
        b=CsRtj50yigS08RXV9NLU1H75+eEpGyuzRD1Ld20A9OUSPag9UvNp4qcRlI4pEDi5PP
         M8XSdWu61J1OD/hsuPvMe+/UB36pOd8c8oVPs3ui045yZlnpe0VQbFD1aFafXfq8fgod
         xxNnwbxbo6slCWePh1VNh4uwRjoYFnGQbopbT6sUTCy81zOiYh7ZgvAWO9wp8oevOREc
         2GTc6vbiIf9ijBVuHZfLkNtn6o99+SogbQhGFgsZJW9FAUdsbIs2KMGGQ9J8nXkcwita
         O2d8F9XvlNQf0wBWhHc+A/rcfseQ3RL94RWuN81nKs3EKDRnQgSWbVTtZBH9HoruUlHG
         O22A==
X-Forwarded-Encrypted: i=1; AJvYcCVVnsaygDPrv58QDHzbqE/eFjIiM/InP4owvW+o0C6/cmuibf6Ri5/xlxN1Dvr9+7gZwDH6Vp8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZTeSCeiZAyEmc2o0J9GLCB07pURVTJjaEtpyNdhIfY/qVxTrd
	sQvmuN25Jo0SnX75zyP5DJf6M5mgIYT+B62vOl89o+XHpZDKxVwPHueTjaKWK+TOIte/Z6iFwhk
	Ez9OILsqLMLxO1sBKyeM0LGjYeWKk7hG5n4rRj06f+3NNUI3NTxhqOj1jox9wYOWi
X-Gm-Gg: ASbGncs1VnGIpdECXjzpSV3jHjlpxdqCPaBdMidoBGuoWvj4C9W1G/nCYk6xbn3P9xa
	JUYLfbV/P4N7vVOzg6FBDeJzfxzC9viVSYeNcc4wX1Do/loBE09wxEqEegezhnjZl+Ny5DnygNo
	aAK3IaIQGw3IK+LzymEPpMgGuC81h8j/Sr6EvmagwcmouPZHaSRgUiCf/YLUIiuUpJN0yPeEMRG
	BMzIaWhOh0CaI/bbVYR2H2whu4lGW+49cyNnAuYQJjKHQ2cE+BF3FBl4lYnNgeNKN9a9ACwR35A
	6lMR1cKR0FEOHd+/jv5BJRe+S6Qv0JRBT6j6iyH+U64OT+xskR2X3F/YJjmIlRLYvvb0WP3hqbG
	4hXkG45aPu8i9PeXxGsv4Q2wHF3hX70AKd4UZsGBcDbipkZeO+b0Hf+9KOTQxIn1GbjHTY5j5cR
	A4/6mVYZ/v0AiB0L02gFwBCDo=
X-Received: by 2002:a05:620a:3728:b0:85c:bb2:ad9c with SMTP id af79cd13be357-8b33d4773f4mr1898796285a.53.1764081738330;
        Tue, 25 Nov 2025 06:42:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmlMTG7Ip2VPXHNDOOA0wwV0LI0Qd7VntPvkheaXH/P/uFMCXTQC2rYLbRyXf/+XgeIt2wlw==
X-Received: by 2002:a05:620a:3728:b0:85c:bb2:ad9c with SMTP id af79cd13be357-8b33d4773f4mr1898792185a.53.1764081737894;
        Tue, 25 Nov 2025 06:42:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db756e2sm5214752e87.10.2025.11.25.06.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 06:42:17 -0800 (PST)
Date: Tue, 25 Nov 2025 16:42:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: David Heidelberg <david@ixit.cz>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>
Subject: Re: [PATCH v2 0/3] ath10k: Introduce a devicetree quirk to skip host
 cap QMI requests
Message-ID: <b7gibtoind5srjk6ncybnen3ikdvwnktg4epyzbltg7alipmex@k5zzpbnmzlso>
References: <20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz>
 <2b34ceae-5e31-4dba-93e5-3fa35754fab6@oss.qualcomm.com>
 <ttka4uevai7tzf4c3r7rgozzpd3hsdhjzf5uyysfzj24ex2o2v@r64z6pvxb6sv>
 <6a3448cf-dd18-4b3d-a8fa-fe282ee779de@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a3448cf-dd18-4b3d-a8fa-fe282ee779de@ixit.cz>
X-Authority-Analysis: v=2.4 cv=C53kCAP+ c=1 sm=1 tr=0 ts=6925c04b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8 a=pvefKgMU93j4ZQig1qcA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEyMiBTYWx0ZWRfX2LExOBtcfY1g
 G4+llqqF0QjkpXd688hDWKAVw6euqs55CZWOR+EPXjJARMXlAuI18gFOV/6sfCu9lZ13YQdTec0
 3wh+eumopEaGRV1lneVAFaEb2trxCGXaOhf+nhy65pB+jjMnjaQxAbgFDdfqFV4tKSjg64galct
 Zyj4XMYrk0eM362Ur3XFW5USRuR+oNVHj0dpcm+sCmR9W4hmE9CUvuJiWyw3LQ6Jj3cJuWuowui
 ATwkU91ay4vFSET3kzN0jSASc4SoI6jWBAgapRvg31XP658jvCKUYoln+/cfnmgCcNx/faX0r6W
 FJV6IfN5P8CM3LmvwOsv+2rhrt60FfEeKNVi5/0BsLLnHSwImHXvbWj8BUCu8wujCcdmjuP89hj
 rRGZGmXoPTMZuiMWi5pH0i+RjK4s1w==
X-Proofpoint-ORIG-GUID: _ASAh4gAOBbmolVKQIsl0jWFmjO7fq1g
X-Proofpoint-GUID: _ASAh4gAOBbmolVKQIsl0jWFmjO7fq1g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511250122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_064220_430409_7AE6973C 
X-CRM114-Status: GOOD (  21.67  )
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

On Tue, Nov 25, 2025 at 10:29:23AM +0100, David Heidelberg wrote:
> On 10/11/2025 21:41, Dmitry Baryshkov wrote:
> 
> [...]
> 
> > I think this should go to the firmware-N file. SNOC platforms now allow
> > per-platform firmware description files, so it's possible to describe
> > quirks for the particular firmware file.
> 
> Since the approach to put it into the firmware failed due to early
> initialization, see
> https://lore.kernel.org/linux-wireless/20251111-xiaomi-beryllium-firmware-v1-0-836b9c51ad86@ixit.cz/

Is it required before we load the firmware? If so, it must be clearly
explained in the commit messages. In the end, if it happens before
firmware load, there is little you can do. That was the reason why
qcom,no-msa-ready-indicator was implemented as a DT property.

> 
> I wondering if I should get back on this series?
> 
> Also, meanwhile Paul found another device [1] in need of this quirk.
> 
> David
> 
> [1] https://lore.kernel.org/all/20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org/T/#m90e8087d4388e588b71a0eff01b88f1721f73b73
> 
> > 
> > > 
> > > So I'm personally OK with this suggested approach.
> > > 
> > > /jeff
> > 
> 
> -- 
> David Heidelberg
> 

-- 
With best wishes
Dmitry

