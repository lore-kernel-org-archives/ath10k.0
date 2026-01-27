Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78BDD2FEDB
	for <ath10k@archiver.kernel.org>; Tue, 27 Jan 2026 18:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ixa2UGNOFQZl7W2RGTX0PTppeOqrnnMpuO5g8Z9i7aM=; b=lI2Zquv9FIDPYT2ZOdI50bQeJQ
	FMy/NASO+Z55py4+I999h3JRoZV5arwhvILNn1aRZVOANN/aUjYjXLlMeH6/Rhhqj9yDKvVMeIfxN
	r9lteFYhveQ1PRMJt4CXjcfsVjhpZbS5CfhA8Qqca0G64Fkzy3ZGwvHsteYM2y1Cq+V/A7a3DD/iq
	DmEDXXnJaBA76B9gIGEWhWTtrNRiTmkyavDrTqNpZRwFT008PaD9Ls3yDxrI3qbWW/mpK0hUn8zvn
	0hXOvahNit5LmLVfsNR5WTWbKv4shmhDyRMfMeN9l/CHiDxlBu516S7z5IZwym8dCZiBm6s00xvix
	popdppqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknvN-0000000EpJw-1w4F;
	Tue, 27 Jan 2026 18:36:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknvJ-0000000EpJ0-2OFr
	for ath10k@lists.infradead.org;
	Tue, 27 Jan 2026 18:36:24 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RH1rko1334211
	for <ath10k@lists.infradead.org>; Tue, 27 Jan 2026 18:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ixa2UGNOFQZl7W2RGTX0PTpp
	eOqrnnMpuO5g8Z9i7aM=; b=fcl/VH3HO+yP94XAfGovsWpacnxdbhM9txSHE4yC
	9goskpflG6mtq3dkXu18L2niM28yWp4YfCHMktg3PcvCjYDFlB3r26lykEscqVJS
	+gmwNXcIPSnFe11tvCEMqR9ulpD/f4/kaIJIS/ymZh1EL6tpt3iijR54o1p5NVOx
	4QmwJd3+vZ1rLTxeYk4Yt3jYQuC6G27WjmLU4DRHjuEjxWOC6Zi5XeMhN5mHdF9E
	XzhyRe9VAN6KkyADozZfiTMUvHq9sR7vu3L/ibvhTrK3jWuPyiwGFjGDPOmvLZZs
	moZwT7rD1jRxWYK49qRCh3OWywvBqzngqz4mwhVcphmolg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by1dfrayn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 27 Jan 2026 18:36:20 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9483af29f38so5606256241.2
        for <ath10k@lists.infradead.org>; Tue, 27 Jan 2026 10:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769538980; x=1770143780; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ixa2UGNOFQZl7W2RGTX0PTppeOqrnnMpuO5g8Z9i7aM=;
        b=PEqFdXA5EnqjTzoBHFv8VP3YPcXNlY5GwcBj12YTEYduilUWB1Cg+QbxCNpC/t/YP/
         dnRBVP59Zrf2gTUNqzBlUSpKxkbKKWmXJYulhdsBhSy07oWHMvAUtk1JyP/ca54CuOk2
         j/kmOI2xTz8+aR9MMuVcJMVRjV/p22uUpELOfpDmK7yvvHFd4aOgV9inK11WrYaHKfTZ
         I8Ob0ej760P9xVxdbbKYu9GHnBvLMxo0v4eUwj1qwc0PPjhDKVgrWrjY3n4d5wYvmSI6
         1JPhP2GB/mfaHftJuCM5wyWu2AN3YBG7VouKLPeTe3Zc2Z9SJ6U9O2jJYS5+oCqKdka0
         LTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769538980; x=1770143780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ixa2UGNOFQZl7W2RGTX0PTppeOqrnnMpuO5g8Z9i7aM=;
        b=N3qFKZOyATqKfOOzGyKWSmfaySnPuhgrR/zoLf+wmtBGoqL/4fifYDpbDT2dkJjM3r
         g2zkRLSbsgtgHAJWpy7KmlY+29iLla6ty7pDTBvhnjJcx+BVUnZOWFAQn57y7uS9t4Kg
         kD9rM+E3gFrM2GNV3wBLSH8z8xDS3BDfD6ozbrcOIvirvSMu5rKSXFiROT7pW6FGSZOC
         rFeNRygv/98VbPfa1Bin/5EsTGpkmn5OBe2A0/rQ4IBBENFmQbVS0LJtUjm3AnlrW1Yh
         Mwd9Y8C/82xM8e2aFWrKUTmOfz06WbryJDk036vlodMw+x53YNTSx6JPlZqxfpeFseLc
         ePUg==
X-Forwarded-Encrypted: i=1; AJvYcCW84Ezlox5Zc4fDGddGQB4ep2ILvpSoiX+MAF5rgTumbzsD+ykNsPwQUwXsTIg9rioMvkfJG+Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2yG7yVNIHtSWqJaoutYX6tQXSpIsZMnFl07BbueqhECICzKa6
	qk/9SHS4axbx1KNyzDTGzJ2gBvwFD9z6tLok6vZUPV3daeFspSl9fPvcBXLfgGILXp3jzL9Sp9B
	xWrTsE9enNtsa+6ei5U1xnl7nGLe8n/GshOsH7skq+8L+F3vvL7+deakvvW00mHKH
X-Gm-Gg: AZuq6aKIKUgfjLHo5SwUDsJ1/Jny6Vc8D7CjgSrzoqI1FfNyr5N/FaTEO4ooud3KUkJ
	6dspreP8Cz8M4rPewdr/GnA8BP4/UoSqGpRAl5v8kYnZk7xEQ+zfLE82dTLL8ScaWHM0/gxRwPu
	TS0Xqf/yXafT0gmnzwj3XlJILe9qLTxYvnBvI5m/u4ib+VI24eL0qdx2nmPG88bF4BwFbjaFh2h
	Eo+urCRSXO67HKZVdi0MdREA110SkzNaztEv2uai2KHZCUKvcKYX2/rSL+xzGiN0LITapxo9Ffe
	/tba49jCs4hyI96RhospS/jIZgJT1WfpM4W7uw7rtjDXirJ/3JYaGmSbyeM1qCem8pwPl8zLrFW
	zVjRdUBLpgjIU7KXaQHo9/f/X0D1smLrr9fu1KjfcbCHbspOsDWLwQmAdQwpcJ+a8Y0lZS+I/jQ
	MxCYuuOCgy/2Iz/rXUDKHnQYU=
X-Received: by 2002:a05:6102:a47:b0:5e1:866c:4f8e with SMTP id ada2fe7eead31-5f723817ee1mr912477137.39.1769538979648;
        Tue, 27 Jan 2026 10:36:19 -0800 (PST)
X-Received: by 2002:a05:6102:a47:b0:5e1:866c:4f8e with SMTP id ada2fe7eead31-5f723817ee1mr912467137.39.1769538979095;
        Tue, 27 Jan 2026 10:36:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e07481b72sm98670e87.11.2026.01.27.10.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:36:18 -0800 (PST)
Date: Tue, 27 Jan 2026 20:36:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260127
Message-ID: <usrawtmodalbj4b4i22tk3hzgbrpt3gdbji4x7vfzdhp6qsb3g@rw2bl7jdnp22>
References: <6f1fa3be-e28e-4653-bbf6-b0b64b7e65b2@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f1fa3be-e28e-4653-bbf6-b0b64b7e65b2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE1MSBTYWx0ZWRfXzTcHANW+xeAQ
 HhAgsaV4I5eU4+VVA75lgo2eB6CYRfWbpjRKBCGzEGbrDdz6YhR4V0fnVt4dLF/lSBqq3plihuj
 PaFKzmrABlULMKqeoOUASBq8Bz38/7hrcH0i9SfaS7rCVBzixo3EGzdmi1RJUz7+Lu8Cl2Dn/jA
 9xLaOWwnl0st9NdWqnauRI4ulHVdeDMIQpuTD8nHRy6Pw8UlAK4i3RCOJZHPrfyHQxA6kd4CPP8
 aliAHfQmPXPwJpLAF2jQrr2ZXM65sy8abFSAoPMwpixWnaDC3QwLVR7QfiJrVxkEN6TXONwTjqf
 kpOAaCCxV+8ioGFkJZaOgHZclRf02qHPdws8isM4MNdWI9/qfO6GMXKahRdO7Jr4DIxsNdRu0Vy
 lPY8SuezzZjISRKHoaVXMpYXCnrLZAmEnQJgHg0Yk3vP2OX1qlzgCW/UQuByhWrdHItv3Z/H5hQ
 27j7TuSWD5w549kcCgg==
X-Proofpoint-GUID: hNOsymNDrPLX8HPjs-qoPadWugcAJqAx
X-Proofpoint-ORIG-GUID: hNOsymNDrPLX8HPjs-qoPadWugcAJqAx
X-Authority-Analysis: v=2.4 cv=YeuwJgRf c=1 sm=1 tr=0 ts=697905a4 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Ic6Kjyy2t_iG7cYfer8A:9 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_103623_793636_0A2164C6 
X-CRM114-Status: GOOD (  14.64  )
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

On Tue, Jan 27, 2026 at 10:04:46AM -0800, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k.
> 
> No updates for ath10k.
> 
> For ath11k update board files for QCA6698AQ/hw2.1 and WCN6855/hw2.0 to support:
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=255

Don't we need the variant for this one? Otherwise it's too easy to clash
with another unprogrammed board.

> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=105b,subsystem-device=e105,qmi-chip-id=2,qmi-board-id=268,variant=QC_Hamoa_IOT_EVK
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=34618,variant=QC_QCS615_Ride
> 
> For ath12k update firmware for QCN9274/hw2.0.
> 
> Please let me know if there are any problems.
> 
> Thanks,
> /jeff
-- 
With best wishes
Dmitry

