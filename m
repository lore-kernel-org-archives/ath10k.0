Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A00FFCC9A6
	for <ath10k@archiver.kernel.org>; Tue, 10 Mar 2026 00:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UzZKnoilqHx4458WKUDAbi2+T8n0C2ogsIPespO3GAw=; b=D6/4jqKHnwI+XyDgH1ewhAiIev
	4X0DjPFQF3XaYkItYJv/8c/69UU4QdCDVEK2bjgEkBz0aeAANsQOIcP2aDIsbiaBPEFUjt2ShbDbh
	MWQr9B3dj08zbLotXXeoiY6dsEPDkK40TxykrPj48lcKWEFyV+uzmah8OLjcz4sjTVGokS28tcNbN
	rgbGThD1+pkKSYy6qUOx5KV22o2ZkX4RBj1+F2dJaQCFmeSNYF/+/qba4D5qJp0Vhz0m+BPXie9Cu
	BxCd38QZF6EoAmDq/kKvAK3+yu346tWL8QlQYd8+Wyr+yBqsTphAoLYf+uFbD129RlRJWo52bN8ra
	pvE8EUAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkf6-00000008OLB-01ni;
	Tue, 10 Mar 2026 00:09:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkf4-00000008OKb-29Ce
	for ath10k@bombadil.infradead.org;
	Tue, 10 Mar 2026 00:09:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UzZKnoilqHx4458WKUDAbi2+T8n0C2ogsIPespO3GAw=; b=BvMZ3v77/sfiPT9gWbKaZeTJ2q
	Osthjht8URz9XOh7JoyIDzzobEkb5Z/rS4SB+s//JG8kj3yzeN6viKLP8P0FsPpFLF9N1X5PQBBFo
	XnYrlAi3qipG7zNjPPZJDf7MFo0zwS1MFvDTGXTKVT51gG9Glv61YNwVAgHcFUmjT0iZk9xI0XwOt
	gj1W6QgzzeN14DFpYWRpIRbqDGlDUBZ1IDBBf2mZNAIv1U/vLtzj5+I0Je7cr3cMxFmEMNoN+A9y0
	Mr/LnkV3vZO40FMvdrkTpzGuXlkiFjflnG4Dzf4N8+rgsKuGB2kBodK8jVmBguTsmYTecdJiHKl7u
	RUqLVRuw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkew-0000000DOHh-43Po
	for ath10k@lists.infradead.org;
	Tue, 10 Mar 2026 00:09:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBnCK296308
	for <ath10k@lists.infradead.org>; Tue, 10 Mar 2026 00:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UzZKnoilqHx4458WKUDAbi2+T8n0C2ogsIPespO3GAw=; b=dUPs77F4pGXERTFD
	81tbz3Mys0cMxTotueTQZHr2XFKWf/Qrv0mB+kbTYqLTg6OKniVnRA7wK2D9ZVdF
	f8J3Pjfj00iYMNPne5rhQ2Ij6e0qFSEruhvUob6MWoygiBwySVHZtzb0fPGhuy+c
	r6GHvu4r2mnszOM4EqEscrBodR7PJJmf7xLXrK7WpKaOQQlEdNrjNZlHrl5mNeZb
	GLKoyRCaJLbuZT+o0k8PpI7lH83lHxqI/XwP1E4oQvNK3n7XgyibmT8jsmm2Bo5H
	FRsh7ENIQv/2QU06wGk/QKHEgYJiesvRZKtqycMfTdMbl21bIm7MhBuE6f4dWR4l
	0GkcIg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyfy1wgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 10 Mar 2026 00:09:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd76ff19d5so1427859385a.0
        for <ath10k@lists.infradead.org>; Mon, 09 Mar 2026 17:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101350; x=1773706150; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UzZKnoilqHx4458WKUDAbi2+T8n0C2ogsIPespO3GAw=;
        b=WzzbXJrqcSxHAGv4mnfrVu+oRYfNg9VEBAvhlvDqHsZlXFhjRHssDhQb9POjpR9QzY
         YgikLPIWY/pQum4/n31OdiHVbWFmBvUBgquClGc6Q1gC+1ORYZ3AIAhV1vSwcV+g5EQL
         ArY7cuWllCTXa1JLn4NxFKrI/8+QI5AL2u+qjijJXu0qtWRmU2a7lLWdLVdJHKqqHhxG
         ofMxaY8aVcDksn939+343G6RVG8gekrvH0IMIw7SpRpq4cccIiLDXrxV2f+59LgnYbWs
         kXSRKpYaz7sml0muR680iKRuiug+TzlLRo5G0LR8yqI/vFEdOg1GtNayz5BBG4CYn3Fx
         4h4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101350; x=1773706150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UzZKnoilqHx4458WKUDAbi2+T8n0C2ogsIPespO3GAw=;
        b=H9y9QdKRl/ObiQr/ZeDKCPbpq+B9dUlBdFGAg8DdzWoAo+JBXjEdc85dd/9ujJA+Q0
         lm46eFSPEt7AKZOSVoCFqmG3xpoD/hCsC6DvkgfeVNr/R0nowznil4gEvbotXoNt5mo5
         hJIC0xp+H4xsQW6De2NZbx0oFhTk8sJZGuON1wFO0Lov1NDjsn4Sv4AXaXocLGNvecTF
         ooXNvbUAurb9H9XuJdJh0SkId9wnJmVDHaHCljObNegVWd9YbY4dJDQz1slHyww7HCzY
         jkdy8VUGqkKCl/VV8Uw3RoP+QAWxpM5+PCFKFGNaaTp9UEGduDMnvyKdBbPxHXv57ols
         xA9A==
X-Forwarded-Encrypted: i=1; AJvYcCWMw8vOY84rXZ+uZdwqyyOdkV417i2mB3sdEMgdyOKC/bhzuTfvBB3km0rk+OLa1b3Z6aWpAPQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwcOKh1VeOxvX0VhIjSL1l/5IKgYcLbA/SRTtahihEazR9A25eB
	W83IIGbXx3CyOJo8rs/5hubklXBh995bYhkk7IeIU4UohUujejVrFn8/tZ4Vjn3H60/9avfyhK4
	/VC7O70REIMj5Z4bpcLFEXee7Gc0eTDryuOATsJcWgXBQDzmkFi6YUZ+zl62NGJKo
X-Gm-Gg: ATEYQzzU5LelNxfS0hXxjBXTBCQn8KF1Bps2fBGYDuWe0lLeXkn2cFZhZxY31RD34tm
	4R4EWiFJSIE1VVMrmlUmgX4NYGVwN3+Wvf+hrYBCR/u/YGZq3Zsgmeh7zkZIIDPMf2bh+Skvdxv
	j4sn7XVRaRF/e815vZSfJQ0aiFEN6O7WBk+ftolUMPisVIgSBW5JPBqAYnQwXAERYALPy0gyZ2I
	Aql14KHwyOUltZM9HfGBWsjDTlkNo+BvQQ709E28aFQmdbk9aiRmfS3Ur4HJrw9jTw2zG7xuQIh
	XQox6InIj3fxbgm8p18E7XOaoSr7A3Sxe021pCKwZfVDHKfLMvpO7w2AVVBhHqIgHAtUNGzZRgT
	yaH4S8BXmMVI1awyDanMaVUvnfReJVDESFvThjQfH/v4EHFCHMDrG3To2JVNqjVl1z3bNOT8st2
	qlov7x3X93
X-Received: by 2002:a05:620a:1485:b0:8cd:75df:f2fb with SMTP id af79cd13be357-8cd75dff685mr1012756285a.65.1773101350448;
        Mon, 09 Mar 2026 17:09:10 -0700 (PDT)
X-Received: by 2002:a05:620a:1485:b0:8cd:75df:f2fb with SMTP id af79cd13be357-8cd75dff685mr1012752685a.65.1773101349998;
        Mon, 09 Mar 2026 17:09:09 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d973sm28840297f8f.3.2026.03.09.17.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 17:09:09 -0700 (PDT)
Message-ID: <3283cbae-4100-484c-9b00-1d7111c62456@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 01:09:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/8] Group QMI service IDs into the QMI header
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
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
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <9cc7638f-1232-4cb7-b4d7-cdac66a2f4ba@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <9cc7638f-1232-4cb7-b4d7-cdac66a2f4ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfXzj8CiKvSzVDN
 dBan+2bomYaBpw1IsQuDQqKoe1Dzsc0c/7sA4B23lzx4nT0tAFWrifdox9kqB+/fJVhdC0VzkEB
 N1Cl/aeKCOp/KpALPkJupm+7vP3bB+8QYKb5tl1gKBpAy4ZZjjjWPaJALeaQGZ+7EdbltWBbbf+
 7ASJXQPUihbqfr7ubZKAPSxK9LXW4qK50Xjmz6x8iEJ47+5/ty8X6WSE5KP7qkaqV32lOArXFZw
 sGz0eF4NOOUDpJQe2EV+FNw3Ics7slOtas4wjooHMNveL9m7r89FbzI22+zhNJze5cMi0VHFtxB
 1Kk4tQNvzkcgF1UkTqeT1p3OAXhGMnX0FU81+PCCq2BQIN992k+5CE+2nBvwbG0+PB0m46t988u
 uUFcKEv8QHxDEJx6gPAIz2P3/JQcNf7UIXbUivm+QlIoH038r0ImFewSaNmTTsXVtxpOnK4DV4f
 MmuuEM/YcWhCK4cIPYQ==
X-Authority-Analysis: v=2.4 cv=OcmVzxTY c=1 sm=1 tr=0 ts=69af6128 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=H3M1aXInkkIOK4AFoC4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: AQvWePGH_53C9A9auG7nNGA9VXOjpD80
X-Proofpoint-ORIG-GUID: AQvWePGH_53C9A9auG7nNGA9VXOjpD80
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_000916_582233_463AD5FB 
X-CRM114-Status: GOOD (  18.11  )
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

On 3/10/26 00:50, Jeff Johnson wrote:
> On 3/9/2026 4:03 PM, Daniel Lezcano wrote:
>> The different subsystems implementing the QMI service protocol are
>> using their own definition of the service id. It is not a problem but
>> it results on having those duplicated with different names but the
>> same value and without consistency in their name.
>>
>> It makes more sense to unify their names and move the definitions in

[ ... ]

> prefix for wireless drivers is simply wifi: <driver>:
> so s/net: drivers: wireless:/wifi:/

Noted, thanks

>>    remoteproc: qcom: Use the unified QMI service ID instead of defining
>>      it locally
>>    slimbus: qcom-ngd-ctrl: Use the unified QMI service ID instead of
>>      defining it locally
>>    soc: qcom: pdr: Use the unified QMI service ID instead of defining it
>>      locally
>>    ALSA: usb-audio: qcom: Use the unified QMI service ID instead of
>>      defining it locally
>>    samples: qmi: Use the unified QMI service ID instead of defining it
>>      locally
>>
>>   drivers/net/ipa/ipa_qmi.c                      |  6 ++----
>>   drivers/net/wireless/ath/ath10k/qmi.c          |  2 +-
>>   drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h |  1 -
>>   drivers/net/wireless/ath/ath11k/qmi.c          |  2 +-
>>   drivers/net/wireless/ath/ath11k/qmi.h          |  1 -
>>   drivers/net/wireless/ath/ath12k/qmi.c          |  2 +-
>>   drivers/net/wireless/ath/ath12k/qmi.h          |  1 -
>>   drivers/remoteproc/qcom_sysmon.c               |  2 +-
>>   drivers/slimbus/qcom-ngd-ctrl.c                |  5 ++---
>>   drivers/soc/qcom/pdr_interface.c               |  4 ++--
>>   drivers/soc/qcom/pdr_internal.h                |  3 ---
>>   drivers/soc/qcom/qcom_pd_mapper.c              |  2 +-
>>   include/linux/soc/qcom/qmi.h                   | 12 ++++++++++++
>>   samples/qmi/qmi_sample_client.c                |  2 +-
>>   sound/usb/qcom/qc_audio_offload.c              |  2 +-
>>   sound/usb/qcom/usb_audio_qmi_v01.h             |  1 -
> 
> You are touching a lot of subsystems with a single series.
> How do you plan on having these land?
> Do you have a maintainer who will take all of these through their tree?

Yes I thought Bjorn or Konrad would take them with the acked-by from the 
different subsystems

