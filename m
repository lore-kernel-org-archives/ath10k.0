Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A9CE7316F
	for <ath10k@archiver.kernel.org>; Mon,  2 Feb 2026 19:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tA682+q1xEwSg3W0DA7FAOnqV35V+X/ek5rDAp2W/sE=; b=OtCi21xugtb6HR0bgZ+nHrXWwS
	RwKDG7AObfOAL3d8S3UJ37LTJVEG1o0OKAS2sRAIWTEc+lmynx8ubH77WDxy0NxXr7ozKOUPIUtue
	zbO6hZZZrDHiq7BKkAWVzqpL0a3ZhO56HJUD5IyIWW1Sp2JEPfIn1PJb883F5auDgT+D7Fr/I2yTi
	ZziL/E2LegDe3vjw6AxSo50pcYcZxdpAwLFXCAAGCZs1J3Okfs1ZWmjARNb6l1chOHewLVClyomX9
	YwNqDMjFlLx31AolXdbAUb9PO39x8cRaHBIdb8VpG+As85IaOdzkN8yJN35omC2gmuB1kgGO2V4In
	8yOfzdcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzVA-00000005VUb-1npm;
	Mon, 02 Feb 2026 19:22:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzV8-00000005VUG-0b3y
	for ath10k@lists.infradead.org;
	Mon, 02 Feb 2026 19:22:23 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612CJYAg2884449
	for <ath10k@lists.infradead.org>; Mon, 2 Feb 2026 19:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tA682+q1xEwSg3W0DA7FAOnqV35V+X/ek5rDAp2W/sE=; b=eRAzMqi1odcN5DP5
	G1BG//ZQqUPO0iapHC5ZKsrE82XQsskIT3MWcj+sfh3O6+pjwPQgGHfkRGxPobeU
	zlCGn2T97TeJJWbuXp+Vx6DRPBVJfZsEwkvKagyPtLWliRFXg2dAHibBAEYVZyDS
	RIViw6S7wcPInlt9eDVBO4RRLqCn9j5WAoswdY1dcc2CIpuc2mnnOBkpzH8g5q6Q
	/rd4W/WvH81TSC2mUd1zmmvRjYi2oDm6k+IWsiDC6gppnP7rqtsgDEuMZxt52fPq
	SDWwmIuhj7tHAZrhDTfga3pXEbRmueSonTbTP29P/QYrqrprLEC/0XmWYfifu/V5
	OElPsA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2uu3hcjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 02 Feb 2026 19:22:21 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1249d001040so54075c88.1
        for <ath10k@lists.infradead.org>; Mon, 02 Feb 2026 11:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770060141; x=1770664941; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tA682+q1xEwSg3W0DA7FAOnqV35V+X/ek5rDAp2W/sE=;
        b=JqQjROsqTjCh6uo2SVOY/CkPjUDux3CuGs9TiEOVy2EeGb0BbMOxv0qYippoE0QNXa
         BY6PjLtyzbR+4Bs7nnAwlt5xbFmjr2lRQxxfLXvGJweOLnyVldmokPsmFRA8Yv2z8/4D
         1WbjFldaldHukfCRt92fVwlwGRH+CTgw279pe1s42Q6n5cXcybSh3efpa2J04zlk7SPh
         anCf5MJxgC/VhCXsc/7dD5yab7SpSnu7uU5DGyLTMBnoPNlJesXaPv5TAstqKboCbX/I
         jvrHTH0RB2quS23WR3TJ5v+BseVQu5fijkJw304trXOaykp4AGawVoXsoj0XC+3PRboP
         ZKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770060141; x=1770664941;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tA682+q1xEwSg3W0DA7FAOnqV35V+X/ek5rDAp2W/sE=;
        b=mfw/skZjgt7VRnY1axRsnvqjblzNwPw44LTLymbV3cPT2bQwtI0rjWYUwtaikECEGw
         t5L3wauXTo0VgHjo/5ndb8dMNLIB8f1ym9PKBziC+PeWCvj8jc1T/srgzb8Pf6XGOSL8
         Goh79/g+6VqAoKfibb8fG2l26gAX0ZqU9cY73at9eXXbe36xDXN69lXXa9aPh5WDb/au
         vDAvLVPTOQeUBC32tEvCgt5NwI2dzpA5d64hSfdYouX8Il4BrnSTqFNP7ot6zUA2X8AX
         qP5B0ehdXatb938JVNeWSvRwH3tCxjDZf7EeaMGT+epaN44SOuG6pY+SAc/r9d2ePFbR
         Ix+g==
X-Forwarded-Encrypted: i=1; AJvYcCUhREMD4zodtY6iXj9au/1TamMjN68uBFDn/KN09GAsfrQmVwglxWRJa1HXiNwAsc6KWdm3TD4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl030PUGW8Llsk5oBwCG9pC+E7eSj3pKgzu6wy9QKI8YlUdXH9
	CqmCZFPBUacGsbpiNq2dZ/X+R6solbIercFk+IYkNymmGKeE5TNnlGUpI12E8oTBzfhCn9ua8iG
	WpNZdDNlDXTc6iQ8Y7JjmJIpeDzuhICAwNSsvPi5DFFtVj6hsRlG73bEUkxCSX4vStwmGT6Z+
X-Gm-Gg: AZuq6aIMUeBgqifVXSuoDj0w129h8s83nXf9tcLlRIFi5zqZqTQ+dKKUYSC7rhK/w9l
	Q1TVuC+cpexRSUEosKeW1nY5eWYfeb6NlJFuUf3gWez1xQgwwhieGUsCaI4iN/tYwpeN1DDVye0
	pH1bfACwaO9qmLIJY7xLpqeafk/mkfa3fkFb9Lkf7VDiQ9O+iPn0bNVtKZHJ/y21/ii1LiYQ1/Q
	vWX/ywMuX/5YDJgfy+WS4nRXhvjMozxv2BIMb+XigqGhGnA4+NsGa/+F4F8QSMRzW7Ejg9SKEj2
	cj5rJ/JSuE5ETUTZU1w7xPymUXbu5RXRkTc/wLErSmIaVkQ91MST8InDDouhlFA8xbPZkzZPCtY
	DgVNtDrqySqrqF1+9KkrvS0t/c7vHdl5XDJOjtAl5mcUKcixXn7hf4K3ljn8ISOyCtahJCecBDG
	PIsg==
X-Received: by 2002:a05:7022:24a9:b0:11d:fbf1:1e27 with SMTP id a92af1059eb24-126ea90d304mr176762c88.19.1770060140538;
        Mon, 02 Feb 2026 11:22:20 -0800 (PST)
X-Received: by 2002:a05:7022:24a9:b0:11d:fbf1:1e27 with SMTP id a92af1059eb24-126ea90d304mr176757c88.19.1770060139967;
        Mon, 02 Feb 2026 11:22:19 -0800 (PST)
Received: from [192.168.1.40] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1adef97sm20321673eec.29.2026.02.02.11.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 11:22:19 -0800 (PST)
Message-ID: <4b33b731-f6d4-49aa-8cf1-bad59148bfab@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:22:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k-firmware: WCN3990 hw1.0: Add ECS LIVA QC710 specific BDFs
To: Val Packett <val@packett.cool>, ath10k@lists.infradead.org
References: <2f4cf929-387b-4cff-bdb1-73671b49bfa3@packett.cool>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2f4cf929-387b-4cff-bdb1-73671b49bfa3@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: d5hTf3wtmxGZucxTmaLhPx1F9y0Ec9hg
X-Authority-Analysis: v=2.4 cv=OrRCCi/t c=1 sm=1 tr=0 ts=6980f96d cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=qC_FGOx9AAAA:8
 a=0OcjPZOPgrksF1lfuBkA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: d5hTf3wtmxGZucxTmaLhPx1F9y0Ec9hg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE1MiBTYWx0ZWRfX2vF5+rmgi83G
 v4NOtOvYWUst0YsVbNuBRqRGzYEs4N+TuV27ajKdeHnvUK127tAThSgIeMFkuZEFg/+q+PnAXHg
 +J7b99LSIqaKvQIhhS0WoJmvAG6gbpfDJEF0ILO06fvgWcLe4MK61bdj/HoYO4E00EPm1fvtlIK
 qjkO8AmD9xUHrL0Hxtd+4r3KjpNHJdXckBs1CuiXrltwjUo+TiN0DWdImluu0931yKWusLSiysS
 DJkaV1sWfH5QCbYI0gXBNmh4pwXwRZystVrMLEkBNZLde8TdmwdViViRBKqB/z9jHwZfgyl2UBb
 u9fBszK9vojjy26G8pCZXmhZQMWD4Yv5aiy/rXpOGrDLOcBafTphhRVuYT1WN3b6+vjfUtKVwl9
 Mx8ZH/eBQmPm2bv84kgeJPjt6JT5KQ5BMA4saJFKsiyigvN6DS3FIA5bUGH+NtGuY59O2wP7IRt
 pZq4E9zfV0mSAZ8f54Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_112222_190302_B305304B 
X-CRM114-Status: GOOD (  12.96  )
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

On 1/11/2026 4:40 PM, Val Packett wrote:
> Hi,
> 
> this board/calibration file is for the device I'm upstreaming currently:
> https://lore.kernel.org/all/20260111085726.634091-2-val@packett.cool/
> 
> Below, the questions from wiki:
> 
> * description for what hardware this is:
>       - a mini PC / devkit based on the Snapdragon 7c Modular Platform (QSIP7180P) with the sc7180 SoC
> 
> * origin of the board file:
>       - Extracted bdwlan.b67 from the Windows driver (qcwlan7180.inf_arm64_38b56292be899426)
> 
> * ids to be used with the board files:
>       - WCN3990 hw1.0
>           + bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=ECS_QC710
> 
> * sha256sum:
>       - da2e615dea087b66889d09ab627e091710a35ce05167b0bd95cf4926196a62e1
> 
> * attach the actual board file (board.bin)
>       - done
> 
> 
> Dmesg for reference:
> 
> [   15.935995] ath10k_snoc 18800000.wifi: qmi chip_id 0x320 chip_family 0x4001 board_id 0x67 soc_id 0x400c0000
> [   15.938157] ath10k_snoc 18800000.wifi: qmi fw_version 0x322382ec fw_build_timestamp 2021-05-07 12:53 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.3.2.2.c10-00748-QCAHLSWMTPLZ-1
> [   20.958975] ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
> [   20.958999] ath10k_snoc 18800000.wifi: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
> [   20.959019] ath10k_snoc 18800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
> [   20.988128] ath10k_snoc 18800000.wifi: htt-ver 3.87 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
> 
> Thanks,
> ~val

Thanks, added to WCN3990/hw1.0/board-2.bin:

New:
bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=ECS_QC710

Changed:

Deleted:

1 board image(s) added, 0 changed, 0 deleted, 33 in total

https://git.codelinaro.org/clo/ath-firmware/ath10k-firmware/-/commit/92ebe10fcb27c2e2fe6ed8811ad779691a678333

