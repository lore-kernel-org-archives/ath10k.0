Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F365ACDE008
	for <ath10k@archiver.kernel.org>; Fri, 26 Jun 2026 11:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TbMcTlgXVq3iWulTYE5kksxHge2wzzpefndBpLUCplw=; b=CTsKeXiGfQjqVQye54VvesKMxJ
	C5K46ODdBLIFaJhgsfvqSNZSlQpNRTxvA6e1jn3bpjDEE8FwMNEYgGRAYbeZjJvssf5qjX71nORJN
	CxXii+92D/vlu9XCCJykZnkEY51fgf0eSepVpz7wx88YF1kGf6/HKCMzbI6q9aVC4gIPb8zxPSVFA
	Gb6PilNI1vU/vPxcbxA9y7zATOpqglqYx7ks0mIFCsPo/xs8SCdL5iZKl3ZfxG39JcWd3uUBl8/vA
	yPZuPYSowMzzz+Yewhiph4MdYEiAfMIbqDeBed1pdZQ80iEkvfwVyhqlgDY9qxY8FZ1mnHvBDJrUu
	ld01RN+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4lJ-0000000BDkE-2U2d;
	Fri, 26 Jun 2026 11:30:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd4lH-0000000BDjm-25Dv
	for ath10k@lists.infradead.org;
	Fri, 26 Jun 2026 11:30:20 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QAcmhT1190057
	for <ath10k@lists.infradead.org>; Fri, 26 Jun 2026 11:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TbMcTlgXVq3iWulTYE5kksxHge2wzzpefndBpLUCplw=; b=W47d+RMwTjTeZNM7
	xMtbtiXinzbPJz87HGvheabfsgn3iVn94I2ENTawJkdofoNGG8fc4ivtY19cieHG
	aPhRmH1F3YsHIfFuvzxwXQkPPyDiNGN8W2jG35fI9XP3rT1pIeUGG2px0zMXPSC2
	th9sHWIccMnG6MinJeG0xRFQZMlrM1GNOz/g+WJXmVurl1MnrUBxgO3zXlmwd+9v
	beu6+tllmi1dq77WYXqQqTJGs5ho8iQipCRjFcEUSURA0nMftySN8DhPJmluIFa3
	NH3Qu4TVsKkljVBBKIvwwbWTgr80/uUr4k2vyMwBCuCggR4iXVAJJZU52CZd8ibd
	BSa3mg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1asku946-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 26 Jun 2026 11:30:18 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-734f236d7c2so34801137.0
        for <ath10k@lists.infradead.org>; Fri, 26 Jun 2026 04:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782473418; x=1783078218; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TbMcTlgXVq3iWulTYE5kksxHge2wzzpefndBpLUCplw=;
        b=kXq+mwSSuwweqxAmPoc5cPZRNt038XG8hll9m6WEN1Lf2yz8yNiKReJiZrQiZQR8mh
         aMBH2xOsHVDb/HmPc63M1Te5CbihKPCT2BvBI/aQueZ3ZYTek1RQMVKmeYi4081CroHJ
         K0Op87sRXowR8vYAqpQJPN9W6XB+lk/QFniucZpZHfjVm1cKiS/ypUcwD6nLTWq7l+6b
         sN47sIyveK0ukkalGv9E4Aqh71Z0bK9qArPnbbg5YwjlnPvOq8FhkVkhMgKkheAcPhh5
         wqQsbR1kTvVhovVNz1NUt5Z7+P/hprhi4rILSBIhCG7X0aReQu+St4dKOah+yQiJssdz
         vpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782473418; x=1783078218;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TbMcTlgXVq3iWulTYE5kksxHge2wzzpefndBpLUCplw=;
        b=MTv7JBdb21ef9igTxjXfyQF70anY7/XI+HN9QW11vl6zrZi6tPLH/MXIdb6pzBTVNj
         Jha3x9Z9uC9MKOpNGl+D29YorUzVxhZnJGR0E6gT8eTN0DIOMWRv+L2azQQvzR14c90n
         BmfY7+sn1jqFr1vdhDS3l3CKj0HyKfgZ6Ea5bEumIps4BeGjNa/Gjr5LtUb3/fJ/4Enq
         /R2LrmW8g2XztZCGEf4l14tK8wqYqNS5GwfnpWBix8FpGQBCj211x45Shvdv5kr/ANkP
         gaQooowSbOdSME99RSEqXnDogJYUXFH0G3PNgKoq61+JcccxJ0olNR9f4ImxJ9N5Ll65
         WaTQ==
X-Forwarded-Encrypted: i=1; AHgh+RorONP9a1/gi8RbvpygLC9MZG9Pzyh7ecb1oJKK0RA318xJZWYHhxTWOPyd7D439wniCNrbuOs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7GZ9ip+I2Ia5ANJDKtEp96SkImZAAX9I0Cc8aNlvuV+FIAbHr
	+NvZCkVLqPWlE6T5JfDrn5jmtbnfCLCa/g/gS/edypNGFz61z//Mci5erphh9iEg7kUsjoLsKZQ
	vlpWF6h1AJW50ES6T5ZpNaO8Ort8q2nv52EDqF6D6y6I0b/Kz7VHfEtvPu/xTll7Q
X-Gm-Gg: AfdE7ck1vxGQMUGd/FRkpk8TXK+pGheyWUq6bXHr/u5hwPy3C/eVe75Y0Q/GBjXsJmd
	0xoakzrKmke1rYzDdHbaX895ubQT293qEtk7Jny78+YR6/qY8SOrV/PpbZMG40uLiexv5b9Ag9q
	P65qg1YNx3DZTL9sGDvn8i4HhDmXE0VljkCZsOxd43Z/DBAQuvLNNJyaExID9C+HphNej+aZuwL
	QAdIqLpbJQo459MJjpeQMQ7TDr42pMd2uZgGWxMZDFubJ1M1e6xUqY9zoxFPyttYnBohOjH5Yq3
	AfeOvoo2Wi2YWhP8P7UFEEvlwgxEhl5k94Qvb5441gJ2/XbcEoveYiCTvzDo18zhdUH2N+M4otx
	GAo2fqInCae+ObsQ2eNruxeGXTtPzVhx9ots=
X-Received: by 2002:a05:6102:148e:b0:6c2:7d0d:e09f with SMTP id ada2fe7eead31-73433e3675amr1074144137.1.1782473417323;
        Fri, 26 Jun 2026 04:30:17 -0700 (PDT)
X-Received: by 2002:a05:6102:148e:b0:6c2:7d0d:e09f with SMTP id ada2fe7eead31-73433e3675amr1074124137.1.1782473416719;
        Fri, 26 Jun 2026 04:30:16 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f3ac4774sm2774228a12.3.2026.06.26.04.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 04:30:15 -0700 (PDT)
Message-ID: <0e0fb3af-968f-46d2-be6c-18b76c7d2a1a@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 13:30:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] dt-bindings: net: bluetooth: Document Qualcomm
 IPQ5018 Bluetooth controller
To: George Moussalem <george.moussalem@outlook.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Johannes Berg
 <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
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
        Philipp Zabel <p.zabel@pengutronix.de>, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20260625-ipq5018-bluetooth-v1-0-d999be0e04f7@outlook.com>
 <20260625-ipq5018-bluetooth-v1-4-d999be0e04f7@outlook.com>
 <20260626-discerning-light-swan-6b599c@quoll>
 <SN7PR19MB673692EBED649CF6DC9833A89DEB2@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SN7PR19MB673692EBED649CF6DC9833A89DEB2@SN7PR19MB6736.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA5MyBTYWx0ZWRfXzHZUdwlqk/CM
 /EW1Q1nQ72WUzfIx/SoRoe0fm5pFfmIy+vxRDLy3+AEOg4pvU33QuCVEkeVNLELCVF0mKjHWGqs
 1/FqvPgl337iXcRPeGaDCO4vfDlB8SY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA5MyBTYWx0ZWRfX9ES01YV5DTNb
 bx9eH7SGEjPOhMQMne0FRZIo8rcXJE4FkvzHB7JUZPr3J9Y8i6H32jPsCssRCSLaDSAq02M4EpB
 7N55k9K50Tc/V8n/+c8hwUAHW5FyaZHK2lmJzedMdOARwKeS3ghuxKHmIsCjqGcO1BP0IVa6zn3
 xLzR1t9H6SQfKA0sbV4bwMsW9gXSqj9wKVUasHpU03OU+q1kwh50hKj2LsHPYGrfgU2QBUd5xVS
 uoFuObOaDFLJ25459ELmDmLZnrD1+p3F+tAfBHxN2CxptZMxc5W9c53L8Rh2S5G4P1wzKe0J62I
 E27Kknkv8L/RnlQoi7rV5qnoVcWPDru93I6PFV3+HLXdhN31p5v/wVX3645J/f8o4iTynsmAII5
 0xlDFkVkYdfgaUCJznmHooZwkDvQHUK5h67ENUzqX8RuohcoPsuabIG08vS3zZxyB675ny2uDNz
 c5oqsij4Tp4CtRTQnQg==
X-Proofpoint-GUID: ao0eg_fIIvL-HbjnezVPwD8b-X4FpWIv
X-Proofpoint-ORIG-GUID: ao0eg_fIIvL-HbjnezVPwD8b-X4FpWIv
X-Authority-Analysis: v=2.4 cv=AMxnnMPh c=1 sm=1 tr=0 ts=6a3e62ca cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=UqCG9HQmAAAA:8 a=Q5Orqy1XeLiTHnkJztkA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_043019_663544_A03036E4 
X-CRM114-Status: GOOD (  17.30  )
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

On 6/26/26 1:20 PM, George Moussalem wrote:
> On 6/26/26 14:53, Krzysztof Kozlowski wrote:
>> On Thu, Jun 25, 2026 at 06:10:08PM +0400, George Moussalem wrote:
>>> Document the Qualcomm IPQ5018 Bluetooth controller.
>>>
>>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
>>> ---

[...]

>>> +      compatible = "qcom,ipq5018-bt";
>>> +
>>> +      qcom,ipc = <&apcs_glb 8 23>;
>>> +      interrupts = <GIC_SPI 162 IRQ_TYPE_EDGE_RISING>;
>>
>> No firmware to load?
> 
> firmware is loaded by the remoteproc in patch 1
> 
>>
>> It feels like remoteproc node split is fake. The property qcom,rproc is
>> even more supporting that case. Shouldn't this be simply one device -
>> bluetooth? What sort of two devices do you have exactly? How can I
>> identify them in the hardware?
> 
> I wasn't sure how to represent the HW. Should I make this bluetooth node
> a childnode of the rproc? Essentially, this is the transport layer
> (using shared memory space and IPC/interrupt).
> 
> Most QCA BT controllers are also childnodes of a serdev/uart node as
> they use serdev for transport.
> 
> From what I understand, it's simply BT firmware running on this
> dedicated M0 core in the SoC itself connected to an RF.

Seems like this rhymes with the WPSS remoteproc +ATH1xK_AHB situation
- the Q6 core power sequences and manages the wireless controller,
while Linux gets to drive the device as it would if it were connected
over PCIe/ UART respectively, just with MMIO writes instead.

Konrad

