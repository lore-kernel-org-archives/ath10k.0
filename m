Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAA8606A31E
	for <ath10k@archiver.kernel.org>; Fri, 30 Oct 2026 07:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IouODMba;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UfK/VsIa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g5dcVqxi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8jO7pe/YMdj+lxc5RQolDXHt8telDzgusnrLDg6i9lY=; b=IouODMbatJcMij0tyGXXjqXOcj
	AAKM0cZigSWHUaFBZQNC31Tj6GgyNTzy/oJ0wcrMC8PIhC3AwkV4njXoewQVdEKDPsGNvtswGOhY/
	d7j3b9CcTVJWVKqB8dKUOuARXdHnmU9jpNzUpT9QZ6UhCciBgR9CYXiIgNsIr4dhkE4uMr+K048Jq
	Q8IMVBVr4P5WlvSuIxlaydpV4I7BIQ4r1g5q8cvIE+yO121icOrCQ1tfmvIik8OcQqV3A/C3e7UO8
	5zMDXfX0kHpnW0Oez/CoxBUd8Y2yOeBNEoVvMoYMEeX+an82eb2mqZ0equGKxplYwRNrJe4D96GBJ
	x2rw5EJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgtb-0000000AzCo-2qeM;
	Fri, 30 Oct 2026 07:19:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMgtY-0000000AzCO-1D3G
	for ath10k@lists.infradead.org;
	Fri, 30 Oct 2026 07:19:26 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5FmJS2874691
	for <ath10k@lists.infradead.org>; Fri, 30 Oct 2026 07:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8jO7pe/YMdj+lxc5RQolDXHt8telDzgusnr
	LDg6i9lY=; b=UfK/VsIaAj/vhGupDlmafT1mSxb5K245tb85J/5kWp28XWVdT5r
	awZTqO+rGZYVQs8jru+jiRsCSCbrux8oSkEBnEfEUiYQssHtjrCdO9tuaflIss90
	TTxw++q/nmSRdW7+3ItrZzIRkdi5s54kBk2iYhRRaOdzKxj2JyPnmJuXdCPZXzXK
	W2qNu0VabHn4i97XG58/etj3mZZQrmctbD7HCR0VBachuybvl04jV5cSP/ueMfKP
	zF14LCTRC+Z6sU6GvVYphZCJl6A48Nsv2ruTg58IYughpibW77MG6Mnh+K1k1sFd
	1BdZWYy7ZF3NcWrD8CRKTehOB3AgcQGSRcA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhrhp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Fri, 30 Oct 2026 07:19:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f20addba1so68414685a.1
        for <ath10k@lists.infradead.org>; Fri, 30 Oct 2026 00:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793344761; x=1793949561; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8jO7pe/YMdj+lxc5RQolDXHt8telDzgusnrLDg6i9lY=;
        b=g5dcVqxiS2tX+Djf5AFWwRV6/+6F0zyWgpa7ZLIOMs8D8VZvV0o9WaeodVnt3EMYCX
         lBx+aFVxV1TISXQshRvWUkFGxLiyPMjUda1NuQ67iRrtohw7TMYaMhRFlavKFtFKO0xM
         de8fvca/HpF634U6Tx8t6rMdM/sRuXHXtiZFdwZYqYIjFeQyra/QGpmBUd7/2BVHamBF
         u0EdeZHf7OJbMxvPmb3nQItf/7yr9L+GKga39a6ud4ZF69jkhRKBB1MEjtjZioMLeUmY
         qEE5wwZU00pqWZnxBEBY1Jmdap84NP6vtUat3tFqdqdIASu7W39c9+AsABeTy7rxS9nY
         7zLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793344761; x=1793949561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8jO7pe/YMdj+lxc5RQolDXHt8telDzgusnrLDg6i9lY=;
        b=aX3U7p00U/1G/rXnrAEY/WawEid3zm5UrJinoCyRZJGgJcUE42TnvooGveVPwlfnz9
         aGvIFmkRnnfM2SwWZWCcgf//T6bNoYbA8ArMeICXcvaKUykuctF+2FckUzDn6FPtfDBd
         S25FVklFz1QoJP1D2+GItW2DMloAm+etGxC2i9J/wiYe00alkpLLyg/sp4sc0GH9WdEa
         bjgZfi6ZSm2F20H/RITs7x0y5NqG+e/R94wY/Eo9GkL6mVmO90hjTpcSal+1c3o0h5ES
         7O119lF9FsAamGtXFR7osAI35BzNaXLXjvu6FbHcpB2YNAwMMuEQ08vjAa4x3lZ+CVm5
         kKEA==
X-Forwarded-Encrypted: i=1; AKwUvByf1X2HuTNoubbrAjMNB4InTjZvwQVMEWJpeCjpsQJQVYfAzY1hTEz0YYGkUehPQBrzDHpg8+w=@lists.infradead.org
X-Gm-Message-State: AFq9FYIUNDb4foHsyy1AZEE7eaL7SuRqgaTS0IEyu/GMoJkUvNeCkB19
	wXtzTkJvGdW6YJczZGt8ZlcsJCTtI4+Ygm4aPTfUapTtX5TgoEc4l0KFrjmoVxsBs4bdWfBUa8s
	npp5xELS/Oy+RVTfbGX/VYcRJVN8mTgPaMP4oTZf0oJZq+8DluagIEg6xZvNYNaunPLuUlKeN
X-Gm-Gg: AYBFou0YUN0+UCOucOWr1wOlsG4k0TYUPkJEM/eXG35Y/eiO49YdSrrRpyikUPux95W
	Kf6tueMuixFA2okBhHQf+wj/IzBHXvbP+nIxb1kQBM44FAvdt7OXkdaiARgAf8gaPn0TmREkja8
	KPWXA8orfW15D0igaVhQ8CulWyNiJ2re8Covuy2oWf5hjy8HQPdQEDaev+Bd7Qi+xs+AQ0hu2rm
	eDaY5KmSN6AMNsz8j5TRYzNyf4FZjS8bkGw5GPo+7GCCzijp8WwtI5VKRa2sLIKNl9193AxADI/
	6jeaIQ0qLV599VaKqcW9eem1eZ6DNLXQkFC2qms9uNJOS8DOODSMBxdakaTHSA0qLFZfIpM5zqI
	pi+yc/2MVv0cxxyrxIkZ9Z1XkJK8Hol227OuGhMcRKpBkynM2DNItT6mguqcXLQ==
X-Received: by 2002:a05:620a:4594:b0:93e:c12c:4409 with SMTP id af79cd13be357-944217cece5mr244314185a.69.1793344761030;
        Fri, 30 Oct 2026 00:19:21 -0700 (PDT)
X-Received: by 2002:a05:620a:4594:b0:93e:c12c:4409 with SMTP id af79cd13be357-944217cece5mr244312585a.69.1793344760474;
        Fri, 30 Oct 2026 00:19:20 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab69b54742sm135516845e9.15.2026.10.30.00.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 00:19:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] wifi: ath10k: Drop unused qmi_elem_info arrays
Date: Fri, 30 Oct 2026 08:19:13 +0100
Message-ID: <20261030071912.107577-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=38737; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=OZTHnSfXrSGrfy7csl8Xp4GxV7JqWiric/MfQwyQfE8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5ETwjOGjFAYjG0uA39fMvfKosw4jIIQLagXve
 VIIKOSB26GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauRE8AAKCRDBN2bmhouD
 1zUXEACHtyVKU8O6y6PGLDJ51hBSces9CZ/LS63CuPMOstfaVhCxLb8psCtxgsGUD3nQu+DyZHu
 /fdlCKwG8yTFlUwPlZj5KOBDqG+FAw7hKhRbvyBE8eFFM++pHc+8Le6rRj471hjUBFPYatcnNQ9
 Z5c6yXkARELsKV4svPIBIkaME047CWJNgZ7+cPROT5tpWcZ2gwj8ynv0xm0cvDYDWr2wa5S8pZ8
 mxv1GD3ANPqCaNReEp6j/jtUqR2tZDe3SU1Dd1EkSOMAzKvtBsTik4zSbcY6t57dhmO3UJRLQGR
 49egb2l/TJCvK4MYflMOOTIJiCtIiEPjUKG19DEE6HuYLm4Y809d9T3+DHLS+TPNU0M2vHMy8W1
 41jq3n3xe/8JOWOX0pbmfGeOLF3s4uvXzfoZe475JRfn/zwyGiv8An4B1FohRTs3riN1FX7AgEw
 x8URiAWYqlqTloAJZfYE5D+fHK7kdeEpSSZWlhoDOeh1UJkB8lCVvutWpONo61F4ih2Q5grKa6t
 iA3FdP3Oh/7wtQpMTZY9tw1/qCRg9S7rO4frsITsZaMXbOpYTMDFq2WCjiLcqfp4ahvtlCaYEhB
 IvXBJ5dFDUOGuqfo6xwlYlKok6NzduyqJM0RExxtVmXe390n7U8dIB7gZSiEGokp7cjmDfv2zN8 uwdPKxnzkEOaKCQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyOCBTYWx0ZWRfX+kk/fFSHcKhb
 Zp10ABmDgJh2mdUSxBZRoDCt7J9aNwoFl/tTbpN/SAM+UAyAZsPwkaxaTxW4cRIzmE+Q8SvNEB0
 jaPg4bgIghWT7jE4T05rWy3AQjp8Bt4vq5iig3ir9RPAc0bLRfLQcPgEL2OwmmuxOVFWaRn2qmP
 1xbhNOJD7jpOeyg19eKgSDw2DqPwIASRJjbJ2WcIDiboepXDvMUeUIPQrvz1uNWZsOrZBD4kC1q
 wPoFIYk1YVbC6yvQnOT2IUrgim8jBOxG+6QPFE1JXGZAi2NShiVdP3PYEtGTJiZ6HPr2HtHgSw9
 vxsAPWsY2FrfyzlTNxbzBuXKzC4q4yRw4HXvbGq9LGhPWmyLyOehCsgukqvbGvhQfo+XrbjK5Ii
 +2gt1ngk/Mm881yFF5UYrRvywo6pdzY45YFsrkZv4sT+LNFfsKkWaTLQGtsUsN+LZkrI0xCRV9Y
 K4FMB7k8J+WfYUO+26Q==
X-Proofpoint-ORIG-GUID: qZIBBKlGOCaWqfSGDVOY6WPg5IxFuORN
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae444fa cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=cqqb3YIOvjNEIm1MWrcA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyOCBTYWx0ZWRfX7/5Zu1soBxR0
 k+tBtIb9MJEVpGED4hXoKNAZWmqQBGjdx7bMlYdP4esNAYQKIwcSxPpX0iCxMFxCREXoMp/MRmY
 Dxzk3+tlbT965qmiY40t1ZoPBA+C0mY=
X-Proofpoint-GUID: qZIBBKlGOCaWqfSGDVOY6WPg5IxFuORN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_001924_517068_A6207552 
X-CRM114-Status: GOOD (  11.21  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

'wlfw_pin_connect_result_ind_msg_v01_ei' and
'wlfw_initiate_cal_download_ind_msg_v01_ei' are not used anywhere.
Dropping them allows to remove bunch of other code referenced purely by
these ararys.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Fix commit author.
2. Drop more stuff (LKP, Jeff).
---
 .../net/wireless/ath/ath10k/qmi_wlfw_v01.c    | 929 ------------------
 .../net/wireless/ath/ath10k/qmi_wlfw_v01.h    | 278 ------
 2 files changed, 1207 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
index 279aeb2a7dbc..6aaa36b5f92b 100644
--- a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
+++ b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c
@@ -154,109 +154,6 @@ static const struct qmi_elem_info wlfw_memory_region_info_s_v01_ei[] = {
 	{}
 };
 
-static const struct qmi_elem_info wlfw_mem_cfg_s_v01_ei[] = {
-	{
-		.data_type      = QMI_UNSIGNED_8_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u64),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0,
-		.offset         = offsetof(struct wlfw_mem_cfg_s_v01,
-					   offset),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0,
-		.offset         = offsetof(struct wlfw_mem_cfg_s_v01,
-					   size),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0,
-		.offset         = offsetof(struct wlfw_mem_cfg_s_v01,
-					   secure_flag),
-	},
-	{}
-};
-
-static const struct qmi_elem_info wlfw_mem_seg_s_v01_ei[] = {
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0,
-		.offset         = offsetof(struct wlfw_mem_seg_s_v01,
-					   size),
-	},
-	{
-		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
-		.elem_len       = 1,
-		.elem_size      = sizeof(enum wlfw_mem_type_enum_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0,
-		.offset         = offsetof(struct wlfw_mem_seg_s_v01,
-					   type),
-	},
-	{
-		.data_type      = QMI_DATA_LEN,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0,
-		.offset         = offsetof(struct wlfw_mem_seg_s_v01,
-					   mem_cfg_len),
-	},
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = QMI_WLFW_MAX_NUM_MEM_CFG_V01,
-		.elem_size      = sizeof(struct wlfw_mem_cfg_s_v01),
-		.array_type       = VAR_LEN_ARRAY,
-		.tlv_type       = 0,
-		.offset         = offsetof(struct wlfw_mem_seg_s_v01,
-					   mem_cfg),
-		.ei_array      = wlfw_mem_cfg_s_v01_ei,
-	},
-	{}
-};
-
-static const struct qmi_elem_info wlfw_mem_seg_resp_s_v01_ei[] = {
-	{
-		.data_type      = QMI_UNSIGNED_8_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u64),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0,
-		.offset         = offsetof(struct wlfw_mem_seg_resp_s_v01,
-					   addr),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0,
-		.offset         = offsetof(struct wlfw_mem_seg_resp_s_v01,
-					   size),
-	},
-	{
-		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
-		.elem_len       = 1,
-		.elem_size      = sizeof(enum wlfw_mem_type_enum_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0,
-		.offset         = offsetof(struct wlfw_mem_seg_resp_s_v01,
-					   type),
-	},
-	{}
-};
-
 static const struct qmi_elem_info wlfw_rf_chip_info_s_v01_ei[] = {
 	{
 		.data_type      = QMI_UNSIGNED_4_BYTE,
@@ -569,64 +466,6 @@ const struct qmi_elem_info wlfw_msa_ready_ind_msg_v01_ei[] = {
 	{}
 };
 
-const struct qmi_elem_info wlfw_pin_connect_result_ind_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_pin_connect_result_ind_msg_v01,
-					   pwr_pin_result_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_pin_connect_result_ind_msg_v01,
-					   pwr_pin_result),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x11,
-		.offset         = offsetof(struct wlfw_pin_connect_result_ind_msg_v01,
-					   phy_io_pin_result_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x11,
-		.offset         = offsetof(struct wlfw_pin_connect_result_ind_msg_v01,
-					   phy_io_pin_result),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x12,
-		.offset         = offsetof(struct wlfw_pin_connect_result_ind_msg_v01,
-					   rf_pin_result_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x12,
-		.offset         = offsetof(struct wlfw_pin_connect_result_ind_msg_v01,
-					   rf_pin_result),
-	},
-	{}
-};
-
 const struct qmi_elem_info wlfw_wlan_mode_req_msg_v01_ei[] = {
 	{
 		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
@@ -1148,302 +987,6 @@ const struct qmi_elem_info wlfw_cal_report_resp_msg_v01_ei[] = {
 	{}
 };
 
-const struct qmi_elem_info wlfw_initiate_cal_download_ind_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
-		.elem_len       = 1,
-		.elem_size      = sizeof(enum wlfw_cal_temp_id_enum_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_initiate_cal_download_ind_msg_v01,
-					   cal_id),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_cal_download_req_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
-					   valid),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
-					   file_id_valid),
-	},
-	{
-		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
-		.elem_len       = 1,
-		.elem_size      = sizeof(enum wlfw_cal_temp_id_enum_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
-					   file_id),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x11,
-		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
-					   total_size_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x11,
-		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
-					   total_size),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x12,
-		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
-					   seg_id_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x12,
-		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
-					   seg_id),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x13,
-		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
-					   data_valid),
-	},
-	{
-		.data_type      = QMI_DATA_LEN,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u16),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x13,
-		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
-					   data_len),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = QMI_WLFW_MAX_DATA_SIZE_V01,
-		.elem_size      = sizeof(u8),
-		.array_type       = VAR_LEN_ARRAY,
-		.tlv_type       = 0x13,
-		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
-					   data),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x14,
-		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
-					   end_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x14,
-		.offset         = offsetof(struct wlfw_cal_download_req_msg_v01,
-					   end),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_cal_download_resp_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_cal_download_resp_msg_v01,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_initiate_cal_update_ind_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
-		.elem_len       = 1,
-		.elem_size      = sizeof(enum wlfw_cal_temp_id_enum_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_initiate_cal_update_ind_msg_v01,
-					   cal_id),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_initiate_cal_update_ind_msg_v01,
-					   total_size),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_cal_update_req_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
-		.elem_len       = 1,
-		.elem_size      = sizeof(enum wlfw_cal_temp_id_enum_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_cal_update_req_msg_v01,
-					   cal_id),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_cal_update_req_msg_v01,
-					   seg_id),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_cal_update_resp_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
-					   file_id_valid),
-	},
-	{
-		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
-		.elem_len       = 1,
-		.elem_size      = sizeof(enum wlfw_cal_temp_id_enum_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
-					   file_id),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x11,
-		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
-					   total_size_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x11,
-		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
-					   total_size),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x12,
-		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
-					   seg_id_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x12,
-		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
-					   seg_id),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x13,
-		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
-					   data_valid),
-	},
-	{
-		.data_type      = QMI_DATA_LEN,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u16),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x13,
-		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
-					   data_len),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = QMI_WLFW_MAX_DATA_SIZE_V01,
-		.elem_size      = sizeof(u8),
-		.array_type       = VAR_LEN_ARRAY,
-		.tlv_type       = 0x13,
-		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
-					   data),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x14,
-		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
-					   end_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x14,
-		.offset         = offsetof(struct wlfw_cal_update_resp_msg_v01,
-					   end),
-	},
-	{}
-};
-
 const struct qmi_elem_info wlfw_msa_info_req_msg_v01_ei[] = {
 	{
 		.data_type      = QMI_UNSIGNED_8_BYTE,
@@ -1553,195 +1096,6 @@ const struct qmi_elem_info wlfw_ini_resp_msg_v01_ei[] = {
 	{}
 };
 
-const struct qmi_elem_info wlfw_athdiag_read_req_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_athdiag_read_req_msg_v01,
-					   offset),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_athdiag_read_req_msg_v01,
-					   mem_type),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x03,
-		.offset         = offsetof(struct wlfw_athdiag_read_req_msg_v01,
-					   data_len),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_athdiag_read_resp_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_athdiag_read_resp_msg_v01,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_athdiag_read_resp_msg_v01,
-					   data_valid),
-	},
-	{
-		.data_type      = QMI_DATA_LEN,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u16),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_athdiag_read_resp_msg_v01,
-					   data_len),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = QMI_WLFW_MAX_ATHDIAG_DATA_SIZE_V01,
-		.elem_size      = sizeof(u8),
-		.array_type       = VAR_LEN_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_athdiag_read_resp_msg_v01,
-					   data),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_athdiag_write_req_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_athdiag_write_req_msg_v01,
-					   offset),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_athdiag_write_req_msg_v01,
-					   mem_type),
-	},
-	{
-		.data_type      = QMI_DATA_LEN,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u16),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x03,
-		.offset         = offsetof(struct wlfw_athdiag_write_req_msg_v01,
-					   data_len),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = QMI_WLFW_MAX_ATHDIAG_DATA_SIZE_V01,
-		.elem_size      = sizeof(u8),
-		.array_type       = VAR_LEN_ARRAY,
-		.tlv_type       = 0x03,
-		.offset         = offsetof(struct wlfw_athdiag_write_req_msg_v01,
-					   data),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_athdiag_write_resp_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_athdiag_write_resp_msg_v01,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_vbatt_req_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_UNSIGNED_8_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u64),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_vbatt_req_msg_v01,
-					   voltage_uv),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_vbatt_resp_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_vbatt_resp_msg_v01,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_mac_addr_req_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_mac_addr_req_msg_v01,
-					   mac_addr_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = QMI_WLFW_MAC_ADDR_SIZE_V01,
-		.elem_size      = sizeof(u8),
-		.array_type       = STATIC_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_mac_addr_req_msg_v01,
-					   mac_addr),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_mac_addr_resp_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_mac_addr_resp_msg_v01,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{}
-};
-
 const struct qmi_elem_info wlfw_host_cap_req_msg_v01_ei[] = {
 	{
 		.data_type      = QMI_OPT_FLAG,
@@ -2024,286 +1378,3 @@ const struct qmi_elem_info wlfw_host_cap_resp_msg_v01_ei[] = {
 	},
 	{}
 };
-
-const struct qmi_elem_info wlfw_request_mem_ind_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_DATA_LEN,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_request_mem_ind_msg_v01,
-					   mem_seg_len),
-	},
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = QMI_WLFW_MAX_NUM_MEM_SEG_V01,
-		.elem_size      = sizeof(struct wlfw_mem_seg_s_v01),
-		.array_type       = VAR_LEN_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_request_mem_ind_msg_v01,
-					   mem_seg),
-		.ei_array      = wlfw_mem_seg_s_v01_ei,
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_respond_mem_req_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_DATA_LEN,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_respond_mem_req_msg_v01,
-					   mem_seg_len),
-	},
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = QMI_WLFW_MAX_NUM_MEM_SEG_V01,
-		.elem_size      = sizeof(struct wlfw_mem_seg_resp_s_v01),
-		.array_type       = VAR_LEN_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_respond_mem_req_msg_v01,
-					   mem_seg),
-		.ei_array      = wlfw_mem_seg_resp_s_v01_ei,
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_respond_mem_resp_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_respond_mem_resp_msg_v01,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_mem_ready_ind_msg_v01_ei[] = {
-	{}
-};
-
-const struct qmi_elem_info wlfw_fw_init_done_ind_msg_v01_ei[] = {
-	{}
-};
-
-const struct qmi_elem_info wlfw_rejuvenate_ind_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
-					   cause_for_rejuvenation_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
-					   cause_for_rejuvenation),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x11,
-		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
-					   requesting_sub_system_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x11,
-		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
-					   requesting_sub_system),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x12,
-		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
-					   line_number_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_2_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u16),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x12,
-		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
-					   line_number),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x13,
-		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
-					   function_name_valid),
-	},
-	{
-		.data_type      = QMI_STRING,
-		.elem_len       = QMI_WLFW_FUNCTION_NAME_LEN_V01 + 1,
-		.elem_size      = sizeof(char),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x13,
-		.offset         = offsetof(struct wlfw_rejuvenate_ind_msg_v01,
-					   function_name),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_rejuvenate_ack_req_msg_v01_ei[] = {
-	{}
-};
-
-const struct qmi_elem_info wlfw_rejuvenate_ack_resp_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_rejuvenate_ack_resp_msg_v01,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_dynamic_feature_mask_req_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_dynamic_feature_mask_req_msg_v01,
-					   mask_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_8_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u64),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_dynamic_feature_mask_req_msg_v01,
-					   mask),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_dynamic_feature_mask_resp_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_dynamic_feature_mask_resp_msg_v01,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_dynamic_feature_mask_resp_msg_v01,
-					   prev_mask_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_8_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u64),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x10,
-		.offset         = offsetof(struct wlfw_dynamic_feature_mask_resp_msg_v01,
-					   prev_mask),
-	},
-	{
-		.data_type      = QMI_OPT_FLAG,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x11,
-		.offset         = offsetof(struct wlfw_dynamic_feature_mask_resp_msg_v01,
-					   curr_mask_valid),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_8_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u64),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x11,
-		.offset         = offsetof(struct wlfw_dynamic_feature_mask_resp_msg_v01,
-					   curr_mask),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_m3_info_req_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_UNSIGNED_8_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u64),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_m3_info_req_msg_v01,
-					   addr),
-	},
-	{
-		.data_type      = QMI_UNSIGNED_4_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u32),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_m3_info_req_msg_v01,
-					   size),
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_m3_info_resp_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_STRUCT,
-		.elem_len       = 1,
-		.elem_size      = sizeof(struct qmi_response_type_v01),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x02,
-		.offset         = offsetof(struct wlfw_m3_info_resp_msg_v01,
-					   resp),
-		.ei_array      = qmi_response_type_v01_ei,
-	},
-	{}
-};
-
-const struct qmi_elem_info wlfw_xo_cal_ind_msg_v01_ei[] = {
-	{
-		.data_type      = QMI_UNSIGNED_1_BYTE,
-		.elem_len       = 1,
-		.elem_size      = sizeof(u8),
-		.array_type     = NO_ARRAY,
-		.tlv_type       = 0x01,
-		.offset         = offsetof(struct wlfw_xo_cal_ind_msg_v01,
-					   xo_cal_data),
-	},
-	{}
-};
diff --git a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
index 8d4b929e8437..a1bffd89d3bd 100644
--- a/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
+++ b/drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h
@@ -61,19 +61,14 @@
 #define QMI_WLFW_IND_REGISTER_RESP_V01 0x0020
 
 #define QMI_WLFW_MAX_MEM_REG_V01 2
-#define QMI_WLFW_MAX_NUM_MEM_SEG_V01 16
 #define QMI_WLFW_MAX_NUM_CAL_V01 5
 #define QMI_WLFW_MAX_DATA_SIZE_V01 6144
-#define QMI_WLFW_FUNCTION_NAME_LEN_V01 128
 #define QMI_WLFW_MAX_NUM_CE_V01 12
 #define QMI_WLFW_MAX_TIMESTAMP_LEN_V01 32
-#define QMI_WLFW_MAX_ATHDIAG_DATA_SIZE_V01 6144
 #define QMI_WLFW_MAX_NUM_GPIO_V01 32
 #define QMI_WLFW_MAX_BUILD_ID_LEN_V01 128
-#define QMI_WLFW_MAX_NUM_MEM_CFG_V01 2
 #define QMI_WLFW_MAX_STR_LEN_V01 16
 #define QMI_WLFW_MAX_NUM_SHADOW_REG_V01 24
-#define QMI_WLFW_MAC_ADDR_SIZE_V01 6
 #define QMI_WLFW_MAX_SHADOW_REG_V2 36
 #define QMI_WLFW_MAX_NUM_SVC_V01 24
 
@@ -103,11 +98,6 @@ enum wlfw_pipedir_enum_v01 {
 	QMI_WLFW_PIPEDIR_INOUT_V01 = 3,
 };
 
-enum wlfw_mem_type_enum_v01 {
-	QMI_WLFW_MEM_TYPE_MSA_V01 = 0,
-	QMI_WLFW_MEM_TYPE_DDR_V01 = 1,
-};
-
 #define QMI_WLFW_CE_ATTR_FLAGS_V01 ((u32)0x00)
 #define QMI_WLFW_CE_ATTR_NO_SNOOP_V01 ((u32)0x01)
 #define QMI_WLFW_CE_ATTR_BYTE_SWAP_DATA_V01 ((u32)0x02)
@@ -152,25 +142,6 @@ struct wlfw_memory_region_info_s_v01 {
 	u8 secure_flag;
 };
 
-struct wlfw_mem_cfg_s_v01 {
-	u64 offset;
-	u32 size;
-	u8 secure_flag;
-};
-
-struct wlfw_mem_seg_s_v01 {
-	u32 size;
-	enum wlfw_mem_type_enum_v01 type;
-	u32 mem_cfg_len;
-	struct wlfw_mem_cfg_s_v01 mem_cfg[QMI_WLFW_MAX_NUM_MEM_CFG_V01];
-};
-
-struct wlfw_mem_seg_resp_s_v01 {
-	u64 addr;
-	u32 size;
-	enum wlfw_mem_type_enum_v01 type;
-};
-
 struct wlfw_rf_chip_info_s_v01 {
 	u32 chip_id;
 	u32 chip_family;
@@ -240,18 +211,6 @@ struct wlfw_msa_ready_ind_msg_v01 {
 #define WLFW_MSA_READY_IND_MSG_V01_MAX_MSG_LEN 0
 extern const struct qmi_elem_info wlfw_msa_ready_ind_msg_v01_ei[];
 
-struct wlfw_pin_connect_result_ind_msg_v01 {
-	u8 pwr_pin_result_valid;
-	u32 pwr_pin_result;
-	u8 phy_io_pin_result_valid;
-	u32 phy_io_pin_result;
-	u8 rf_pin_result_valid;
-	u32 rf_pin_result;
-};
-
-#define WLFW_PIN_CONNECT_RESULT_IND_MSG_V01_MAX_MSG_LEN 21
-extern const struct qmi_elem_info wlfw_pin_connect_result_ind_msg_v01_ei[];
-
 struct wlfw_wlan_mode_req_msg_v01 {
 	enum wlfw_driver_mode_enum_v01 mode;
 	u8 hw_debug_valid;
@@ -365,72 +324,6 @@ struct wlfw_cal_report_resp_msg_v01 {
 #define WLFW_CAL_REPORT_RESP_MSG_V01_MAX_MSG_LEN 7
 extern const struct qmi_elem_info wlfw_cal_report_resp_msg_v01_ei[];
 
-struct wlfw_initiate_cal_download_ind_msg_v01 {
-	enum wlfw_cal_temp_id_enum_v01 cal_id;
-};
-
-#define WLFW_INITIATE_CAL_DOWNLOAD_IND_MSG_V01_MAX_MSG_LEN 7
-extern const struct qmi_elem_info wlfw_initiate_cal_download_ind_msg_v01_ei[];
-
-struct wlfw_cal_download_req_msg_v01 {
-	u8 valid;
-	u8 file_id_valid;
-	enum wlfw_cal_temp_id_enum_v01 file_id;
-	u8 total_size_valid;
-	u32 total_size;
-	u8 seg_id_valid;
-	u32 seg_id;
-	u8 data_valid;
-	u32 data_len;
-	u8 data[QMI_WLFW_MAX_DATA_SIZE_V01];
-	u8 end_valid;
-	u8 end;
-};
-
-#define WLFW_CAL_DOWNLOAD_REQ_MSG_V01_MAX_MSG_LEN 6178
-extern const struct qmi_elem_info wlfw_cal_download_req_msg_v01_ei[];
-
-struct wlfw_cal_download_resp_msg_v01 {
-	struct qmi_response_type_v01 resp;
-};
-
-#define WLFW_CAL_DOWNLOAD_RESP_MSG_V01_MAX_MSG_LEN 7
-extern const struct qmi_elem_info wlfw_cal_download_resp_msg_v01_ei[];
-
-struct wlfw_initiate_cal_update_ind_msg_v01 {
-	enum wlfw_cal_temp_id_enum_v01 cal_id;
-	u32 total_size;
-};
-
-#define WLFW_INITIATE_CAL_UPDATE_IND_MSG_V01_MAX_MSG_LEN 14
-extern const struct qmi_elem_info wlfw_initiate_cal_update_ind_msg_v01_ei[];
-
-struct wlfw_cal_update_req_msg_v01 {
-	enum wlfw_cal_temp_id_enum_v01 cal_id;
-	u32 seg_id;
-};
-
-#define WLFW_CAL_UPDATE_REQ_MSG_V01_MAX_MSG_LEN 14
-extern const struct qmi_elem_info wlfw_cal_update_req_msg_v01_ei[];
-
-struct wlfw_cal_update_resp_msg_v01 {
-	struct qmi_response_type_v01 resp;
-	u8 file_id_valid;
-	enum wlfw_cal_temp_id_enum_v01 file_id;
-	u8 total_size_valid;
-	u32 total_size;
-	u8 seg_id_valid;
-	u32 seg_id;
-	u8 data_valid;
-	u32 data_len;
-	u8 data[QMI_WLFW_MAX_DATA_SIZE_V01];
-	u8 end_valid;
-	u8 end;
-};
-
-#define WLFW_CAL_UPDATE_RESP_MSG_V01_MAX_MSG_LEN 6181
-extern const struct qmi_elem_info wlfw_cal_update_resp_msg_v01_ei[];
-
 struct wlfw_msa_info_req_msg_v01 {
 	u64 msa_addr;
 	u32 size;
@@ -477,71 +370,6 @@ struct wlfw_ini_resp_msg_v01 {
 #define WLFW_INI_RESP_MSG_V01_MAX_MSG_LEN 7
 extern const struct qmi_elem_info wlfw_ini_resp_msg_v01_ei[];
 
-struct wlfw_athdiag_read_req_msg_v01 {
-	u32 offset;
-	u32 mem_type;
-	u32 data_len;
-};
-
-#define WLFW_ATHDIAG_READ_REQ_MSG_V01_MAX_MSG_LEN 21
-extern const struct qmi_elem_info wlfw_athdiag_read_req_msg_v01_ei[];
-
-struct wlfw_athdiag_read_resp_msg_v01 {
-	struct qmi_response_type_v01 resp;
-	u8 data_valid;
-	u32 data_len;
-	u8 data[QMI_WLFW_MAX_ATHDIAG_DATA_SIZE_V01];
-};
-
-#define WLFW_ATHDIAG_READ_RESP_MSG_V01_MAX_MSG_LEN 6156
-extern const struct qmi_elem_info wlfw_athdiag_read_resp_msg_v01_ei[];
-
-struct wlfw_athdiag_write_req_msg_v01 {
-	u32 offset;
-	u32 mem_type;
-	u32 data_len;
-	u8 data[QMI_WLFW_MAX_ATHDIAG_DATA_SIZE_V01];
-};
-
-#define WLFW_ATHDIAG_WRITE_REQ_MSG_V01_MAX_MSG_LEN 6163
-extern const struct qmi_elem_info wlfw_athdiag_write_req_msg_v01_ei[];
-
-struct wlfw_athdiag_write_resp_msg_v01 {
-	struct qmi_response_type_v01 resp;
-};
-
-#define WLFW_ATHDIAG_WRITE_RESP_MSG_V01_MAX_MSG_LEN 7
-extern const struct qmi_elem_info wlfw_athdiag_write_resp_msg_v01_ei[];
-
-struct wlfw_vbatt_req_msg_v01 {
-	u64 voltage_uv;
-};
-
-#define WLFW_VBATT_REQ_MSG_V01_MAX_MSG_LEN 11
-extern const struct qmi_elem_info wlfw_vbatt_req_msg_v01_ei[];
-
-struct wlfw_vbatt_resp_msg_v01 {
-	struct qmi_response_type_v01 resp;
-};
-
-#define WLFW_VBATT_RESP_MSG_V01_MAX_MSG_LEN 7
-extern const struct qmi_elem_info wlfw_vbatt_resp_msg_v01_ei[];
-
-struct wlfw_mac_addr_req_msg_v01 {
-	u8 mac_addr_valid;
-	u8 mac_addr[QMI_WLFW_MAC_ADDR_SIZE_V01];
-};
-
-#define WLFW_MAC_ADDR_REQ_MSG_V01_MAX_MSG_LEN 9
-extern const struct qmi_elem_info wlfw_mac_addr_req_msg_v01_ei[];
-
-struct wlfw_mac_addr_resp_msg_v01 {
-	struct qmi_response_type_v01 resp;
-};
-
-#define WLFW_MAC_ADDR_RESP_MSG_V01_MAX_MSG_LEN 7
-extern const struct qmi_elem_info wlfw_mac_addr_resp_msg_v01_ei[];
-
 #define QMI_WLFW_MAX_NUM_GPIO_V01 32
 struct wlfw_host_cap_req_msg_v01 {
 	u8 daemon_support_valid;
@@ -584,110 +412,4 @@ struct wlfw_host_cap_resp_msg_v01 {
 #define WLFW_HOST_CAP_RESP_MSG_V01_MAX_MSG_LEN 7
 extern const struct qmi_elem_info wlfw_host_cap_resp_msg_v01_ei[];
 
-struct wlfw_request_mem_ind_msg_v01 {
-	u32 mem_seg_len;
-	struct wlfw_mem_seg_s_v01 mem_seg[QMI_WLFW_MAX_NUM_MEM_SEG_V01];
-};
-
-#define WLFW_REQUEST_MEM_IND_MSG_V01_MAX_MSG_LEN 564
-extern const struct qmi_elem_info wlfw_request_mem_ind_msg_v01_ei[];
-
-struct wlfw_respond_mem_req_msg_v01 {
-	u32 mem_seg_len;
-	struct wlfw_mem_seg_resp_s_v01 mem_seg[QMI_WLFW_MAX_NUM_MEM_SEG_V01];
-};
-
-#define WLFW_RESPOND_MEM_REQ_MSG_V01_MAX_MSG_LEN 260
-extern const struct qmi_elem_info wlfw_respond_mem_req_msg_v01_ei[];
-
-struct wlfw_respond_mem_resp_msg_v01 {
-	struct qmi_response_type_v01 resp;
-};
-
-#define WLFW_RESPOND_MEM_RESP_MSG_V01_MAX_MSG_LEN 7
-extern const struct qmi_elem_info wlfw_respond_mem_resp_msg_v01_ei[];
-
-struct wlfw_mem_ready_ind_msg_v01 {
-	char placeholder;
-};
-
-#define WLFW_MEM_READY_IND_MSG_V01_MAX_MSG_LEN 0
-extern const struct qmi_elem_info wlfw_mem_ready_ind_msg_v01_ei[];
-
-struct wlfw_fw_init_done_ind_msg_v01 {
-	char placeholder;
-};
-
-#define WLFW_FW_INIT_DONE_IND_MSG_V01_MAX_MSG_LEN 0
-extern const struct qmi_elem_info wlfw_fw_init_done_ind_msg_v01_ei[];
-
-struct wlfw_rejuvenate_ind_msg_v01 {
-	u8 cause_for_rejuvenation_valid;
-	u8 cause_for_rejuvenation;
-	u8 requesting_sub_system_valid;
-	u8 requesting_sub_system;
-	u8 line_number_valid;
-	u16 line_number;
-	u8 function_name_valid;
-	char function_name[QMI_WLFW_FUNCTION_NAME_LEN_V01 + 1];
-};
-
-#define WLFW_REJUVENATE_IND_MSG_V01_MAX_MSG_LEN 144
-extern const struct qmi_elem_info wlfw_rejuvenate_ind_msg_v01_ei[];
-
-struct wlfw_rejuvenate_ack_req_msg_v01 {
-	char placeholder;
-};
-
-#define WLFW_REJUVENATE_ACK_REQ_MSG_V01_MAX_MSG_LEN 0
-extern const struct qmi_elem_info wlfw_rejuvenate_ack_req_msg_v01_ei[];
-
-struct wlfw_rejuvenate_ack_resp_msg_v01 {
-	struct qmi_response_type_v01 resp;
-};
-
-#define WLFW_REJUVENATE_ACK_RESP_MSG_V01_MAX_MSG_LEN 7
-extern const struct qmi_elem_info wlfw_rejuvenate_ack_resp_msg_v01_ei[];
-
-struct wlfw_dynamic_feature_mask_req_msg_v01 {
-	u8 mask_valid;
-	u64 mask;
-};
-
-#define WLFW_DYNAMIC_FEATURE_MASK_REQ_MSG_V01_MAX_MSG_LEN 11
-extern const struct qmi_elem_info wlfw_dynamic_feature_mask_req_msg_v01_ei[];
-
-struct wlfw_dynamic_feature_mask_resp_msg_v01 {
-	struct qmi_response_type_v01 resp;
-	u8 prev_mask_valid;
-	u64 prev_mask;
-	u8 curr_mask_valid;
-	u64 curr_mask;
-};
-
-#define WLFW_DYNAMIC_FEATURE_MASK_RESP_MSG_V01_MAX_MSG_LEN 29
-extern const struct qmi_elem_info wlfw_dynamic_feature_mask_resp_msg_v01_ei[];
-
-struct wlfw_m3_info_req_msg_v01 {
-	u64 addr;
-	u32 size;
-};
-
-#define WLFW_M3_INFO_REQ_MSG_V01_MAX_MSG_LEN 18
-extern const struct qmi_elem_info wlfw_m3_info_req_msg_v01_ei[];
-
-struct wlfw_m3_info_resp_msg_v01 {
-	struct qmi_response_type_v01 resp;
-};
-
-#define WLFW_M3_INFO_RESP_MSG_V01_MAX_MSG_LEN 7
-extern const struct qmi_elem_info wlfw_m3_info_resp_msg_v01_ei[];
-
-struct wlfw_xo_cal_ind_msg_v01 {
-	u8 xo_cal_data;
-};
-
-#define WLFW_XO_CAL_IND_MSG_V01_MAX_MSG_LEN 4
-extern const struct qmi_elem_info wlfw_xo_cal_ind_msg_v01_ei[];
-
 #endif
-- 
2.53.0


