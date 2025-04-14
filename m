Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E453C369A2
	for <ath10k@archiver.kernel.org>; Mon, 14 Apr 2025 15:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fx9CLNx6B9Vh7w2Q67gBVSliKW/Q6vuPCUUdblElgFI=; b=b3BT4j6Y7NXOcM0toTR2j7SASA
	CspOPV5vrSJv1Iwmo8y0L4TfMCzJdfcW7R+jn80hV8ndTnV2vvZmRkhZNDHA72SmeSKyTL+g/HZHY
	VuGNbASf+FzbVNx7gvOnhiIBRC7siBbX5MbFbmR3S7DXIIkjP/AmNwghZQPvXMq6MMjCmwyGkcQZE
	kH0dBFx3Ie3JEm65QTMyEyCKMruQqMqGYTOE5cBq6T0h8QxDYnr2vBrUa/S2wbvKZO8VyaCTI2IMp
	U6qUjFMGf7JVypijLLVkoLqtRKFVh7x5qJbVBHwTIoQ8MiovOqkY95NX7lwlXcutakIhEh4OrGKjv
	pHL7uJ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Lfw-00000002cBM-0TIc;
	Mon, 14 Apr 2025 15:24:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4LKf-00000002XOn-2KYE
	for ath10k@lists.infradead.org;
	Mon, 14 Apr 2025 15:02:47 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E9A1Xh029090
	for <ath10k@lists.infradead.org>; Mon, 14 Apr 2025 15:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fx9CLNx6B9Vh7w2Q67gBVSliKW/Q6vuPCUUdblElgFI=; b=kFYSey27HL8ztTDg
	RdpAvxgZ9m4z4naV34qjlKe322EcwPVu0dTVnfPZZoyOdXUJ5E7wux2TeOqRJ4cg
	2I23PD7rdAlxiI0HYOEieepyI1mShxQcF8F6Y1o6s3QYkTAyNatHpR3StJnJHmOe
	n0lIZfIVSP02j0rp4r8uiD7Tk5zoWDd1em3eS3Q37qd5aF+3T6OY9AqQFyTVpJ4B
	TrXR/Rrm3wfGoSnWErszLRs4u1X6Tb16EmX8Q9/jInhOi4z5JarRPgcVFD6QRjsM
	cI/1f4oldAetzdjVh8rgjuL2xxugaN6sKplOEl3/wFEr8GZggBwlvk6fkfz+6Ou/
	0XmDpg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs1500u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 14 Apr 2025 15:02:44 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-af510d0916dso1492015a12.0
        for <ath10k@lists.infradead.org>; Mon, 14 Apr 2025 08:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642963; x=1745247763;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fx9CLNx6B9Vh7w2Q67gBVSliKW/Q6vuPCUUdblElgFI=;
        b=Lmjf8X4dnsktDVfEZ/7eFA6h6J4G3OX2aMfgorQKS1jGt7KAXl8MB4+Du41F1KNo63
         7/+7iEYSF8aqnp/gg+uV5wNsG2KeM5UmWlbNSuXZ9zoPIuyzGILTACHLhBwda0/zFq2t
         T6DvCEVprDU8kAn1dg7bu+u7V/JDWBA4BbsQRS1xD91SqugaPgibfPx7TkzupxX4vfTs
         yP1kd/N7nbOQtZFhv6XOD0ndhyZMiSnK3NhnESjEuG1IZQTJ7cPXXbSaW7uvCEYBJ9xP
         mdlumshv/3339kpuHliZoNZKvy/b2083gMaK5lJ6kHDgC8cRDcpGdtSsotwdSmtMSAa3
         uNkg==
X-Gm-Message-State: AOJu0Ywqx5eZxfewqhf0/l3QLYLzPd4hTBoqPwIxgCaq0xoDWUQ2WV7U
	pbUKeMCf6vt3nV7i3cWyFRtkhADe8vW3KcbTcQviUxgvy4NP31xrRQt0hCrfjKlvhfMe1mCHa1k
	ZkWis+4W7W4tZ/ZzEWxPlVl+7MsDdpiFFmDF96P5eFlxqG+1L5jDFK41d/2uu
X-Gm-Gg: ASbGncvYXDxZ0Wc9H+zTKhAip8OTVjvNWA7ckBJKARtXkDZoDJ02rlu2y2u5KowPqAv
	qi4cb5CTTnfKRWkCeG/apt3JP3c/aHuwMBGnnz71FDQdpzhr2TeJJBWMc1kOc50xrdvGwB+gqOP
	/QdfvrOIO5yTUsu67t6Ly8VnggXmyoVgvyxqwUquHxb1q8zNdromODXYH9B0X6pG3PeiqRq/G5y
	cbjQCi8YkyNwce9ekt3ARj9v7zebd0T/DOau62A4HMsaS66ZjR86zBa7bqC3sip1zii9KaUdT1r
	AdbHd3myc0HS43oqOcg3F5aNJeS27ET5qAhSoZZ1uVsTjucx2BSKjA4ncEIabEoC9YELIgfXuKl
	spceI
X-Received: by 2002:a05:6a20:94c9:b0:1f5:9024:3246 with SMTP id adf61e73a8af0-201797a39c1mr17925516637.17.1744642962980;
        Mon, 14 Apr 2025 08:02:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1bvcHXdGUC9wzx8xCOFjLvQn3x2hUBSOQvCCcOvrLi0D37ffqN0AxJ/2rFL/I3g9ErbikTQ==
X-Received: by 2002:a05:6a20:94c9:b0:1f5:9024:3246 with SMTP id adf61e73a8af0-201797a39c1mr17925443637.17.1744642962376;
        Mon, 14 Apr 2025 08:02:42 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a0de8926sm7855972a12.30.2025.04.14.08.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 08:02:41 -0700 (PDT)
Message-ID: <9c53011a-0e00-49f8-bf7e-b04ddc8c575b@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 08:02:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/7] net: Don't use %pK through printk
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Brian Norris <briannorris@chromium.org>,
        Francesco Dolcini <francesco@dolcini.it>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        Przemek Kitszel <przemyslaw.kitszel@intel.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
        Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>
Cc: ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org,
        intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
        linux-rdma@vger.kernel.org
References: <20250414-restricted-pointers-net-v1-0-12af0ce46cdd@linutronix.de>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250414-restricted-pointers-net-v1-0-12af0ce46cdd@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fd2394 cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=2xVh5uQ6XZRltrFgOl4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: NBQVWiYo98Tu_TiKtXlTIjvwLOnc0scx
X-Proofpoint-ORIG-GUID: NBQVWiYo98Tu_TiKtXlTIjvwLOnc0scx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=600 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_080245_713640_4C7B36D1 
X-CRM114-Status: UNSURE (   7.94  )
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

On 4/14/2025 1:26 AM, Thomas Weißschuh wrote:
>       wifi: ath10k: Don't use %pK through printk
>       wifi: ath11k: Don't use %pK through printk
>       wifi: ath12k: Don't use %pK through printk
>       wifi: wcn36xx: Don't use %pK through printk

the first four should go through ath-next and not net-next

>       wifi: mwifiex: Don't use %pK through printk

this should go through wireless-next

/jeff

