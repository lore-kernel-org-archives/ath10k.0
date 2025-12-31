Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C3DEE642F
	for <ath10k@archiver.kernel.org>; Wed, 31 Dec 2025 12:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xz+xZs2XNmhxuGnfco4MJFSJELyf3YGCWmUww37g3ko=; b=3q9OSdS4oB28dpJgmqDa5lR12b
	bo7fWabd/nT72tf5JNIBdJkHHVMUFddw9DXqvTjyUkXcuKej6O0egFKuQXdI4VBnAI1RwCgssoKPF
	e6Ak2zrWviZxKrp2Vn+JMwKgPqehmFKA2+1AV/b+suwPsZXnDswS/Nvn6jbhm5Ry6dvsKZNRn3SL9
	gyP7tRWo9kjYVlyMZrF2Dond6gViuwBQHa6n6XfSnnaVkMNPIl9NeYN1P17xVGKUlEFuAtgvkcKsi
	zU/+3fRZDHvCR8DCioO1k7/1ZdzqEceewhJCZS3dk2uS0O5dv3kOFH+CfcqtImrE419FZf8iUOWlg
	llKmmHZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vavAr-00000005xd3-2PvF;
	Wed, 31 Dec 2025 12:19:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vavAo-00000005xcd-1b29
	for ath10k@lists.infradead.org;
	Wed, 31 Dec 2025 12:19:31 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV78RbQ2733191
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 12:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xz+xZs2XNmhxuGnfco4MJFSJELyf3YGCWmUww37g3ko=; b=SqbFdJjiHICg/tIN
	xEggnwI4mOibHhIycb28cGfoiu6ke+edR/CNYaNq6x/50ZcUqV1Pid+1IHErjiYD
	xtlpIcatn6HUYrB3UfUaC77I3TXUSOMMjyVm6ofcRIe6XLwj3AJe0d78Vbo4nYUT
	aK22TCMGj+/0mdnJ1PzMMrzehlrRn4T0uH8kWS1J1ezNwJDHuIKnsvAx2YYvAZ0Y
	zUG/GZjK6s7ur1B+ooUMcd/gnObBRPYqV54FFHkPSs64aAVzj5L1bSAwNJzhmHK3
	9WvkMlPxq5lRj645il/843Fqp1byQA1C36A2WHWhzONU75ubYJItuojOIsn7JFYw
	i6TRSA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcy6aggmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 12:19:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f34c24e2cbso35493561cf.3
        for <ath10k@lists.infradead.org>; Wed, 31 Dec 2025 04:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767183569; x=1767788369; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xz+xZs2XNmhxuGnfco4MJFSJELyf3YGCWmUww37g3ko=;
        b=TVI+vB6NshfZmc3EOaHwhzg8ZDokfTlYBAhNc6pHgwKgs/14CoblGCglWgHu2a4hLh
         2gciSH6BJQON7g07yBE68pSwegPxNU/9vhKKKJkp/5IrUdKWPkswnFmEyaqz8ZtCgUdX
         t1OKQ23Ray9MLo2+R8Ai1NBn5ImtKjdhO9Fyy4STMWRW8YzTRAkBCSBLZbt8FKU4w/Nq
         sHwDO5e9wexVeIE3xALNJb0V3I0kXYN8ARVcsedVYN67DbtProSKSblQKfXJtOyvD0Nk
         vK3XM5dDE/ZgVIgUu0rJOUdmAewJKaQigJKOPvdf/GfMX3r2BN1aBjJ0zCaO8Qpa8bmB
         3UNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767183569; x=1767788369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xz+xZs2XNmhxuGnfco4MJFSJELyf3YGCWmUww37g3ko=;
        b=WAl5PKAvB4awT1VxZmWMiBXmFOiQPRttsCRzILrlkxM1areEyh2rfW5xTbVjVr3jY0
         Igdtoy0pJREjG+OeGGK1zelb4mhUdSXLZNRpyBvxnYjTu0KAD3IyadwCuqUtv0subb7k
         CArWDVePajWdMgOfL4iL7sxdteHAhxGfegwoMTaN0F13uK+sorTa9GHbe52i1c+BMVGq
         Fks09YY9Rp7VEY/PGOBAnxVmI61IKOG12n+be055Go0jxxjlu1Q0COKF5H+s7qy4CosP
         VHelA0hK+zAAM1OsgOIUKirM4l3WFXbjQb/ZANbFsSSRfnwk8urVjQ7HgT9sqRpewCXY
         1kYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqUzbhqNQ21zOTIx+YxSlhbtw8C6leERfUWEGElzw3rwdZxmzZEJy1foR92VWAUldb0u+2Jqw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+ub+NUbooOvWsYyOdKVZ0sLPrZ6SpVUrwO+4xsQV/4dKS2ngq
	48PkUDarA0l/YF4zQTVVJMdrHN86daAxThCTcyQXMK8IpsIXBaQ/z1QUJA/97CRpDyttPMEOLEX
	aG3KGqPCcnUPNrouvWC+PswQOfkYFjf3LOvSdsHRtHcuR3bMZuHzg/UfdEDPQHf3c
X-Gm-Gg: AY/fxX4+i6imJAboUUmBIJdEWA2HK3A9TiQtuSoQSyPAB01uzbNGj22cpeR4sb6sXvf
	LgqGotrZbIrCbT+Q+cQQu46RHhOW+iG0XPztHdufc2r98l98iFgcD+jlDONGUPADGgREcphqZJB
	qQuBaVRczlqB1vlN+0/wxqC/rEmHICVvG8kM5F8QnpHrzvAg/CEE24+89v8BLoE0L9YPCKybIGy
	IKiVwAbgleg3z/OX4QNU/fR6aUjbRxo6nnxq6ZDNiZmlelX5cgKFt6ReJrDPBAQSdazD2iY2x54
	u0G0yaYTHm3uEKNMcN0xGLLCAkJIzSNmQSglEAGM/Zhn+LMu4a2vrBCEF7Pruxt4WXt/55yucuN
	R5cPgV41eMqRXa6GYgbzed5qacKD0ASB8k93D4AGy1TDQJWHGmN5W14nu8rTFGECZ8g==
X-Received: by 2002:a05:622a:1922:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-4f4b43e3a80mr373002561cf.6.1767183568707;
        Wed, 31 Dec 2025 04:19:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE17gAkMD/VQbxKbGwU9yVlfZFQ5opbRwOVwkfXCULRVa3rxvdDFea3lTOfrcxDClnLVCPsfA==
X-Received: by 2002:a05:622a:1922:b0:4f1:b3c0:2ae7 with SMTP id d75a77b69052e-4f4b43e3a80mr373002211cf.6.1767183568144;
        Wed, 31 Dec 2025 04:19:28 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91599844sm38020443a12.25.2025.12.31.04.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 04:19:26 -0800 (PST)
Message-ID: <ed3e9128-cf11-4ba7-a7f5-cac2c537c2e3@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 13:19:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/14] arm64: dts: qcom: sda660-ifc6560: describe WiFi/BT
 properly
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20251231-wcn3990-pwrctl-v1-0-1ff4d6028ad5@oss.qualcomm.com>
 <20251231-wcn3990-pwrctl-v1-12-1ff4d6028ad5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251231-wcn3990-pwrctl-v1-12-1ff4d6028ad5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: quEZ-NcO4dQrfHQYUO01mY1yoqfnqsLN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDEwOCBTYWx0ZWRfXyuVNPUdvTfvu
 wocVMxIjJfyl2SA64VHZGo1k6qVqRc44EqZFT3NztVnnuwrvxeqsHThpvYmXIIVl76tX1k5vucB
 3YoppNr8JrOpyeeWrToPB3OAl9uQx0AJdTWjQgcxrLvgE8Z+gWKjp80CTb7+ZFt4e1kl+mBN29q
 k6q6rN1Yui02bqrayPLPtRPKL0RUeinamSFrICGP39j23Z6riOttIvKUjto3djnZnk7LKqbFp/b
 mgiHJQHbCHmV+vG47xMY4aG5pZfoeJVjK+TE0fHkcpSvFzzoK4mlmtj1e+XW0OHa8rb51h+T5n3
 tK0lOMhQITmT551RDi5pZ1mVWcJbbq1TIMYlYPaxdndpOnX1knLLFSzDg9I5R6+e6iz7B1wBq0x
 7njxRIuQ1S2V5+PXFxO21MuQ1MNteMtbJwJLrOA31e2f/aLQSw0TTEiq67TxVDn2xWZvvVJCG/6
 x5tpjeYNVSDAVYaIT1A==
X-Proofpoint-GUID: quEZ-NcO4dQrfHQYUO01mY1yoqfnqsLN
X-Authority-Analysis: v=2.4 cv=J9GnLQnS c=1 sm=1 tr=0 ts=695514d1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=YN4nVyxdPvXl5XCbABQA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_041930_559594_9F59ED4C 
X-CRM114-Status: GOOD (  10.55  )
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

On 12/31/25 12:36 AM, Dmitry Baryshkov wrote:
> The onboard WiFi / BT device, WCN3990, has a simple on-chip PMU, which
> further spreads generated voltage. Describe the PMU in the device tree.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +&pm660_gpios {
> +	sw_ctrl_default: sw-ctrl-default-state {
> +		pins = "gpio5";
> +		function = "normal";
> +
> +		input-enable;
> +		bias-pull-down;

Ideally

func
(no \n)
bias-pull-down
input-enable

anyway:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

