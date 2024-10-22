Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FDAD2CE13
	for <ath10k@archiver.kernel.org>; Tue, 22 Oct 2024 17:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXcJ3K1gUdDWKdUaikl4eM2JpH/ZHoz7SeN1sxFV95o=; b=OxS3schp8w2mvDpcXrsSKU+y8T
	oPzWE36tf20MZnZVMQiXnid8aL/aWJdq2eu70M2ZTEIODEkQtYC+qn3sK875D8x122cfRskc5cI2L
	c1vqGrHLBJQGDI1EQFqHGLPZvTDZrzCDFYNP04jSdbxDvHt1iVUm7Q+ujATtpwJfwwFSase/Bax8b
	hEX2FExujKuHOIm2maSjc2cR/HMUsnr+sc0YzqWGluKTdcYhjMIrMuGZHO2z2n9+7qT+rge9vtMZw
	OFiPZWd+y99jGxbrl3uGpvZYFI/X+1XStFdOzrvYblvnusTmTlbkCGbCWiy44XIPFi1K4DVhGrokD
	j4L1mQAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3IwY-0000000Bhhr-1yTd;
	Tue, 22 Oct 2024 17:45:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Igx-0000000BeJx-1EXf
	for ath10k@lists.infradead.org;
	Tue, 22 Oct 2024 17:29:13 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49M8dGSq017132;
	Tue, 22 Oct 2024 17:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hXcJ3K1gUdDWKdUaikl4eM2JpH/ZHoz7SeN1sxFV95o=; b=hCDYOTgP2tiUIeld
	KJbsCrq3nSGKwJU5FQUfLFuXAQmfsE6CbtOBsc6mSLa8nl2WtknaCnzpAm9OV0f3
	22p5VbXw2/6rNEIxiPi7lDxNomrOSdo96FvuZtBpq+ELI0VrJ+o06kVN6/eoWqZX
	10bSRHeoEW3e54OdEIYtaOf9hv+pIo0GXe/2awBwArUgy6xff1tjwZ49CTqFqhDV
	rO0Nmktjz3E5SuxjBXQ9ffsByqROBog3OUCSg3/cLQBRvw+v4bVrng51wf3NPKHa
	6IPQjC0EtEWBih6cKg9gwsg8BEllG7vJSz78fEvQ3oOp0o1dq/X+ebClJr2xozRg
	OLpL0w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dmdqd443-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 17:29:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49MHT7G4025133
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 17:29:07 GMT
Received: from [10.48.242.6] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 22 Oct
 2024 10:29:07 -0700
Message-ID: <c5efb251-8129-4f05-b339-ed16b5e25f4b@quicinc.com>
Date: Tue, 22 Oct 2024 10:29:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k-firmware: qca9888 hw2.0 Archer C6 (EU) V2
To: =?UTF-8?Q?Martin_Kop=C3=BAn?= <vanilkovy.puding@gmail.com>,
        <ath10k@lists.infradead.org>
References: <7129c7c0-3b6c-4df1-8bb9-89d2d30e90de@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <7129c7c0-3b6c-4df1-8bb9-89d2d30e90de@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nycVYwQ1IYRfmAL3U-r7TENiD4CTYCPM
X-Proofpoint-GUID: nycVYwQ1IYRfmAL3U-r7TENiD4CTYCPM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 adultscore=0 mlxlogscore=665 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410220112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_102911_482172_E10F3201 
X-CRM114-Status: GOOD (  11.02  )
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

On 3/16/2024 11:10 AM, Martin Kopún wrote:
> Boardfile for Archer C6 (EU) V2 wifi AP.
> 5GHz wifi stopped working after flash to recent OpenWrt git version. According to the Internet the proper fix is to update board-2.bin.
> The same issue also reported for Archer C60 v1 athttps://github.com/openwrt/openwrt/issues/14541
> 
> * description for what hardware this is:
>    - it is a wifi AP, TP-Link Archer C6 (EU) V2 board
>    - qca9888 radio on 5GHz band
> 
> * origin of the board file (did you create it yourself or where you
>    downloaded)
>    - Downloaded a firmware imagehttps://static.tp-link.com/upload/firmware/2022/202208/20220810/Archer%20C6(EU)_V2_220613.zip
>    - Extracted it with binwalk -e ArcherC6v2_eu-up-ver1-3-7-P1\[20220613-rel64828\].bin
> 
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>    - "bus=pci,bmi-chip-id=0,bmi-board-id=20"

I'm reviewing the backlog of community board file contributions.

Is there a reason the variant field isn't set?

Compare with:
https://msgid.link/KL1PR0601MB4004DBF909C71C81D33629E2B7632@KL1PR0601MB4004.apcprd06.prod.outlook.com

Which specifies:
bus=pci,bmi-chip-id=0,bmi-board-id=24,variant=tp-link-archer-c6-v2-us


