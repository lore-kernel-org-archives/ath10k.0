Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5A3ECD6CD
	for <ath10k@archiver.kernel.org>; Wed, 11 Feb 2026 17:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YbEKtqACNKXR3HnZo2sx2bZC79gvHeWfRD0XRdypxok=; b=Y9P/G2c2d5YCK19JDdEhV2DSGw
	rN8c7x3Pf9CuGCbu+rHBYdzLjk1oS17d89X5TpN03CiTTwmV2KOkYErb66e6E6Ei5BeHiKePGYfy1
	jik9qo0ANPio5PBtrgNIYk/lW46h48UTf4MgPxXorXOMQbhIIfgoj8stGkn5V9jLpuZkhUJi/qnU1
	0w2rmty+sT3FhhpKchJsMKoAJBtn/3Xptmi49r7v6OtHNx5lYZL+jab42hXWQebAdihXIr59PBKGU
	dWiolajx9bKV4pwAGTK5BQarQBwOP8voEmptzqxk9ylB7axw3mg7de0Gq5gLmVeuoY47Ys3H+yBrj
	tPSguk6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqEM1-00000000v3p-1ou1;
	Wed, 11 Feb 2026 17:50:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqELy-00000000v2s-3KQ0
	for ath10k@lists.infradead.org;
	Wed, 11 Feb 2026 17:50:20 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BEVELb1507273
	for <ath10k@lists.infradead.org>; Wed, 11 Feb 2026 17:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YbEKtqACNKXR3HnZo2sx2b
	ZC79gvHeWfRD0XRdypxok=; b=cjqUI9apyQoddM8cKej2SKUvwO+LCrfEb4sppO
	RXk7PTK0uFBKBRgpoK5lTBjlurtFJpHqLwWXtkFMkoWiCbuYhEI2Rec+vsZ+ZbBB
	HShNKuKEoM++1JvJfYcZVixp97PrzpdaJyXHpW04OxBhQE2w5ifN5vwnKbM3lBP5
	HRysqNuLJhPAogGTS28Wr4EFsPtQUhv0M0j0KARUNP/iLBB0jjZprXrJmAkHE8BX
	1f06eIcCyhcDt9sn2jRuasCnNL1DUO1wp+iMJHO0D+M9iatbEUAWnY9PLRhggjSu
	oZsfu2kVHTINxX3wYTDP9jJDqvXn+Zk4IfKxKFUQycP+uCNA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8ukt0phg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Wed, 11 Feb 2026 17:50:18 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1270be4d176so20695843c88.1
        for <ath10k@lists.infradead.org>; Wed, 11 Feb 2026 09:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770832217; x=1771437017; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbEKtqACNKXR3HnZo2sx2bZC79gvHeWfRD0XRdypxok=;
        b=TMABvYljhmXUTeRWGzztswwYK+U6bUPelAGJoRsKkHetFDgZcrU0XdRo7n9deCy2Hv
         87nO+FzTzD8LpvT6ka3amKPqdmNxbhSmPM2b3b0LLakReULpI+uTrRrJmABRhu7TduDU
         IQdAawgarlhG9uy3CY9cJZOEg0DN3UFTZ5qm4fMcfqp5q5N0i7bsM3V8inZa6XdJM0x0
         +Oq5tcKdK5PLfauRmLkl8KMMENFxbZBXPZvQrbGFn0xLewboA/Jnc9XHSa5vBNels7EF
         jgW7eV+5CwDWcqHHfBH0hg47yCtbD5WVDKxXlEJguj8s21mtlUehe2yq+gupV1gwqKf9
         sD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770832217; x=1771437017;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YbEKtqACNKXR3HnZo2sx2bZC79gvHeWfRD0XRdypxok=;
        b=F2xKwIPynJBcGr8So1xBmExzHT9jtTkAU6EGQq3Dxoa9F7PiJSPje44FzmAvI0t33+
         5TfKdxyL3QWw01OgmiG34DPkVzHTqzYcf9bHvBas83z2D4slZUjuZ9b50SCWob8W77ay
         gy8yi8nHsDJ7eLZvY9nxtzsq1NOq2XtT8graDBKwV5WtkkSnq2P2XdF6eCsizWMrCDCE
         TXRxWApHmtSjvlBdJbdVrlH8TLgFlExD3Y0fGLmIjrxPZTGFLgFp+1jRrXQFJxFxqpIj
         0J+KsPvZkFIOzogwridTF1VjGMTikVT3hHuJHfIanL5gjXr6mrSrK3BhRcmJSoJxpoGF
         NSAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR3V3A+/MzVifL1O5u+cwUpePH5368wXMg+KocfsAznE2WSoZrjKyEx11Axh/5SEy5L89O6PA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5GOnn1MBzrodqRXFuKA3kJlZv7fQiNbTN2wVu9QmdakHDlok1
	/7MQ1rT7oKtPFniH9zy3tM5jVqD63DqCglEzVbkXq91zPOkAx+o/S1iqhnKWVkbltbtvbeqzb5F
	kdtx60NpANo2U7HIC+YclY6Mssnrn4o4qjMa8MEzoIfLZETS9ryKIqNdkr9HIu3W2
X-Gm-Gg: AZuq6aJxPFbYTB+j2Fp6dKPYBAm7ZMVhSPSdmCmE/WMjo+xJ3axwbnZrLxLpa43XGhM
	pPQYByeNhjIkA1HiD+cIWwbbTVN+hfi11FtS5uE3p+vPe4fFr2Pm+1/Bd++dpUnp/9Oegpn/5ng
	Lf5y0BwaJti4IHShIw0bv5voVV/ZgF+lJVvlTLklEN09OJYwIWmIwnfseNdcm22GM5LCRpMAncR
	6lu9c10Rj5EtliUf1l+DEjVyYyKbWMRR1oLcVxEhTshEQbJQ5yvzhWyb/l69q3WMovagFlJrfXq
	X/I3L2OA1nflUs9c7YRGOLjWpWUedQw9C0MhVK5gYPCuhwm6F5KRJDh+OcLr9dy3l+roRftV/Ni
	NZ4WHSjs28iRDfEdw+ZkBdbCdXSRbb7gWxy3bXsKbuY08BRCKqhuq+dcNvQ==
X-Received: by 2002:a05:7022:629a:b0:119:e569:f274 with SMTP id a92af1059eb24-1272f778d6bmr3980c88.29.1770832217503;
        Wed, 11 Feb 2026 09:50:17 -0800 (PST)
X-Received: by 2002:a05:7022:629a:b0:119:e569:f274 with SMTP id a92af1059eb24-1272f778d6bmr3963c88.29.1770832216903;
        Wed, 11 Feb 2026 09:50:16 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1272a636095sm2708226c88.0.2026.02.11.09.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 09:50:16 -0800 (PST)
Message-ID: <61ec2d75-38ec-4ee4-b447-3fbb723f59bc@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 09:50:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260211
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDEzOCBTYWx0ZWRfX8s1RSZjfXTGV
 aKNZULaGMHCW5/Jg+1oE07Pg4tHZOv3tcwfq35BbCGcg2kdkUXiJ7ScenhvASUE/ME+/89yFIg3
 d5GbBz9tefBKov8x5N43OT2QOz18Qn8Fpp7lm82URCYpxQK1CB5zGBkJCXxwotgmhzBqX9YTpCd
 g3h+z9hz+oEdpB/6z54b2cCvw+b2o822e3Rxp/drZJFESQP1trYRru2EurRyFfvAHkNjVMWKLe8
 6r/21plCjp5QLu+gEJenzuMfiF+/JH7LUPttREqfXelirJksS2HIXs33Icj3iHj+9UVIXoopUEj
 g1MU4PrYgKVtyaU3bmgHum8S366AA8UREYYVgbiYDvQmJ6NMdCXfXP/vmmbMUH0OqsnyDSwDC/G
 AZ4OlF8+B9i7f14+Dw2HcTzQqsVydfvt7WI0dzIC5FRBMQRPtm7BpAC2fNnuwkyXrDedgpmKBTo
 S+CZxr0jKEBSLz1EvUw==
X-Proofpoint-ORIG-GUID: PyXXga6yR58SOWCTnojCpJ932sCL0zOE
X-Authority-Analysis: v=2.4 cv=INIPywvG c=1 sm=1 tr=0 ts=698cc15a cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=Y7CzE7BwRR1qakfplZkA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: PyXXga6yR58SOWCTnojCpJ932sCL0zOE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_095018_849416_8A3EBC45 
X-CRM114-Status: UNSURE (   9.27  )
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

The following changes since commit d87f4693ed96d0f3f6f16b0f09be42f3b8acb9e0:

  Merge branch 'robot/pr-0-1770665774' into 'main' (2026-02-09 20:06:30 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260211

for you to fetch changes up to cbd0f9753754fd9605df129ff04b0c4b4fc82568:

  ath11k: WCN6855 hw2.0: update board-2.bin (2026-02-11 09:33:04 -0800)

----------------------------------------------------------------
Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

No updates for ath10k or ath12k

For ath11k:

Update board file for QCA6390 hw2.0 to support:
bus=pci,qmi-chip-id=0,qmi-board-id=255,variant=Xiaomi_Pad_5Pro_5G

Update board file for WCN6855 hw2.0/hw2.1 to support:
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=255,variant=HW_GK3
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=18,qmi-board-id=255,variant=NTM_TW220

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------
Jeff Johnson (2):
      ath11k: QCA6390 hw2.0: update board-2.bin
      ath11k: WCN6855 hw2.0: update board-2.bin

 ath11k/QCA6390/hw2.0/board-2.bin | Bin 173980 -> 231980 bytes
 ath11k/WCN6855/hw2.0/board-2.bin | Bin 7117076 -> 7237392 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)

