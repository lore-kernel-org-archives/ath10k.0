Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CAAC9830D
	for <ath10k@archiver.kernel.org>; Fri, 25 Sep 2026 14:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSAwvXSu0z/cPlAloRsBK1Y8v4BwQK6DKrIQDBSZuBY=; b=CbXWDXf6053e5akrELxDz7kPrF
	84LzG2/S/br0KHxKvvE27jyq1x5UpSPgqLY3daPU495is9e5M65uYDtm0ShvaoA8aIYouIKeck1Ty
	gtTIKVUrxqp4jXHVh6wQQop5dyQSd0NvevhIcU6ap8Ev9vWrzfJLA2RZcjNRG6F1E7evtpZbL31fP
	8rPk6WuFbw1gIJzC6+PjG1t6XZG92uNlug2pU2XKLmCt79BzTfIX4f11GKgVYT9svfmA80l+YxbGl
	aBTNIwaLA0UaxNnyL9H/RUIEpeDHUpydyvK8NFxybQXKR5TUzU9RMgoq0U++kz/h0mF9g9uWNL3P7
	85pSwuNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6dT-0000000DXnc-2UtG;
	Fri, 25 Sep 2026 14:10:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6dR-0000000DXmP-01fG
	for ath10k@lists.infradead.org;
	Fri, 25 Sep 2026 14:10:46 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PE7bUJ3627530
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 14:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dSAwvXSu0z/cPlAloRsBK1Y8v4BwQK6DKrIQDBSZuBY=; b=cEW2Gr68J/yjV9hf
	LNqU2nvoxSEwn0pCeoRSzf6frVtNvyysoVE6beEu+utx8RIdLQ6B5jJxEVVPbE5f
	93BCcsH/PaWeQYpvzgoXNVGO4lcKf3r1jfpeuLKKmH6slaMbs2WbVJTa08OurNHG
	llAB2HW6DvnZi6wHmCSRIr0oLErXHCw03L4ta6aSFr2/3pRuANg4rKCaAgH9VlSO
	nDV8KAWKGzAlYZQMUu/INIy0K0r5V5efPH3tqRwD1syigBxl7w0Calqr2RjndKcU
	Nvxt+nsasLfKTVlRNC9n/DU6m30KZnpOlswyXckl5wFr0/sUz7kmjutAMtI6BGKd
	aLj7yQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq39nww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 14:10:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df8cffbdbaso5701375ad.2
        for <ath10k@lists.infradead.org>; Fri, 25 Sep 2026 07:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790345443; x=1790950243; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dSAwvXSu0z/cPlAloRsBK1Y8v4BwQK6DKrIQDBSZuBY=;
        b=HWOVzACipICf9/MGL9dqKeWKgbbmxgw5thS7Tl4Pze3bzt9ULcWkxbg3b9mlP7CfhS
         z1yhoG4QWionmZ22QCfjQlbB6eArQKi7lVNIKCkRCAEw3YA9XQWuz6TuvFUiz+JpLb0K
         2yv2e8TUpOXJ7ibCrYjf+bt2lPWCX5cK/MQVpZjVdBjw1qF34r5KJAPXy6hGorBsGBDU
         Y6o7K7Gdyb56+ZHpde/pF9raXW5M/UgqckguH35g9nMNx18yzkVP7wxPXsqE8J27FRbj
         ausB6l503dfpU2tMtBwfr3MJfOSlkGxZZK7ehr68I9syQTQZjnkbDCkE4IwZPdUtmWPH
         rhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790345443; x=1790950243;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dSAwvXSu0z/cPlAloRsBK1Y8v4BwQK6DKrIQDBSZuBY=;
        b=gxVpQRI8HNkBB321eLCy951XueQgWhVIvCE3SAkdPZckcxHG73auh9+jN0/dKfB3V8
         7GGrpwQWjBhMsXSlpmPMk7DmlyK+w1bLxBdg+qPK4F+rSoSlCfyXFGfx0mH8CIlP/YlG
         yThLlq4VSKMthEG2FuYdXRiD73q2ZxhESxb/zlCWYti9vg9+tDMVJ/7uSX+GjQNdj3UT
         Q3PpW3sFpbbFhCkdMGmlvcMDs4+U3VmIuKFe5Bycgz3LwUzsqaWk4/fK0gSGOaMBFTrE
         nEUgQLkt3Qkuj8vYNdIfhyp3C+imhBQX9WoflZ4Zq2pjq1fxqau1wvgVrhY2TpapTSQh
         YaUw==
X-Forwarded-Encrypted: i=1; AKwUvBz2zQ6LFTTafY1N8oy8nbHetbZW4GWtpFykitEMXOShyGmHZs+qS5mqK2+AzzfzSvfva6x/G3c=@lists.infradead.org
X-Gm-Message-State: AFuF++mHDYtruR0jq9sKXEq6mwn1LhrVf3VfJ+S8ptah9g/4R1ONVdbh
	R41m5onqqIpmzzSvcWano2MUhZ9KZnclCssjB4rs1AnEy0EcR0E5BKAwwAa+wLh4J17wfRWqcOA
	y1/JDZcM+Yp6ecKNFqLKcE4lytS5qzBRHr1ypELf33rneCXCdA7kdjNF7/6D9lYUs
X-Gm-Gg: AYBFou0uBXQyjZDcikuRJJS2TVpHPGcJQnSch8iXZCp6dJcnZ4cAixhduXzwljLhw4X
	aHqm6S5rPtlEtePCxxn1ffCKuuZDhAGvttuZi10znenyRnyml+wdgS57qIZqB6rx6rxSF2Hnjvx
	fQ2cPe1fdEXS2PIOPIhXdZfY5bXLMlAW2ofHcnsL9X450xzEEld14sXaRjkEUbDzb/weVC499NU
	tL+EOQDh1v7NbQUYQ+kW9ruTWelLH1qeNVTSKhrm//46znY3UMQog6fina9jsfBnqly2po0laKR
	539ReBXY9NWouQ+5rd/4j0sn589nbMRBD4O3NmmhGU0kMeWp7LmS9kUBUAXvn5fU9HwH1/lLEcK
	qDhsbzUGXCvKG/s9JrkG0tq/0GnOLoKYC9zV5AO3qAKDOPTk/Bx9/4MZXJdwu
X-Received: by 2002:a17:903:324c:b0:2dd:c100:80b5 with SMTP id d9443c01a7336-2df7e6644a0mr43024385ad.48.1790345442757;
        Fri, 25 Sep 2026 07:10:42 -0700 (PDT)
X-Received: by 2002:a17:903:324c:b0:2dd:c100:80b5 with SMTP id d9443c01a7336-2df7e6644a0mr43024015ad.48.1790345442134;
        Fri, 25 Sep 2026 07:10:42 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142969esm11450165ad.45.2026.09.25.07.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 07:10:41 -0700 (PDT)
Message-ID: <f8815dd7-1e31-4567-8f12-1b2b1dd451f7@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 07:10:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH v10 00/10] Support for block device NVMEM
 providers
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jens Axboe
 <axboe@kernel.dk>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Christoph Hellwig <hch@lst.de>,
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
 <178998281449.889291.7893229102394463283.b4-ty@kernel.org>
 <CAFEp6-2P14MdYJGuH6ygRL4ZKtLnJEj=PVMx2p+b9L1RuiX1dg@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAFEp6-2P14MdYJGuH6ygRL4ZKtLnJEj=PVMx2p+b9L1RuiX1dg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1NiBTYWx0ZWRfXzMRk5OU71uu4
 7CX57SQ1FLEr2yY/SbiJno+ws41mwUzzF2BaHp/oNk8p3w9DtoDkMwrdjnYv2bJw4r1IxGoLSks
 XdxgViNiR4e5y+aHkrvTC74rOhSsJsg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1NiBTYWx0ZWRfX4768rP+Hnfsu
 gHqdGZ/LeOewWEly2sgIKhOk0mDa3zOHeQDiw0az8Fko4piL4Yxu6EK1p2T45PYx3N9pB9wq6++
 WqWTd9QhXdgefQAVs8Nk+rpBHqO4fVjbcc+zQd5iC5EpFn4lw2kDs8+tm7G71NIngy0Jp1XWdYx
 3bGf/l+eeez8soJfNSw4/334u2xahUr0BpO54wttyIU+CZnu/kl1Po65q47Xq/GqKd7iAmhxV6L
 o33aikp0HyP355WeatizHWH0cpsG+QlB4i7Jll25Aj0J5d5igJFSKU4nfOFkzQiBBivR9ae/owA
 vzyQV0f/DNEXSXAaAXabMkZrwM6tCI/aCVJDDOC/QloKRphymTCgB6Ndfc3Nntv3153qLsLkmLA
 pzmShZRbV2wlMSuPclKfIev18HnbTC4TBHYvIssllN18kMz4cBTyubkQ8+hp60Itpri0vqy18tR
 GPMpdFOQndOS3AQPDdg==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab680e3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pXJ7akKBZDLnz8CNZxAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: OTYpW4mVy7FHGNTlazVvz6p2A8aIcoIN
X-Proofpoint-ORIG-GUID: OTYpW4mVy7FHGNTlazVvz6p2A8aIcoIN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_071045_168778_91224EEF 
X-CRM114-Status: GOOD (  13.35  )
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

On 9/25/2026 6:38 AM, Loic Poulain wrote:
> Hi Jens, Luiz,
> 
> On Mon, Sep 21, 2026 at 11:27 AM Srinivas Kandagatla <srini@kernel.org> wrote:
>>
>>
>> On Thu, 06 Aug 2026 16:38:33 +0200, Loic Poulain wrote:
>>> On embedded devices, it is common for factory provisioning to store
>>> device-specific information, such as Ethernet or WiFi MAC addresses,
>>> in a dedicated area of an eMMC partition. This avoids the need for
>>> and additional EEPROM/OTP and leverages the persistence of eMMC.
>>>
>>> One example is the Arduino UNO-Q, where the WiFi MAC address and the
>>> Bluetooth Device address are stored in the eMMC Boot1 partition.
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [04/10] nvmem: layouts: Support fixed-layout as the nvmem device node itself
>>         commit: 9c6cab93dcd47c3075d896c777567b9d8f813d18
> 
> If you're happy with the current state, would you mind picking up the
> block-related and Bluetooth-related patches in the respective trees?
> They are independent.
Should I take the following, or someone else?
[PATCH v10 02/10] dt-bindings: net: wireless: qcom,ath10k: Document NVMEM cells

/jeff

