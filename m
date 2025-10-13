Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA31CCD184
	for <ath10k@archiver.kernel.org>; Mon, 13 Oct 2025 01:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nvhwqw+s5IRG5JJ9BC7K6h40VgHBm6MIFrG9gT1FsX4=; b=WvFeUcP9sIRtQgdT0VLN+P28Oa
	ynBKrakqYrCmPErIMasu9QQWeqHw21QgesA0kvKUyk/3aT87IxcmTSTiAW3sq/B35Axwr7tFqjcd7
	2N7CqFFhDGufS8B1+Z1rYA+hYqNGUTWOtjvidgSU5MFU1rcks8SrDUZGTZQusX96iMKvNR0l7UNU6
	OGoW+a5Pbv+AgiH2UQCqApTt5FBlwHhkfQBcneZfamt20hqdUZRGmygjW6pWEAFW65d0uOLSfKITl
	UtIAboSy0dE0yTR/MWvWTtI9VqnvEi66hj94vflKsSxi4nMmDOtbFrYkg9kXJnilJtQz/i4o04fGV
	RWXyIdBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v87hN-0000000C4IM-3Ijt;
	Mon, 13 Oct 2025 01:50:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v87hL-0000000C4Hx-2U5b
	for ath10k@lists.infradead.org;
	Mon, 13 Oct 2025 01:50:05 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CNihpZ009729
	for <ath10k@lists.infradead.org>; Mon, 13 Oct 2025 01:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nvhwqw+s5IRG5JJ9BC7K6h40VgHBm6MIFrG9gT1FsX4=; b=L+UnEtxVViFXXNyF
	LcL/vPe7PnmF86Ut4u6u+JjNaoY7cnV9LsCLKM1EgW3t1H0rCKJjxeL3wPb2JbqW
	WUNN+lV5gKCePVUmjZsl8nyc7EWq8vGyWCJXLTSwldxjQZwZg5VwW1Se72GQsWWu
	84vMbT1J1dR3dnl3fSn+rzlNeoIyRkDWi4cJkXPBvlbDoI8p7Q94kLIzan9v/efX
	sThxEzH4XDKvti/btHc3yYHToBBlXdmiC08yY/kXgz2WAZmbGJ4RtE4IR2NPKTw4
	guSiBefoQfynC+qLiBFtHiFF7ybQIjGJFm38NrYzwsoRjAMCjWM23ALAPsuZNtxF
	FofrxA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5aw98-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 13 Oct 2025 01:50:00 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b62b7af4fddso6322695a12.2
        for <ath10k@lists.infradead.org>; Sun, 12 Oct 2025 18:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760320199; x=1760924999;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nvhwqw+s5IRG5JJ9BC7K6h40VgHBm6MIFrG9gT1FsX4=;
        b=cD7gRARxrTP7O4OfCPqUcxAPooFYTvhVAVOFjDHGqId2iKc5VmHmuFkBHe0tT83vbU
         iISWvw+/pVMY4yREzexOFDsyaIctopTyhFpUdA0f5q215ZBs206jfhEcoq4QJFQ+YtCC
         tcZrheQRh5KehFUULuYBGqmtzv4XJ8QbRLu5RJ3HpftlCzbzCNHynV6yPLHY9XV3oGMv
         HLP286tc5e2Kuussvlrpc8nhiI6SSr9OOP8yS5o/HQnMRAFjpGCxjosF4dj3s2SXwR/N
         zpV4OxnQBhtPqO5i8tP0hPp+FPitJ7CkMrAPndbQRE3GfelUwgxT/VyNEySA3RE3s2Ny
         fwwQ==
X-Gm-Message-State: AOJu0YzCRVI2SdPH6fDUvP3SVJfAgXfD1X9oljEBSxTOxMitCs3nxN/q
	12WRz65xPp2isQkB6HA6v8tn6lT+RwBv7bf2g4Y8Luxy5fXxDXR/mAUU29K5Ued9GF+ySEPruve
	iZesWGQFUn7tJGTfxtgM65QW54B1VhNnbbBQFcc6lZxTsxi40zf1YOF8k4eiwjQ4v
X-Gm-Gg: ASbGnctD6P7+fHtLQ25AaMlk3JJdPGHzPYUFm9UR67KdSavtWD2tOy2mAOq00ahvm/T
	UdDqDie6qWiOWpNin35wP4fVgweCja24cwlTtn2qAY+uDCC1PF1FQrSkS7WwcmWGS7HmzFx88a6
	DouSDozDpKktalgpDjqPvtUAvjhaLXMxUSjEawSWLhMNh2bs1Pj6n9TSeZt2G1FIggOLHsRj5qx
	wUnhUUweQJHpptRPGlqe4RAiJ8phmD5Gcpezisw00FPV1UX15zug2prs0UieKHftxqDmwrtbCUq
	zonn9b8yxPbVezJWBZhYoQPg3eh/cNwwN/COCyJ9IpgR2POwGo1julCeZ8jg0OwMLNRUtuo8Zu/
	2XL1+RRV1skdgCpx9SEdDAVIncoRhUVrFAUbs
X-Received: by 2002:a05:6a20:7495:b0:2ae:fefc:feaf with SMTP id adf61e73a8af0-32da80bc78bmr26585548637.12.1760320199128;
        Sun, 12 Oct 2025 18:49:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNCl7StGWHFovArAL04kybTSuSFjARFdVOyCDRbeQYmRMBIohUKytVShRx9q0caXT0U2r/iw==
X-Received: by 2002:a05:6a20:7495:b0:2ae:fefc:feaf with SMTP id adf61e73a8af0-32da80bc78bmr26585526637.12.1760320198662;
        Sun, 12 Oct 2025 18:49:58 -0700 (PDT)
Received: from [10.133.33.61] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992dc86a93sm9635684b3a.75.2025.10.12.18.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Oct 2025 18:49:58 -0700 (PDT)
Message-ID: <aa30f484-7269-4fb9-bdd2-8b7ab75061a9@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 09:49:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff: firmware
 crashed!
To: Paul Menzel <pmenzel@molgen.mpg.de>, Jeff Johnson <jjohnson@kernel.org>
Cc: ath10k@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
        jamie@stimulussoft.com
References: <5aa2dae4-94ba-45cb-b138-bb40c89a85eb@molgen.mpg.de>
 <486e9f27-3b03-4317-a1fc-1bd92235db1c@molgen.mpg.de>
 <90a764d0-c230-43bb-b7e5-189544839f8d@quicinc.com>
 <e2e58098-4589-4ae4-bc38-6b009823b071@molgen.mpg.de>
 <82b9e966-5e12-4a13-98d4-0ffa88505f97@molgen.mpg.de>
 <d8145c41-1e61-454f-a343-be0a7239e36e@molgen.mpg.de>
 <8354f613-692e-4f6b-933c-3434a5ae90b2@oss.qualcomm.com>
 <e02b3b8b-78a3-41c7-864e-caba6f1a8c0b@molgen.mpg.de>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e02b3b8b-78a3-41c7-864e-caba6f1a8c0b@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rTFFq4CHbxJfhcHnDta5fqViTLE2asYc
X-Proofpoint-ORIG-GUID: rTFFq4CHbxJfhcHnDta5fqViTLE2asYc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX1JjuO/WsPgJl
 2P4qTuNYy9bUJSoQAfr+OSrinHhQSndKGExXZtwsRNHkSCWn4SCkdnrvYrOWFCg5XqT7xrwJ46O
 8RiqYk2BJ+d30QnIJxzcplwWf/2O0k891XvGFOwth1+IOmhydZj+ivCYVp0IMoM5/7FDVvzhb4G
 msnvV/X89xTNRU/w/2WhnxTcamTNxnwpbrEQIYfPes+XwpvD551HafMcL/Fj7OFNN4SUXPbGevx
 iJ+y+zWis103OZWFmwesxrLq1cW8yRLo3vwEDF2slXd8T72JqLxcBa8DOZbpIEyLPYOUurFtHTC
 8nbDeStr39oo1COj9qBuwyMRq9BTCEmnqQBq/15RhFb3lI11gI2XHnF0uFNRwsDQQfy6xPtGw/y
 mLFX6tBvOL/WebHdLBuaWbrb+rfJaQ==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ec5ac8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=UCfQCeL7Kw1fo_lLQ5AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_185003_817388_530B60CD 
X-CRM114-Status: GOOD (  16.34  )
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



On 10/10/2025 9:12 PM, Paul Menzel wrote:
> Dear Baochen,
> 
> 
> Am 21.07.25 um 05:21 schrieb Baochen Qiang:
> 
>> On 7/20/2025 4:43 PM, Paul Menzel wrote:
> 
>>> Am 14.05.25 um 10:08 schrieb Paul Menzel:
> 
> […]
> 
>>>> Were you or the firmware team able to pinpoint the problem, and
>>>> come up with a fix? Is there any logging I can enable to help
>>>> with debugging?
>>>
>>> It also happens with a Telekom Speedport Smart 3 (Arcadyan
>>> Corporation) router. The firmware crashed five more times since
>>> June. A reliable Wi-Fi connection would be really appreciated.
>>> Could you send me a debug firmware, so the firmware developers
>>> have it easier to fix it?
>>
>> Paul, we are working on getting legal approval on collecting
>> necessary information, such as firmware dump etc, from community.
>> Once done we will share guides to collect them to debug further.
> 
> I just wanted to know, if there was a conclusion yet.
> 

unfortunately, not yet

> 
> Kind regards,
> 
> Paul
> 
> 
> PS: I set debug_mask to 0xffffffff a while back, and it logged so much, that my old boot
> logs are gone from the systemd journal now. ;-)
> 
>     echo 0xffffffff | sudo tee /sys/module/ath10k_core/parameters/debug_mask
> 
> Any hint on what to set, when the crashes happen?

to collect core dump, you need to load ath10k with coredump_mask = 0x7

	modprobe ath10k coredump_mask = 0x7
	modprobe ath10k_pci

