Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B47DD33981
	for <ath10k@archiver.kernel.org>; Fri,  5 Dec 2025 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uY/zz/FmTheKinzMsruxPAeAFgeFSh6MXrbrP2Vw8Ck=; b=agme4qZRY+B8pouKmLacrr6+df
	KUUR5/Gs+jSQAP+xhYvaC2DQLlDW6LDLQ3w3JasnSiq2dZY9bResNztoBaiek9yJzDAzJ29IRiNvc
	bkl1KxmYLCzB0Cv3pxGgocapBzDiwvA4wfkTVa3RqGr2A4Z9CsHoJowCZyTSKo2J65XnsHCZgOB4z
	H75Oltgypo3JlDOmS8Fh0ceWHHdD+JV8CTcKqxx8b07eVIg2vifdf19lkqTGg2DOmztxd+eGsm6B4
	zxP6D5wK9a5oY/jOW2O6/69tsnz7/tvSnPYUS3KbcEy+S+SMwnEogBMXsidI3dvbaU3Q/IP/730YB
	JqX/6Dtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRYh8-00000009hm6-0me0;
	Fri, 05 Dec 2025 16:30:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRYh5-00000009hlA-1XJU
	for ath10k@lists.infradead.org;
	Fri, 05 Dec 2025 16:30:08 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBPWq1075766
	for <ath10k@lists.infradead.org>; Fri, 5 Dec 2025 16:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uY/zz/FmTheKinzMsruxPA
	eAFgeFSh6MXrbrP2Vw8Ck=; b=AmewZFZuTpnfOwXbHKGEFposUfJyFi+9L/sM1r
	dSP3z8QBY0s66WGN4QyK0LiJWmXsSTQKVNyoVvL4s1MnLL1Rhj7gRAT4lNs2nURK
	dXHXbwhxGEmkvjv8VHTbYeo1HDmUf46r0p770SoRRFiX5mGiFt+xObRaXGrpEgo/
	CnIpWfQmW+Sgv/N5Ch4PPntC5ALF1km241FZ0pnT1Mk+k1E3nLSOj1W54UjHiUhv
	6wxXjP38eeyJj3JO2sFOcSCJadq8QQECu5O9iFXzot9W7jffAsdqNyk0UiBmYzZh
	gqmSJhtxjEUoF3w2O17fdLobl4KIkCGudqsdbL45Ahy+TH2Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av0ngrfmr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 05 Dec 2025 16:30:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-298535ef0ccso29919055ad.3
        for <ath10k@lists.infradead.org>; Fri, 05 Dec 2025 08:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764952204; x=1765557004; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uY/zz/FmTheKinzMsruxPAeAFgeFSh6MXrbrP2Vw8Ck=;
        b=hm/t62rjCIJeiS1Jrs9ZTw94O47PTV5IWf7zCyEb/aqWiUSrKWp5k6jaiFHMw1EzHc
         T1H56vM/MI5BaDeZP1gT80jIM+aFQyLoIdCv2o8Xj60PTUDaHEaFuJW0Lzj79NQPhHhD
         ixETmv2J9N7O4fODgecDKr/Ju3j8HAfFR8Vzs5pT4o1KCiZbqAcEfawS1STZQ0jX1QgO
         xbHfJYYSccNcJRuXJ7+5fTVgDrQruez4t5mOxKwErLE2i4XYDzEH5YVytPn84CMaCkIr
         NV11ySc1tH557qwVLYEfE7nRlkh5Gh27zax6k6kbu/3EuDbKHckjni8XsYeLRw8JliVF
         jcYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764952204; x=1765557004;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uY/zz/FmTheKinzMsruxPAeAFgeFSh6MXrbrP2Vw8Ck=;
        b=azo62AF4Qd4RYOpy6iU2CmcmnFZHu16+MMox/VoS96EkwnlwF3+otRSgmhSABle+FU
         +2kG0aqeyeCLEOioIg5tBkx1CVdEzz7lWyLKrrDU5jE4U3AbbAP9RnXLl4iQWbd6rFJm
         vw/HQlYYaCFoMzeI66aVPIXQvgLroffDQI989MJgll9Z3N6U5fLuqXwGUplHqxoR+5Jx
         cEGGkChqPWcu9zxn+sKAMm8JSJq5OYatCXrtzh4V/8oBNCdYI3EagNdJZ/HHTHrnq8sT
         LwnDViWHvy4jhFceyl+FJmSEs//0Nlwt1B20qMNFUo10P40lrO2HZzlQRuzQ+ram7D/V
         gsKA==
X-Forwarded-Encrypted: i=1; AJvYcCV27LmIs6wbh+2ep1awApOerFFEs5Mm+yykRHzjJMT6l/IxaM7CwrHtAa2fUudCzntBsV5BvBo=@lists.infradead.org
X-Gm-Message-State: AOJu0YywIU0tKo3Z0KTZZ+xhh4dsY2e7BY4fPV1ACXV/Pls5yuJEd4z7
	rZRDWKXaROB9xvPN2Ibi0P1zF9yQqrDtlbO+DdPYc29eDDi8riaRg86hKBN2Uo1A7UeJ0fCwd63
	HUrXCLpFzznjwqkRx2sZ0rDXYy7TGAqz2AoDPgz+veWIhZPxIjMKW4yOH+pUqxSya
X-Gm-Gg: ASbGncuMADg3+43SgkGm/PDEDdQ5dSht3SoSdcCpS7JjY9kkEmst1qDBUD+0jPtnvs0
	KZ7E/94OQ5V4MGXmfUNDgdaEtRahbH4Gd1k3/aZqa/nRZVEaXwZl76YQBUxU7GycySpmAtiuycv
	Sh71XtlxIz4tYgFCZ86fVuO+IA3t3L/0eXV+XsxX/PvBe9X2e6+XxPK89hrmAkADe1nJ4Pqpc7N
	ltGMWrm/yimxvNqK8g1CQSK4GJMGbRMxPW0h8hWC8mTyNRrLSMB8NYieu7fMjCwOGubeEj+cVya
	8xDEz3mHFljg+epImUFYQWceuczhs0A08Z1TeizjGaqyqklL2fOEh9GevoTV48op0IyB9ZCQKWE
	zLeVBxROjsfLWOYfdwttEvsetZ3uRJewMIKhhk4o1P3QJIw==
X-Received: by 2002:a17:903:1b28:b0:294:ccc6:cd30 with SMTP id d9443c01a7336-29d9fb6eb47mr88186825ad.17.1764952204100;
        Fri, 05 Dec 2025 08:30:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoqCm17nT0SnoxUP5EoDhHux+tD0gpH6iUAYDqqKgBNd2YHlT+I8Pl/pJ4QXlhgtjs1gu46A==
X-Received: by 2002:a17:903:1b28:b0:294:ccc6:cd30 with SMTP id d9443c01a7336-29d9fb6eb47mr88186545ad.17.1764952203564;
        Fri, 05 Dec 2025 08:30:03 -0800 (PST)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae33c2e2sm53266725ad.0.2025.12.05.08.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 08:30:03 -0800 (PST)
Message-ID: <f4e1e95f-672d-418c-9f3a-e47d01a1fe91@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 08:30:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20251205
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9am9aVHr0wvneVMB_K4JiikulmIHfLNB
X-Proofpoint-GUID: 9am9aVHr0wvneVMB_K4JiikulmIHfLNB
X-Authority-Analysis: v=2.4 cv=DrNbOW/+ c=1 sm=1 tr=0 ts=6933088d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=81yDGmwx11_j3xA_CzoA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDEyMCBTYWx0ZWRfX+GzAXt6opCoF
 vSubdHBTyvrtbZekH1uAh8HJ6xUgxKrbGcXZWlJT4d03t7FCjMP2gtFHbOI7bqM574JDgy3Ocms
 U1sYXHGMJXi8kaIRcQRM0b0bhLZ+hikIbUjSHIYOGSVcko4uBPJXuda5DdzPUvRUfkrtpNjCwyT
 e5QqLJzjD1fcU44ZGtiFnqSiVrRZv6BLWru5VOJ5mw4+8iNFkh5qVUf5YL80yyMQUaOZQrKwlO3
 AnpCmMYPRztVLtSbxIm5Z3HP1v4TWp4/nmH9bNVIzztDFPC/yX8s9asnRgqX5xOHF3YQ1ZAdpVd
 Q4nuE3RIW7QNi+k6d6vfHmFlKDpuyXLKJKN5LwlEF1o+slpgF0pOyFL4Pvk8mclBwZws+UB+ZYw
 v0GU95JHbdjkRsThGZPsvTO/BmxhzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_06,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512050120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_083007_533369_11E0AF8C 
X-CRM114-Status: UNSURE (   9.55  )
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

Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

Only ath10k board files are included this cycle:
QCA4019 hw1.0: Add Netgear LBR20 specific BDFs
QCA4019 hw1.0: Add Meraki MR30H specific BDFs
QCA4019 hw1.0: Add Meraki "underdog" specific BDFs
QCA9888 hw2.0: Add Netgear LBR20 specific BDFs
WCN3990 hw1.0: Add board file for the Arduino Imola (UNO-Q)
WCN3990 hw1.0: Add Xiaomi Redmi K20 Pro/ Xiaomi Mi 9T Pro specific BDFs
WCN3990 hw1.0: Add board file for Huawei MateBook E 2019

Please let me know if there are any problems.

Thanks,
/jeff

The following changes since commit a0f0e52138e5f77fb0f358ff952447623ae0a7c4:

  Merge branch 'amd-staging' into 'main' (2025-12-03 21:05:40 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20251205

for you to fetch changes up to 05c97f71a5336854054db1dd4acdaf68c5b7c144:

  ath10k: WCN3990 hw1.0: update board-2.bin (2025-12-05 08:20:14 -0800)

----------------------------------------------------------------
Jeff Johnson (3):
      ath10k: QCA4019 hw1.0: update board-2.bin
      ath10k: QCA9888 hw2.0: update board-2.bin
      ath10k: WCN3990 hw1.0: update board-2.bin

 ath10k/QCA4019/hw1.0/board-2.bin | Bin 1822336 -> 1895232 bytes
 ath10k/QCA9888/hw2.0/board-2.bin | Bin 218596 -> 230744 bytes
 ath10k/WCN3990/hw1.0/board-2.bin | Bin 670116 -> 742192 bytes
 3 files changed, 0 insertions(+), 0 deletions(-)

