Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D629FD707A
	for <ath10k@archiver.kernel.org>; Tue, 17 Mar 2026 20:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h8hJpBSymWCOuiDE63BWomIOUCJqxU/ANvolJAkwQik=; b=cl+b3LfM1AZIKF4gQOByUkLmz3
	jsCm0ivoCbfnJwAO13WhdCFInwKgvqNxvw1Iw8IHf0OLU4pZEX3Ft0oSrPI2B2WWVOyEwipJ8U55X
	553qNADxtUTygk83vbWFNoUARy2x6SLJ2QCncbHPKSAJhK7FweIj7JZiPpCC5d9eo7K3fzqn83681
	VaCW6orLpKNz5p3NzFkKZO5iSG6EplUpIjtxYIQZcqgGXuEbLAfWOq6mZ2CYPKnc21BZgFnRbnhtA
	fQi+f/Zf14SENpg07C/V4/wlIfhaMio//taNxGzeOl3QrQ/Sm7sjFKrCYNJIwkEMh70Iowm4MCVE8
	fDf7IZdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2asc-00000007Bia-47NO;
	Tue, 17 Mar 2026 20:19:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2asZ-00000007Bh0-3FpM
	for ath10k@lists.infradead.org;
	Tue, 17 Mar 2026 20:19:05 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIJBAa3281289
	for <ath10k@lists.infradead.org>; Tue, 17 Mar 2026 20:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=h8hJpBSymWCOuiDE63BWom
	IOUCJqxU/ANvolJAkwQik=; b=EdJCwjRks+tHuwFj0x7YLeaFL6s704BL1NLgXi
	+zK2X75joPTXfmrSjaOwuTBQWpxBlapLQePhZqqRSRQV9olta15fMpxCzmi7s1Bi
	dbGJbbDP2RHQMbgmFRaatm3ruLLoW/Qtsjn7OGSAgKW5AbP++sLyvOfNpQ3jvrQH
	qGwp9s+cv6a62MjGuO/I+hCvY+lDg4pS2NSQR2OSK/OkTO0GuU1Jd+YcIfShqZX5
	t/ZVOr012PQVgQuqFUR+gN7fjdT+mcBAbqTFDWgjUeqI94PPJXcEpOmHRGFRzm7z
	zyfCv3tY/pfncaikXWIQAWWMmQ8NUN6V/d6TMKHmaxAoVI8g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya62s1f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 17 Mar 2026 20:19:02 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2beabdd96f2so5780655eec.1
        for <ath10k@lists.infradead.org>; Tue, 17 Mar 2026 13:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773778741; x=1774383541; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8hJpBSymWCOuiDE63BWomIOUCJqxU/ANvolJAkwQik=;
        b=RN1X77MlE6azZ3fZbKN5uh24aL7Z92xc1lrVhfoRjUd7r/XZRauDIZU5Y6ZQMCMghg
         wRePy0kEtaqPpLy6cjxFskkJAKg4IQ6mAFIbKq0er5qbjTirOZXcMcOBuhIB08EoDg9X
         rPxbOB/aFWf9MZSr/F5kJhnPuV8/+IS+bXHabWDj+3RDEDrQwEzja5DuI+8x0IlFOWR2
         JYxrQafOl7rsP+cqpLpkVDOkMlIR5ihlgKGPoZi1pEBd+vL1/FLvPywbrwxGVHIZxsBt
         icyD+iZU2Fy3bOhfZFRGaXXAad++pZbV5kfX5wb6SAnpIOKteplKT3F2vJz8wdNSsqW3
         53eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773778741; x=1774383541;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h8hJpBSymWCOuiDE63BWomIOUCJqxU/ANvolJAkwQik=;
        b=ez/n9hEkfq057pzGxuvcTABmZz8bNN4zCrAWQPNs3lERZQoDFfPIiOofdtnksDdKA7
         U7gB4icMBnoR/4Kius53vHobWGqOlUogiSc6CJHz6Y9D5S3/c/DdgrccE4ylhuEq9M+K
         jYrqt+AT+vifIoxMUnqg68zXxSPZFkYS6AEN+palEf/VCeJPNgvfJv8P9vKJ1RfOrEln
         h468Wf3nTYDFwkn3bw6BkTpwvQsRh/hmkpP9pBMpVo89pRbBmt2nPn8/x0owUi4FIdX2
         yJafcFwpRrDrF9l+MDvL1Df4FHUjRkFzFZ9AcVLfJOA/7rDBFeNz4Aq2IiMpRt/RgN1n
         BO6g==
X-Forwarded-Encrypted: i=1; AJvYcCVoCCzO2FAPXb0JsNOX97u8fgH7pLMK9/CFecDY5sqI9kBq3iSNWjekHRrYAFf5UQ0p+Q8j398=@lists.infradead.org
X-Gm-Message-State: AOJu0YyaHXbwlIhibz8ugWFX1XOM5q3YbrIRCznmacEEBlRP+Q7VdWoh
	GaDbUWyaas7W+fBl8KRPQtbNp0nW+p1so7QRcmYxtZGinROoIMh/0VEtxKlvkTHjPbfrAm6C9L1
	D5X6pcigwhLRoyjkuMn4y1o8GA12XX4CAwt1pe+ac09V7vXS7iDWZmp9ZEkkejRg7
X-Gm-Gg: ATEYQzwHmyjedLzrLSll5lC8+qthof6QhBVgeIYdLKR4T+n/y3zZUvX/Ecl0MDmfxXn
	1alXwWNAeYD85DlWCi3ChE2Df4KUMYdZTVtzVOSvXf+oIhOm76ZAGOBd+E0NXyFDmT1VtawOAf3
	fNQgsdiLrfA5BryastzRZySo1BKtgOmZAor9p9jVNgttW6kYAGyOUOskMrxqsV8BMYXT/dE3kR5
	4dPmUqqVSxSYLZF706Hv/yEWDDEXE4Nwh8e8WsXfw7rUs+5WyG83qbCgLB/UHC1VTOdp0q/z3Ex
	H45ExO1NanHL64MaaADO/mHhFv+DPEN5zVn7a7xg9qHA4aF3WPs1jYYr8y8+tSH0/zPiTimTWac
	vCyoEu1CghiHtpFaPzU1XPan3+f7p/bJrCU1nghdFtjN6BSjzgct2DNJEzg==
X-Received: by 2002:a05:7300:3724:b0:2be:e4b:60bf with SMTP id 5a478bee46e88-2c0e509772cmr393493eec.10.1773778741094;
        Tue, 17 Mar 2026 13:19:01 -0700 (PDT)
X-Received: by 2002:a05:7300:3724:b0:2be:e4b:60bf with SMTP id 5a478bee46e88-2c0e509772cmr393474eec.10.1773778740510;
        Tue, 17 Mar 2026 13:19:00 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e56062e4sm756534eec.30.2026.03.17.13.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 13:19:00 -0700 (PDT)
Message-ID: <3ff94227-db20-429b-9872-75faf39daec2@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:18:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260317
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ns3cssdJ c=1 sm=1 tr=0 ts=69b9b736 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=lm4jLvrnElEPTkshbfUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: HYc9VWyBR5zC0TYxiWWjwMeofxeBbXi7
X-Proofpoint-GUID: HYc9VWyBR5zC0TYxiWWjwMeofxeBbXi7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE3OSBTYWx0ZWRfXwWgj2UdkB47U
 708/NH448bDye62No80lGOVWxlUBgfj/jHXWd97kbDGd/6nZcTAhP6oNMmTNAuS/X7xBLbujHNp
 0eISkjWzzmOR89hRw+how3V7ZO0bQ9BQl4Yl4WXVkdxDwbDSLqEcIBj1jkuKncgCelqeWHxNye6
 Xw+Bp+arbDWNx6KEDdyyfs3WP345N7NXGlw5n3sYPbwz4RJCiUtDdhbk6HbjWCj8ZIEzgLRqVU2
 Cq3rIt6IzZMJyWSVeiC8eBjEESfbtl1FvGr30ewK3hxERMzw0Gr/hKI+mqaOrb+6KpD3NvQIrpg
 RXTh+rZ0/2HfMCjfXOVIJmcxnCxHe0Oa6u3tPjGD4rDx9WGCy/+yIolAgfgnLnAS4JrASjnqy93
 r4SHupxsa/NXjxFIIhuB4lP70fRatGWuLQZ67asvV3JByy4oedDhHIpglM91EwQkfQI0EkNx1xM
 GaTKMJ64GBZU9LYwS4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_04,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_131903_945646_6F81FB9C 
X-CRM114-Status: GOOD (  10.10  )
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

The following changes since commit 81f761d1b5fd51469d87d1633a959dbff4785f58:

  Merge branch 'mt792x-bt' into 'main' (2026-03-17 17:33:37 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260317

for you to fetch changes up to 6fb33265936075ee1bb5a31786a4fe1b30fdd001:

  ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3 (2026-03-17 13:07:48 -0700)

----------------------------------------------------------------
Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

No updates for ath10k or ath11k

For ath12k:
Update WCN7850 firmware a new unified firmware supporting Mobile, IoT,
and Automotive.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------
Jeff Johnson (1):
      ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

 WHENCE                        |   2 +-
 ath12k/WCN7850/hw2.0/amss.bin | Bin 6082624 -> 6090816 bytes
 ath12k/WCN7850/hw2.0/m3.bin   | Bin 299660 -> 299660 bytes
 3 files changed, 1 insertion(+), 1 deletion(-)

