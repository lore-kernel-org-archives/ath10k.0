Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9362CD4F26
	for <ath10k@archiver.kernel.org>; Fri, 26 Jun 2026 11:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efSmsLNw8E+yGzrU4i9rfMYqOeX4WnsvoEalewcGYnQ=; b=jjmtTFQiSRHeTf7O5qfyKHVFNQ
	LUg8zp3kBlmdMQ1hvN8jQKXIsgrJZWO+v3BFIe7GQAMhDFmPsTXcFFxRF5FMcaZCYAFUgmVA+DQUw
	2UF5N9/8p1cba+0SFZ1tZRSG8+plKEtokmKkvRqiMeeYY1Q3iSKcPH+3EVic7zfPkJTi5zK2yENIV
	s0cQYexklli3J8vAgXb9Dm0/VPDAD6JxBKCg93J9fm/0cBIfMcLz+iVpxHjtyrY+72hY7v96w4+Sj
	OQQqwfCGk14OQI5KUB6oBJXzs2lHTW8PTOpn7aZsG+tE5SFmfYdBM1vq/Nkzzt4Mrrzv9vA3jKpc4
	BYX9zReQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4br-0000000BCuv-2E9l;
	Fri, 26 Jun 2026 11:20:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4bp-0000000BCuP-0OT1
	for ath10k@lists.infradead.org;
	Fri, 26 Jun 2026 11:20:34 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAd3h91053620
	for <ath10k@lists.infradead.org>; Fri, 26 Jun 2026 11:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	efSmsLNw8E+yGzrU4i9rfMYqOeX4WnsvoEalewcGYnQ=; b=g1zAlDyz9+fjFEn1
	eSLwg5hGzrK6g6mloSVh46LugG7GsSngDqO0kgNgdgND6LIRSGZXWL+6k34xsLaa
	E0GaUP01R6u7FDeAt4tY85T8+QZC9Ph7N8Rei1xnQJsIR4Vaf0ua58e2H44b4Vh6
	zsRya1YcadyGXUZMluRvvhQ3xB43A6rLUrguZaV8685jFOP9gawXuLDp9oJ8QMW7
	OZ+84CuflpoD+EzVf5b1tTB+t28WxZTCyyJYKTn0OQHTifpEoRseAGg/nOsISOI3
	y0d18VYFI12DOixIFrZ37QjG1Eex9Dm9DVSgncvQo/ETUDKXO6Ar3QOaNKB6pKWH
	lA1LTg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1ngggn6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 26 Jun 2026 11:20:31 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-734fbe0e6afso30506137.3
        for <ath10k@lists.infradead.org>; Fri, 26 Jun 2026 04:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782472831; x=1783077631; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=efSmsLNw8E+yGzrU4i9rfMYqOeX4WnsvoEalewcGYnQ=;
        b=ONzbK0JXVqjBiqZbhA69v815zmkrdQnZnDeFXXkKDYdc33SukqB6Tb+wHcVgQTdCpR
         /DPgSiZ6EsSCxGNB7AopOlp14ZUYa0/TfDJSvf5GW5RKz6iwp4+K8TDSJwByDEvN0UJI
         kP6NWgcwahf/c+E+weW8edU2ramH8Sfe/6O8SCeeU7j0GALPd7gMto7B4fTWtvDGzFlB
         hl4amBmRAhVh/7ENnMy1P1Li7c5MEsX1j06X6bzOZCj4piBni/1+qhzHj8rTnVFqHV/A
         mp6bFXtvPsx2/ZDfNPo6gSwKdealS2jzRbJo9kVLnG8SF4FNRCihA4YZ7vSK/bA0rqeM
         k9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782472831; x=1783077631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=efSmsLNw8E+yGzrU4i9rfMYqOeX4WnsvoEalewcGYnQ=;
        b=n85Mnbs6Uq7bO6Sa7eXaQHpnJCisO4WcVm2erfVDjHzjQHsS0YhIkdg1vdhoEgX8zx
         nYo4zoluIdKZ4gCoN+v01EnqlbGOpnvG4NSe8fCmDVhXcuC7uXX5qPBEOSRs6/Ojeom+
         yS2G8PP9R1sZYio2V9uh47CiByBTBds+9qZBAuxF6jgWotwDUq3QDd9B4O+GV/G/wpRc
         sNaFvB12cu5EbI/SSUFEzsj20W6rAY4z9q8jtioD+/WF7rJM1/Y4YCILjpemREsfZLBg
         bujrbvu0PEBeneomIqeS72P18jEgeTIv+pWwT/GTe/VWl47OU0XRyrQQ/TUip1aRbv77
         AN8A==
X-Forwarded-Encrypted: i=1; AHgh+RqRvpXRfYbjDZ2107/o8UbBVl3OB1WufbMs7EuXE7+b0WFLJXGARC4PSQ0xKfobBCcUUevwd58=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs2c7WRp7IeyAEPW5EHmt51rYCZku4OooOyCnSIpdI75WaA/1e
	pcn1TsA2ApQPR7uCc362+dnZuQqXCXFqW2dv1TLDvm+zF5cc3XwvoQ+vw+UXqeU1M1Nc6rIo1vZ
	wuoPODM5MkY8TTlDDfPdPPFdN/0GfhRx9Tfhub2bAvfsn1/NnDjSq0JXKfFemeOVX
X-Gm-Gg: AfdE7cnki5V2oglhUdce+25U/JfplQttZt7pQY05xYzk7HFDNgoYZoOLcQtzHqPUvA5
	6vbXJrY2/BbJlSAvngfJlp11BQ3pyPbgIMQosEmbQAT4Q66jII50unGq5jfW8tZ1wRW4HGSBi3f
	+j0Hh6fzZ9x2+ZZ2a5fjX7SzmOypHIEZNatIrKVy51hol9Ym6l5fLGLzG3FBGinBOckb/LdGnbW
	ErTbD+M4jTeY4gDXhyMe+H1nED0tXG4AGusaTSPZnNtSsxTcwIdWuLBtgTH+suDHav7ztHtS5K5
	mtx2kTnyn2IJLEvOz4DiGzyU+arQy+DkMT8KFZ7DPL+V9EQFKFBXblo0L1Ue7A+KkfVz00Oy+ea
	66AxZsGbpFya4vdkMVgywR3R77GWwtRhuKCc=
X-Received: by 2002:a05:6102:148e:b0:6c2:7d0d:e09f with SMTP id ada2fe7eead31-73433e3675amr1071156137.1.1782472830788;
        Fri, 26 Jun 2026 04:20:30 -0700 (PDT)
X-Received: by 2002:a05:6102:148e:b0:6c2:7d0d:e09f with SMTP id ada2fe7eead31-73433e3675amr1071127137.1.1782472830410;
        Fri, 26 Jun 2026 04:20:30 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f3ade18esm2731485a12.7.2026.06.26.04.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 04:20:29 -0700 (PDT)
Message-ID: <38aceb33-b28e-4994-b277-de070b6dae2b@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 13:20:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] remoteproc: qcom: Add M0 BTSS secure PIL driver
To: george.moussalem@outlook.com, Jens Axboe <axboe@kernel.dk>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Saravana Kannan
 <saravanak@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260625-ipq5018-bluetooth-v1-0-d999be0e04f7@outlook.com>
 <20260625-ipq5018-bluetooth-v1-2-d999be0e04f7@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260625-ipq5018-bluetooth-v1-2-d999be0e04f7@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5MiBTYWx0ZWRfX9WvVdGqn7PJM
 zdtsGGKygHwiAGN6Ci4yjgfaYwmV/xt2rLT/MffYHcPpZ2xHmK5ei0n81j884d11to7fXC9SXJi
 eFyCqxXMld/BwJgy8MmmV+8IRJe7l4M7M44pOxbOoAxQUWPNMbUtEpAOv34jCDSCMhPRHdOMuiG
 5NgN6lgMh0bNVTI0N4F3U+5BFA2MddARvGhKkRSsVRZ9H02VO21k0pWPZa6X65DAxXXbeq/lGun
 18jPTWoVeffRlIE+awidDsJxD5yFoIscVGZoGcNQ1LhTEg/j8QPaF+PNv8oKcwc7gEFiamKypmc
 ExJ4gmpatye+RCLB9L2LTs7lleciy2iVYV3IJb7u9UZd8nOfk3kFIO5dZIc3DPCAhFF5pHjKN3B
 SqD4D7KIpe9OaxAF4tvokJTR+TX6H2uE8KdPiqCUFn/DeEfee1WByFCow64/DdUBhALYI3EmU9Y
 L6miCNWpdFj/hv7YpLw==
X-Authority-Analysis: v=2.4 cv=KNlqylFo c=1 sm=1 tr=0 ts=6a3e607f cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=UqCG9HQmAAAA:8 a=sp8NEORZx8pkfp9qRiAA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5MiBTYWx0ZWRfX/8c90rmMEG5G
 ztsbxJhsRhc0iSXbQ70giz9kst0DkxKVwel6j10JRstdPmr0ckMSGAasfyBuDP8iInHchwMrq3q
 Qfnwsgy2TFIgRM1psDkKvAX6KszeWKU=
X-Proofpoint-ORIG-GUID: Z6URR9zfnz6Wv5uokl3O2B8HaJmBXyqr
X-Proofpoint-GUID: Z6URR9zfnz6Wv5uokl3O2B8HaJmBXyqr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_042033_255613_2C6C9F68 
X-CRM114-Status: GOOD (  10.25  )
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

On 6/25/26 4:10 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add support to bring up the M0 core of the bluetooth subsystem found in
> the IPQ5018 SoC.
> 
> The signed firmware loaded is authenticated by TrustZone. If successful,
> the M0 core boots the firmware and the peripheral is taken out of reset
> using a Secure Channel Manager call to TrustZone.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Can this not fit inside the existing PAS driver?

Konrad

