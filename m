Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B24BFC43458
	for <ath10k@archiver.kernel.org>; Tue, 30 Jun 2026 11:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iu/2dveu+R9hFdVPTPFLQKVnjQWaGi/W5/Il6dZxvC8=; b=u71FwmkfZYFrV5CYseTTKphEkf
	NwOny2KPPD+Yh5aDEIXOIx6/xBtLuzGeSNY5BbLsMo4VAwjv4avLPajXohXMZ2o5CWPe3OPh6CZQx
	ZaaSp1uYsL6FViADfhSvxu2LIQK5sslU8uE2BfQJdfqTSGwVBXr9nIQPzF3nVnzK7qlmXUKd7Qcr/
	qq9bgV0uM5ReXFBvE6t2PXA3cOoQOVuiitDNBhsjRr6cZhhmGEQHVs+RrGeOxMOOLD5LO78+IXwf0
	B1UUhNPOOnTyJhjq8caBXBHSAUDVXdeCJaYS++LSu1xfdfVETeBsx7KkXeV1UnXK61ER44C8r704+
	NUlGOmPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWpd-0000000Gs5q-3Er7;
	Tue, 30 Jun 2026 11:40:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWpb-0000000Gs54-3Ar4
	for ath10k@lists.infradead.org;
	Tue, 30 Jun 2026 11:40:48 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nCxh1590619
	for <ath10k@lists.infradead.org>; Tue, 30 Jun 2026 11:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iu/2dveu+R9hFdVPTPFLQKVnjQWaGi/W5/Il6dZxvC8=; b=kDIwdl+FsDNtJWC8
	mA8UYMxOlaR6mQTOQrCTPzzl98NOGJD75VI5r0SGlAtY2XjpWNqVI/pLpdeoTsiL
	hINcd7c1y9xrJ2DVbWTL1f9FkquhGq0XubcoV0upDf/dKwZf90SF3Y2aA3Kn4kHh
	P6c/gx+ca4vdcGlJaQ7Yd+YlmnbvxwuIiVTEK/AHPez4c0wPup+KrC7chfDSssao
	YUddsNS6WWKf9QfjjCi6z2XNdUi0KIDNpKIvAyohaZ9MjM4iAXbtMttvJRwveyIO
	lfZfYreI+fmlswJrKRUisIV8RWKn67roEHK0iVfevsTZI3yrmNnofxCMZ9AcTqMv
	aoRUkg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k3aq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 30 Jun 2026 11:40:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92b79cc1f21so114242385a.1
        for <ath10k@lists.infradead.org>; Tue, 30 Jun 2026 04:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782819646; x=1783424446; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iu/2dveu+R9hFdVPTPFLQKVnjQWaGi/W5/Il6dZxvC8=;
        b=WvNhRjCCJ+02pPStNj1WUIoIXD+VCQrNkUEwM6D03L5XluZXzqYa71rgA5swTqHbdx
         M7rGArQ6GrIIFOL6KkllgKr/0rqfxBKe7d5Y4kmLwBaoJifaf8LQWtFM5HJ4oOBUDEQ2
         oH/4cHjHp7Bo1F1Dup9rogIQqpG+P4Aw5EUmU+/64rt4+qf4Q/sawZdCQt1DCEyh5WPY
         29pquFv24OrDSbRZhaYkMFLIAAf3bxcKnpybrNQpGZlcJjf+cFp0a4m7O2YtTF/AzXos
         FF8mZE5+XZhw08kd0u56EyQ79MLtxhd1tJb2SwtjOk3NryJiDVq/sUWwkPHis3MzQs08
         Oi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782819646; x=1783424446;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iu/2dveu+R9hFdVPTPFLQKVnjQWaGi/W5/Il6dZxvC8=;
        b=PIf/HzbU5MOPZPF+6n35GQS/XAL6p9GWrDUe+TEfYB3EOCQU5YTehWA2s3yOS9Zk8f
         Mo7I9Sspm+mohoITvs4kxCXz+oSig3ApYI96NBZqxH2V8Ifq4CVG2/U/DB02qKQv0YQ1
         lpi5d80Ly/bN42e+kPh0GRurtHMl8DNRN88Ro/cOVPXSuNC7oZoeGe/j6O3X+133KGwp
         yp8hRqLih2OFrEXXF4QqA5XDesToIJGhnZIscn3JLyU6jqF4CyrwOhYX+3oPNYVCTMcK
         x4JJyj0cv682LrVCnWcesygrbtec2iElubSCumaZLjCOGCxCI6podYUgrQic25r4uLWA
         BCXw==
X-Forwarded-Encrypted: i=1; AFNElJ/mFm3dMIDYieV6I0QErcJ2rcmJ5c0J4jU6Qa8g3Tg9HUMYzw6aTKoYXISjcO8eXIlb1k6q9tg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwgmAp6fQBPeeIBWfQ5jTE1PSoBxfdKK3HKkhu6RhI2EfkH426J
	M5pbQwEzUmHDK6UuGEkBY2AFWggjXpM/xGio9d22KaPRKtxjqHjPfpgfMIl7GHI99QoDdiYa3PH
	3UmXSkjO9xL3Wsnq+NPIQ9oaECY0Rs6JtuWPW+1K4f3Xon09bFXIaL2FJlWhGB6dV
X-Gm-Gg: AfdE7cm/IyCpToiAIyPb7gCVV46p5KncE3RD828rQtK2PqlvxfOnXAHFoAcGdBsxx5o
	OGyz4iw15503OUstXOej3r/h64RPxB5Ex4AyRtwLLyP2+FG4uTlCkbwGPo5sBa/ZX2wu8vWv2e0
	IPn8c9Hrw/V/vH7TLG2SjYDPamuJU6uU4iT109mgBOKKt0SomcoO+MnjxAHUFkw2KXFmT5/d6wt
	Tiubba5N+Sc4b5n6Fl5T9V875h0VMIZ5hyHNdm10EcVc0lXPEQihvo/rvSDcwCkIpjvizle6SzW
	4MudCnoijBjQDD80G0v1fL8QrBA9FMnfg3tqTr/P00PAwDaAFje4OkTkOTyGpjRx/N5oPlKCBLi
	ttm4SpIFy1w8BhN2Xf3LchrZy6zzDDq0B6nQ=
X-Received: by 2002:ac8:59d4:0:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-51c108ea935mr28923751cf.9.1782819646214;
        Tue, 30 Jun 2026 04:40:46 -0700 (PDT)
X-Received: by 2002:ac8:59d4:0:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-51c108ea935mr28923251cf.9.1782819645781;
        Tue, 30 Jun 2026 04:40:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f4c3aesm110014466b.47.2026.06.30.04.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:40:44 -0700 (PDT)
Message-ID: <f3c79cb4-02eb-4e4b-b5b4-9732876c075c@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 13:40:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: ipq5018: add nodes required for
 Bluetooth support
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
References: <20260629-ipq5018-bluetooth-v2-0-02770f03b6bb@outlook.com>
 <20260629-ipq5018-bluetooth-v2-5-02770f03b6bb@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-ipq5018-bluetooth-v2-5-02770f03b6bb@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwNyBTYWx0ZWRfXzim9YjAFDTKm
 gulC5MbwRlumjpHYAISu6PHl0jtc3eqzXGu/POo5eUJ/FGTH47vLD95IoaEAN4zd5Mm5BX6YPbQ
 mjwoTDwVsl+akW9nij1bXwnEPMO9i84=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwNyBTYWx0ZWRfX397dL4KzBg0X
 FzZM81/2eV8rDOUUDnSobrM1dIhUlOihDrISxeu0LUxezEGsXZ2Iep5/IwQSbqgo0p9s94wolBS
 REKrMh7/dWbn5P2TSQlpB8vqYEpHnLVfoOvmUSXQ37Rhy7q8y/Ar0uPufuZmxac1o7yvrVcnP9k
 7xXfA722R74fsT+Qbx+QH2c1e34r+YqB1BM7NfxuliT2cNpAqNIe9FPbTnlBGTV6/uOoHFUAlaX
 9KbfJPpZRayjOotgYd7D/qq1kMJPudGI6JQD7ijvHchOdH+25oPsrHo7V+xOwdl30cTU9MrHskL
 EFZDjyGhsk2RXVoNtbleVsVR08xcqFbcGhV3Z//mjyzpzir3ybIF0dsdGaIJre4AwvxfPTqfoLZ
 DZTGTA6/6PfrlgUIpsXYJWS5gYSIHZV3M3Q9ASvLDK3Fk0GYgvR3KqHPBv/e0CaeSXshM5T7R46
 b5llA9dkgu92EhAXpAA==
X-Proofpoint-ORIG-GUID: MaNRtADG9fYhN7Ug2L1v5PHsowc0p5a2
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a43ab3e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=UqCG9HQmAAAA:8 a=t82OjkPGvLD1vuDj7LAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: MaNRtADG9fYhN7Ug2L1v5PHsowc0p5a2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_044047_913128_5AD83CA2 
X-CRM114-Status: GOOD (  16.39  )
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

On 6/29/26 3:01 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add nodes for the reserved memory carveout and Bluetooth.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 6f8004a22a1f..65a47ba7d3a3 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -17,6 +17,23 @@ / {
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  
> +	bluetooth: bluetooth {
> +		compatible = "qcom,ipq5018-bt";
> +
> +		firmware-name = "qca/bt_fw_patch.mbn";

Is this fw vendor-signed?

Konrad

