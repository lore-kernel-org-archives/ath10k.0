Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4363BC88E45
	for <ath10k@archiver.kernel.org>; Fri, 11 Sep 2026 07:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TGZGv5Mzyd9kaR4ZVZfO50u8GGM3KaCihDXEWev0Cbo=; b=gEv1zDxiPwVr8vm4+ZYKxMCWu0
	ggWA8mhsYl8NSSNWIFjXgYgL8UGNIYDNEQCW8WBGdZINaOj2Z0YgAPo5x4z0Efug71mfQePz49slZ
	oJ7ZlKXgi5katOSl0cwGhGJoUdwwiUESgD48ErMAp4KuPv/UVGhTEWT3xZBQrmyP/aih0bkN/FM4L
	S43AacOIERKiQfKcdLi3Y31DEV7pVegwXE6ZmAeQggMDReTVrrdzN5gkXOfeYTI1eNMPO/m641MCf
	WLuNMnNjXyeSYT3UCgpp5mzwi+4ZfmW9Y/sOFb0eDSJc4aMlAtjgwJ4ste+8bd8kUHXyOSIxToD1x
	QCBgHoZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vcW-0000000G0sG-3nLj;
	Fri, 11 Sep 2026 07:24:24 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vcU-0000000G0rq-1c8E
	for ath10k@lists.infradead.org;
	Fri, 11 Sep 2026 07:24:23 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso610624a91.3
        for <ath10k@lists.infradead.org>; Fri, 11 Sep 2026 00:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789111460; x=1789716260; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TGZGv5Mzyd9kaR4ZVZfO50u8GGM3KaCihDXEWev0Cbo=;
        b=Df5iy548H+9gnogkn6D0dKJsLyafkRri2Jgp1eNxSg+9U3ofPKbevfVYcRChbRehKU
         HzZqaD/GRA8cT1L+1vKMpm48pvgJ2Qyqb5AuRfa78qGFgnkXYxk/iYU3Hq8oO/Yi88oX
         bWudyDsqJo1vbIceJoxC/b/pwu3y/Jt7OAey9ON6+Y3+gxEtDwFHecKWDtPgJkGJVgaf
         HvBDLJyiOwA1iuO9+FR7FCUgQIeEiHycxgMjhJFgeLUPNx8KKOqzwiye4IhH4m9xAoRe
         eMLYfyC0pM1PV/hB/pubdYflpLmitan0rQYV9h01uEh+IzbjHSIe6TuMbIknc+iosfi7
         hZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789111460; x=1789716260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TGZGv5Mzyd9kaR4ZVZfO50u8GGM3KaCihDXEWev0Cbo=;
        b=ENPiTQboA3a/d2lqGTYDlZB6QJ8zDjbtxASDt/1OnAXCj+NcXDB3d4AlYwFB86QG/+
         0EZE3ePZI0+e17bB6M/gYogN7cUL3T+mi3z1qsOCU0GFznFgsNj/pfCeHbqWzyMQfdj1
         Q2Gx1ghzPh/Ndxd1KWUK4qnLmjTV9K6VXJrlaz7GoKPkaQE97I9tVTtawi6z4Ovh+k6q
         ybQQ57eLaDCmNHAwx6fXfM4TN8f/VdhEi+f3w0xfsTnKUxYanTLgT3lRAU2RY66VY840
         G+p/o8qZlF4BBLMkhFqaaey9dX2Ur7flJe68KtcDO0oOoIqkyQHGik3m4zzdtIN1Xkqt
         XhIA==
X-Forwarded-Encrypted: i=1; AKwUvBy0PH/lYYC82wx1Y559FcuisIIZsASWw5Ia/Nq1SjvQliONgPgXb4ZkDMrVzUYIcfXY83vZ1QQ=@lists.infradead.org
X-Gm-Message-State: AFuF++mhkMm03lTRjiAzMWayq7JLjZGE+qFj6UZks2G0xK267F78iYhg
	DLF3gogPS/XoYicyojVlZwJa8R3VxPvIgDcPbV8jbJZ+o+d3p5cS3A4ikx6ffYEQ
X-Gm-Gg: AYBFou1vK3bVJ/aZyuAB0FoNwOZa/H6+agHcq6s7YFrWN4pUHKV5QiMXcn5iOT/AJaM
	6dmE+DtvVqTp03GG8g1Izz9q/Jgv9OzCtPhWMX2ZGzJwyv6FksWrGr8gb4ZnB0bVG0j9tL8sqUB
	OY9H13Q+eTZuBbTK44obHbVXMaW2T8juxsPlM35qZ9eLNPOB404sj36YuPMewk9Kjqh+xF770y0
	S88lAZLK5Vx0ZdAW0xqZWxHVBsFa6e3cngQK3O6z1J8i4NyZHrBDyA16qfQsoSEuIKJqiu6hnsl
	e8J5EX//CaOBFzY2HmoWeaX5l4T32fn+oJVNdpaNaFWdmHn0gKQ7eaDmyICjFd2RKj7+/DcnQtW
	GRAGj4yy23xhhJBhn1vxEv9zAOEhccfc2b8765XQVMaZKqxNc38v4QwL3g3rxIfrmlbWewhjOYd
	NnxdgMH5XeVRB+569IAC55desTaqyP0PdN9L9KxoYHbWipCwIDSPKrFTnuiUqXWkzL8OC7CVj3E
	8U7pU2KJ87FWIKS1KHOkZkWqOlpiibCQ3odcU2aNY0y7D/kNrYzOTyj/yNQW7759OJNgsxLbxFe
	iVA=
X-Received: by 2002:a17:90b:580e:b0:396:40e6:f631 with SMTP id 98e67ed59e1d1-39d9bbe47a7mr5454805a91.3.1789111460451;
        Fri, 11 Sep 2026 00:24:20 -0700 (PDT)
Received: from codespaces-1adab9.ktkhmpmw22vebpok31ngjx2qsb.ix.internal.cloudapp.net ([23.97.62.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39da1ad5d79sm1984815a91.12.2026.09.11.00.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:24:19 -0700 (PDT)
From: Rivaldi Hormat <rivaldihormat@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: kvalo@kernel.org,
	ath10k@lists.infradead.org,
	Rivaldi Hormat <rivaldihormat@gmail.com>
Subject: [PATCH 1/2] wifi: ath10k: Add missing validation in debugfs mem_value and reg_value
Date: Fri, 11 Sep 2026 07:23:16 +0000
Message-ID: <20260911072318.5232-1-rivaldihormat@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_002422_451267_77AD5D50 
X-CRM114-Status: GOOD (  10.49  )
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

mem_value and reg_value don't validate the address and size provided
by the user. This can lead to out-of-bounds access to hardware memory
and registers.

Fix this by adding the missing validation.

Signed-off-by: Rivaldi Hormat <rivaldihormat@gmail.com>
---
 drivers/net/wireless/ath/ath10k/debug.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/debug.c b/drivers/net/wireless/ath/ath10k/debug.c
index fb61e53ff..50e017021 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -729,6 +729,13 @@ static ssize_t ath10k_reg_value_write(struct file *file,
 
 	reg_addr = ar->debug.reg_addr;
 
+	/* FIX: Validate register address */
+	if (reg_addr > ar->hw_params.reg_size) {
+		ath10k_warn(ar, "Invalid register address 0x%08x\n", reg_addr);
+		ret = -EINVAL;
+		goto exit;
+	}
+
 	ret = kstrtou32_from_user(user_buf, count, 0, &reg_val);
 	if (ret)
 		goto exit;
@@ -819,6 +826,19 @@ static ssize_t ath10k_mem_value_write(struct file *file,
 
 	mutex_lock(&ar->conf_mutex);
 
+	/* FIX: Validate address against memory size */
+	if (*ppos > ar->hw_params.mem_size) {
+		ath10k_warn(ar, "Invalid address 0x%08x for mem_value\n", (u32)*ppos);
+		return -EINVAL;
+	}
+
+	/* FIX: Validate size against remaining memory */
+	if (count > ar->hw_params.mem_size - *ppos) {
+		ath10k_warn(ar, "Invalid size %zu for mem_value at 0x%08x\n",
+			    count, (u32)*ppos);
+		return -EINVAL;
+	}
+
 	buf = vmalloc(count);
 	if (!buf) {
 		ret = -ENOMEM;
-- 
2.53.0


