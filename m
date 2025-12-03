Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC82D1BDC7
	for <ath10k@archiver.kernel.org>; Wed,  3 Dec 2025 17:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qu56B6CVocPahpNKlC/P8lCJtLvQZLyGvBE9xegdPTM=; b=Kg8isssynXBdBoGUpe4v3etP2s
	mTeFgj/UjzKXXUZV7Rd6+hnmRask8keSkjr3q6Fv+w8r56P24MWCCyDd5/y1yKxg2pxdOWc3fJ58R
	ej3V+lLrmySp0L0i4Le+7iadFBakUKYckn+zND35ZkapVkKnmTKIBTBzWCud60HNUz7cMywOKkLaD
	qQdYEOjxzDenBv3NUYUJ7so6+iKPV7now/K0DQRA7IZzLAUikf5opEbj01aphggsBgIuk+ElL5sq2
	B2XpZ+4sIv3kIOQhlS8u8F792d8/facX0du3lw2HyKoHUY76DrpReumvdXguzBY8V58KKTeoohZx+
	8e51+Vpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQr7a-00000006tQm-38IK;
	Wed, 03 Dec 2025 17:58:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQr7Y-00000006tQ0-2i89
	for ath10k@lists.infradead.org;
	Wed, 03 Dec 2025 17:58:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B3Bk5mp2436338
	for <ath10k@lists.infradead.org>; Wed, 3 Dec 2025 17:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qu56B6CVocPahpNKlC/P8lCJtLvQZLyGvBE9xegdPTM=; b=TXNQeNsYrRYka9aD
	DDq6vv0lJgzUWQKRxCq9QTMXz5zwXFxZwZ8BlZqD3PVT/9ySYbT/N23bl7HUzaT1
	Jjz4hSol5q1w7Xe99748pGpkwXZ7Dlsv6Gu0hNwtmrLCtU+QPFrmBM2tEZB3Qx/C
	bk54tw/97FjB0mF2vkCUZtCZldzaHcKup8aqMiXZxDhxssP/eYxsZ/Lq+XF2ABIt
	sAZ2mSgFBa6IIDvj8mO5fUJKcm7GiHlLrbqpqyelOw7kjofkp+QYqbh8rBOKFiUn
	ik/ja8m4k6aVIKR2GJlEBF2Jfff7V9Z20ooq2E0e2qanRaaCeIxNcYQ1G4vlaiH2
	ouVSdw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atmmd9431-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 03 Dec 2025 17:58:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297e66542afso748465ad.3
        for <ath10k@lists.infradead.org>; Wed, 03 Dec 2025 09:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764784710; x=1765389510; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qu56B6CVocPahpNKlC/P8lCJtLvQZLyGvBE9xegdPTM=;
        b=RSEw9fwB6+S85agMHT2+8RhjpzpEglDHjZH+15GPQMYQG80PTn9N0rqf7RFiq05ZSG
         WMTSh+hsIJC2NaFWyG2Ct/dLSpzae+8dQVje+psWXIM3nlzerU1FOhTBRQzjzANlS2C6
         qfRmAwEUmltbK4FuB6tPxv24IFgvnz9p7eF6KoKUizXJvhQusTa+GI1DdO+EiSECcqbK
         Y4U/j5keoD4lTMbZEM1uDzyRFZOd/vlPwhrhypb0Usoe5w7hPpS29mdvFpKKTzjfd6Cf
         qli40qlK7X2+V4RwX/RVqNTf9JSSk1Q918HqwcH6BVRSSQPmGSLH2vnbzMD54K1ZSACW
         Xtlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764784710; x=1765389510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qu56B6CVocPahpNKlC/P8lCJtLvQZLyGvBE9xegdPTM=;
        b=ix+JmFAAFP2E8joDXkjHMnGdjX541wrBG5Xeo9sqCU+8cM7T7Q7mvvLLdtRELStLOZ
         HVY07OXcdNge1XghiKKwbCDQt/AwJebmxPzWGUyU7j2+9Kcwqpfy2dqLsR+8OY2Oq5Ko
         cxFo5MESwwptoGhTMI719vA22gV5foKgkjMHzMy2MSdiAxv6/YK1lu8B2tutivdPZGl8
         hLAQT1ZpxVb2lGHZUTu1vwrrVA2Z6qJ8q4pHSWB5JYwbCPb7n5GNJvlo5h6wbGj99S9X
         9t4HOanJSnlN9N+aGJPZIyQ3LBLK/w+troWGuXHL/WNXx3AlJGnR336P7s65HOHWAeGK
         C4QA==
X-Forwarded-Encrypted: i=1; AJvYcCXKRmMP9RAa3NQR/Dn+LmtelEd2MaaSvA02YjJdxU4hW2/8a3AdiK+lv9mgO0/ZmTI1bZKXSXg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0UKlM3ICO8n20I+ex1r64rIfTJjL6wqKsSgCYNQ15IzrO7qc1
	OyboDA8AxZcpIqqsudnABHZ/ko20DGsuJH/+2sYm2tHzv6UAhgy3LndAaVPcosswJN0jzj6VqZw
	3fPbKLnqBqI6grF+rPEHWLxohtgg6sXCfxdgXBBOKBUALCsigLOlIjXo5SWkYr9VqA1RRNMCH
X-Gm-Gg: ASbGncv8NFSeZWiHC7fnTHbvj4AJJi+RER4Xt7BaUroTaZ8hB+ASqQW+4MpQvk4zCsI
	6QMplfWdS13R+VKQwHxVxnWo6fT1pZ+w+I1o0yDz/yUdU7wLkvgin4ofTJ4L7U6RK0y6YnE1/Ow
	sDihN2BIIw6xw2npLSPwfCFB81ikrgyv8wSQ33r7nxxPqZ0recq/n61hVp/p1lH3zLmNwXk537h
	RhgTAVU8yEacbn5Xhb+4TLW9hj/z9+85AIVw9pM8hAjaON8GBbJ2ARiRli4j7HVWfpIxaRThG9n
	/2gbyw5u9N9S4UZZzhRMgD4wXThW+9n3Kd1mAmQvB4vyu/RNfKcvsZj+rCRcWzXSwLC0En5985f
	Zemt4OBoBiWfP4iUrfaRvgxuPJBmLs+h0pMUmi/sYSvwYY+55CI78zcN9vLpYoImOoNFCjg==
X-Received: by 2002:a17:903:19e3:b0:297:d6c0:90b3 with SMTP id d9443c01a7336-29da0431caamr832755ad.23.1764784710542;
        Wed, 03 Dec 2025 09:58:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQkYAWwt2UmAtRaUBjw+wnPHEAfEoFgQskK2ccZLJyNDT7UwRIu0CzWnw3XzS5uH79xHr/7w==
X-Received: by 2002:a17:903:19e3:b0:297:d6c0:90b3 with SMTP id d9443c01a7336-29da0431caamr832485ad.23.1764784709922;
        Wed, 03 Dec 2025 09:58:29 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40ace2sm194533525ad.13.2025.12.03.09.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 09:58:29 -0800 (PST)
Message-ID: <590b4702-cbda-4301-858a-6a63ff451040@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 09:58:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Meraki "underdog" specific
 BDFs
To: Hal Martin <hal.martin@gmail.com>, ath10k@lists.infradead.org
References: <CAHkvJJLBuwgiwA_Kz7UKnngBuTXQBkNbEkdrenNUfAoKnUfgew@mail.gmail.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <CAHkvJJLBuwgiwA_Kz7UKnngBuTXQBkNbEkdrenNUfAoKnUfgew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: waPvvbnQzwD1xizngNeDVlx23gAxXYMi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDE0MiBTYWx0ZWRfX6/X8LZZTht6m
 AO91qI8ynd77fL08l7owUIHWNn9ucaykIF51m9geaqhXGJ1nZeAdONWP4OEpAcOfDRAdahSUHIZ
 lL3OZ+q9Bn/ANXUnYvL+IL+6C56FWFUojO/Dhq9bd3rkvyoSjs/cz8t6BdQZn5159wuKuVeoKb9
 HI2Qwv5fDFA8uqQPMGWLr+RDoy7uWs0TPJFScTwO0k61JGtbf86WIHLqP3Fyq2WhRjByACWJGXs
 /y/mfZ7WYJTN4P3ZOJadxmHA/rGcNygtyULdHhjhh16u5YxiDI9hS4C6gEfEiBjMiSsjGRdzFZM
 igPaFI6cLn+WPfpYwp9cy83ITK/9oFAjk4YTdJGG7w6YAEsU34X3ZeAs6ou8iBL92JFDlhxfRSK
 tJnxfzDruOqJ3tpgNNMIifK24t4mrA==
X-Proofpoint-ORIG-GUID: waPvvbnQzwD1xizngNeDVlx23gAxXYMi
X-Authority-Analysis: v=2.4 cv=Ctays34D c=1 sm=1 tr=0 ts=69307a47 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=qC_FGOx9AAAA:8
 a=5chRr2ajmEhlubIYmlkA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-03_02,2025-12-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_095832_806773_37E9AE97 
X-CRM114-Status: GOOD (  19.33  )
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

On 6/29/2025 1:32 AM, Hal Martin wrote:
> Hi,
> 
> I am working on support for the Meraki "underdog" APs in OpenWrt. The
> "underdog" APs appear to cover the models: Meraki MR20/GR10, and
> MR70/GR60. These APs require
> two special BDFs to get the Wi-Fi PHYs working. The bmi-board-
> id='s are not currently present in linux-firmware, so Wi-Fi is
> non-functional without them.
> 
> For the questions from the wiki page [1]:
> 
> * description for what hardware this is:
> 
>   - IPQ4029 based boards
>   - one QCA40xx radio is used as 2.4GHz radio
>   - one QCA40xx radio is used as 5GHz radio
> 
> * origin of the board file (did you create it yourself or where you
>   downloaded)
> 
>   - the files were extracted from the MR20 running a Meraki firmware
> released in late 2024
> 
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
> 
>   - QCA4019 hw1.0
> 
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=22,variant=Meraki-underdog.bin
>       sha256sum:
>       3b196ab4d5cf18ee194b2aafbdfb4b26b144c8f15875274168a4d721bcd6e313
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=23,variant=Meraki-underdog.bin
>       sha256sum:
>       ff5654adb55a6aa2ef6ba527090b551af62d5746b5cdc22f43d35b24827f6999
> 
> * attach the actual board file (board.bin)
> 
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")
> 
> Kind regards,
> Hal Martin
> 
> [1] https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=22,variant=Meraki-underdog
bus=ahb,bmi-chip-id=0,bmi-board-id=23,variant=Meraki-underdog

Changed:


Deleted:

2 board image(s) added, 0 changed, 0 deleted, 156 in total

https://git.codelinaro.org/clo/ath-firmware/ath10k-firmware/-/commit/e6c8f42eea0683d833682389788ce5005d51f9fb

