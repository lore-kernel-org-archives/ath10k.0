Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5954CF6C00
	for <ath10k@archiver.kernel.org>; Wed,  7 Jan 2026 08:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k43xa4VOrmCN2BiW8MUJUfR8Y0vRZWMZ5hz8NjvOgRc=; b=suXMv0qr1QCz9I5Uj/wU+/3dkJ
	ipWq/vcclBblxtE06nLCHdWJS9fPyjVbk/bwsDPlD85lMfQhB7oWUZQOzIDlstRs9WzZFM84hnCIq
	Nm+gIpIL3IOUh/OAuf7U2s9rDl2h80046Q9ARhrLjSHIW3WfF87Lz5HJ3Y4pqNrG/wa1hCYfoICqi
	bqiWY2KvRO07NRJkh5oYgsxi91Z85ZEgw08oW0yHiQeXNE3kc88rYmiP2dp/D2VdqwVqe6Ts/kP99
	uhXwPclKbJXiPSsGyP4Xmvdqiw5T6Bu5j6vBHbpzt/fcWuojj1JvZtjvRFR7+V6nnUMhVQTC6rCFV
	98OC59XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOtk-0000000EPL6-3Tmo;
	Wed, 07 Jan 2026 08:28:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOti-0000000EPKN-2kGM
	for ath10k@lists.infradead.org;
	Wed, 07 Jan 2026 08:28:07 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6074mDjM1643107
	for <ath10k@lists.infradead.org>; Wed, 7 Jan 2026 08:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k43xa4VOrmCN2BiW8MUJUfR8Y0vRZWMZ5hz8NjvOgRc=; b=IjIzlr1R3KKnDL48
	B4snHTjz6SONqjd29mx4uQZ3AvJlUhmn02XRlKxkp+RwDNmsJVBv9/es/IYnZcl0
	B94OoR6+JlMDnB3ABDSZCR4N4Sah3Eb0y5lyz0D04hjVx6VmV/XEubFket4cuE17
	CY46JeOZ1m5HwWTsCfA8dirRd5Xxf7Gq/kNq1YJU+8fVNDW+B4+K4iY/QryDH6/P
	edEe7CYGA4XR0peZ2whHfhBmUklhHzZK21BqVg4DccdxFDHnuMtjTwSbi1Fx2pnw
	hsUUL06lkeVTpphXAMXEio6Mhc54SPQhWZYGUGA17WP+P3TY/lSYNDCgRWQM40Gy
	VNqjKQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhgsfgmuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 07 Jan 2026 08:28:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6ff3de05so52088001cf.3
        for <ath10k@lists.infradead.org>; Wed, 07 Jan 2026 00:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767774485; x=1768379285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k43xa4VOrmCN2BiW8MUJUfR8Y0vRZWMZ5hz8NjvOgRc=;
        b=TT46RcbRRMPUJ/R5cPpSpgcB9tZipJyr4kqB69FzzLghm/7aNSA1fsHtcgTM15OXvo
         3R9yNFbnO9tQMKyxnQs0w/oDEjLjpitfqO/RdqZfMG39nMqB0/chRDqZFfCefGZC7+CZ
         r1s3hiHM5HpMwTzQ6+3x7WjAAgQtzNxcngxwWXSDp/NkdxTljwS3nEEw6+PsA4j3pQ4F
         4H/aRIXtzWGCA/x7rCEyzgAsHDpxtIHXUCJ6lhOnOLI0I6s75XV9KoKbeKBpaxDgZ6GW
         0K4SP3hZ9jPXZ+3zo6Qd5Zc+Oc5iY2YaZ85x/VcRqmWS5GDlAqt+yYt+QI9AlSgw/uQ3
         fl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767774485; x=1768379285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k43xa4VOrmCN2BiW8MUJUfR8Y0vRZWMZ5hz8NjvOgRc=;
        b=Sjo3HCZjSgwRZNEpmyqfdROXw79GfpClxbt+DQgJpXnAtKr1/mMgGK4tI4DXTWxO7q
         IqBa/SViuYC7y3UgEuPrrpNadYj8KQDkJKDJevm/G0OGA0MzwFJeso64rdkFH1bwsDr2
         o+PwCDbtmjKazG4Zx2zxNikPPWUmqIKI4WSgqKNls9Ekd7ojRf+8pYFsjuAen2VTJyJ2
         j3In+N7kDWNXrw3XiABlWs+7xbiVfkI3gRjatKEPuV27I8f/50fWOATzZSQJgORPge/Q
         f8R9egCjk0fHSMILYJqJsIjWaUgQElM6fvJxIrdWfDYDzWexhrrJPQ++a8a/fiz7Cyww
         zC3g==
X-Forwarded-Encrypted: i=1; AJvYcCVIDqkbyjKM3lwueX6TPUf1oKmjtC23sWkbHUenSc/UYkjxfkP0mvt5aAwSg6Wfo//jx2+fxA8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOrvVcK7RhSRxwZHLqquvI7i3wqF3sl4tlYTTkuU7dU3b7QUwT
	CWC0CCkefz6jBKg0DTSeOKLUU7xsCIG+6J/cUEiifSPf/yFEP3K/le2UUUlr9n6sa5erRAZaTVj
	uczriLVecbdb8JSxNoTxKOET9Yg51FEEV/Qh/MxvKMtkpuD3xb+PMKEJKujdmZ22E
X-Gm-Gg: AY/fxX4jTa0oZ8yXVFNHN1+mDyjGimmOq4qMqGiMAnH/ZEtGQlA8cDaC2OHeMjPN5jw
	/tVA7L5GRi89ujsB1R+uxM15Eb7mFVCykUtT6jV62hSkli31RX0qj7tordscxnOq9Nq6OYtyr2H
	lIjs3YZNGF66nl3WnVcTWkh5sAAgZMM3vVUqCi4qfvddkItHm0HrtqyRSL3eKC8uw4CDNRLPWGg
	n1AVe+uGhQe0KmFqPFhVm02NXSJnRS2/2PBlo98ffRiDqt8QIiD+6IEtjIQaofwpEaoCB6EVG0x
	bhVyO3CJod/F87gypwySVT2+nDFMuAUwOLQus7gwoACLkmgKdt9TaHLDZ6aJzZB+4Cf7vzkPYcb
	T16i/YiDWwVilF4U4w+pestiVlK3JF8kh3yn4
X-Received: by 2002:a05:622a:1b9f:b0:4ff:a40d:d2b2 with SMTP id d75a77b69052e-4ffb48636f5mr24099411cf.16.1767774484654;
        Wed, 07 Jan 2026 00:28:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH1MiIvYcTnGKSlwitEUnDPbVgoa6OjhOX+6gyCQTwvT+xhiYWDPGcJ1+Nnrt4tdoBe4eljtA==
X-Received: by 2002:a05:622a:1b9f:b0:4ff:a40d:d2b2 with SMTP id d75a77b69052e-4ffb48636f5mr24099151cf.16.1767774484256;
        Wed, 07 Jan 2026 00:28:04 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b90b:ec1:e402:4249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d865f84besm8276575e9.1.2026.01.07.00.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:28:03 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
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
        Matthias Kaehlcke <mka@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-pm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 00/14] power: sequencing: extend WCN driver to support WCN399x device
Date: Wed,  7 Jan 2026 09:28:00 +0100
Message-ID: <176777447710.14370.7888531422852179019.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
References: <20260106-wcn3990-pwrctl-v2-0-0386204328be@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA2NyBTYWx0ZWRfX8Hy/Q0Nx2mBh
 Vcu5B+lx6aTvmhh7e8t8AFL8W/NW2opdrJBVjqEvDAjKxvZRUU6ALq0I5dqSL0hcHLPF6o5m+8r
 ri/lfTLVGdIPtk5oYc5cZfHsKwL3ObBlD8UcOjMgUF7Jn2l/4Czvy5BcEsh1QngF5qlCr6CWvCz
 jfzaEMHo2ublEhemrg4By8tCMJKKHDCZ7QR6cDTmZBWMt1llOJxIlo5Uz+//lRipddVMZTHE0vz
 ifPXzmkyRSJ0RPkIhHL0PEwYnwwA71dKnyhfcmnyF9zgrqhKZ3OCadcIlQO0sT9Dj1xaiZOc7HF
 WygydAN5Fq6kI+IS9nHOItO0fNWlXdMaArfjGExXmDfsRWr1i0ooaSrcMpU8GC96yHsgLDjQxgM
 jwhdDrWhnreje6ZkN5/y4V9hT1fW83CbWAVoDqgu4bEjFX89sUQrda9I8qBZodOJEc8LTvW06ae
 grgQrfrqZmQ4tZ7UrMg==
X-Proofpoint-GUID: JpRWrxRoM0zSv7n4Ou7PxcfFq9myyDv8
X-Proofpoint-ORIG-GUID: JpRWrxRoM0zSv7n4Ou7PxcfFq9myyDv8
X-Authority-Analysis: v=2.4 cv=Abi83nXG c=1 sm=1 tr=0 ts=695e1915 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=f4exIScRoNMJIANslhQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_002806_860417_379EC5A4 
X-CRM114-Status: GOOD (  13.53  )
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


On Tue, 06 Jan 2026 03:01:10 +0200, Dmitry Baryshkov wrote:
> Qualcomm WCN3950, WCN3988 and WCN399x families of WiFi/BT chips preceed
> the later WCN / QCA devices, but they still incorporate a very simple
> PMU on die. It controls internal on-chip power networks, but, most
> importantly, it also requires a certain start-up procedure (first bring
> up VDD_IO, then bring up other voltages). In order to further unify code
> supporting different families of QCA / WCN chips and in order to
> maintain the required power up sequence, properly represent these chips
> in DTs and modify drivers to use power sequencing for these chips.
> 
> [...]

Applied, thanks!

[01/14] regulator: dt-bindings: qcom,wcn3990-pmu: describe PMUs on WCN39xx
        commit: a5fae429ec2ac72372bc874a0334a7fb9eadee83
[05/14] power: sequencing: qcom-wcn: add support for WCN39xx
        commit: 0eb85f468ef515fbd2538375ef3884f6dd376382

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

