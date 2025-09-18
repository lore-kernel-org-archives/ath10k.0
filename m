Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D57ACAC597
	for <ath10k@archiver.kernel.org>; Thu, 18 Sep 2025 07:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtCe2RN/Y8pRtGMrLYTfDuCnv7IysubE6DCnGz7W7B8=; b=Ikwp4SrucMMdzGpUyX/tEgPnP+
	K2cQAkMvOKglRZruS79asV+yH0E2sP6o9RnuTuJNcEXHr3uj7hyIcMeTSlY/d+MC4jPHe/jbjXvgM
	siLwC2Q+c82o1wSyRRUtEBiNzDxTi4QORzFOvj9QSYVYu0LdiUAEE9U2snq12kulQOP/Lh6yd/KRD
	GZZL/tWwtpLGm4UwOYUUDonVI810wCF0lYajd4k1FsJG97mCEiGe7laqyhV4VtowJV4sQ/dPqSH05
	nOQzgojd3SzrmaDK/2g2fFR/X+vpJcCYAlwm9wbZRH1jyl21OwYXE2H6pYtqI/Sxgfa9OLdRZDODT
	yBxgmiXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz93L-0000000GXa5-1LkC;
	Thu, 18 Sep 2025 07:27:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz93I-0000000GXZb-3m7I
	for ath10k@lists.infradead.org;
	Thu, 18 Sep 2025 07:27:38 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I3xZMP011237
	for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 07:27:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QtCe2RN/Y8pRtGMrLYTfDuCnv7IysubE6DCnGz7W7B8=; b=HuC3m2ahB4bvgx80
	qUemhJL76zjVnfWRorL9tTZoVdBfmD1OC6jLJzEjVNkgJBfpShrGwZsk+T8YdbwS
	sCigaZjWyDCAflV9onILshlLErjzC4wpIRHWGllI6L+q8m9HPzMLqjWDvrmIU9+8
	64ziix6Iliyjm4lJCj3SDi98XGn587KDUlHCaVBDqKnx3vqXFVrbFQcn5e1zSWgl
	ySoijlIpz5VxP/ywgJEuho0vW69SISwqAYcX2wEkM0Pj1K50IVDOisxCYBcEBB+j
	oxNGZwvGgatpO4N93z0otD7NyHASWnUBhdVUiI9+/lGmKnwH9CYpCRG2VJeJWwOI
	izukew==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxwbm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 07:27:36 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2681623f927so7570725ad.0
        for <ath10k@lists.infradead.org>; Thu, 18 Sep 2025 00:27:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758180455; x=1758785255;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QtCe2RN/Y8pRtGMrLYTfDuCnv7IysubE6DCnGz7W7B8=;
        b=uWp5Af/JN5kVw9K5FBgiF4G5KPbs0epFAmeFI9vDJc4VJVfDFZRdjbNa/DNKGDB8ml
         DOI26BnQbidBL/N8kd7rw1RwEEDTaHFBTNfCRcd/k7NDDaYWO0o6BGgJ6saIuKYbo2yU
         gZIilmidVfIxwmled6UsqsfK/I9/9i5dcfsazWrd7v6s/zJRSa2yxXcvTsXve6GEhsoM
         B23wA5fqxg9Q698EOWpkFAfLWjsglhOSdJsmdEOj+Sk0KLFHj+qdyOL86RKpHRmFXsb3
         GbI0kus/xKhhHnMfXGMwp6sS0tcHN3cJI4TKlI8Il9q5PX1zibmVAQERcOuCYZuE/PYZ
         7+4g==
X-Forwarded-Encrypted: i=1; AJvYcCVCQw7EgR+bz3pytUvYVh2782PrmNv1npU/3iSL5bJPCNMr9MuC0X6coFI/J04yhZKc+ox5whk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxIpM35h5jVTMlzkY2/BFyTQlbZvsSGLCSy4R1YXcNZHuQcjqme
	hT1tsBGiB4j5wAxTVcYTWW7OmQ4uHz4XNRIll3auVI/OJQaNHAYGmdsVnEQJ9EZzaxzjCzRfuXD
	a2rKyEbqljDTyn2kk0tUVcm78bhtKQd1254MCsks2RHeyO5ijllTlrMQ2WgVsfFfr
X-Gm-Gg: ASbGncvcJ7wPdjU6jupiLaXOneGO59qvMNBO4284iVbjFo/Dk5NtGfZHvDY+ti22rLb
	BDHI7ORbWwaWKbo+DvpP9f5D5z8iHgnwuZo9jGQhlGZlbPpNieF73T90UDEogTJCMJ3BGgkZxYn
	uslbR9u/YYaR5tnyOn03VMGZla6cZ7HgQ2VkPrgaUDjh/Lb5r0ouLOBaZvAv9rmL5fhFTF3ZE1g
	3m+NxPFwZhGDGV2TXZve1fDB5lhI2kbXZilus/Tk57wkYUW66cAv5hqa24P9nKGV3lVshilU33W
	0EKUxTDxxddhmY62VIR5UxBRe7d2lqFd4Le4mpKDNtbGGML9lPstGNgbJX7Su4n4rJX3YLOmmKT
	YMXHkJg==
X-Received: by 2002:a17:903:186:b0:24c:9a51:9a33 with SMTP id d9443c01a7336-26812184917mr59001665ad.22.1758180455505;
        Thu, 18 Sep 2025 00:27:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErLnyx0n30seI7eSnLwhrrBGTy+VTJlJ2pd6118rrdXNeRKTAy8YPNg5NJ/hm0KMGdyJ+OsA==
X-Received: by 2002:a17:903:186:b0:24c:9a51:9a33 with SMTP id d9443c01a7336-26812184917mr59001265ad.22.1758180455032;
        Thu, 18 Sep 2025 00:27:35 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269802dfcbesm16608495ad.88.2025.09.18.00.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 00:27:34 -0700 (PDT)
Message-ID: <d6ca6b1e-466b-f90c-a75a-b9f88ca63aa0@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 12:57:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath10k: avoid unnecessary wait for service
 ready message
Content-Language: en-US
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>
References: <20250811-ath10k-avoid-unnecessary-wait-v1-1-db2deb87c39b@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250811-ath10k-avoid-unnecessary-wait-v1-1-db2deb87c39b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX67B8o6B++Ov6
 SMJZcsEq5gb9JiBDNyba3el8AoV0rsRmwLmbQ1bd+1AbMNX+br7jCWHXRc7bA/enygGJ6GMdLWu
 RzdDAZ2CjcH6B7nA5E8/oiZrQ3285NOp4CMNIUZYAzOj/pDT2KA7eU+ghPjoXtR+eQOwAtUWsJW
 4pPBlWihcQt1vB26Ml0+ByIlt0YZotDgCam03EFYkgfxHI0lfDAMYshEVL/DPpX0QlXBvEC7mH/
 cZ4jxU5Fzt7VQI6XeT2zQIPKN7pypabAC/fL/Fnn3oJIzuMk2u7HT9QT+OoOo0CrnmTb1A/xjoO
 QZGz2PRIO0JOWuSxRcjrufcJxnd4aDOMLrwX81Tu26UsrrqjoxZxMyWgr4cCG6PSw/PJ1OFAFi1
 ijnJNAnD
X-Proofpoint-ORIG-GUID: 7UPq6RWhEskoWmHjPxjvRb2RcT5CGnDe
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cbb468 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=mpCJlUNt7pqHQ4OmjRMA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 7UPq6RWhEskoWmHjPxjvRb2RcT5CGnDe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_002736_948101_4A020238 
X-CRM114-Status: GOOD (  10.75  )
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



On 8/11/2025 2:56 PM, Baochen Qiang wrote:
> Commit e57b7d62a1b2 ("wifi: ath10k: poll service ready message before
> failing") works around the failure in waiting for the service ready
> message by active polling. Note the polling is triggered after initial
> wait timeout, which means that the wait-till-timeout can not be avoided
> even the message is ready.
> 
> A possible fix is to do polling once before wait as well, however this
> can not handle the race that the message arrives right after polling.
> So the solution is to do periodic polling until timeout.
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00309-QCARMSWPZ-1
> 
> Fixes: e57b7d62a1b2 ("wifi: ath10k: poll service ready message before failing")
> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Closes: https://lore.kernel.org/all/97a15967-5518-4731-a8ff-d43ff7f437b0@molgen.mpg.de
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

