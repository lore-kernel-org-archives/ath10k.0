Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B94D46627
	for <ath10k@archiver.kernel.org>; Thu, 15 Jan 2026 22:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RLTv/1YWn/ElIxiYzdBl6a2RnzNYFUXfvjrstlyGkzI=; b=s4M45uKo91z0bHci5sjEUFHp+a
	3Pjr3JCpqFAEkjLrJQ+H9ibk0LVzW4d8l/w9oFp9zq4ldwKSNhzGtrBXCTAAMlR2dDmqa89jyXG4c
	TtiXeV7/xG5W0O0o+BgAIgM80psvBpO/QjyRgtkcMrzosNVAIEOXMwRlehpZKe7shc1y2q3J2t1tm
	noA+uoR3Zp9uvLgTQmz+7LQLFKa4e92Iwuf7Jn0Fhk83ho2Y2NpaVSSSXKPaKeyJgm8BCjULx4XfK
	i3aDj5MPIu3fh2KJ7frD2z0zJMmZX81JgVq9zchiW+YkIKCsBjQVyIU0EVDjeLNQGCkI5Gg9a376a
	q+T25cxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgVrM-0000000DHNI-1LB1;
	Thu, 15 Jan 2026 22:30:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgVrK-0000000DHMn-1Ahq
	for ath10k@lists.infradead.org;
	Thu, 15 Jan 2026 22:30:31 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMKGDD2774363
	for <ath10k@lists.infradead.org>; Thu, 15 Jan 2026 22:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RLTv/1YWn/ElIxiYzdBl6a2RnzNYFUXfvjrstlyGkzI=; b=ZGfrPDJCgCWwJvNj
	hcP4KgxMFEL81528zd9FqBDLEDfbg8JiPI2gwhtJH+eONFYsck1FyJzBfo2laI00
	NjCEuBG5xIz2gne4zjurmMxzNMFEj+4hn193yEHjxi+E3BJqxcWhV37GYhgLZIgM
	T5YmTWjLzCDIefmbFNr/bS6ms8SO2esYb9BHlbabAoADlRpUwaWOFviFXDEfTm1X
	fl2SXfCNw6Hv7e7YAdLVIHH01FssSve4EtYDjJ37VLNJ8HAw+MeRwC56jFkvnCkM
	efbDRSL8YNBS7UOWpBnHbiglZRAvzWES3P2kx8tbkr4PK0U0G4DASYNHKlMv03u+
	331jAg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpxgn1y8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 15 Jan 2026 22:30:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2adc3990fecso1004655eec.1
        for <ath10k@lists.infradead.org>; Thu, 15 Jan 2026 14:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768516227; x=1769121027; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RLTv/1YWn/ElIxiYzdBl6a2RnzNYFUXfvjrstlyGkzI=;
        b=amLm6JqWPnuqMHaOX2N+22/Jta0s5z6XTuLtAuk0i8BNgnuKZotXbjmdA63n/hm3++
         wyTM5n+g2rjCNda+MZyl3eUSBr/RT+hhrervm6eDwfXiMOGkzVGJqQJhk5qjHcLrKdrR
         vJbRWg8Ik+QKdkfOnz2wZ9s1H4GZvnw4djo2k0YzkSpkyNe2Egp17t3kEMWAB5tzT8a7
         jV/BZS82zpV11UZK4Y3vaC4G0URHae3A9puFTFDf/k5XpDjj3/nelBEzpEjlEaZnG8OV
         RFAMsJtEf6W/MaP0rcEaRhZxKbQwrKwqDdtvCAgXwkxSEylRA08gQJcT7RK4pqz3ll8B
         1aOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768516227; x=1769121027;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLTv/1YWn/ElIxiYzdBl6a2RnzNYFUXfvjrstlyGkzI=;
        b=MxcvyR6Dhh3FauV+sBRz4lj9ubIXMzE4MDGb3cmH7rk/EzbZY8EHghWp1L81EUD8tj
         tvyGhaJCQM9kuBKhfcvTcoZjJMUhyVUaFu5kc5lH0mvzW9+2q4VJH9lw0PwvD3593Mpt
         qI49i/NHNiAsBxrfrIwitTqvSFXTc9mWqfS1iAa7AeiFsWRKAueKiYqgUhsBZ0VSN0Lj
         j65TC9gqXtMqGRV5RRPbwVPNTEUqtKFpVbt2XqX9cy4GaBEo6mEEy8GhwfvvrqjV1ZuP
         Ueqi3oOS/fx+nm92cUnMhllV1ClOuaKUNk90uMdDhE6A+7d92xqT+NK28Ax6+jyipBwo
         gkwA==
X-Forwarded-Encrypted: i=1; AJvYcCU8moKtF3OpgWbOeHmpihjyYKdxC7PK3RBig3PJfn/iI0akZndMt4NAi6QkzDsws6noAh0/wYc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2babhxUQgSnJc2GqW/Ixha+LPS1PzRLqi/zAQv9HJv+ot5aJ6
	o+xNzPQQaj27wUv2fhCcCAd3XxdZHXYEQqpqtz25vDeya2YE2NQtagDNXFRAotBnA8Btmimm03u
	KgY1KH+BhymAGuKEie8BjnG13dozibDGc2Yd87c3nOkJimRXQpleplXpoWdXH9KX9
X-Gm-Gg: AY/fxX7vroFFC8XlK06KPfc8SkZqNrr5LQxqsTLVVdcQxe5Mf/aRlsGvmOAYPv3lMbT
	gMfI2DeSL6nZooVa0E/tpD70XdA89AvkisZTTufS6MPhhh5OuKAofQOM/W5brBBhI7eEQcZZwOG
	bE25USTnZthAvZtNXfc6/TuKx70BCnzFv/4hlrx0kAi7yi6+yJTKNGrXgulBFMYAAB6mVynbDLM
	MqmtZ/VGy1iIyzqlM34J3IdZ5uF7F+694erIgRHuA+YpvUpDenwDsaM5SmAUdYJPVlZbz+YfKsH
	lWtrO9OhgVguH8OoMz+wFARsit9knAt36NnURXAGdfn6VDK/YJXHwhnX5h7OaFOWruK9wn6QhrV
	ImiDe7zfU8PwvFAs+9BrYX7rMSzIC1YWe/H76x2rwE6EsDUOnBKU4qxreC+edf+BBtJLUmAkL1v
	5P
X-Received: by 2002:a05:7300:640d:b0:2b0:487c:7aba with SMTP id 5a478bee46e88-2b66434e796mr6726480eec.21.1768516225246;
        Thu, 15 Jan 2026 14:30:25 -0800 (PST)
X-Received: by 2002:a05:7300:640d:b0:2b0:487c:7aba with SMTP id 5a478bee46e88-2b66434e796mr6726379eec.21.1768516223209;
        Thu, 15 Jan 2026 14:30:23 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b36564ffsm635436eec.28.2026.01.15.14.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 14:30:22 -0800 (PST)
Message-ID: <52b2b799-09e6-40a4-bea8-c7e8bf21cf51@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 14:30:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/14] wifi: ath10k: snoc: support powering on the
 device via pwrseq
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
 <20260106-wcn3990-pwrctl-v2-4-0386204328be@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260106-wcn3990-pwrctl-v2-4-0386204328be@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OkW3GYxtsSPH6ugNFPkdAbTw_po6ftvT
X-Proofpoint-ORIG-GUID: OkW3GYxtsSPH6ugNFPkdAbTw_po6ftvT
X-Authority-Analysis: v=2.4 cv=ANDFHcx+ c=1 sm=1 tr=0 ts=69696a83 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=L2C35plnZqJTIQ-6vfsA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE3NyBTYWx0ZWRfX0xBVu3l74VSt
 PpX6BSBOcMoE1V/zxjSc1oj67HJf6n9DiBvkJPGycHp/AmCLH4rcXXBKCL4acMkMHWgckN4Oh/A
 QmKC78/RKFMGn3TiCxUh29sXy++CpS09hlHGiA1/4RK5p2kZJfPrc14mCLccJMjbGemuvBJaIVE
 982ebgqYwLEWpvinErDsQxsHIaqd+7FNikuc79QgcnnbjblFOa/KPlOkGORx5K9Y+UVkHdIw9PU
 /6aJW+NV2ez2D0n/WwiZSKTyyJBBAshlVIRJnGTwH3n1UDuwU6tSNHe5QYyPw8YJAqQjj1Q6siT
 Pmlr9MBOxQ1xOd8+r/7dpyBdNPtwstx05h4Emd/CRr+VwiGW6R08gJsn8zn34U2ggV+nKjVz6+V
 JnBlqxx6kdhfDFIYTRnrCEoaRR2bAh/+eZiLNjSs8HmXTsymxq5Fo4av3MnKhdLfRPB9WfjX+d+
 74+RJ+slZbLU8KSW3LQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_143030_478113_CC8A02EA 
X-CRM114-Status: GOOD (  10.51  )
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

On 1/5/2026 5:01 PM, Dmitry Baryshkov wrote:
> The WCN39xx family of WiFi/BT chips incorporates a simple PMU, spreading
> voltages over internal rails. Implement support for using powersequencer
> for this family of ATH10k devices in addition to using regulators.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/snoc.c | 54 ++++++++++++++++++++++++++++++++--
>  drivers/net/wireless/ath/ath10k/snoc.h |  2 ++

My automation flagged:
* drivers/net/wireless/ath/ath10k/snoc.c has no QTI copyright
* drivers/net/wireless/ath/ath10k/snoc.h has no QTI copyright
* 2 copyright issues

I'll add these manually in my 'pending' branch

/jeff

