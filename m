Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446A0CA0FF0
	for <ath10k@archiver.kernel.org>; Tue, 26 Aug 2025 15:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SwQL66e3Nu9k+2rWN9KxTqPiCmr+WouftcMZ22iOrnk=; b=EQLBy6B5NRbmzPGQTP9QV1xNuz
	n6d3uPANC7A3uwEDcYStdMZzx8EzuqoEQLVCqaJrkOg/KcUn6UxG94WrzpWzZokAWami6k6EZxDSo
	EnUsUZzNcp/4S6WJwAMlqXan4IZ5/TsZVf1Kyh7EYu/yRx60OuDfEaqVURvqm+C2enSb6pzbrQ8qW
	I/Wt6PGcuBeolOQf18RgseeuZvBiLOtIPnKvaHT3dYxghG/6WLA32K6WmFnWUIbkb11hCjLu6Nqsw
	N72OZfsvrX727UYhRxqof4mLNVzONoCGwz04U1J+/ceGMoMpGtAh2qmbboD6Dyh6JWXoRb2yiuqN4
	cv/i4y1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqvSC-0000000CQYO-18Ed;
	Tue, 26 Aug 2025 15:19:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqvS8-0000000CQWZ-2yN3
	for ath10k@lists.infradead.org;
	Tue, 26 Aug 2025 15:19:18 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q8YcTK019757
	for <ath10k@lists.infradead.org>; Tue, 26 Aug 2025 15:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SwQL66e3Nu9k+2rWN9KxTqPiCmr+WouftcMZ22iOrnk=; b=eIgUxzswlkZHaCJj
	rnGJn/nm+urEM+YqiKmfCGzN9GianKouzNyZ4SMpX/5oHoXQBdOD92gtcvaJyGHJ
	HYcIwvtBb3wL+6ClPuis+8ZugT820zeUWhxaAf/J8MFqajlb0f8yyom/5qH5LcMG
	MPAUcLqG5oXx2rNdeim+dtqRMpnKQN3VNzUkXKaqRqHcyyoEQYQ32v2vAd5GIvcj
	I/rZmy9gjqo6fhYhEZZ7aPePWpgmlf8i9yjFrk4UWnkuiUfZKWJqX5k3ICVl6duZ
	fkRGBAvgp9w8u/ByXFJ3YR7qq/jxHiPjhtl5ldeR9VJji7FtqxQDrB7rFCfZIW9A
	ZrE4EQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5uns6n9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 26 Aug 2025 15:19:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3274f7e6c1fso591380a91.0
        for <ath10k@lists.infradead.org>; Tue, 26 Aug 2025 08:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756221553; x=1756826353;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SwQL66e3Nu9k+2rWN9KxTqPiCmr+WouftcMZ22iOrnk=;
        b=Z8kDqWxo16w20VZsn9Ra6mKfVIWBS2hsv+3JGh7fkJgLfzGLp8zs465yvqIBNCLaxa
         xe7EYVFWysJAFNcQWgw0tZOuelC+cWa8wxsNAv1T5n+tBGBfduqqySkt6NMWkYmXHjmW
         FjiueFeVSJoGvi8D9bWlj4XhLCLNyH/dHwEsX97x1QFwSNkvDpTiPLo4Ss75ecB39naI
         ldUpFHwWb3xdZmsoxX7qpSOrCV/BoWyFDT4U4xZ7cMdqWYx4QdOSc34zkj3uJWnkEvt4
         CjLCtXz4CEJXyWwNBETzGOESxEKJ4AA6MDPEBvxb2IUXE0xXG8rJHzzIujI4MdMf/Sg9
         Zf+g==
X-Forwarded-Encrypted: i=1; AJvYcCUqQrFevdzi+LBJYHhojjUMTMRCQCo9MgIFpjTTV00a1K1ioj5Rrqo7U7AWuvGND+oZWg1RK6o=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ5n1WGydHf5jTcsV1Gnlp1Ywp6SJJTGn/trvCo6BtxPIyucjL
	HmiZNpWPgzbSOTBQTJ/ZYirkPdJ7H9JDQb1wGhMFG4fYgWtbv0lb5lOvxkop7CnM3+89+yUV0+E
	jU+dtFQWPUeIRmc+GTqhmsR9aaBdZ3wK9VEf2vmwmWEp2J20mSEBsn/5yoOEGsbUj
X-Gm-Gg: ASbGncuptCwAlNdaFIZKqd09bDShhWvwsyBIIf4T0wi39RnUpxOC8VsfcMMhZfM/2e3
	ZQrXhdZSaI2Yv0L5nO2MnMKFgwLtqJAcYT/wEKdtSvgF5VqrKvmUcDyIUBgGbDUobaFDTqa334C
	UBieMvja61OoK2c+X5O1+BFcXCdLG5x1B+cR3ADX/roWoasPvIjIiHQy2RubP5e4InxAztWaFH0
	oMpG5+LZtWOPzAOxLcAcQhSe6zL+c0vH2rDt0Bmjkeg7ntkajpjI3MVwPqFFLiu9rwXZNrr2T0L
	PNz1SsSmVR7x+PQNAzJH77UK4Qqrz/+SLvtWhd6vEq2/+Earf/8n/IQsuAaAYnFYpIG7SMIkpFK
	28UUKjo08NdQHvB2ScsA=
X-Received: by 2002:a17:90b:39cf:b0:325:17e1:ab69 with SMTP id 98e67ed59e1d1-32517e1b5a7mr19762816a91.3.1756221553077;
        Tue, 26 Aug 2025 08:19:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBFCqB9ocm/fFjwbsOzFsZHFiZH3GbPHYwnLpzF4CEcjFDhaSfsGGNUpwdAdtaM5f+IRrboQ==
X-Received: by 2002:a17:90b:39cf:b0:325:17e1:ab69 with SMTP id 98e67ed59e1d1-32517e1b5a7mr19762764a91.3.1756221552537;
        Tue, 26 Aug 2025 08:19:12 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3254aa708cdsm10154132a91.26.2025.08.26.08.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 08:19:12 -0700 (PDT)
Message-ID: <0993bd25-3cab-4f96-9398-bf5b5f7770cd@oss.qualcomm.com>
Date: Tue, 26 Aug 2025 08:19:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] PCI/ASPM: Return enabled ASPM states from
 pcie_aspm_enabled() API
To: manivannan.sadhasivam@oss.qualcomm.com,
        Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Nirmal Patel <nirmal.patel@linux.intel.com>,
        Jonathan Derrick <jonathan.derrick@linux.dev>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, ath11k@lists.infradead.org,
        ath10k@lists.infradead.org,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
References: <20250825-ath-aspm-fix-v2-0-61b2f2db7d89@oss.qualcomm.com>
 <20250825-ath-aspm-fix-v2-5-61b2f2db7d89@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250825-ath-aspm-fix-v2-5-61b2f2db7d89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: E2x59QhPEahCqrvLOM-S3g95IwsypjmJ
X-Proofpoint-ORIG-GUID: E2x59QhPEahCqrvLOM-S3g95IwsypjmJ
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68add072 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=guytT1_IP8q0_Fb2ReoA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfX/faGNBbkr7NA
 DLhlCaNwyoHnJNQwarPqfUQ6gTcipiidbfTa5IAgWVpHiyHvzLJCB/Q5RASJF6P1+CSC0m3VDRm
 I4lF5Q/5IfbcNy58GR9ZhRA+YIJR8zEkLzSHKBZAeBNAk+eTGOh06yI2NK3NvvGynYphahVbCJG
 e3i2WpyyXmldc7SW/UdefEtcY8NTExQRqQFhwdoqlwCWMHWcD/Cyeg3DnQ8lhdfZJfLJep6BtKR
 GvvADCZFdfTZpygz+0JppBwLfcE3CT3y666ZvpLOX+No74NGMw4T0cOtaflo/sALdwyIL8tzjqn
 BAsj0FB9h0c0alv5wXTY38cJGgxY7/SV1h6Ov0ip9rGffs1OayqOSt8YaJmD/P4i3KVCTdBSUvl
 WP2oUSW3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_081916_877493_527F4E5E 
X-CRM114-Status: UNSURE (   9.68  )
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

On 8/25/2025 10:44 AM, Manivannan Sadhasivam via B4 Relay wrote:
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1851,7 +1851,7 @@ int pci_enable_link_state(struct pci_dev *pdev, int state);
>  int pci_enable_link_state_locked(struct pci_dev *pdev, int state);
>  void pcie_no_aspm(void);
>  bool pcie_aspm_support_enabled(void);
> -bool pcie_aspm_enabled(struct pci_dev *pdev);
> +u32 pcie_aspm_enabled(struct pci_dev *pdev);
>  #else
>  static inline int pci_disable_link_state(struct pci_dev *pdev, int state)
>  { return 0; }
> @@ -1863,7 +1863,7 @@ static inline int pci_enable_link_state_locked(struct pci_dev *pdev, int state)
>  { return 0; }
>  static inline void pcie_no_aspm(void) { }
>  static inline bool pcie_aspm_support_enabled(void) { return false; }
> -static inline bool pcie_aspm_enabled(struct pci_dev *pdev) { return false; }
> +static inline u32 pcie_aspm_enabled(struct pci_dev *pdev) { return false; }

return 0?

>  #endif
>  
>  #ifdef CONFIG_HOTPLUG_PCI
> 


