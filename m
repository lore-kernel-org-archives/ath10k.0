Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4496C61DBE
	for <ath10k@archiver.kernel.org>; Tue, 25 Aug 2026 14:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqb1hLPCdBMX9bDD357agm6jzjxUoiWPN5Gk3Bmu7w8=; b=b8KkXUytlOk6d9uB6IRGvqq8ZX
	Eq43jZEoxE8S2wh2qxo9UHbvynXoIqpU8upNEr08hzl8sQQQcxUuhPwLOsxUjQiuZYlhrwmqnSqKk
	KX+0OATfXRXtD6R0U1b8QyImjTk9FHCpoXAEM+OrnGClRtn3j29lCZeLTZgGnn8jYoJIVCV7Ed/8U
	+a/dyWo8bIz/wEp2z9ZU/m6cgfF2BchwfmMbArP3P5ba6saqOZJKVqnMYNO5cJsVjdMZmwLpx6TNx
	JE573Ou5J2HFeJpuUc8O9dG/XOovhE8AhxMDboqhFBHvW/tRS2LITD3yE1YxkkvA0UudyyIc1+wzY
	s9NAbH6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wysGU-00000000yUo-2CZe;
	Tue, 25 Aug 2026 14:36:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wysGR-00000000yUK-1ndq
	for ath10k@lists.infradead.org;
	Tue, 25 Aug 2026 14:36:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PEUasW2569674
	for <ath10k@lists.infradead.org>; Tue, 25 Aug 2026 14:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nqb1hLPCdBMX9bDD357agm6jzjxUoiWPN5Gk3Bmu7w8=; b=YqIFvd5oCNH7HRGx
	xQ6d9eQN0oa9ar90Ocv/ts8ADYck9PRGrtx5mdBwZcNpszaPhayC2bQ9KePkMAf7
	3DhJHd11WsIrpUCmadBLAvWwjeNSsh0tdA2nnomzJTrjyGWPNVGvxwayaqa7PoC5
	+2dCjTb2Op+RCBa1JgNpBIFYbGjeIrmdn6JdP2LlK+zp8DlWg4hkCQsmLm0EgDrx
	QoPMVR22SQ9RT7C1Drf5NzVPOJdBx5Qp3Xb3NUjWoYsPk8J2xMZPMENWzoXKodPr
	XY2H9ItfFRZFZsDuZarAkgFK90kOhIzoEMci/CMozxXwhneZVA8ItcVFjAgajfzA
	RHUckA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93kvtgqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 25 Aug 2026 14:36:33 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b28d9206f8so3316577b6e.0
        for <ath10k@lists.infradead.org>; Tue, 25 Aug 2026 07:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787668593; x=1788273393; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nqb1hLPCdBMX9bDD357agm6jzjxUoiWPN5Gk3Bmu7w8=;
        b=YhB3AmUwR8QA3QIKTkEZw5TmikSaVxeAEbgFZw08oFwAmWeeDGQzSINfWSvtkIN9fq
         8g0+ahWbHZW1kCnsP8soay9p3CgdVeSJf2Bi8C5HeAMRkqC4gtL3XuvyEkkhZ7Dg2weF
         BQB/fH5SITILn5MV9Kt5XJsmMsf8bz5xXDTpRPmab+Foppd35OZVsElT4lOw9Lo9BwBv
         xzQJfLiL/EBtaFHu3+7mpxkkmFYbixAY6GvB+Rxa7u3q386IwkozNR9zYO00ueNL4c2p
         hzUT6/DcEDx2pcNUkGiw+2s7SG3SIPYpxCVaBJGXGZ8/xe5sac6z9svMnHgIuGAo9Ir0
         Wr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787668593; x=1788273393;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nqb1hLPCdBMX9bDD357agm6jzjxUoiWPN5Gk3Bmu7w8=;
        b=IFjvJdZ76GqtmEXwhF/sAXI3JkoGHRX1DkuslKih4jTsrm23RTZKTmlqat+fMM5DLo
         7uBOiMGKgcCLz7zwq7q5ptt1Opzs6FIafVwu6kl0YVAA8XD0N66mbjErduLcVk9AV72p
         +BgrLOd1lKoMcDJBGMYJ6GAF1MlRQCsWxy3xcBeyrQHJOM012483zK6G/CzdaqvhJOYZ
         7wRZbWowaF5dLLWxJe5UsIQnm1/xWj5NguUiLWcHVQKulOVEGXSTbjWYn3P5MdkslnE+
         3cgfpl1SdDQezAe3rImwfLeOM1DjzKfDEGHu7zWD5Zh2SWw04uY3dcrgTZ54Kqk8AAC+
         +jYA==
X-Forwarded-Encrypted: i=1; AHgh+RqMrZtiHGeFjudwwcT6FX4oE9EidvKYg4seTTGfAdiuHlMMKKVTGCNT2YDVtnLRn41Vc9CzY0w=@lists.infradead.org
X-Gm-Message-State: AFuF++mk+HViE5LS9g3UlO8W2rdgt7v6/zF+MtiQtI9ZlT/upHuMIjJD
	JwMktOFWudPqQH8H9TU+K/3QlGO7TtqmU3bRdX6MHms9rH1l+ZNFCH2lluAuUoJf3Fx9pYXELSA
	b1XQOpwL3r2F9+x1d+mgoBLnGlOFZmV/1UibqggK5eB3Mp8NLzgpwEzJyoMenK2lG
X-Gm-Gg: AR+sD11kgswCsGzazetu8KvZIOzbH/ovRFBbYlIoKhs9j4EWYg+95o0ZzFxMh0rfXuM
	NkD3GsOgbc7swuLAHm4FHtprCDIrDE29er9G01w2AY5BL6iyQLP8A2vWFdFq+uv3ST4FZD+uVh6
	9odk+3SAgnmq5tXpTdUGwLXfpLsDSpurmpu9t1fDHhp4jFDkB0mbmM6KTXpbB9KL9WpfoI6CGKn
	4Zr7AKDncA7ozyy2kQWMTN0DWPTJqXwUiNQrFb+mpxq6TM5kNy+DvfZpGLiYYq111Icxbr+SSVg
	NnU4gYp7kb+tW4rOYtd+ETWuYcAPdt9Xb5HrwKj3P7Kz7kQ8Fkwb6xI0LoamLzYfLY//t0WyDZ4
	ndZn2Q2BmCvnws5/BVI9yUTf2XyfL0WXRyyBqk9ZR7CMT2mcz+zhgCwh24BDe
X-Received: by 2002:a05:6808:c292:b0:49b:33c8:4b75 with SMTP id 5614622812f47-4b309a50d08mr25270520b6e.5.1787668592640;
        Tue, 25 Aug 2026 07:36:32 -0700 (PDT)
X-Received: by 2002:a05:6808:c292:b0:49b:33c8:4b75 with SMTP id 5614622812f47-4b309a50d08mr25270466b6e.5.1787668592157;
        Tue, 25 Aug 2026 07:36:32 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b32c8c8093sm5746072b6e.17.2026.08.25.07.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 07:36:31 -0700 (PDT)
Message-ID: <2280a747-03d3-4468-86c6-6fdcb2154285@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 07:36:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k_pci: QCA9377 hard lock on resume from S3/deep suspend
To: Omar Abuzaid <omarabuzaid587@gmail.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CA+kcdF5BtM9dZJ6JNAvvsTfFZ18xcio06iSsYHGY4S7xDjtZ2A@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CA+kcdF5BtM9dZJ6JNAvvsTfFZ18xcio06iSsYHGY4S7xDjtZ2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDEyMyBTYWx0ZWRfX0GFyX3MBogSW
 kVtBOjR48G+cFRsFYR9dhhsHz53zFQtD7EqNWzwXN6KTy1zGsamhMm2S+/V2Xd4I8kszP9McM2l
 2yAxlMB0GqPz3Q7PcMEljfctio0vRwSybKoZz2ZWu79syaQ9Ibuy20+us3xgk0KuZkbfGQw6RSs
 K8Xsdm12tZCmi3a+OWW4qDNrokZpo/Xx+yf15BbnoaOCWhWhMPNNUe4Jr5k8bDTl6Wu/eYPOKz2
 gTNxI2ct5n8zpsQh7vOsXpe6lf2a4XyTrG6yDF5z0tLgo8euUZD5Zo9tbKy8ym5hsxDCS0eIjmC
 /tZeWqOrUbqhneIL/lhzj6zWaN+Vbep6wQwUrfhJPHmivNJsotIvqz5WC2/woHPevUp8Oafx8lW
 p+nQ1GnPI9S2HPjh7b3TV4hRh/+eVx4xvnWTK51iq6krBOgjW9CYc1MVxiU/ftLT58daqMxIpzh
 9PmVTFPVbIYzCCAHhAg==
X-Authority-Analysis: v=2.4 cv=aPHAb79m c=1 sm=1 tr=0 ts=6a8da871 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=i5WpYceg8j5kjbeVgd0A:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDEyMyBTYWx0ZWRfXxC25VL6yABFq
 UN2XN/Mqeu6jKn7dY1CTk/Y79EC+XSr0xzKyuwDiUCTz8QbDt8t92E+dka8NNKsdPwm6PoEppR3
 YTVW+PDHMI35N4yANzh91ZNN7nKvrdQ=
X-Proofpoint-ORIG-GUID: pAlFGdD3M33qIJUwLfyLickMQ1jrWXrf
X-Proofpoint-GUID: pAlFGdD3M33qIJUwLfyLickMQ1jrWXrf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_073635_620663_F9543686 
X-CRM114-Status: GOOD (  19.46  )
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

On 8/24/2026 11:41 PM, Omar Abuzaid wrote:
> Qualcomm Atheros QCA9377 using ath10k_pci can cause a complete system
> hard lock when resuming from deep/S3 suspend. During the failed
> resume, the kernel log shows repeated PCIe AER Physical Layer and Data
> Link Layer errors involving the QCA9377.
> 
> Unloading ath10k_pci before suspend prevents the problem.
> 
> System
> 
> Fedora Linux 44
> 
> Kernel:
> 7.1.10-200.fc44.x86_64
> 
> Architecture:
> x86_64
> 
> Kernel taint:
> 0
> 
> BIOS:
> 1.32.0
> 09/03/2024
> 
> Suspend modes:
> s2idle [deep]
> 
> Wi-Fi device:
> Qualcomm Atheros QCA9377 802.11ac Wireless Network Adapter [168c:0042] (rev 31)
> 
> Subsystem:
> Dell Device [1028:1810]
> 
> Driver:
> ath10k_pci
> 
> Problem
> 
> When the system resumes from deep/S3 suspend with ath10k_pci loaded,
> the entire system can hard-freeze.
> 
> When this happens:
> 
> The system becomes completely unresponsive.
> Caps Lock does not toggle.
> Magic SysRq does not respond.
> A forced power-off is required.
> 
> The kernel log around resume contains repeated PCIe AER errors such as:
> 
> ath10k_pci 0000:02:00.0: PCIe Bus Error: severity=Correctable,
> type=Physical Layer, (Receiver ID)
> ath10k_pci 0000:02:00.0: device [168c:0042] error status/mask=000000c1/00006000
> ath10k_pci 0000:02:00.0: [ 0] RxErr (First)
> 
> pcieport 0000:00:1c.7: AER: Multiple Correctable error message
> received from 0000:02:00.0
> 
> ath10k_pci 0000:02:00.0: PCIe Bus Error: severity=Correctable,
> type=Data Link Layer, (Receiver ID)
> 
> There are also ACPI errors during resume:
> 
> ACPI BIOS Error (bug): Could not resolve symbol [_SB.PCI0.GLAN.GPEH],
> AE_NOT_FOUND
> ACPI Error: Aborting method _GPE._L6D due to previous error (AE_NOT_FOUND)
> ACPI Error: AE_NOT_FOUND, while evaluating GPE method [_L6D]
> 
> Steps to reproduce
> 
> Boot normally with ath10k_pci loaded.
> Confirm the QCA9377 is using ath10k_pci.
> Suspend using deep/S3 suspend.
> Wake the system.
> The system may completely hard-lock during resume.
> 
> Isolation test / workaround
> 
> Before suspend:
> 
> sudo modprobe -r ath10k_pci
> systemctl suspend
> 
> With ath10k_pci unloaded, the system resumes normally without the hard lock.
> 
> After resume:
> 
> sudo modprobe ath10k_pci
> 
> The driver reloads and Wi-Fi reconnects normally.
> 
> Simply unloading and reloading ath10k_pci without suspending also
> works normally.
> 
> PCIe information
> 
> LnkCap: Speed 2.5GT/s, Width x1, ASPM L0s L1
> LnkCtl: ASPM L0s L1 Enabled
> LnkSta: Speed 2.5GT/s, Width x1
> 
> L1 PM substates are enabled:
> 
> PCI-PM_L1.2+
> PCI-PM_L1.1+
> ASPM_L1.2+
> ASPM_L1.1+
> 
> This appears to involve the QCA9377/ath10k PCIe resume or PCIe
> power-management path, although I cannot determine whether the root
> cause is ath10k, PCIe power management, device firmware, or system
> ACPI firmware.
> 
> I also filed this with Fedora as Bugzilla #2523243.
> 
> I can provide the complete previous-boot kernel log and perform
> additional tests if needed.

Please see:
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath11k/bugreport.html

Although that is an ath11k link, the same guidance should be used for ath10k,
substituting ath10k for ath11k where necessary. Having a Bugzilla record
allows the issue to be assigned and tracked.

