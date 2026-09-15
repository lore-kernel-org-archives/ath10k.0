Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD6EC88E75
	for <ath10k@archiver.kernel.org>; Tue, 15 Sep 2026 02:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VjazF2u6aHcCpAoZDETq19dN3ZnMJLylSSJylHYqTeM=; b=QjLV9HhpY2ko0MZVyyaJVizk5S
	0CM7uVXEg2yEL4chym2Qfztq2oP7w7UbjVWcE5SFvFe5eP7s1PGFGk6Si/As39duR2XWufsco0Erh
	WbB/2AxcLV5rfOH9fMRp40i1u5nSxg0LGjvEpjBb1Z244QnjKLuKeAVVAQznG7JAartAUK2SIDkE+
	kld9Im5mvRTWXSx0aVQ7rOgQIkvpjC5NMif6CUa/2TqbfPFNhQ4G2bphSD8g+Pv6jcjGJDtTfoJuq
	SdQMHGX4jX5dKhjt8ZpR6uOpznN6ZgL4etpmLxmdUGYezPuzYuWDF6PHoyPU4XzeUCpWocgJdtgp3
	KAQNHirQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ITA-00000004zs8-1weI;
	Tue, 15 Sep 2026 02:00:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6IT8-00000004zrV-0Rz9
	for ath10k@lists.infradead.org;
	Tue, 15 Sep 2026 02:00:23 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EN0bw61198952
	for <ath10k@lists.infradead.org>; Tue, 15 Sep 2026 02:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VjazF2u6aHcCpAoZDETq19
	dN3ZnMJLylSSJylHYqTeM=; b=f9ZU9bs3a5oUo9/qWaxRlLegWqegOsM98sGUek
	YpLAWywyhrft9sL+JNzBCdIcH7my5zgqWiHDWHw5ORQw1HtThXOt3iD+7Wk7Y/g7
	0f2jc0gLjIhqyZSeqFd0msrzlLQOV6g8UsIjK7G6tTi4jTGcaA+oecjGswvhC5iu
	lNzIJHC9FphsGcVU8e+Zv3e26yCywEd5Vfn+1q23f+mxD6UNXIyUUNbjnSHz3n3D
	5rfhOdsmjcSyypY2XifwcNYLwAM67wGf9YIL87zbWue9GNZKEZj54xxHXM1BjO6r
	1Uih7DDRLXLqmGOWO9aCnCMJDhGmmQqWLatN1zl40sFzxORw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpcjg3x1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Tue, 15 Sep 2026 02:00:21 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c153bab4c3so3871823eaf.0
        for <ath10k@lists.infradead.org>; Mon, 14 Sep 2026 19:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789437620; x=1790042420; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VjazF2u6aHcCpAoZDETq19dN3ZnMJLylSSJylHYqTeM=;
        b=HsKl/XeXsuzARhbFYKikTmADLhufmDmu2RsIHKjUyMTh1+9QM3lK0GFHkjJVU3dfR4
         lcbqeP6k1HijQiekdzGayhGvPSu2egN8eehZ4Z+332m+NeqNGC7iyY1XgDy8CAmnRbY1
         74Pd1JwtdP4LsiJZB4PoVREJswyxP4PncSA+1CrxNkkp6uHA0KcdwbThQOljFcEbZWEc
         P311Tb1jQc+XB5PWokqa5zYeSiywL7xxVyhOD4jVCnXD8aRwwIv3ZEoOcFinjPAFG8Mo
         yE/ZAJ2fEVCW53LnPD9BYGOphQpehBXgEcpnkOceyZ/rnI6yFR3q1bsaiIK9ALhHkBx/
         9U2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437620; x=1790042420;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjazF2u6aHcCpAoZDETq19dN3ZnMJLylSSJylHYqTeM=;
        b=0X9QSRrevMJ+o8yMsyBNn+IG1wm2DQqW2uCPKpTUrHF9aWYfvy619emMAAtFDFW3gP
         TrVdG+PbMwxMYwuqT9l42PVPnVXDwzXAYyuao2F87MVEUGw1NioQDDn0kbdrTUBwU1RA
         MErTfhATtxF1b/HxBITiKjz8Mn/Mqxyiirimx/hBW9oN2vCNLOHLpkus6QWTXR0lG5ad
         n6MtpgHEjIIRXI891dp2MwHMzclCv6fEGcovlpIPcITDqilkIk3ODz0A9xy4t8YkatIz
         587/iYWti+rrI/l+9FcRXxYVBtbPqYlkwvPWn/RGGQtOnq/01WTcTSccLT4GNQJ0mp9r
         iWsw==
X-Gm-Message-State: AFuF++kEuc6ADpAq1gS3anCMK4bOOvWlqAbNV5ImpqMWsg1IaCOXBFLy
	sobCbSknMvFMdujwnqvVPceRuwKEhwRZAHVJT0TergsZeqpOKf7rSz1OpI+z/wSijR7agEat0iN
	ykIMBqpwPDrDNJPUV3dJZQe28Bx/6E54TPSVR3/iRz+8/5h48TkRyLAgjqirMlUDH
X-Gm-Gg: AYBFou3xOKx56d0zJlmx/hQqz1tACnv/dVdq13b1cvgPmI2zc9dLIDKpNWyX0GDCh7V
	h7ULkcBkEnHJ6hz+RcR6/B9IRaGctonoGwW3OGpIj7Ku/nEMQbhAvVH1Mei3gD/AeQARbdYCajW
	naO/13lkzc0zJcf5JW5DYKbk+3DZcuxzUOyaGe9pwW3hfj9DZv4UAyQQM6mGE5Tif7VRqDnTPjU
	MLgz9CzB+5lYQO3gWb7QPfuX5Jx6ziIFEjwL4zPAGuzBloaTFnRw3xi0a3wYmiTbILqbJbB9OlN
	Hnj+WSv/Z/q3jnBrVTcfxZ/I2RpOpmTRMSgiZY0eFIkUzBEm2y9UFSHripThI4q6W0xgDf+F6KY
	BFMvk0lJoOC2FFYwi7kn/W8xQyw5ghlulNGEu
X-Received: by 2002:a05:6820:220a:b0:6c1:6bdc:466c with SMTP id 006d021491bc7-6c5404802demr3020704eaf.20.1789437620400;
        Mon, 14 Sep 2026 19:00:20 -0700 (PDT)
X-Received: by 2002:a05:6820:220a:b0:6c1:6bdc:466c with SMTP id 006d021491bc7-6c5404802demr3020679eaf.20.1789437619876;
        Mon, 14 Sep 2026 19:00:19 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143659a9a06sm28347650c88.0.2026.09.14.19.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 19:00:19 -0700 (PDT)
Message-ID: <22125816-3a33-4df6-9dc5-e45f3c970e1c@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 19:00:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260914
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CKa/zhrD c=1 sm=1 tr=0 ts=6aa8a6b5 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=hu0l-D-OjZVreMFwxdgA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: L5NamUmyWfcqnEv48PmTtCqJmpdXsOkR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAyNSBTYWx0ZWRfXxgNALJOJvi+g
 +sYBtrjAJ7P1zlkb+ZVLEneCm112YXiCfBYdkE2K4litnsQjSulGISulgXUjrxyLDYx9f01Uaxy
 vwHMpDpUPKbkIGzHMNRXHaQwewV1nJQ=
X-Proofpoint-GUID: L5NamUmyWfcqnEv48PmTtCqJmpdXsOkR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAyNSBTYWx0ZWRfXwRcU6fusgqYY
 7jTdJX+Pkco+38i1pN/c0ZgO/wrJxibsaW7WjPooBLBKU60Lzx9MdAUm55B8OoHvKlS4hrl/M5g
 ELTTKx5RromrYx19M7Vjjl3iO18p04TAOS+CYPw6OHn7i7qMEEwP8hh0rkRSKXsaburhw99dcI+
 /N3IkVUbf9sToaEnOfuSQfqR9hfgzDRhIiS2qh/K48rVI1Lz9bEHyv1SNl5MUmzWhOdw4b8w5/F
 wxWN6Ad3nF1Y0mO/Ys8LDM6dR9GApuApTmlw4WdUkyquCO3H5b/30qtzxKGJzP9OKlxxZLK0tvs
 ZieTNlCYs7/sb2VpO/+NgF1/90y9TDodNmSsToHPgewBNbT6J8AOyJwgrgNYQ5MpEcK9vv7rK2B
 4JH03QbHce127HQfipMAvCXhL81v8a7RNIY2M43kAbaajn1lBJogAujYNC+QKm62RloNP1dvoxv
 7X6J9W1dhtWLthARU6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_190022_245605_0E3FA8D4 
X-CRM114-Status: UNSURE (   8.05  )
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

The following changes since commit 50d3d79dc0743b616afb00d01a626c76758721f7:

  wifi: mac80211: set up the TX info early to fix failure paths (2026-09-09 14:51:31 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260914

for you to fetch changes up to 820b8cff81c796ba20573e04722ab62500713f97:

  wifi: ath11k: cleanup arsta in ath11k_mac_peer_cleanup_all() (2026-09-14 11:43:31 -0700)

----------------------------------------------------------------
ath.git update for v7.3-rc4

In ath12k: revert an undocumented and unapproved DT ABI that was added
during the v7.3 merge window.

In wcn36xx and ath11k: fix preexisting object lifetime issues.

----------------------------------------------------------------
Fan Wu (1):
      wifi: wcn36xx: Fix potential use-after-free in TX ack timer teardown

Krzysztof Kozlowski (1):
      wifi: ath12k: ahb: Revert undocumented ABI and dead code

Nicolas Escande (1):
      wifi: ath11k: cleanup arsta in ath11k_mac_peer_cleanup_all()

 drivers/net/wireless/ath/ath11k/mac.c       | 25 ++++++++++----
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c | 51 +----------------------------
 drivers/net/wireless/ath/wcn36xx/dxe.c      |  2 +-
 3 files changed, 20 insertions(+), 58 deletions(-)

