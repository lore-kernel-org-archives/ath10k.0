Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F411CCF9F8
	for <ath10k@archiver.kernel.org>; Wed, 12 Nov 2025 09:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Z1U6pAv398aa8/5qwHlXbo4iyPjOxFUrccDmf5/HCc=; b=fSPUtq5mTZMGFYnzmBrYXg2oRC
	VSigpLb0s7dec6op7Jmv5YW9yeOAwMOB92oBV4HlW1QXa0JUTGEbIL9V2gHSmrY3DhERn5NVXTmPG
	ihMINfJNgN5A1BsThYDGNvJS8Tuw2B50o9fSFdA3tTwqZXlrpMdH0JV80FZTxKjnT48lG9rO20hzq
	wM7TpuY3Raadb+v99nuwSqrdbXDk8+3ciLFI1kdub+FzAXDrjlu/cwTBc9/fz/XwgjtWHAvjFenCW
	/tK0MxTVTPNLkOdv2sJGMIZ0YO9lED+cTMyzPo+NWUrxPrAtg906dXsFxS1V+PZkM541vfDTQg8Gb
	SECMRXlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6zr-00000008RdH-1ZcJ;
	Wed, 12 Nov 2025 09:18:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6zo-00000008Rc8-2n3i
	for ath10k@lists.infradead.org;
	Wed, 12 Nov 2025 09:18:33 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9CklJ510766
	for <ath10k@lists.infradead.org>; Wed, 12 Nov 2025 09:18:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Z1U6pAv398aa8/5qwHlXbo4iyPjOxFUrccDmf5/HCc=; b=M3mRdK1RR8PQNY60
	GweKj5OB6mJQfS9anE5lEstnPMnkr5UfAh/gaNwnTtqGpmGiCJMT6tcjd7c9qK4B
	n06Npwsl/bcr0LXw40fQGofnf/AHhZzy4R3Tuo9Nrv9nVGG8OyhuFgpjkq/R+UAO
	KzXT50zZ4T9qKdreR4L1xDAObsSajZ01aLywFE2KOmNeIPAZxLAVTeqURbCNphOl
	qWzmmjG2UuQHVbPiA0XF45h6XtmWFTNBcynHdR75QGuTX+UotG+kO2kDbGhw3qwt
	flYPbOPio5XHn4VvNlWJQWhX8hpC1KgIBi30zF+VUTudBNjFM26Gp8qIpij4OZYD
	2+S1ng==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqdgg0q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 12 Nov 2025 09:18:31 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-882416e9d9fso1721506d6.1
        for <ath10k@lists.infradead.org>; Wed, 12 Nov 2025 01:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762939110; x=1763543910; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Z1U6pAv398aa8/5qwHlXbo4iyPjOxFUrccDmf5/HCc=;
        b=Owx/kQ9l6+PnowlY0OV4kX8JiBacsH64cQtJ/OSJT670W/jM4rUvxZ8mc83ijkj/ZC
         /51AoJA1vaKyF9T0ydps/aokTfpX115Jkj3rqnwgCSrVJ4SHgAqP7dE0aCVGXUutGPPR
         Rd8bQLSNr1gxdCZBxUezbPWaqd7ULV/MtqjLH2NkZGJaiNSAHyMSCMBOfmHCVo6irElG
         aRkFgajGRtZyW5US7Qhbw6XVqFyDxxSLcRxQ29FpSueuV/lOUGPoBWuZ3+6brvpPXPiK
         vITz3T7gG3Y3/Z+vFU6wU4LAOioHLD0BVhDLyfbN3i9mLeeJ/iBeAGsdAtOH7Pwsq7ng
         nt0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762939110; x=1763543910;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Z1U6pAv398aa8/5qwHlXbo4iyPjOxFUrccDmf5/HCc=;
        b=Z6Iyj2MrLPLdKaSXNWh1G2mpzM8dabg/4nmKeHYYRlc54qOk88ggx+ntXoS/rwS4NF
         6dFzv4VMUtz+BvjuaDi3yqjSkA5kREKOIeA9TpCR+iPqXQoqMC/5a4M1fv4n6mvMZdj9
         L4oC5Tf5/3XCw+ZN2SvwSkeQ1ti1yxEaVlg2jDleejqox1PL0AS0JvoU/JJufqv8R038
         0ZfiNCUBL5A9VVQKa5S+TiWO2wgfDFje3NXiKK7noayYdz3Oiour5ztBbAB//OatJJ7K
         f/6jUQxTdAzme1kahruhcv0v7dm57gruRJobXvEuyBlgEgkJdqbSz9FMSK0zZGh+XuYO
         4fhw==
X-Forwarded-Encrypted: i=1; AJvYcCWcakIvIWEhWBJvp1O28Q3i/jVZMfX2v/TVgswzGgbjEYAMwhVmJnGb19q28uEPfuzTtKxg7DM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwHj5zebFwF7vPKmRGpoZTXZmDYU1Va+6ETDntpqwQHDg1Sk6/1
	tFLPuw1hY7f11dhxcjYsjpnu1F+wCIvSInnZ8VTukLdJtL4qMpL0ckzaualeDKnm+q3eTsHRYMM
	gl1kXBWkPqjiestQrCJyvbrort86V7ih6cjJO7Oztcz6D3MJcRWb4f0JpfNiw6rti
X-Gm-Gg: ASbGncuE7/YD0WdBDtpXE33a5O2Z+koCCTP0QHI6f2xcGY2c37PffstNLxGRB7McKLZ
	4orWxeg466LJf3yRTENCmNEyHC3zSHgJ0Xi4+jd2/qu+CihV/7pnw6bNv0nS6IQn7lrqanUvpBJ
	lVnh+fAI3f/WomcmcMRG2VBk85fubA8MvxUVKpTVLt9du6H9XV2WQnvBJgjvC8itbF1etGyPUL+
	l5Sfeo0gzXnAFoOZGIEgeQUcT2qCwhOnRS8YK+DO2Z5Bzq5ZYTv9RsgKP3vFOsLgqMMPYGGIvvN
	VuRVX5miUTfI6ZmVJTRpU6kZ2KjGFGdSi5jlQU4hb5leNHxFc3iZmIbLfQZH66b4FGdGNDrCNSl
	UvtW53z1GV2HFwweIqCiHxs1w0S/9NIxYbcb2+xzMMcfR28c6Uz2d/UYm
X-Received: by 2002:ac8:5808:0:b0:4ed:a8f8:307b with SMTP id d75a77b69052e-4eddba75ee9mr19583021cf.0.1762939110392;
        Wed, 12 Nov 2025 01:18:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4l5nO38ZbTUUbjYXNEyin+4V4OUbwvGEdR+rVes2WfMKu7BFS5vDlEA3PIIQEduH3Cw7aqg==
X-Received: by 2002:ac8:5808:0:b0:4ed:a8f8:307b with SMTP id d75a77b69052e-4eddba75ee9mr19582781cf.0.1762939109964;
        Wed, 12 Nov 2025 01:18:29 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d43bsm1618141566b.45.2025.11.12.01.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 01:18:29 -0800 (PST)
Message-ID: <a0c267b3-535a-4f38-9a9b-d7b141b8fc64@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 10:18:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: xiaomi-beryllium: Add firmware-name
 qualifier to WiFi node
To: David Heidelberg <david@ixit.cz>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Joel Selvaraj <foss@joelselvaraj.com>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20251111-xiaomi-beryllium-firmware-v1-0-836b9c51ad86@ixit.cz>
 <20251111-xiaomi-beryllium-firmware-v1-2-836b9c51ad86@ixit.cz>
 <wxvtfyfdso3ngqvnhvryeo2w6udoolfp46smv2r3qny2cl7n4o@iawxfnj7qtrw>
 <5c6a1434-1f43-4434-b6ed-0c5b98ee8d2b@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5c6a1434-1f43-4434-b6ed-0c5b98ee8d2b@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dtrWylg4 c=1 sm=1 tr=0 ts=691450e7 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VEnwf-grGjUPgLEjvqIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: kS7CiUdA3w0UqBcPZQPvmSHlLoequcW8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA3MyBTYWx0ZWRfXxeAyMj5RUUkz
 IrM9ZXLT+iiweuj6mD5/fAjajYT/kDsxar0ablfuLserx+4eGxn3a0K19QU5TZ3DfsVU9JR8Xax
 +Rk3hVWZxdy596Gn12by/pJTWSYvC3rtMQoMdBc0HHVcsYXy5qVDLyq5zJ45B6CRfMi9zCUFqYg
 uSE8qiRYE19WNxTFXe3iPzZTWG0mEoG7IPB4zvsDqtfTiN203HM/v5C7z7sfKdte82JMWVAvA/q
 6Qs9WCSjh2HkTAmhec3H9Qo6NU7yncIoK07iaTowezyr8bY+0BxWcgV5Gwf+t55cillzXdFu8xg
 dQMF0/ZqZa2OlAyGZVMX7eJpWhcrctdPJvr37UpT+uBXnZz8EkzMnhXBEwjaN5iLeuxgb+OT8kv
 PQ1ZFbeUtMlxFMIJIUPbfLr81Dh1gA==
X-Proofpoint-ORIG-GUID: kS7CiUdA3w0UqBcPZQPvmSHlLoequcW8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1011 adultscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_011832_775232_09D24F92 
X-CRM114-Status: GOOD (  15.87  )
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

On 11/11/25 3:23 PM, David Heidelberg wrote:
> On 11/11/2025 13:46, Dmitry Baryshkov wrote:
>> On Tue, Nov 11, 2025 at 01:34:23PM +0100, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Add firmware-name property to the WiFi device tree node to specify
>>> board-specific lookup directory.
>>>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
>>> index 785006a15e979..9b0b0446f4ad3 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
>>> @@ -631,6 +631,8 @@ &wcd9340 {
>>>   &wifi {
>>>       status = "okay";
>>>   +    firmware-name "sdm845/Xiaomi/beryllium";
>>
>> This wasn't build-tested
> 
> Sorry, I wanted to send it more like RFC to get initial feedback, I got user with Foco F1 who is willing to test the changes, so I should have new version with T-b until EOD.

Nothing in this thread seems to suggest this still awaits testing :/

Konrad

