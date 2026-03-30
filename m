Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF7F1061B18
	for <ath10k@archiver.kernel.org>; Mon, 30 Mar 2026 18:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jQquXf10QhX9x844aAbt/1wdTJFANl0SLZ/dDLwin4=; b=clNq/6ySvqfv3hnQ/fRIz1+UBx
	ls0gGur/pOM9YouBhp0+WOfVOazCtwj1D6fY23t/m7+MTLbyDUoGVsRn2Bh1Ewigy2eGZHF7Gvn+n
	gWgScZZVA0wLhGRKfp5dro8nfvLWETTEbeTn/V2FTByFpJV3UicZ3EmFSKupYWp8YED8mhwmlkgyp
	f5LEyMHowHZR8PCvNK2bHWRbaUg9Ujgf6VlCELWCTrLUi2mneCrrUDMaGcS3wdGVy6Ml+WtmDjwL+
	lDmkMloIVWHyYHSVc/oCV8QFcv2EtsCkxUIbkmGQ2sTJ9Lggy/l6sJmQYHGbb1w9G1lS4wcl05MYD
	8Ze/u7Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Hmj-0000000Bkni-0iCv;
	Mon, 30 Mar 2026 18:56:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Hmf-0000000BknN-1dn2
	for ath10k@lists.infradead.org;
	Mon, 30 Mar 2026 18:56:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UEDBhf1090272
	for <ath10k@lists.infradead.org>; Mon, 30 Mar 2026 18:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7jQquXf10QhX9x844aAbt/1wdTJFANl0SLZ/dDLwin4=; b=HhZAWK6cv0Nyn4LX
	LSK7kHxe7ovkOblAPIFEJ3oO2/IKSgW4CXLQfixlc3P1m3tzX6yNVSCSRe0lk/A1
	btd9VNQQgo+Ta6wfeeAtg2jBwCXaB8vzB7UZgOHtf8tKI4EyBekr2Fi0BPr2WLkJ
	XqAi0Yu8asfUbIhdY/H1KP087hIq0l29+Otv/5PlW0SvYLtDZBlUR+9DUFIpbl8b
	CmkMvz9KpgjaeSGvHDikq3KvyTIIKnVDlzJXEJSIXf1qO7jcjioB500reJVLu6uy
	8XM21xtmO5h/f/qnRx4qTYsGIzsgZzlk/NrqwOUHoDix+Mx4u/e4xMrN7Fi931BH
	zAP3Cw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7trd15g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 30 Mar 2026 18:56:19 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-128ba70cc99so3400332c88.0
        for <ath10k@lists.infradead.org>; Mon, 30 Mar 2026 11:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774896979; x=1775501779; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7jQquXf10QhX9x844aAbt/1wdTJFANl0SLZ/dDLwin4=;
        b=W36d4L4Aj03G6uWHHXyhlkz8NjsJHqs9oKYzQCsldoN2hxvrbthxDBRttXrrWLZxdl
         qAdURTfVB0yA6PbKDcUmBrUl27aT+43MrhiMVdmLm1074g47/y4pJxpC0PHeJQ9e8A57
         J3UMXKwNzow7GxNXRurccGozGTQcaquq1YYZwPSpDR35vdstiIIMVut6nxhJA1ydlKja
         qBwzX5FYDNoU85I3j9n4YU4hKpVdIR300X0uIAIgPW2UQh5ROhx6KAulGlh97H53bQHQ
         fVuW3vTXtUDzFAddQLa70b44d9mIfDDTB2lZHuQdLIciQZyYT5XjkCOR49+sWvwtHx6h
         eSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896979; x=1775501779;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7jQquXf10QhX9x844aAbt/1wdTJFANl0SLZ/dDLwin4=;
        b=OSiQMMAPIm6VaDdgxTeTJ+53a0cv7WZSWycB0Qx7qgL9Cr7W59Ihtq2sn7LO8XWUo4
         kPSaTqTSV3VcHODj+eM3DB124jRq64cWhYuK4sR86wz3h5aGaRzlb0Il+ilhIwFNk8TI
         TbJxnxOuRyo2ISoYydpIMuzHlrK/+Oq8mxhxWx15H1TaDp4+2vkXdPAoH2rW8ydqqksv
         Hr2HS/j1egvz9ANzlqEA2Fe3vHSg77ZRvqccEHEjYylc6HTssA0uMTJ8DrXJ6mC5rrfH
         dyhV8y7Ed5DND+Pww4KKrjfTgUE25uCSHuT44eZ4FKZyYwWIgQbrBfyUCG8a59pM1QIg
         Rvgg==
X-Forwarded-Encrypted: i=1; AJvYcCW1GpqDlFwS8cEg2DiAjgTFuYwJhqhsw2M5m38GMSdh6clcEkhY0TvF+MrBz3/exIszHmd2ceQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxST0q97eTCST2gva4kHN4240mXYNxOHeBaxCMdmwP3sKme/wY6
	+QzRCXe22ZTL5sR9XNjad+vfyJ9xdlGQaswy0YDatmnns/O8OwiGL+gufSfwgEnpXFvHE5JGeBI
	9lbjt/l/JlghbxOC4KS+J1SoKjO6Ke6lCCyivL1sdiOa1HrJTuWbVjSMhHvOwXWyR
X-Gm-Gg: ATEYQzzNfw+aQgXfabyY2lAtMeCTBhcDP9cKS4eeCWavmZE0VCT5HXMHveuE4eEbHow
	//AAK58iNR9lnMuRIFbKOq4Zb3rWnQ74pO/Kobf+v6T2owkesRj9oKeUNmNALQdiL4rvI8GGve7
	jlulEMn68eOz15RFP3VaRBFafKCGVXlMhw2Cp72OtxFA038mSv9y9DpKJ63AX4dqQ9BQhQHFora
	3xghw5p6QgYLfrfLwnubXweDmXhcvCOTg/xtB3bTL+sKqJv4m5+Ax72Kh9MZzf8MCvq2dhjk7Es
	EY9usc/MGAZlZ9RvSrWP0lMEt2B9NTO28EsOdfGP88YskSgmUUiXJ+AxXEX6tSquPAo7hx0IB0o
	Bo9+hd3uSmsYq/21IoHPOsELO6nrOL/r1FJtaw9cMAD2szvzwSG4KVeKOJjAApmde94STHTkbWF
	A44xSevVR/xbFuHA==
X-Received: by 2002:a05:7022:6281:b0:11b:9b98:aa4b with SMTP id a92af1059eb24-12ab2857c82mr7701499c88.6.1774896979016;
        Mon, 30 Mar 2026 11:56:19 -0700 (PDT)
X-Received: by 2002:a05:7022:6281:b0:11b:9b98:aa4b with SMTP id a92af1059eb24-12ab2857c82mr7701468c88.6.1774896978404;
        Mon, 30 Mar 2026 11:56:18 -0700 (PDT)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ac4a0fa8dsm4890474c88.15.2026.03.30.11.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 11:56:17 -0700 (PDT)
Message-ID: <fd33e4fe-8450-4076-b0cb-f09a7bb9cb11@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:56:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] ath10k: Add device-tree quirk to skip host cap QMI
 requests
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, david@ixit.cz
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        Amit Pundir
 <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
 <20260325-skip-host-cam-qmi-req-v4-2-bc08538487aa@ixit.cz>
 <c5tdbllqrxxsviv7m2i3xzweyjhetv6wbpgioddaitig3tm6or@a22uaizux6nq>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c5tdbllqrxxsviv7m2i3xzweyjhetv6wbpgioddaitig3tm6or@a22uaizux6nq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d-3I3FYdAT0UBFJX_2UpDv_0BhYVI49X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1OCBTYWx0ZWRfX3KGuTUIoIO5B
 eVpBq4ZakFubW28uwkhf6c9eEOpJBQDeK9RFbkV6ObclJqxThsfxO+eSUA54cqTYHPSistYJWlb
 9+NWXgbnM9oPoUVDOx2J1YcVs3iLg8w8R206qJhlaqjiMfD5GCxDN/WlkNVN1WCaHTWn6ZUcxtx
 O6g2kYBMBiMCKOlW1wJ0BlYFlqFDnIhpvraBCb3OEzs3qrBJp/GYms99tkKVv224jjAL8/XHYy7
 B32okrrtSqlc12JtZ5e9rDGz98j6PGz7HtA/HfC84Y8VndPCnrA7QVDKg6ezDCyWTNQtMZ9hnuy
 XB6LGIRKiqyuFswCtrtUrJ/lT/EvxYt+9Rl6sVI2URKLnW2DcK6Pn4etcaObbo2sjscTSdmGxHy
 dAYw885IB8gkh5AggweB34ebtTWkZKocEHRwAmH1n/JysRnKsstLH6IHMvlHz8D+hGD0E9r0fa/
 M8m+vrofEGRjq6y5tUw==
X-Proofpoint-ORIG-GUID: d-3I3FYdAT0UBFJX_2UpDv_0BhYVI49X
X-Authority-Analysis: v=2.4 cv=H8/WAuYi c=1 sm=1 tr=0 ts=69cac753 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qpm92PVjyM3Q2z6jdXUA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_115621_440887_061763E6 
X-CRM114-Status: GOOD (  14.14  )
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

On 3/29/2026 9:26 AM, Dmitry Baryshkov wrote:
> On Wed, Mar 25, 2026 at 06:57:16PM +0100, David Heidelberg via B4 Relay wrote:
>> From: Amit Pundir <amit.pundir@linaro.org>
>>
>> Some firmware versions do not support the host capability QMI request.
>> Since this request occurs before firmware-N.bin and board-M.bin are
>> loaded, the quirk cannot be expressed in the firmware itself.
> 
> 
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Jeff, to my knowledge this is the best approach that we have to solve
> the issue on those devices.

I'm ok with this approach.

I need DT Review or ACK on the 1/3 patch in order to bring the first 2 patches
through my ath tree.

/jeff

