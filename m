Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC899CD4F32
	for <ath10k@archiver.kernel.org>; Wed,  4 Sep 2024 21:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTTjo7NTFeiyi1GWoiVfJY9SrFo2k4ZD0hkZxbwH2Io=; b=njmtgvqdQuHVBnxzinXmDeRIvv
	zpaCUvSAX/XBbJhuEMSgjnz+kRU9cm6USsnC1zpZgsm90jJBBUyfrfSUFkM+kf3snIuegGmNANO+w
	4NCBu7IOJ8gTtsBF2eyL13kKAdSUCw5PJ+oB+9YhjECIrlAmsu4Gq0J1DSKK5tibBO3CyaouKAaUX
	yCsLHrIPt80zxomcmmOs6ji1OCKabvoGnW3NfRZZEsdabsJhKE8iadJSFfCiu7cCqsHoECLBJ+Tic
	DAalkLDRLEnZFNkE+RDl923mtlNTkJ+ZB46TI402xeW0bi9WmEUjUMOjDHa6KqycbydIzT3ehOt0p
	aULa6ymw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slxFV-000000065Xi-1LPk;
	Wed, 04 Sep 2024 21:09:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slxFS-000000065Wl-02nd
	for ath10k@lists.infradead.org;
	Wed, 04 Sep 2024 21:09:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484DH8rF009037;
	Wed, 4 Sep 2024 21:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QTTjo7NTFeiyi1GWoiVfJY9SrFo2k4ZD0hkZxbwH2Io=; b=cOGTKWczdmXVhNGW
	LMd4y0gLraxhkPu19vC74FNzPX6RM42ZUBILLQZNgmCQ9Tr7kcTxs+ArYmqYlaIZ
	60cwSC/Yqb8ntjXtNXRWOoqR9lMtWlmIw5jAbzkABSjKsJU+3dy6bq7Zc2KM8V8Q
	M6ENfhYVo9eo+tmMfhFrKNgS/mk21zcYSHAB9wADWXFbd6s6HLO3tBxOaTfdCKk/
	vro467ew4NVHvn2g9vxlrp3N+QVk0kv+qjWofn4KrINqcJREhX0FYCDS5ut7556a
	AsyH24A4CrzvmsV3OAs/X8MhTP80NMpiLktoClyp1BNa5Q7M6IlzS2MBhvn6tC2V
	9o70Gw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41bt67443t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 21:09:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484L91Uh005416
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 21:09:01 GMT
Received: from [10.111.180.250] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 14:09:00 -0700
Message-ID: <c9f1100c-b34a-4d77-bfbe-1e20cf4143ef@quicinc.com>
Date: Wed, 4 Sep 2024 14:09:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath10k: add USB device ID for Atheros QCA9377-7
To: Tomas Paukrt <tomaspaukrt@email.cz>
CC: <linux-wireless@vger.kernel.org>, <ath10k@lists.infradead.org>
References: <22t.ZbsX.5bWREDtSGGB.1cqQpF@seznam.cz>
 <8b7d9777-e239-4173-bec5-607e15b98130@quicinc.com>
 <56o.Zbc9.7x3xmPitckT.1csARP@seznam.cz>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <56o.Zbc9.7x3xmPitckT.1csARP@seznam.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TVWLsE-zo3Eb7Y07qoe0nBKsNjrkj_8I
X-Proofpoint-GUID: TVWLsE-zo3Eb7Y07qoe0nBKsNjrkj_8I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_19,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 suspectscore=0 phishscore=0
 mlxlogscore=708 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_140906_220892_F69D0B9F 
X-CRM114-Status: GOOD (  11.68  )
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

On 9/4/2024 11:28 AM, Tomas Paukrt wrote:
>> Also the Tested-on tag should include the firmware version information as well.
> 
> Hi Jeff,
> 
> I tested it with manually converted firmware from https://github.com/8devices/qcacld-2.0/tree/CNSS.LEA.NRT_3.0/firmware_bin/usb which does not include any explicit version.
> 
> What version should I write in the Tested-on tag in this case?

Ah, my good friend qcacld-2.0.

I'd expect to see something written to kmsg, but not sure it is there for USB.

for QMI there is: 
		ath10k_info(ar, "qmi fw_version 0x%x fw_build_timestamp %s fw_build_id %s",
			    qmi->fw_version, qmi->fw_build_timestamp, qmi->fw_build_id);

but looking at past ath10k USB changes I only see:
    Tested-on: QCA9377 hw1.0 USB 1.0.0.299

So I guess what you have is OK since this just allows you to be probed anyway
so that is actually independent of firmware version.


