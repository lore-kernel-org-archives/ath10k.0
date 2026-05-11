Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A6CCD37AC
	for <ath10k@archiver.kernel.org>; Mon, 11 May 2026 15:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDht6lpg/PXAnT4uuyAceBk9WJ9Xz2MSpMHjEkRwDs8=; b=E9+KTN6HMrEhCoH1RcgKSldSOu
	Wgjs3I9ygkeHpTAFlfGkaUMTLNyvyfiNtxmxEVSqdNJKlPAoCYVNi40Do08Gjyyq4fOdhvGbhey3F
	efR7x8XVyAzuLqUmNFUPvUKZHfsbqXGxL/ks3npGHbP0kNZYCHfhfItR3DP3nP1Rjr3tCJLoHFyR2
	Ii1NjgmR13uYYWFXFbfMJ3BrDA4gsOb+YG2QsSTZMONxG/8mR+yqwci1fB3A+1HpArJ6ktu0ubI0B
	mGh2y4xuBQe01Pdc7cziEEI9cK36K1kWIlOTkIPv5MTpjmD7FHQ4kYk5jSftqY4HWeYoBh10mYZqg
	E1HwJWJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSA2-0000000Dzbe-3l5X;
	Mon, 11 May 2026 15:03:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMSA0-0000000Dzaf-1JGU
	for ath10k@lists.infradead.org;
	Mon, 11 May 2026 15:03:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BEpuC11513387
	for <ath10k@lists.infradead.org>; Mon, 11 May 2026 15:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aDht6lpg/PXAnT4uuyAceBk9WJ9Xz2MSpMHjEkRwDs8=; b=Ze0s+xIAkVn/dSwR
	21gDBhDcBYo7rwdotupkhEYWRS1WaiIe6MvILIFt0eGZKjEJnh0Lr/a2xxRVstuh
	Jc6gf/P67jBiqAwMIwVYz/qYCJ8Ms7sdlHgOWqxmu/ZwZQl4ECZZH9BD+MVm+J7v
	gUnbBNXLCyGrOYcANvRLWWJN5JgnQr6OE4rhlLJlFfVruWIVZNcnrisqONZZS3Ir
	Ejdd5ofqliN1nfbMPcAAHxcJo58a4+j1/jWeKMP8E4cnex2U5MsFplTMx02iJSAJ
	Ehjntvtr2L0ZP+/hTjg3XZG4opWCK1d7gnQctk8tSKezt6GqF5OGClFiaxBwNNZ7
	P1AUJQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3h8g81t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 11 May 2026 15:03:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2fded513994so2813478eec.1
        for <ath10k@lists.infradead.org>; Mon, 11 May 2026 08:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778511787; x=1779116587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDht6lpg/PXAnT4uuyAceBk9WJ9Xz2MSpMHjEkRwDs8=;
        b=LY7Gt7QMM+aaS1icQ8JqNUo5BPo1gXKWiN96A5fPOBsbA9wwunSi7MN3DxB5X7sqsc
         t5m4GjbNBKvKFEbzRO07oIWKfWXe3axDIwJi1aAtZbAQlQAHlWrV5rZ+ygl0nef6tSSP
         dq1w5hFxL39O6Rmzm2/krubtmf9YedJzyZ1U0Ev7bkGMoRtLDE3QYeHKWdSGP+0S5N9Q
         X1BAR6H9ksB6BMFyBBDaz5HWA0V6hlGpvAVNFCFcpYx1RPj5alWENe6rk/hV293WsUZz
         qUF3oIeJJyVNczN5wKpnwq44OzZLn21zhVrQzLMnMceIc179CV4RCFX8uWDbrrBa50p+
         b2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778511787; x=1779116587;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aDht6lpg/PXAnT4uuyAceBk9WJ9Xz2MSpMHjEkRwDs8=;
        b=iAgmStC0wWDczoCwtUa+Xaf+CbcENTKIeriGarK6pUsPjyxrMMz+Gh9mcYjGI88D2i
         Pc+JToPOJH6yn5yON9GvirfWjQqmu38/ImdOjC6x67yxSHqDXfPgmTjp3IygpaJtE2NS
         CWFfz/k+maI1MvncDWNRSfouYlB8pEWDKBCyuQjq/k9fiW8zQQX0RY57V5Xr16+ZRkpP
         yK+8MMi5uzMjSQCgVntGh1NatBQo0vu/7p62nvlBTdmsdezIhZkfmvuAL8CedBOIZ+If
         AfXKTIVKas4gKAVle4HZl3lov0+WwpvcP26gIRgJh/9a2JCZbK03Ai+nu81P1MArZoQH
         Bk3A==
X-Forwarded-Encrypted: i=1; AFNElJ9YEqwDDxpvDFehNaUEXRRM9GZGls6npt/U9XR7yqxTgYRV/y/iNxHWDS3czbZ4wni5freI9gw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMpFnVI52J+RZvX8qPN0vpkpJarJ1mmQB0ue6JDcW9WFMosBrv
	M9Y45ClUnGEf18l0ByBNRVJm9u1l7VMTRs6elFCKyB8/8+iaNJwha0q9SmVV0xazWg4WDdgjt7u
	QP3dcwYbmF5GMlRc2ynZMvNOjk/X4TssbRSbM2mlbf9N9uUHJVal6vZUNwx8ugjaf
X-Gm-Gg: Acq92OFqyxUqnUB2uI4zH+zySrACy3/gro3JdlVkLeGgsVPAicE9LOjpU+sGuzfAI67
	9jfBQP+QYQteV7GLZbutEtWUq1vt0dOFnWXipKkY582YcpmUM6j62wbx6Ygye4cpdyutKfthhhs
	kRadU2AufoEiB/2MLZXE8dp2H9wK8p3YVI4I0cKVLngwfyKWWTCwGO+uRTbQMIFZlm3CmvB9zNi
	xfQ61BnWLveAGEawxmai6bdCxoCkBqSmL7xBBH8g9aAW9CPA1z4R79xWbOG0qF33qz6gLXJ45a9
	OXqWWyb/7d41Mn9o5QUgmT7/5L3Jkm4Zzf1OoAUGQ1JRNYV+yg/rGPA8N+jYVFjXEGpqYKirNHg
	W9YsDS05dhzeb03OfJRE/zYmKZRKa17Wm2uLBgYo/7cwzp+SwHERx+7C26YrKTKDZdF+OT14qi1
	BG
X-Received: by 2002:a05:7300:6da5:b0:2ea:ed3e:13b7 with SMTP id 5a478bee46e88-2f54ad72068mr12004310eec.7.1778511786462;
        Mon, 11 May 2026 08:03:06 -0700 (PDT)
X-Received: by 2002:a05:7300:6da5:b0:2ea:ed3e:13b7 with SMTP id 5a478bee46e88-2f54ad72068mr12004228eec.7.1778511785819;
        Mon, 11 May 2026 08:03:05 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eafcdsm17330453eec.6.2026.05.11.08.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:03:05 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kang Yang <kang.yang@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Sumanth Gavini <sumanth.gavini@yahoo.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260428162955.614739-1-arnd@kernel.org>
References: <20260428162955.614739-1-arnd@kernel.org>
Subject: Re: [PATCH] wifi: ath10k: drop gpio_led reference
Message-Id: <177851178488.1372190.18056204850884674986.b4-ty@oss.qualcomm.com>
Date: Mon, 11 May 2026 08:03:04 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE2NSBTYWx0ZWRfX8hFN/HCZ1qtb
 BEYnxhGw1NvB6njCE2iuHLMmjM8xE8IJ4KI1Zmfb2891b6a1DebB7DmvYwFM/6suXUOuCqq7z7I
 eNNOuX++3APEtizBzKPuiKJHMo8Bc5XXH9eJ8RkJlR2YoQ4N7lAZWnnMIGsHR9N9kY2sfFhmK5G
 K7roxyP6I9YZ3dCmm+qVBmCsMIWNauJuxUCNK3sddv+/v20vpJlwnvbaN5kkhLd9Yl8B/un0v4/
 R2wXRd7G3oa+N5fd4KzFThQiNYQyFiOxj+86QJKzKO0HK1vmFodEsHIt9H7GG8bTdrN+hc6vbWZ
 426j3oPkUu8dauSb4cMMZa7PFxGvYO4lKa/bKHPKIeN7ulNYp+cZ/Er6QhryJNqOCp0DUsp/VFH
 Ummpio56N4GSltD4MBE1+3F5HUfcAf36GlN7VMxn2lporD8tSOcCZaSxfvoSCVQZ6KdrfagSD0B
 CoxE7sj0Ivu9M+bFN3A==
X-Proofpoint-GUID: zIaMEr9JB-39DajML98sSEbZCkCyzb3E
X-Proofpoint-ORIG-GUID: zIaMEr9JB-39DajML98sSEbZCkCyzb3E
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=6a01efab cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_04,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_080308_383599_DE21FBD2 
X-CRM114-Status: UNSURE (   7.58  )
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


On Tue, 28 Apr 2026 18:29:49 +0200, Arnd Bergmann wrote:
> The driver uses a 'struct gpio_led' internally, but does not actually interact
> with the gpio_led driver, in particular it does not actually use gpiolib here.
> 
> 

Applied, thanks!

[1/1] wifi: ath10k: drop gpio_led reference
      commit: f8b7c2f1a45bb70eac754b2bd438168bbeafb499

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


