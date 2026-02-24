Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2ECEEC2B8
	for <ath10k@archiver.kernel.org>; Tue, 24 Feb 2026 01:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1/kowcfPiZ63aqxrhjD+JeSq7F+B4yeWdD2GIIqjgI=; b=HYpnNtx/U57Pvn918rwLnkrdRb
	VmlHfurSUnhWQLqTMCmYveM5dgEb6QfHGVFEasA/3D4ffet0KcZMNY9AcbJAvL3EcbIEWOyi4OoHL
	mwdiTs8detKrS+eTveSvPi1jzPaAIdUFX3zD+z5NhOuoylIBFC/7hqecXSMARRtRMN1/yoMYMNplU
	btNMZ/LsG0xZaC5+/+/DuRXOlTTUiI6NS25jlLWQXEn8R6n/VpwFvmraP1tqIOGPMOPCGg+8ABBsR
	DabJjWnBLEfImIZeKP1O7dcUN3kvzSsL6SPufRy10F1dZsVJp2KioDorE/9TN8Cm+0lHJ/XvZ2DK0
	yyGf805w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuh0S-00000001Ge9-2Mzb;
	Tue, 24 Feb 2026 01:14:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuh0P-00000001Gdl-1nJa
	for ath10k@lists.infradead.org;
	Tue, 24 Feb 2026 01:14:30 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NFVcQe1200431
	for <ath10k@lists.infradead.org>; Tue, 24 Feb 2026 01:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w1/kowcfPiZ63aqxrhjD+JeSq7F+B4yeWdD2GIIqjgI=; b=RGjEp+WP1dnqKoIF
	FHBee8QJNn/lkJbIlB2n3CSC/kJPVdy3r9yWfxxfhB47GTSWBcNeJDDpYYRcWToE
	TAqNRbgTiFeLkBSZqB3F5KqdNBNvbn90UPnuaFLyw/UGTuj0Maw/S8oGu6Y2pijz
	IVHzld95C4zkqH/1OYJ89XMXIfILprRMHmqZaVcPu3V4rL0zYfS2dyH5oeE3Ij8y
	TpIkB/7ssMKknmUuGmahO149Ml+qy5RPwIulLrz36dNJbr59WwOOf5PsIWeehaLI
	amnPyHRaug+F1xM/a97df3ffotf2eMC3qC29ngEniDFFxRrV7zQZ2W/DTsIkbCu4
	eUDetQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8rae9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 24 Feb 2026 01:14:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a784b2234dso122654295ad.1
        for <ath10k@lists.infradead.org>; Mon, 23 Feb 2026 17:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771895668; x=1772500468; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w1/kowcfPiZ63aqxrhjD+JeSq7F+B4yeWdD2GIIqjgI=;
        b=Qmn3PLpwHlFEP7q7fRek9R9hrF0fGfBzZ57Tl7je9YbvW3tPVvFxuFtzMqa43u7eg+
         vzI2wEcYVF0GXjxFnAhulU1NkEjzUoyrNLOIaTAnOayHnF9XLhgHjIg6Tc0hMFyraUUK
         iNUC8cGR2rJppVMhesSHH0vIHjaPv4SlCSonDg2oxQR//gAk4fazob+KBhFNPt/lN/rR
         H5Im8nUZJwVRuNuJGycrlBFuk4m+U9XiG+44J1X9ell/aXVqoEKZHKdlvpZA6ekXplf4
         aaHhnqOUdzTsPrOfeQLhjyulPYqQoq+YPGECfyNOsRL9mIqJZpIKrW6ksAVTiiKudhS8
         9iTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771895668; x=1772500468;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w1/kowcfPiZ63aqxrhjD+JeSq7F+B4yeWdD2GIIqjgI=;
        b=ueHyo0zRV7iXXOyNnzopjuHAQDG42X+iUjxbca/v/VvvXvT68IncRi+6fJEutRympK
         EZJWsqytF7IlXOTEKcyZKnSmMbgfwTMg5dgohrRQRgvsi0d5VZtV7PHqtpG/2GAk0Rqq
         R/b540IK0GDGmqL6igCyvTLVj+4bSYaUpfqgO6Q3nSajC0ttIf+ir78kXYVV2tgnxLCr
         VqvwkyEr72DFDymP+aG49ou7PtAIF2tPgAiNrKONetNuD96xzLmHvroJVnqCSO0/JbHf
         3LsKu/LPHk2rDbxmMlUx/tC/fmlwD0MSYl2jfsZ1cIA7i6St8uPKk7KtFUyWbtnHlJPu
         7TOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFa0VScw6Q59OYJerPLNUSliSYbXV1s+bzUK7e2Wz+dOF2lppwsN7o5lLqEJzxYmGKodxH0hU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo5sqmuDzQr6YpY//viUdu2N0RJLPHSZjqN6BgqJiHQRNpJRPs
	PDcaW6xp65DDFeojVjwA74tpJMG6C0MiPk+q3MoS21DSfhPs909+CheQmrktFJ3L02CWury3jtk
	0aLgmnw90Rl48oFEgUd+eF6N15UdnAmIglClnRCsLBZwME98lUpIpxhL5h0CnJHdq
X-Gm-Gg: ATEYQzw3XJCVk5o7J3W2mqIGexwTOqB3o0fABkpCO+WoQX8oFzh879eV9KOE4KMngAw
	BNEH/A4JjZx/ZFrchvkerbbVQt53wVWrO77Bb+Ek8K4fG29aLa4M/4hcejlMT2p4xFr6iY7b4SU
	tFWJnSFMyK9HdBfir6HVWkCz9TCXpM6DlMEsh6QI6dhD0JGskkFmCRe0qH08gmu9mtR6CMUB1RZ
	ee3oP+ZXrSoZk77P6RPIuyghjztKDKJeGKUl12ZsJlg+ajoJfhiXPECP0fOV+m1//xv2jfS8UD4
	olO5zMY+N9V6q0ao9eq5gGL+RsnxPuprbGeEHDYImeX6sPhoyXemxD5fJoLqrWfsmcznAkTyoNX
	W296myY31PJQsUqvDSU/Z95V0jgNSj7dW7xCFDx8VZ4Vrd9ikIWgmOEcihExlxnsvqaWXYtpjhc
	OWxihDAdRA9VgIcutL2Us=
X-Received: by 2002:a17:903:38c3:b0:2aa:e6fa:2f6c with SMTP id d9443c01a7336-2ad74460475mr111797455ad.24.1771895667862;
        Mon, 23 Feb 2026 17:14:27 -0800 (PST)
X-Received: by 2002:a17:903:38c3:b0:2aa:e6fa:2f6c with SMTP id d9443c01a7336-2ad74460475mr111797225ad.24.1771895667331;
        Mon, 23 Feb 2026 17:14:27 -0800 (PST)
Received: from [10.133.33.133] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e34e9csm81801255ad.3.2026.02.23.17.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 17:14:27 -0800 (PST)
Message-ID: <9db7e1bb-9766-4239-bbf6-a95a872ea130@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 09:14:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Wi-Fi quirk found in Dell Inspiron 5567
To: Bandhan Pramanik <bandhanpramanik06.foss@gmail.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
References: <c7c5a458-ec8b-457f-893d-1c4b147ebb65@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c7c5a458-ec8b-457f-893d-1c4b147ebb65@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: F2HXG-4Tn2B0GxY9DeWvSRtb-zlZ1MBk
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699cfb74 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bgCL48uodNVjzKK0AG8A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAwOSBTYWx0ZWRfX7xqWzTol63U4
 bS6+v7xBSFnN4dyORpzfpdaw4333I6/PMnZR7x0cua/yF/gCdd3fTVg/9g7spqzk3J9LtTjZLtt
 gTAPb0Hs4X4Kh5NsXCvB+ew3kOe0YxalrawYQ9FYhSZBuODJAiznGSSGQAnaSk1rj69q7frdeRP
 Uwoex8tCxjtbtcCb5DhvnMEwC7quh+ytM8j6PUOeVZVmBOW+M86iiCxbafOjN3AHtMy5Hd35vpK
 svX9P9UpeNCSXpTzW0hES5aadApzRicmRh7p+XZNdXVw3rhYGIPEfUyYvyPUD2MScHmWGDKlQox
 APSxR8dfN1v73J89Bg2toSpU5rBKJheKrNX6A5sK4IDZaiRob+LLrWMxCWGRd6CHrZOujJ9ez+V
 Cp+bxwLt/Sd5pLG5K9MhQp6KAiALYfYA8JDENyjBWOP/lSEzSHKrJQeweFh48EfzJ3VvLbTnW4m
 /J4kG32M7k00LTOQ9qw==
X-Proofpoint-GUID: F2HXG-4Tn2B0GxY9DeWvSRtb-zlZ1MBk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_171429_496293_FA930E44 
X-CRM114-Status: GOOD (  13.05  )
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



On 2/17/2026 1:05 AM, Bandhan Pramanik wrote:
> Hello,
> 
> I messaged regarding Dell Inspiron 5567 earlier. This is regarding the QCA9377 chips
> placed on these devices.
> 
> I fixed the issue using "pcie_aspm=off", and I can say that the ASPM configs of the Wi-Fi
> chip might be problematic on this device.
> 
> The reason is that *these laptops run Wi-Fi erratically if we don't turn off the ASPM*.
> The result is the overwriting of the dmesg ring buffer within seconds of boot and IRQ #16
> being turned off for the influx of multiple correctable errors, which hampers the
> touchpads too.
> 
> What are your thoughts on turning off this device's ASPM by default? I will be happy to
> provide any details as needed.

can you please share the complete dmesg log, as well as the output of

	cat /proc/interrupts
> 
> Bandhan
> 
> 
> 


