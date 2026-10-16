Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB29ACC6B38
	for <ath10k@archiver.kernel.org>; Fri, 16 Oct 2026 14:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KGl0xn96Tc2EEaoKMCvnPTGqKsWYtdwEFfVL1zKeloY=; b=x3FsadNiqgvkiFd3oMFS7uCm4j
	QPWZ2DibYpy8e+HKEZb9MeJCgG/jD/2p2WG5nwMqoYySzVf9o/8CvneA8vh5y9XpuVzIxjBeoM5l1
	8BJM1SERlw36s8guEhXaOOUvFbva47l9p/6Cr3BmDvxVYUKkynB/nbPujjEPDAHNx5hA8JdJmCnrH
	NrkcN5/nNYQEA5Nv9qDkqnD5yI0ZktW95fisGzNO3R0Apdoyv9B5xBBBiOlRqsnLQGtofO3lGDPp+
	78Ebdgymu6hH6IndJcTz3VjJ3E6yZVtFAtELfQtM7v91BtP7ZM9FtoLv5C8tee2GIgQmaw+9JaTOh
	B6mBgqeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjDz-00000003CFJ-10Ml;
	Fri, 16 Oct 2026 14:47:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHjDx-00000003CEU-0H5n
	for ath10k@bombadil.infradead.org;
	Fri, 16 Oct 2026 14:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KGl0xn96Tc2EEaoKMCvnPTGqKsWYtdwEFfVL1zKeloY=; b=ihSBoav3TCka3PE5Q4dIrPghx4
	ag0cqYGTOun8ag4KqO/ajVXExrDNUtdKOmIdXLu/jobHpami3c5X8U/XpMDFF/4H8RkvUFVIQ11fX
	ANYgTI+U1BbazbCcFZiV36TqadzdejtMp9ItPAfNe7WfEaIDH3uTb3AVZlnA1dJjGsrBHh/gKrdCV
	xtVq3L/4M865wdA1WKEvAaOe8M0ahMEjBsZb2x3ITeGIJfF9AXsKjgAO1M0AjPzEXE/uD5VlngNpY
	97sFvNbOqCQJF+drweky2GMGr0cWxQXqMWTVYvps6B1744gbBfDTvuJwWWMDkFcHMLd+jTbtAJWMN
	n3QAkRdQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHjDs-00000001clx-2pf5
	for ath10k@lists.infradead.org;
	Fri, 16 Oct 2026 14:47:56 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE65Jj2302180
	for <ath10k@lists.infradead.org>; Fri, 16 Oct 2026 14:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KGl0xn96Tc2EEaoKMCvnPTGqKsWYtdwEFfVL1zKeloY=; b=JNYyJN1xbbTUsV4B
	omIpO2ajXQbmKYVPNe3eleOKNePbhfgE724k7TNqaBhVJ++JJY1hJy8WGS8YrsxP
	JOFbyPbEYmxyhgmrjs/vZDhDUvIu7JlIV3ywaKkxl3mBPMsIaD5FYScGMx0IZqLr
	suQBOayj9rfFKYLzAjOMgA+Z8dFxX8J6rmRi6k8vj9l/CkPr9bG5eoCCUqRcvO4c
	YQ23K5jrI0zWi6wyKG+JESLeWReD0i9dWRt1oL7IowkqGBt7fNY6kdy+qm9C8ZQH
	d/mCO3FjzjoxMRUAcIqBV32/+mTuis0IP9vYCtaV/fZlfA96tOIbzulx5V/96WvV
	06xb1Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sev6yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 16 Oct 2026 14:47:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so18058187eec.1
        for <ath10k@lists.infradead.org>; Fri, 16 Oct 2026 07:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792162067; x=1792766867; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KGl0xn96Tc2EEaoKMCvnPTGqKsWYtdwEFfVL1zKeloY=;
        b=V3/CAb3y+aYnffyemC98cnxECuez8OAg2hEyqhXLDw50/mXC/7FcvtLdd7FYMk+68B
         E1q51fHDSNQKChav2PHTLXTCwzZ2KqebzbiUgoWMplYw4DEoIVuRDnymFd8q45MnXTFy
         E9dtCzCn1G+bCMF6xD9wqBqk7+Al6HK7CfH66aO3xdCa51W9zhmPPuqDp5ZWMnaiH38P
         irBl5K30It4avokDJ6/ifq9qfHioJ7iAxsTwsDONwuK3yClUsLF1fMS7gENCWMX4GqbV
         g+1EPrh0mpq6VwjZLfHhOsUqKPqUnk60r+BukKLDWHKfyy8UznNHjl3v+rPhweZs/chm
         KgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162067; x=1792766867;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KGl0xn96Tc2EEaoKMCvnPTGqKsWYtdwEFfVL1zKeloY=;
        b=qVA+ZLV0vLJmFNkLyMzdI4LtNVnm1D2DLNWBlADICrOWTK2krV6JgoRORUTjt30I4Z
         cKy7O47LUqYamPo2wwbY13J261F0DBuJxVuMnC0fz9OwbJ/FcAKLReZiF+fDNg/mu3yn
         wSri1Q6AvxmL2jznl1DMcXlJQolPLDNDeKGYtQ/EouznANX4JrcDApAs+eFKsRaomdBp
         i5SfFji09vhnUTFEB3Ih+jPWFntNAccAKuYdOVjr9eODdd/yc5LZFkMVY9bawFSOv2hX
         v+QGa4juRzty9blBv+bvcWh37sB2Vos/RkDScMGLih+I2Lv5Gcc9PYd8zOqNJ/vAR4Z6
         AWSw==
X-Forwarded-Encrypted: i=1; AKwUvBzhhDMd65hpMMs24mAJK8GiZtN0aRB1Wh7Up0+Hl46EqhEs65m7xHy7Dd2Veg9y7m2aq01jifY=@lists.infradead.org
X-Gm-Message-State: AFq9FYIfaxXePFnImLtGN3DV1s24hyGn3b37eCq9XYF7cq7NU2zQgv1p
	0SOETaMmnBr3zq4doiigwaOJG5TfPfsNmWj0sDa74B4bALBBpOp1wWfUdY13qXnRu3sD/RoUOW2
	Kz9RU2IghpkHQsv9W55+omuk0ZIja0Zz5A9HYCnYUmodVOEU0aRQZYydBGuzEfqiL
X-Gm-Gg: AYBFou3S9uyePhGBEXeSlwPgV70HIpc/JMJHRH9jYyO0NK7gNB25WpF+LRFFwVqpxTT
	704mv//ZXqBhCtekPVrWIL5fqPf3IailQEgB+e9IrM9AMThyGV3yps5x4Nq0ATaQdIk3TYqgCL5
	llweD7AKrPCHIPuYnHD2QfRj3bzzKk7lGUWOkq/EslfHFoNBbYD0C6d+kXLSRgF6chEd4Ogs5TD
	b+PPe0i78g/AWVz7ND9JKqvxsj8D7yf3Y8VhWOTqSnKVGGDUNu+I04mrD8jY5BBrpuhrX3GtC2a
	Etbv4CR8+zJSjMfkqpbydjFEi9iS48xgu/3KYfcaARMwtS+R/vq6+QXTtLOo07icGpCpdmdHCLv
	ieSQecYb9eXGXWWOWZzsJzyvnk6Tb5VSCM2rzjQZOh09A5bVomX65CRkXbnA=
X-Received: by 2002:a05:7301:4305:b0:35f:227b:f8bc with SMTP id 5a478bee46e88-361a1465355mr44208eec.11.1792162067052;
        Fri, 16 Oct 2026 07:47:47 -0700 (PDT)
X-Received: by 2002:a05:7301:4305:b0:35f:227b:f8bc with SMTP id 5a478bee46e88-361a1465355mr44160eec.11.1792162065731;
        Fri, 16 Oct 2026 07:47:45 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608297f4f7sm7670706eec.23.2026.10.16.07.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 07:47:45 -0700 (PDT)
Message-ID: <5495071c-8255-4ff4-80d7-9d9f221935c5@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 07:47:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 5/8] wifi: ath10k: check the recovery deadline on
 its own timeline
To: Kang Yang <kang.yang@oss.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260925-10k-sdio-crash-v1-0-14baf913df94@oss.qualcomm.com>
 <20260925-10k-sdio-crash-v1-5-14baf913df94@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260925-10k-sdio-crash-v1-5-14baf913df94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qMRsmnXRR7FHBIc4DmhXRoYkhJ-sEfDA
X-Proofpoint-GUID: qMRsmnXRR7FHBIc4DmhXRoYkhJ-sEfDA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfX/L+cXu3Nv0KR
 R4EVUaK0FdvG4/OLMTF+/rPCqbPJZ9YEIkon8b3IL0XlUi7t19fF5EwVahuiuybQQSWDSCpIoWn
 pwJbNIEG0CAIC21VJJKjQHrj/Ev4GEE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1OCBTYWx0ZWRfXy1XRU0U/q1aJ
 rZYNWIH0FWEci2LBS77V/abxsKE+R9+0+yKEtMtst1BMAztBsYULRvT38Hm5suSL6XyRnOiphbN
 hBz23xEB4m03drghfTJrwU5UIWCRBY32CdpyWb0LhHAW4Avgt7GdpGnsuN4Q7MS8/zL/VZTBpeI
 geJxArmzikwql62F58+NUYqgYqMPuIzopJmITkn7iHvgjuopzIo9eQDHLRCRYeapieBmggAM16X
 1HogzqtMsd8zMJuF92NO8c9nvsO0twrTX8xBAEmyMSzjpYedwgGqbHEwC3TocV3DkDs3dE5KBHr
 vrUmFuugSdU9LyIHTrjdg2TW8MnUcf/Fwg9yhOz105MmCS89qRPx9FsTe/5yppXEp2nIoYkIZ1N
 3K9Dr7KDjyv/B3hq9Jh4qX1PV3vhxl63dtNyfF2PsC463o43xX6PXL/WNHiL8jAGutWqoCJWcHL
 GuCN/6yjbkpN3vXrwXg==
X-Authority-Analysis: v=2.4 cv=Se1i5fRu c=1 sm=1 tr=0 ts=6ad23914 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KqLv8SHy1QZmO2OOx6gA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_154752_980773_C14991C2 
X-CRM114-Status: GOOD (  11.46  )
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

On 9/25/2026 5:26 AM, Kang Yang wrote:
> @@ -2536,8 +2537,11 @@ static void ath10k_core_recovery_check_work(struct work_struct *work)
>  	if (!atomic_read(&ar->pending_recovery))
>  		return;
>  
> -	if (!time_after(jiffies, recovery_start + ATH10K_RECOVERY_TIMEOUT_HZ))
> +	if (!time_after(jiffies, recovery_start + ATH10K_RECOVERY_TIMEOUT_HZ)) {
> +		queue_delayed_work(ar->workqueue_aux, &ar->recovery_check_work,
> +				   ATH10K_RECOVERY_TIMEOUT_HZ);
>  		return;
> +	}

Even with the help of two different review agents I don't understand the above
logic. Under what condition do you expect the above test to succeed? And
if/when it does succeed, why not delay for just the time left between jiffies
and recovery_start + ATH10K_RECOVERY_TIMEOUT_HZ?

Or as one agent writes:
The early re-arm path is only reachable on the first monitor firing, at the
strict time_after() boundary. Re-arming for a full
ATH10K_RECOVERY_TIMEOUT_HZ there creates timing-dependent recovery behavior:
a worker that runs exactly on the expiry jiffy delays failure accounting by
another 5s, while one that runs a jiffy later accounts immediately. Use
time_after_eq()/remove the branch, or rearm only for the remaining time/1
jiffy if early execution is genuinely possible.

/jeff

