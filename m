Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD9CC77B7C
	for <ath10k@archiver.kernel.org>; Mon, 23 Jun 2025 05:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLTjHztutua3z5I4nsvOTKbG4m9yNPn0gh8iTJrQ/94=; b=gqP2FgAbmTx+almLAxRGG4bA1f
	2BU3LAZlS7XU2F4duHZb18Hxfziurhu6znpdj92WqC78QEeO34APObodQPxHPJBlekL8eh4JxCAg9
	HIm3mmgt+bia/tqNMmHIaR3m5MqY+oFimzlAuYq5jeEkEFX4ZjMO9w9AC0WrR6h5XjTQBW3zdvjoh
	I9j9KXoUIHvL15FXOQbqbArhP/I/mhF47JryegkzwvXt5ijwOnwdp3dELgXc8e5hqBUtpBUfhucQn
	VdeChoPLEvUTGeRGc4ie7tMHBc7hCLZE/umE9Nou2R0T7Pm2+hF1adnv6AQaykzRbIzlKY381qX3E
	wiF5thDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZdr-00000001c5w-3GxK;
	Mon, 23 Jun 2025 05:22:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZdn-00000001c48-3S1u
	for ath10k@lists.infradead.org;
	Mon, 23 Jun 2025 05:22:49 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N4dYM6015169
	for <ath10k@lists.infradead.org>; Mon, 23 Jun 2025 05:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hLTjHztutua3z5I4nsvOTKbG4m9yNPn0gh8iTJrQ/94=; b=YxtkILJ22j77Lvbt
	1AWZYgTxsA0nxvlFD65y0HkRFD4ThGDotDJVoAy22T7Z40KaYzNpqzVZ696K8SUq
	UYfogTeIyUmh/LRTP7QtaU1+oa5X1TFKBdLOHPbsVSDuJxaSfNHSbnQR8KLqajef
	3q3MrwocUgpRr/X7k1yp+YADnvhoBgRe1504WUcDPQve9nncTqMKwJdB7x/i7sJK
	ES6EE7ennAouWY0hRYWyrSarQj/5p3aW1EpKLm8jDgHi0YLtEa1Jlb+ZTlYAAyCy
	1SheVsZI8jd6PdsAnEAZM1pXrGg4Y15t0dJO0yZUw2kd1/TWt7vMHTRI//FmGa3E
	ogfi8Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f03b02jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 23 Jun 2025 05:22:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b31f112c90aso1895131a12.0
        for <ath10k@lists.infradead.org>; Sun, 22 Jun 2025 22:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750656166; x=1751260966;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hLTjHztutua3z5I4nsvOTKbG4m9yNPn0gh8iTJrQ/94=;
        b=fIYjyXX17ywAPr9Ul8su8bt5XRM1ngNF5JiWxL1HisAStj4h8ekG402RxTSfA0W+wE
         CmRnn0nmCE8iPtQGblCG6XdgKRdkEEVYRd1rZ+3zN6s83EL2vWFcSTq6H7j7nMKZdf1l
         7vsw5sTvoI6+Up4qbv3dxVGCHcvBkIgZJBGdf36TcoYP3s504LqHImWQUQsltVK6o1Ty
         xhDi1szJ5N2NIKsiEchGeEWccOeBh+I0QjYqUmXLf0CXECDoylrrhpl49dCImgcOkdZO
         dTpkYsRON2NASUKNcRyauKyLWJLS/s9op8T8uWkjunwt8sEtybqTTC66tea3TdfZrD4L
         DrNQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6mzQaMy+kAmvNAPVAt8hFLQZ8PQFd89FFlFp8egBBFdaWsZHsjUcfwN2a/Z4Q4oT/Q8WJT9M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9211S0Y+F6fiL2O6iPvXXqZZ51HhoC6M2kEmSCZi0rVW5nS4G
	fpeb4MWBHfBltVJ/Ze688x2OSCZ1QnZQ3YB/5cJoM+2xE1Fz2OOw5vXqIPMNCfiYAIZJEZj5zBp
	Qcwk3O63jrrYI/DSSh8zanH2Ms6RqiG4KAExsh6GomqiTpsvfZ91C1K2e67bVEdhY
X-Gm-Gg: ASbGncvKZV/GeWYvRIFokl/k7W8nLP9T+pt/kxsRZvnfJ5zPK0HSiyRifcHLQ/aCFux
	7UR5dJCnl6lPOY9mFaAWRaWIej5HKB+M+cYBKHS1HCEy4npqUAkdThxmuvntVP3bj+9SZLFpW4G
	LqMakXjYu4Hi5xou27YI4nSXbKcpvIYHCdqiGOFTAWSTcEvqVL0POMAtKhFsIFjQ37mPpENZHde
	2zny07YwT8LmS/fLGOFWM0HVIj2fewJOQjCilUmXnPUp1khXJZbyC9vST8xQH1FNLIpCDBFLs3o
	FEMXDCd6sKU33okp85tVJKC98cVQmI6S0KIg8xuSAaW46PQLdHzL1vj4tnMOaP4U
X-Received: by 2002:a17:902:ea04:b0:22e:457d:3989 with SMTP id d9443c01a7336-237dad62e05mr157842765ad.0.1750656166369;
        Sun, 22 Jun 2025 22:22:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPbiH4zXPXU8XN3CMiJXdjzBJctNi2A9Anl0Doa38MkcwwcT6EaraSrDq/JY2/ygobpeCE6g==
X-Received: by 2002:a17:902:ea04:b0:22e:457d:3989 with SMTP id d9443c01a7336-237dad62e05mr157842595ad.0.1750656165996;
        Sun, 22 Jun 2025 22:22:45 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83940f0sm74662795ad.18.2025.06.22.22.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 22:22:45 -0700 (PDT)
Message-ID: <b2415006-6176-8645-9ac1-47b8598dec17@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 10:52:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 5/5] wifi: ath12k: Add missing include of
 export.h
Content-Language: en-US
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vu?=
 =?UTF-8?Q?sen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
 <20250611-ath-unused-export-v1-5-c36819df7e7b@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250611-ath-unused-export-v1-5-c36819df7e7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: arEd5gxSWyeG1xmX5IzGAwlQOuieOiOv
X-Proofpoint-GUID: arEd5gxSWyeG1xmX5IzGAwlQOuieOiOv
X-Authority-Analysis: v=2.4 cv=CPUqXQrD c=1 sm=1 tr=0 ts=6858e4a7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=rPD8waAe7N7EK57NJTkA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAyOSBTYWx0ZWRfX+w8e1ZnldM4S
 LuZ4jRxPMYfyl72y4pv4LZSSdm0FifrJT9bQLIO7pc3BBrRqH+05F0DF+k2FRDHlKfo//Bny3bD
 WIVFv8xC+SGYtHiyVPq1LuI4HCCptrKSUwfwr8tGeOpy/fq6VOjZ26W4zCloVbQG9hCNJaPaYLT
 OrbkXOLCHwfrc56XmXiHe4TS2ZSToOTvs7DTy7968OR9P4ZkTZXFJm3K2Z5YU6TQ1DhccLVvumE
 15qC9z6l4LJ1K1qmWil/f2wlvzh8MDLWYo0Y+X33AtNIWTiFtIW/DFfjcudMB9JEt4Yb8gsK17C
 gP4bbo4E2EqgKCJSxQuT6H5x4ytsIXZ5iBKM1VIcZ7jQuqg5NNkOk+ehgh9dEIhTWVtCpbc3cta
 tcbrF90B48x+EpfeEAsTx9Zfuyvijo57z2g21Qv3E6w0PBYsFfq96MMxusaO9pMpXLaXYUuK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxlogscore=995 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_222247_872233_8D417198 
X-CRM114-Status: UNSURE (   8.23  )
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



On 6/11/2025 9:43 PM, Jeff Johnson wrote:
> Commit a934a57a42f6 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=1") introduced a new check that is producing
> the following warning:
> 
> drivers/net/wireless/ath/ath12k/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> 
> Add the missing #include to satisfy the check.
> 
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

