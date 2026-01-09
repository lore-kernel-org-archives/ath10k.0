Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3989DD26D60
	for <ath10k@archiver.kernel.org>; Fri,  9 Jan 2026 15:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHa/kWbVVsFh5MJgGzVqkCaAwCD43l/Fqd48BAH3J7Y=; b=wJ4tVcX/UL7f6yIjNhH0nx+X21
	4BaDmH7hvzl5L9FxzwSmgs9Vv7X6GP1RxNxi55l1YruzD1fd3BLT2Mrv6WkLezsZvEPnNumyjOMo3
	juGohClXGNP4J7UvVYAUX/evcMQ1bBbPnlzgfQ0MXlHtB0RNDGOc0prQS+uzOaAx0VofS2igpL2Si
	QQ70nCa3ALPQQoFbCtVmjVnFxSM0lE6iu7NRfaTuYeoTwL2IVcZEuG9MONVd5plzz/M3BUSHYG8FM
	Xtx437cmCynQJHRPW7Ja+faBqtuKFg9tRlZV+lAOqUGfsJNvdg2U7EYpn1hsVR7GsoF3X/YnfN8za
	OyB3JTjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEg1-00000002WXD-3zVn;
	Fri, 09 Jan 2026 15:45:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEfz-00000002WWC-0EkD
	for ath10k@lists.infradead.org;
	Fri, 09 Jan 2026 15:45:24 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 609CkAx63542035
	for <ath10k@lists.infradead.org>; Fri, 9 Jan 2026 15:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nHa/kWbVVsFh5MJgGzVqkCaAwCD43l/Fqd48BAH3J7Y=; b=RJ0nPA9LGlMRIOVg
	EmrvOIQzmtGHJJn/gjY4ekKt9LrISXnDZXMfMUCq0HT66grayhQ4lqgxIHESvO5z
	AFkR1fk+y50g92ALvixMZ+D6iXGph4q/oSvrHWuHNRJiyECopqR29YV3FMLLCA10
	rSPNxdzaj4EclGO9I9NsLjKNeX6eZIX72L2TnMDguACr/rmo0uEKL/hEqxXmIUhN
	GqvpvE3BLvHZ0TUqx66rUsY1zMm0Fki8WmYkIFgX+lhXNnnN7cu5e7GLolwlnT9M
	6c/9Ue/vhx9bBwqBnzFilZrDWpThta6qqZM8nKCh02iHwfkCzl7TNI/hnMNBmxFB
	l+mvlw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bju6b1scd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 09 Jan 2026 15:45:21 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-11f3b54cfdeso2228244c88.1
        for <ath10k@lists.infradead.org>; Fri, 09 Jan 2026 07:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767973521; x=1768578321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHa/kWbVVsFh5MJgGzVqkCaAwCD43l/Fqd48BAH3J7Y=;
        b=gNHPTmwbFMEOtbsTnV7jUoxPdVW7UeTF1Dsr0Iy2hPVdjpfy2p1UpctgtLYr286VKZ
         Eu+EIBd1U75Fwavgq9JIJkNMz++7iJnpV1o/fJtUS9iQA9GNjByAcazZcpFdFL0B6QtM
         OPnRiMX4uj0lX2BEigMg8h7uveMjpDu73Usp2c6tHAXjLO2kyX80w2C1BbMkN1rlgFpG
         QgpzxZtu35nKfDs1LPNcjaakNLVdPd+d+DyGy1Oqc6j2nD3FDNHXbMWwoLiVsMU2FPSo
         t7yn8tz7a99FepdxzsdQiAU3IG9W/6YK481194qtvBx0UJ6iE18SKAFqt7fZtNSzxpTG
         7VKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767973521; x=1768578321;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nHa/kWbVVsFh5MJgGzVqkCaAwCD43l/Fqd48BAH3J7Y=;
        b=T8P6qG3KP8ih7Ujan4cowHwJPoyV+gWn9+HIjRThddPsc4errsZYTSOh0pNHghTWo3
         PgdnTmTUyxzFDjthQkJhTmPZKbN5wySQ00nnyy2lFz37DoZAxY8hlJ2CQjb9yvge/vQV
         dWFqYwQQpftmllZpqi53HuUGExUIaGjXyS3Z6nsiX1XL3CCgxLgMqclKscdHyoH9bvsd
         MrKWKtFug4mQSjO/aJkjzBfiWpnUqesij7sJyExXTz75BHeFzEiA5UJMT+GV08WK0gcc
         5NpoDtDMo4hW7SqVjngqYTrP4k1Z/I4zakkMlMAQKcP64Q338u7jB1v2qzjslJLNNvmy
         XIgw==
X-Forwarded-Encrypted: i=1; AJvYcCU8w0dlQvMTMowe+QAUPiGgE1q8WP4a6+aW1Uhq9jbfHCPOzqKKcadLIahtLytphw+aVl94tnw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyioVqzAfBNGrL/M/MkRvELaWU9aeGe6LhnVPfXH/FSjZQsC0Fi
	VBjb0BQTMW2st2CKn1g92kZ0Vrv+9V37l2S7QnIuww7IX2nxUExPmtkixG9CkqUZ9jX//hMpPbj
	xci/LEI8qRb12L+yDt4qCnnVVi0mn3OfbgzvSqePpF2hw1As1vPtYBhZQGcBNQ6Ks
X-Gm-Gg: AY/fxX5jm/patFauSozTlw9SFjdFKN1AwbQ7jRPU4GL8/Q4lsmbUk1DlLxhrb9DgeW3
	21jiW8wMJb3OU4MOq4RX4WAVCXCXS3CsUF/HGhdC6r4KrKICEVdvGVoapAZfgmNkhqnHHNI83pf
	5UFwSr2To2jP0oKELo6Z1VGdHDAu/D854bd28pfdPSc1wuJk60EUuDV/OhbpdJISnupE+MABT1k
	S47etnJe7bVhym19VvPcYAfjeADZ6oSmhlIi1xK/MMD8rd8clpd+//oijXw5MThoeYuBNJbt9RO
	dI/HTPnduz+TTgC6spNSE6bJeNP919JRlDSoj6e74URNVXL7cimHq0W9zfyzUHkN6ce8jptVeDt
	59sKUXhTTCsARZCFZG8WNSxTNxty6B2QdmdOIkuDl3jLPXz7sqG0Jfnenn2XYRBPo
X-Received: by 2002:a05:7022:d4d:b0:119:e56b:98a7 with SMTP id a92af1059eb24-121f8b0e570mr6528114c88.14.1767973520692;
        Fri, 09 Jan 2026 07:45:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyfybUnTYXdEVn7jn2X0VrvpXDZNh8Xo7RoiuvPAkiVw8+WZXLaMsesD2RtWgTmwgmYfJ9Cw==
X-Received: by 2002:a05:7022:d4d:b0:119:e56b:98a7 with SMTP id a92af1059eb24-121f8b0e570mr6528090c88.14.1767973520160;
        Fri, 09 Jan 2026 07:45:20 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b17078dd8fsm13212585eec.20.2026.01.09.07.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:45:19 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: stable@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>,
        Kalle Valo <kvalo@qca.qualcomm.com>,
        Govind Singh <govinds@qti.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260105210439.20131-2-fourier.thomas@gmail.com>
References: <20260105210439.20131-2-fourier.thomas@gmail.com>
Subject: Re: [PATCH net] wifi: ath10k: fix dma_free_coherent() pointer
Message-Id: <176797351961.2503774.11852026073709227675.b4-ty@oss.qualcomm.com>
Date: Fri, 09 Jan 2026 07:45:19 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExOCBTYWx0ZWRfX+Fu6z0piDgyU
 yPBhKMFKrwIoailYjRG5SXQFB3ZCRZYRNPnR70v7R3R+OhNbUXwvPjZdkQI/WmizYQy0WU4SkHc
 RNUCK5Ig5om/rf+XnfwkfHJFxAB4K2UqybFdJKqhgFsgP2MAYDANSmSNTxaJwWDNOg7LUBAH/P5
 esiaxqp1sZeL3tqLkwQQVbAcQBp5mFsINdjHTUgP61JJibW0kxRQ20vP13mdCDK4G7K182TOqyu
 sVvrvGJs71SBMT5OCpU/2U9RDzRCTWzXRJauiY4MTb50lUoQl5gW6rNh/mAbCeFAEV/gDwK3VfY
 1Ddj896rG2WPryapS9+wzvWcinlNOsJEkHYtY9l+t1wJGOBM04RF4RaVZrFB5sHIJ+hROXVWPGx
 h4LxXDIy/Oro3k4ZaV1w1gUsSqIpOWzjJffL+9lxhvfd1hvaGjORJuJ/rm1dzGs+ctS8AxdNj1+
 7BhygPTN0IPTzqcqAFg==
X-Proofpoint-ORIG-GUID: LQs8DbwKOMsCKEG9kjI28HOvaV4WWKNc
X-Authority-Analysis: v=2.4 cv=V+5wEOni c=1 sm=1 tr=0 ts=69612291 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: LQs8DbwKOMsCKEG9kjI28HOvaV4WWKNc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_074523_214509_4E75E6E5 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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


On Mon, 05 Jan 2026 22:04:38 +0100, Thomas Fourier wrote:
> dma_alloc_coherent() allocates a DMA mapped buffer and stores the
> addresses in XXX_unaligned fields.  Those should be reused when freeing
> the buffer rather than the aligned addresses.
> 
> 

Applied, thanks!

[1/1] wifi: ath10k: fix dma_free_coherent() pointer
      commit: 9282a1e171ad8d2205067e8ec3bbe4e3cef4f29f

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


