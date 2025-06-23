Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD453C7115B
	for <ath10k@archiver.kernel.org>; Mon, 23 Jun 2025 18:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZTvShEFC4b3+8jhq/pLhvEl1j+I4GJln1yh/jFqMd8=; b=xy7Li8eKpEsj9gEuNWCVDyFddx
	/c5dvc4+5tRVcqbIPW+/wGk0RzhMAObQC5Khz9LLPhsIsyvuXZAxsc2RwBRsYxAhcXc+dWDhr6L8L
	Sq3bXXn/ZgmqMYKGm8t0+dT8Pzu9eYw7jbP0lyTqa2IwDgeDdhRLIGq7FEnI8sxcAOC6OfVPUzYrR
	EpjBBlK7+u52QPUoAZh8jgqdxPPk+Waz9QaVp+dPGC1JTHOvnYUn8v76UkQ+WTPkQkbHJe+m7q/9J
	IBUxKYsuDtNWAbXkKFhqOdLtFqbTCntTbaaExh+Pgrswnjugov5Dv3/bC4zg79+5gfqf3GaDhb/vh
	gorTY4MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlzj-00000003hHH-3HdV;
	Mon, 23 Jun 2025 18:34:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiTZ-000000036ye-2vqE
	for ath10k@lists.infradead.org;
	Mon, 23 Jun 2025 14:48:50 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9BsMd021620
	for <ath10k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZTvShEFC4b3+8jhq/pLhvEl1j+I4GJln1yh/jFqMd8=; b=NDOmiEujLEJlm+jV
	nPQLPkIh2FFlXdgYivocvH5oIbD50XVwpmwavq/6jNOo3EmMC8q2/b7JSLWRwTDo
	eoe7KIhtAiJpxRSjAnMB4mfYXXhGvHJAKoDZFpwbw2svzW7MZy6pqWFXejVClcV6
	y843WQdQ6K9ivDvbOpYjoGr4gyle3RRpDA2omBTNHnuGW8/owF328R5N2zuaYUY5
	Glv0hPPwJWb2QrskxcsV8SxqhY+94+EzKbbKtCXzIAzfKLAKRPPPx3UPccc6M0i0
	vFF3ILiP1YQaJ1kM9CQRCIUmCS81GS/gJKCiOiyXpQOz3dakDNfc+tBz8HXtic5Q
	1PMJbg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec2637qw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b115383fcecso2888929a12.1
        for <ath10k@lists.infradead.org>; Mon, 23 Jun 2025 07:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690128; x=1751294928;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZTvShEFC4b3+8jhq/pLhvEl1j+I4GJln1yh/jFqMd8=;
        b=A7Dn770F2yhkHKBsxvIMYhOfKtyOONn/lbOXZYQelaEh0R4bp7I3U5ci8C3jW6lgsc
         t+ln1HxlWFdPfpkOQAU8RUPWjg+kfnjqEQgWbeinsW+To5UeP7M36vJxKvKAwFTyi3y3
         zhVjNPgyweF606tG2gDol2eFlY5JGTyXBV0+Zobk5KBTZvSXsauK3kPvp1V7r2z/R21Z
         w+wtSb7AC6GQRcA/pPs16vwelVLaMPeLyXp2bpKRx4MIGQtA+b27yWH2ZzHe4DdpK2wM
         czTAeBmiCuWXKKxi3SY7KDVMtOSJH0GHuCZuhw5uEoyvJH0tI6qAR9WbpG4PdbWHdILk
         p9ag==
X-Forwarded-Encrypted: i=1; AJvYcCUE0015yE2S3N0V0AUq95iYgooVjkDHiaFu0oF5g9SAF02zcEzF2kQsMZ2GK168lq2CyuRWlWk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwKH9ktw8dmfEv3j3zjRNzlf+2GbVMcPR1AOSMXORHO8hJAJFGl
	mtweoxnE8zi6NttZPCaTWjfC2pxlZXmkL8U8A5bmOTS0O1RPryIfeLIhHU2qpllRqdqnDA7bor4
	anaD56wcPdRBjGZHcVUKeZufq2+5BK84NVueTvts7lbQdRPTCEIj9mCaYaiSXdPiV
X-Gm-Gg: ASbGncvFO6vl8VD6oodBJITCaoCLRDxHWd3ijTuqV9n/+QFhBKKSZhRywA9FO3SkMOr
	9GWzLtSW2Rjo4/GJjkP6vNA3C8BMP4YtBBqQJpS5OVhvtWbT6wzw4bjLXDi5WAqmBNXjWtR2+f8
	d2b7ACzvopYNDRL4p6xJ0y0JPmRF07bvQiZT7EJx/6jdg9Q4uPLOv152HmxPKZz2rSq0WLZSbW9
	BfHNQNPA14bAenleOcu6co7PIAgffvLfxBKxJqca+GyiRgc2wAPjrohKKTVIvjS/GHcxYnHnTPZ
	yD0V41fgdQT/h5f48o0faUe+TjMjFl0T0mrLxPH6Fo0RuF3RppLOGrJIkIU=
X-Received: by 2002:a05:6a20:728a:b0:21f:74b5:e8cf with SMTP id adf61e73a8af0-22026e47ac5mr20602349637.25.1750690128254;
        Mon, 23 Jun 2025 07:48:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHhT/7HTLqOoGddSf9WDDsTxORjqJ/SfHm0+ETtMJ1rsYsqMcKPrqpqZxFiopZf4JOj4k/SA==
X-Received: by 2002:a05:6a20:728a:b0:21f:74b5:e8cf with SMTP id adf61e73a8af0-22026e47ac5mr20602309637.25.1750690127859;
        Mon, 23 Jun 2025 07:48:47 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6d1eccsm8332894b3a.180.2025.06.23.07.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:48:47 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
In-Reply-To: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/5] wifi: ath: Add missing includes of
 export.h
Message-Id: <175069012683.3758471.9698383719451711198.b4-ty@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 07:48:46 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OCBTYWx0ZWRfX4U4WZ4iTIjCR
 908zXMCSTNjMcvIzmyuJu24dH8iZdTnk93PLGKZj6lIcBE6WXWlrkfqkHCjjGLMi2OGZUKR1asi
 GlXUymt6lytm9m6z1qMTi5CeIKw3o2Va0lFby/Bxx3kKxcgSG6iOESoMef4jxVl2iA1q0KeGLAJ
 meC1gKN2ai3cLXV1ilwXnNEknJNukXVUFWE/lTmDsAUNo2BXn8ew1hMPxffVvlFdS8U/2YB2mci
 +KemsFCkvzB0lSvIsTu5yeedTKt6PvXSB0EDphZMx5clj6q5lCcS3styXT75YDM1FCceqUOGI1I
 +kjXYzpyaD6HxXGljfbHCnR4M5WBTYXPaJq+cRnqWzh3SESzoDXCtLpJhUgFfIuxAxRAxKPhMH7
 vCBYLVltaK8AdGUGf4SsLuOGolzQQ8V6TdI59rcH/ZYm79YoSVp5UGQugQ7LAE31y8dOuIdY
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=68596951 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=1ICI1GVrwY_GNP6_Nl0A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: IQOsf2Vbxwf9zgxyYfRHu_1jwIVLx1g4
X-Proofpoint-ORIG-GUID: IQOsf2Vbxwf9zgxyYfRHu_1jwIVLx1g4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=721 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_074849_745782_9EBA5FDA 
X-CRM114-Status: UNSURE (   8.20  )
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


On Wed, 11 Jun 2025 09:13:53 -0700, Jeff Johnson wrote:
> commit a934a57a42f6 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=1") added a check which is now generating
> warnings. Fix the ones in drivers/net/wireless/ath/...
> 

Applied, thanks!

[1/5] wifi: ath: Add missing include of export.h
      commit: 3abe2740e50f86401aa3518e9b69c6abefaa020a
[2/5] wifi: ath9k: Add missing include of export.h
      commit: e435827f6d0c4ace62cc9dfed5e337fa4549994a
[3/5] wifi: ath10k: Add missing include of export.h
      commit: 32c3a0f8894311c743b2a6a15b50b13d01411ce1
[4/5] wifi: ath11k: Add missing include of export.h
      commit: f204e0377efeb5f42c7c518febf82f4af32567f0
[5/5] wifi: ath12k: Add missing include of export.h
      commit: c19c24c3b9e2c4d656472738f67ffc68a9b85cb0

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


