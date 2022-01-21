Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41FAC433EF
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 06:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=bcqR08NoqbjA6VhuNsgXFQ6pJihN6NTdWT1LzevwTFY=; b=mVC
	+hVfIVfcIyKLDDFBlCLwd22YltcjIEh6dO+xa3draIKujZ0vKMt4DfZOAizC7/afsCxPmqchyUOXG
	PzdZbwIjiDu+33L8e8YPkFPwVGvp0Csn+1z3LMXP1BPViTpB4rlEWNBNEJkNGkDRSEwgx4fZ5eImW
	YSGDkUjMehsD3YZOXZtYhO0R7IhwyBMQV0GKZzTnhd+mQdw68PyQLONXbaCB1tumVAOKMgitH3unq
	0MtLW7k2Tk90vXuMpPdkjKWoJWJFexJM47bw9z73TXDh2ZJ3t33RyzVJqeYwZy5Km3URcrcJm/j3g
	LniWicivr8USB2MzIhyytEBrb15YFvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAnfJ-00DzRR-Nc; Fri, 21 Jan 2022 06:44:53 +0000
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAnfE-00DzPS-1z
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 06:44:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1642747488; x=1674283488;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6WtxJ6G8QH17m9vpF9tZ9iNboVlbxxw9g9H61lLIeeY=;
 b=Y91CkHh6XQAnBS/aXnteV+dYUI5yquIa0/92VhIp79cRUJBWJy9hiYfi
 NaetRKyFqYWn/mHOfSR90tue4p4BOG5LS5iwVNumjQFUvBcFapTYBUpi7
 V2cwh4VScSGVCBQkS+98gk2NrCTEsxzyqGS/7OFA6va08GAEtGgv5vJW/ M=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 20 Jan 2022 22:44:47 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 20 Jan 2022 22:44:46 -0800
X-QCInternal: smtphost
Received: from unknown (HELO youghand-linux.qualcomm.com) ([10.206.66.115])
 by ironmsg01-blr.qualcomm.com with ESMTP; 21 Jan 2022 12:14:30 +0530
Received: by youghand-linux.qualcomm.com (Postfix, from userid 2370257)
 id 6A162225AE; Fri, 21 Jan 2022 12:14:29 +0530 (IST)
From: Youghandhar Chintala <quic_youghand@quicinc.com>
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_pillair@quicinc.com, dianders@chromium.org, kuabhs@chromium.org,
 briannorris@chromium.org, Youghandhar Chintala <quic_youghand@quicinc.com>
Subject: [RFC 0/2] ath10k:set tx credit to one and delay the unmaping 
Date: Fri, 21 Jan 2022 12:14:25 +0530
Message-Id: <20220121064427.32059-1-quic_youghand@quicinc.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_224448_160773_E9562C67 
X-CRM114-Status: UNSURE (   7.61  )
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
Content-Type: multipart/mixed; boundary="===============6399913783679469623=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

--===============6399913783679469623==
Content-Type: text/plain; charset=n
Content-Transfer-Encoding: 8bit

Currently for WCN3990, the host driver can send two wmi commands at once, 
now it is limiting to one because if HOST wants to initiate 2 DMA transfers,
it is possible when copy complete interrupt for first DMA reaches HOST,  
CE has already updated SRRI for both DMA transfers and is in the middle 
of 2nd DMA. HOST uses SRRI to interpret how many DMA’s have been completed 
and tries to unmap/free both the DMA entries, but CE is still in the middle
of 2nd DMA which can cause SMMU issues or corruption.

We are seeing a corner case smmu fault issue where copy engine is still accessing
the memory though host unmaps it hence as work around we are delaying the 
unmapping the memory and tx credit to one.

Youghandhar Chintala (2):
  ath10k: Set tx credit to one for wcn3990 snoc based devices
  ath10k: Delay the unmapping of the buffer

 drivers/net/wireless/ath/ath10k/core.c | 30 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath10k/htc.c  | 18 +++++++++++++---
 drivers/net/wireless/ath/ath10k/htc.h  |  1 +
 drivers/net/wireless/ath/ath10k/hw.h   |  6 ++++++
 4 files changed, 52 insertions(+), 3 deletions(-)

-- 
2.29.0



--===============6399913783679469623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============6399913783679469623==--
