Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB04606B37C
	for <ath10k@archiver.kernel.org>; Thu, 12 Nov 2026 11:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xNnWoc8+;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlttWxlm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dyuv8HCK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eX+da1b+MVcHID5GzcHj7M4eExkMrlV1smciu9FI1s4=; b=xNnWoc8+1noGmI
	hFCKcLnFLxMnn6Se/T8FW0PHCEnzfi3Y+bbv/2ZdrBDWm9ZLWk+JXfVXcawalT4BG868s2pR+SqqI
	cKpBsF+/EudUlKFDrEzZ2ZkcNCSsPmxl+y8uEai1jmpVukcFlmIyVWzhNhPBNiFd5P5cgHZ5d0b+h
	EO81aO8NhAbb5qZLelSc47/E0Ci9yOiwOgPylaN+itB7ZJIAgamKW2jlOvnd5RZs8/XP9ISW9PBk5
	jMcU6JytKa/HqiOu65/GLbvJrQbIq+XqXswWkgk/B97WKoHayS5NLTot6XkyKMMW1FFrE9eAHD5kU
	6aea4OMoJdXZL/LB8saw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSxl-00000009hlr-2ymp;
	Thu, 12 Nov 2026 11:27:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSx0-00000009h5W-1cZx
	for ath10k@lists.infradead.org;
	Thu, 12 Nov 2026 11:26:59 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC7oVPd2818498
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 11:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eX+da1b+MVcHID5GzcHj7M4eExkMrlV1smciu9FI1s4=; b=nlttWxlm7ef8wzNf
	xAibSwWx8YCu3ggPZ2uKh8kuKX9HwyFLxZaAHyHOA4kS8nSHds3nNbr0WWwxT+dn
	kTZBTvsAOfZDT+Of0HzTr3h6vkAgI9KkRSIxIoNrJnADDbfJtzhl8KEBWqPfwOPu
	1eQS+Xmmr1mzHnoVlUS9E95PBXq+5ludQIMNSmTO2/1KPTLV9YkTT1UhDu9ND1JY
	YAnYLbALR7N6B14IzTzVXd2qm1zzjASKHlwqQHi44ckvr0DdkdYo3TkUSNUjOp3O
	ajBrGufYY8+PznckZ04+bU12BA1h1wcebIMrvqLVrJedNvvtX9pE7Tm7g8XygC8l
	fMFErQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw9e18rxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 11:26:41 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so586453eec.0
        for <ath10k@lists.infradead.org>; Thu, 12 Nov 2026 03:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482800; x=1795087600; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eX+da1b+MVcHID5GzcHj7M4eExkMrlV1smciu9FI1s4=;
        b=Dyuv8HCKjbwJK3vDX8+r2JYO0DW0OLcNa4Z591YPU5CxCC47+fA0J/syTzph8LUYRn
         /rHNmg6Pu7FFdI9JL6JK8K7XNhaVLtt78dHgv+1CkyuIRcwOnHjYVGlR7gXHYSHF1WcX
         eaGzXuYBc+8zQry9j0V0N8uVjwZssH77yE4oQD4c5N8wTvsKWD0TWt2P+pSLwWbk1mY4
         sFrFdoCFaf/fqDza5f7OdutQUOYEJOhRJsHdSJdV/GB06xxvb2EE31ibl4Gf82XBsfhZ
         w+vZrSKqtcyGwKMpv6K5xdFxhAsD73jAAiO2sgyWPK4ldANEB3dqi1YAjBFAmRUiuErA
         rA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482800; x=1795087600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eX+da1b+MVcHID5GzcHj7M4eExkMrlV1smciu9FI1s4=;
        b=Vo1hgf+GjGpG8dE5Q8iFnNB+Uu+zqVnx2+4r+aP6DhSWgCUbsHooAEjRQdnKUXg9hy
         IJBDqyq1nVAaHrlgUQFr/a2ZY9ilZ3cAzMH8/QulcBDCt2PrMBx/8oOtnhHNonE/UydB
         q/4yPJFNogLBhpjuxhzCQmfbykQlNcwXtL0t/lgV7yDtaQtXTCldz6Rs1QJRhAMQgue1
         oiWLr1k+w24YLEPKy7bmJjixorFBjMb/lN41KYQKT7XaBtlquAlbdSYreRVQM5jNGuv4
         NeDOAR9/sMoQmoh1v0XUyTRLMZuDDrWXyiKU0PIb7H/kygU8nymnMNoFYuX7Qnvo1tgk
         xMjA==
X-Forwarded-Encrypted: i=1; AL+hErFd3QXWsHYOL4/f2rkYztI/I97FjUU1sBTTFuZwKO2uyivCaGA4dAwCCuhPdzvxvkF6AdrCrcQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z+vHHaQf6AHCagRu+9ORFliG3mdkhREwoVofM7Id1uRyieHRk1U
	998hupRxHLF4j3+PpDNurFGHEbRAZ3rcsA2VRNFWncM9QcxY/pKQY13mxjTMkro6F9PQtzzxi3h
	rD+pgXDqrUFP3dICrghgnh7lORsMDllbK3Ji0aj5nmT6Y6ecppS3RQhzVA/oDpEh7
X-Gm-Gg: AYBFou3UhYHV6JOnQB+IXKhqBjytnJ22cLp2MHqmj4Z0O87DJXXsO+9UMNOCuKbc741
	H4wT67iCPs0eYM81/S+a8BMTpUim4GgOngXURnTBKHNPqhSdvfo+rYGpjvsXd2O6UgY9q+TxPaJ
	iG1AZ4+eO0JHiC0VX23CGsfJtF2uEZi9kCnSJ6ZywfH7fRmCb6G5Idk1y5VxqQ+RBc/X0wwN3Ck
	81SgM/fy8lKlUOaAgZWL5CBxNZXEUEUQJzcIWn9LMlOUG3vQ2rDzfhtAtBl3dMPavTsS3QOwXKi
	taRTPX/HygB8BWz+/62yDy12JjeL7y0u6z6vUnbCNGiS3iiISQ+GdpbDCXVBc+cvmv2qNRDQJKE
	KMCZJpr+8wUSOBSTxlUv5L2knsYeZFA/G9bfjasm8le5cj5TmQZaR8z6uuRRRjd4EOGCfvro7wv
	d0mzAKCXRIYYtGN4LkLAlx/ww8
X-Received: by 2002:a05:7301:1602:b0:369:f17d:efb with SMTP id 5a478bee46e88-377e1016141mr1890711eec.10.1794482800035;
        Thu, 12 Nov 2026 03:26:40 -0800 (PST)
X-Received: by 2002:a05:7301:1602:b0:369:f17d:efb with SMTP id 5a478bee46e88-377e1016141mr1890695eec.10.1794482799404;
        Thu, 12 Nov 2026 03:26:39 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:38 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:09 -0800
Subject: [PATCH ath-next v3 10/10] wifi: ath10k: drop async writes and
 sleep timer across power cycles
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-10k-sdio-crash-v3-10-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=6579;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=CbJZGKXefg/gwrgcyT9QBK0Y0s7aG1/Z1G07SIrXXps=;
 b=OU9GbDNRpHQE3xpmQtcOW2RZiMzweHwMnf+34uKU9jpUnTKcWXsdBMCvpeUIAti+7ACtlitmh
 6fR7VkHOAgBCPXF3plaCju+gAN+T0/Zry/TM7yG0tuuVEj7phIFtqa5
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfXzvJUJOXgThbn
 5dliaVduHHWS4wYYKBkUXeIDidmLNBppjnBXKiQrbIQb92QodHIYSfKmV4FxfI0CmuYqutUvsV1
 /ttlIWf6YZJ3TT6qOHBF0hOZ4m2BD3nmkVtiJKOhqKnNIMQWjf1SphHGDi5gjfxRVhW3haqNYrP
 YLVS8nCOHCP3mi3YdeRCeA3U/TPvYOqkgRV4fDGLH5hFO3CqfDeJTRkTY5I2txbZsHhV+LdUc78
 YmMg0mlri0HzzOB7o9sbylUcpeukmD3Nnt5PibeKi7a8Z6FMbXdcVXhy9sbJmZvuz7cTWsi9s93
 f+6FiVKdmg1DcW9W6Cq5GlpjyKdXcQyGicE+yEMHT4ch9LZA8LHc8+F3prQrFLGnuSMBUrSjHVS
 KXGnlCO3ZnDeeMXiPNmWNSNh7jw66yDprbYJeqY9+07gGntWc2wExenKsiMaYWIlOvSKsqnCLM2
 sXxTyE3zLJlAtirC+xw==
X-Proofpoint-GUID: tghDAmCGPcEcWH5ToW2uBgDhsR0jEXS9
X-Proofpoint-ORIG-GUID: tghDAmCGPcEcWH5ToW2uBgDhsR0jEXS9
X-Authority-Analysis: v=2.4 cv=F6fC5ahN c=1 sm=1 tr=0 ts=6af5a271 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=fr4EAzCGZu4FAUfOKUQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX0y8W3C/UdKlo
 Q+zmIA9EQmu9S/t9cJ/JglAquFRl8zlJqtfI/dQEIHfnXimdClwDNM2ilMLu57bOo8QI13/mK+5
 7kJ6wzfXAnYazxoraTcOEwpps0esQGk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_032644_289286_18C09B8C 
X-CRM114-Status: GOOD (  21.89  )
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

ath10k_sdio_hif_tx_sg() queues writes on ar_sdio->wr_asyncq and
schedules wr_async_work. The SDIO sleep timer also schedules this
work, and the work may re-arm the timer.

The current shutdown sequence does not prevent this activity from
surviving an SDIO power cycle:

  - ath10k_sdio_hif_stop() drains wr_asyncq once, but new writes may
    still be queued before the card is marked disabled.

  - ath10k_sdio_hif_power_down() deletes the sleep timer but does not
    cancel wr_async_work.

  - ath10k_sdio_hif_power_up() does not clear work or requests left
    from the previous power cycle.

As a result, stale work may access the SDIO bus while the device is
being reinitialized in BMI mode, causing errors such as:

      failed to read from address 0x868: -110
      failed to read fifo/chip control register: -110
      bmi communication timeout
      could not write board data (-110)

Mark the card disabled before power-down begins so new asynchronous
transfers are rejected. Make wr_async_work drop requests that raced
with the state change instead of accessing the bus.

Synchronize the sleep timer and wr_async_work, then drain wr_asyncq
during both power-down and power-up so no request from an earlier
power cycle can run during BMI initialization. Factor the queue
cleanup into a helper shared with ath10k_sdio_hif_stop().

A dropped request is completed the same way as a written one, only
without the bus access. HTC messages go through
ath10k_htc_notify_tx_completion(), which lets the endpoint release the
skb. The IRQ disable request signals its completion and leaves the skb
to the waiter, which frees it. Every bus request is returned to the
free pool, so nothing is leaked.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/sdio.c | 78 ++++++++++++++++++++++++----------
 1 file changed, 56 insertions(+), 22 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index fdf19ce4b55b..f0e1feacb629 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -1461,6 +1461,33 @@ static void ath10k_sdio_sleep_timer_handler(struct timer_list *t)
 	queue_work(ar_sdio->workqueue, &ar_sdio->wr_async_work);
 }
 
+/* Drop any requests still queued on wr_asyncq without touching the bus.
+ * Caller must ensure wr_async_work is not running concurrently.
+ */
+static void ath10k_sdio_drop_wr_async_reqs(struct ath10k *ar)
+{
+	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
+	struct ath10k_sdio_bus_request *req, *tmp_req;
+
+	spin_lock_bh(&ar_sdio->wr_async_lock);
+
+	list_for_each_entry_safe(req, tmp_req, &ar_sdio->wr_asyncq, list) {
+		struct ath10k_htc_ep *ep;
+
+		list_del(&req->list);
+
+		if (req->htc_msg) {
+			ep = &ar->htc.endpoint[req->eid];
+			ath10k_htc_notify_tx_completion(ep, req->skb);
+		} else if (req->comp) {
+			complete(req->comp);
+		}
+		ath10k_sdio_free_bus_req(ar, req);
+	}
+
+	spin_unlock_bh(&ar_sdio->wr_async_lock);
+}
+
 static void ath10k_sdio_write_async_work(struct work_struct *work)
 {
 	struct ath10k_sdio *ar_sdio = container_of(work, struct ath10k_sdio,
@@ -1469,6 +1496,15 @@ static void ath10k_sdio_write_async_work(struct work_struct *work)
 	struct ath10k_sdio_bus_request *req, *tmp_req;
 	struct ath10k_mbox_info *mbox_info = &ar_sdio->mbox_info;
 
+	/* The card is powered down; drop pending requests instead of
+	 * touching the bus. Prevents stale writes from racing with a
+	 * concurrent BMI power-up on the next recovery cycle.
+	 */
+	if (ar_sdio->is_disabled) {
+		ath10k_sdio_drop_wr_async_reqs(ar);
+		return;
+	}
+
 	spin_lock_bh(&ar_sdio->wr_async_lock);
 
 	list_for_each_entry_safe(req, tmp_req, &ar_sdio->wr_asyncq, list) {
@@ -1586,6 +1622,13 @@ static int ath10k_sdio_hif_power_up(struct ath10k *ar,
 	if (!ar_sdio->is_disabled)
 		return 0;
 
+	/* Flush any sleep timer or async work left over from the previous
+	 * cycle so they cannot fire during BMI and poke the bus.
+	 */
+	timer_delete_sync(&ar_sdio->sleep_timer);
+	cancel_work_sync(&ar_sdio->wr_async_work);
+	ath10k_sdio_drop_wr_async_reqs(ar);
+
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "sdio power on\n");
 
 	ret = ath10k_sdio_config(ar);
@@ -1629,7 +1672,16 @@ static void ath10k_sdio_hif_power_down(struct ath10k *ar)
 
 	ath10k_dbg(ar, ATH10K_DBG_BOOT, "sdio power off\n");
 
+	/* Reject new async writes from ath10k_sdio_hif_tx_sg() and make
+	 * ath10k_sdio_write_async_work() drop any already-queued
+	 * requests before they touch the bus.
+	 */
+	ar_sdio->is_disabled = true;
+
 	timer_delete_sync(&ar_sdio->sleep_timer);
+	cancel_work_sync(&ar_sdio->wr_async_work);
+	ath10k_sdio_drop_wr_async_reqs(ar);
+
 	ath10k_sdio_set_mbox_sleep(ar, true);
 
 	/* Disable the card */
@@ -1647,8 +1699,6 @@ static void ath10k_sdio_hif_power_down(struct ath10k *ar)
 		ath10k_warn(ar, "unable to reset sdio: %d\n", ret);
 
 	sdio_release_host(ar_sdio->func);
-
-	ar_sdio->is_disabled = true;
 }
 
 static int ath10k_sdio_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
@@ -1659,6 +1709,9 @@ static int ath10k_sdio_hif_tx_sg(struct ath10k *ar, u8 pipe_id,
 	struct sk_buff *skb;
 	int ret, i;
 
+	if (ar_sdio->is_disabled)
+		return -ESHUTDOWN;
+
 	eid = pipe_id_to_eid(pipe_id);
 
 	for (i = 0; i < n_items; i++) {
@@ -1972,7 +2025,6 @@ static void ath10k_sdio_irq_disable(struct ath10k *ar)
 
 static void ath10k_sdio_hif_stop(struct ath10k *ar)
 {
-	struct ath10k_sdio_bus_request *req, *tmp_req;
 	struct ath10k_sdio *ar_sdio = ath10k_sdio_priv(ar);
 	struct sk_buff *skb;
 
@@ -1984,25 +2036,7 @@ static void ath10k_sdio_hif_stop(struct ath10k *ar)
 		dev_kfree_skb_any(skb);
 
 	cancel_work_sync(&ar_sdio->wr_async_work);
-
-	spin_lock_bh(&ar_sdio->wr_async_lock);
-
-	/* Free all bus requests that have not been handled */
-	list_for_each_entry_safe(req, tmp_req, &ar_sdio->wr_asyncq, list) {
-		struct ath10k_htc_ep *ep;
-
-		list_del(&req->list);
-
-		if (req->htc_msg) {
-			ep = &ar->htc.endpoint[req->eid];
-			ath10k_htc_notify_tx_completion(ep, req->skb);
-		} else if (req->skb) {
-			kfree_skb(req->skb);
-		}
-		ath10k_sdio_free_bus_req(ar, req);
-	}
-
-	spin_unlock_bh(&ar_sdio->wr_async_lock);
+	ath10k_sdio_drop_wr_async_reqs(ar);
 
 	ath10k_core_napi_sync_disable(ar);
 }

-- 
2.34.1


