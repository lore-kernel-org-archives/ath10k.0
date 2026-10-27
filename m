Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2063606A321
	for <ath10k@archiver.kernel.org>; Tue, 27 Oct 2026 01:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2RgF8YX8;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FLW1Zdns
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MnnFd0HiOos9iEFulqxTt8hlW096T7H13qBtT/3EgOM=; b=2RgF8YX8cmzAZaM3Rvo5Ssl9ce
	OwNJuozAIggSfAuwKgXHWgz/Eu1Z12zBnan6UQnx6Gn0Ev1EMqSfXBzpEtpgh8UX9tnd9B/oGVdY6
	5cvqo+53XrA5xx0Kzq2w6Dz8dM1n+/JsppAgCiG7KuR9eBYwxohxJzrKPPapwdQTju270yem0KUvz
	1P1rYM0gF6DuZKJQwkPwoJMHQayFvYqn123FtZ60+YaLSMNWNU6oTbuQCS5QefBt7d363+GyBgbWJ
	2wL9MY8/m8laKK55LKVT3XrWSSO8GvNb25xXBuF/N/Gz8At16Uf9vfT7cUZK3U8HEWgjVluJ1sJAC
	tqqMzaxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLWQN-00000003cOP-29mD;
	Tue, 27 Oct 2026 01:56:27 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLWQK-00000003cNk-1pkb
	for ath10k@lists.infradead.org;
	Tue, 27 Oct 2026 01:56:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49d05d51553so24882625e9.2
        for <ath10k@lists.infradead.org>; Mon, 26 Oct 2026 18:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793066182; x=1793670982; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MnnFd0HiOos9iEFulqxTt8hlW096T7H13qBtT/3EgOM=;
        b=FLW1Zdns5bN/iZA2f/856GL0o5UdttIPLCw8k7Kt4x3i6OfN9NGQz7LN+1tPpUxTkG
         hOf4N+BgYGXHGIeAQe/IxxgIVd+0Y60qRJyygM3GagnRNcKqbe7/q0pSu7jDfnR869E1
         SqZ+mVsjITW9mKp2Q4dS3qshbkdXbEYmU9bLoQS01Ia9VjuvxRYvCxfAo/ajCt3Cg4FX
         EXt5mAQFCiEA3ORsyYx6HzXa+E1NwYYBASW50CChTuLrQxzQTumOL6VPJjY/74+fBvHI
         v43YeGy0uQ6VZ3v3RhRfFZJ5inOUw44FY8mD4zDMALKnqOBdl1RTU8IAgrqedv4SdoF7
         gFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793066182; x=1793670982;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MnnFd0HiOos9iEFulqxTt8hlW096T7H13qBtT/3EgOM=;
        b=cFxCd7+6G31aPJ7JVFy7O1kiP01LxjJ8jK6Uo0zRol1ZjEWTluVW5TPzJLkFcr6IC7
         e+1R8hridtjhwPKPyaMYgDYQx9fAl4FUAUPNUB4/Yg/BIB2r1K2Cyuc8kP5nwT8Zp2RJ
         kuZjotrVXG9r1r+lOhU4dEWfI10uXjXKKO/0XgtYst/e7U52udgG+YqI+NXCLHwS6srG
         04QsM/Y7XPch3vSUAegFbn5U887jsE5VVhQBJUC4P7WLhhBW+5Hx2Ijq7+NQR1qWgihQ
         P1ZU6sz4t/z0PjkCLUUZgZsh9FWhAXKEW5IeK2/MY9mRCaoeFMnWGe9Vlv5UzWArC16k
         e5wg==
X-Forwarded-Encrypted: i=1; AKwUvBy3IQFYarp69wSZy/Xqg5IptCWZNVkJH7jUWhWFGLG+zfwx/u0+MQM/sSNT7QmviSeBi+BdfXY=@lists.infradead.org
X-Gm-Message-State: AFq9FYK+y2JH43ryVdiSvYfAg1i0qOF3DZ9uKlc3nMNlTayOq9Zcl+eA
	c7Bm+YlMuhsgIb+K2sEvlKKZB+6BhMFv9EteYoM2BthYYcwdevZ+7EWC
X-Gm-Gg: AYBFou286whw3guujmD1I76/fiKuCUG65moaGsgKfBgKqxpuaobgdZdojbp/96f3mDD
	Xm0ehIx5bhW/OwUWveUI7/JoLBq9wQ78fuxOe3Sk1ceSMN8kc0kU5YpX4psCMgtFTDCcsQLIOIP
	gQVDkoCbPxoL+0Cmd3/hYoiMoOaUAe8tmCtlj2w1hQrMpf8Um3XjsPSydPgKGKOjcF/LL5RxZ1R
	GGsmjmZJ92hMNIOzLRFkqw8pbyQ26t09S7JN3jaDLCNndJL9QzQZEjXhMTmYmHx2qm/LDuOrgNS
	wrPE6E3QtpRK3H81sEAqLZivPKtiAPLHdXOcAhbX2DzsYHPMWt8rQBa0OsgInelSF5S3QY6Jk7u
	1p46zOP2n559yWnClKu6ZSOflgONMlsMxyS32ndsgXk0mY2qFsJ6lJzui4i3E8/3jzjTi4WE9qq
	ZJJb7xaxeyR+XdExzBfZve8frvkBTF3Qlj9sH+sGX28WJTtBIOH6M5Z28cjiqdaktScdt8p7f1/
	StHPBz6vv8Shwc14AK7a8NFVLneEiiTxsh/MS+1rQEjs1HhJhAVrkCHAC4eVYncL9APxxGc+skV
	41B53A9KPDNXWnDYcY1V8IHHgUR+84cySb5dmlI=
X-Received: by 2002:a05:600c:3493:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4a35ac9d0e8mr157003625e9.11.1793066181977;
        Mon, 26 Oct 2026 18:56:21 -0700 (PDT)
Received: from [127.0.0.1] (smal-20-b2-v4wan-173097-cust1152.vm20.cable.virginm.net. [77.97.36.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm289674855e9.4.2026.10.26.18.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 18:56:21 -0700 (PDT)
From: Filippo Falezza <effeffe99@gmail.com>
Date: Tue, 27 Oct 2026 01:56:20 +0000
Subject: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBBFf4XM2hpmEmp05X8YFqWdwqg80haiI
 fy7gHHn8iT3njND5CAc4ZLNEHiSKH23Ah0ysI3palbiVgbKSWNOpExqMH+oxO3AwaQxsCKqEM/
 eaSwsrMchsJfXLr2VX45jdWebNtO2aCSmPrz36oTb7hfQ/wITKlRcWKe945NHvtatkefR9i2Uy
 7J8AA8VZLrGAAAA
X-Change-ID: 20261022-ath10k-temperature-22b119fd615c
To: Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Filippo Falezza <effeffe99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793066181; l=5040;
 i=effeffe99@gmail.com; s=20261022; h=from:subject:message-id;
 bh=hPT1uLYKS1NCl1gE+0KTb0caCJTisLRSF4QlmjovWDo=;
 b=arFxWloT1KfTE4e0x+lGRO5qlJLn0ARuEMY64ZknvHDszn8Xy8kOYVZAHm1Cgtr653nxjz884
 zoKgmBHgwCfDwO1fIStfYwxaWWLtKPw2AbJI/FKIxupmBYpRgxcq1Yu
X-Developer-Key: i=effeffe99@gmail.com; a=ed25519;
 pk=7PPwl4QILojrh+ATB5QOpvXVmmoxaxyLQhrLRLWEL0I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_185624_522184_07283F5F 
X-CRM114-Status: GOOD (  21.87  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reading the ath10k hwmon temperature sends WMI_PDEV_GET_TEMPERATURE and
waits up to 5 s (ATH10K_THERMAL_SYNC_TIMEOUT_HZ) for the reply event,
holding conf_mutex. Not all firmware answers: the WCN3990 firmware
WLAN.HL.3.3.1-00694-QCAHLSWMTPLZ-1 on a Motorola Moto G 5G Plus
codename nairo (SM7250) never sends the event, so every read of
temp1_input stalls for 5 s, logs

  ath10k_snoc 18800000.wifi: failed to synchronize thermal read

and returns -ETIMEDOUT. Tools that read all hwmon sensors, such as
lm-sensors, hang for 5 s on every run, and configuration changes of the
interface wait for conf_mutex in the meantime.

Whether the firmware answers cannot be told from the chip: firmware that
answers and firmware that does not both advertise
WMI_SERVICE_THERM_THROT, and WCN3990 firmware differs between devices.
Instead, remember that the running firmware did not answer, and return
-EOPNOTSUPP right away on later reads. Forget it when the firmware
starts, so that a restarted or updated firmware is asked again.

The first read after each firmware start still takes 5 s when the
firmware does not answer. Reads on firmware that answers are unchanged.

This change was written with the help of an AI coding assistant; see
the notes below.

Fixes: e98199a8c27f ("ath10k: enable QCA6174/QCA9377 to read the chip temperature")
Signed-off-by: Filippo Falezza <effeffe99@gmail.com>
---
Hello there,

this is v2 of the fix for ath10k temperature reads that stall for 5 s
on firmware that never answers the request, as on the WCN3990 firmware
of a Motorola Moto G 5G Plus (SM7250).

The only change from v1 is the name of the flag: it is now
ath10k_thermal.broken, as Loic suggested, instead of
temperature_unanswered. The behaviour is the same, so the testing from
v1 still applies: on the phone, the first read after the firmware
starts times out once after 5 s, every later read returns -EOPNOTSUPP
within milliseconds, and a full `sensors` run takes 25 ms instead of
5 s or more. Restarting Wi-Fi makes the driver ask the firmware again.
I have not tested firmware that answers the request.

v2 builds with W=1 for arm64 and is checkpatch --strict clean, on top
of ath-next (cd026e68fdbf).

As with v1, I wrote this with the help of an AI coding assistant
(Claude Code); the testing is on the phone.

Thanks,
Filippo
---
Changes in v2:
- Rename temperature_unanswered to broken, as suggested by Loic Poulain.
- Link to v1: https://patch.msgid.link/20261026-ath10k-temperature-v1-1-e5cd6fde7f1e@gmail.com
---
 drivers/net/wireless/ath/ath10k/core.c    | 1 +
 drivers/net/wireless/ath/ath10k/thermal.c | 9 ++++++++-
 drivers/net/wireless/ath/ath10k/thermal.h | 2 ++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index 7c2939cbde5f..a749ae582b0a 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2985,6 +2985,7 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode,
 	clear_bit(ATH10K_FLAG_CRASH_FLUSH, &ar->dev_flags);
 
 	ar->running_fw = fw;
+	ar->thermal.broken = false;
 
 	if (!test_bit(ATH10K_FW_FEATURE_NON_BMI,
 		      ar->running_fw->fw_file.fw_features)) {
diff --git a/drivers/net/wireless/ath/ath10k/thermal.c b/drivers/net/wireless/ath/ath10k/thermal.c
index 9bb486f8e920..9ff7de0abd12 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.c
+++ b/drivers/net/wireless/ath/ath10k/thermal.c
@@ -75,6 +75,12 @@ static ssize_t ath10k_thermal_show_temp(struct device *dev,
 		goto out;
 	}
 
+	/* Don't stall every read on firmware that never answers */
+	if (ar->thermal.broken) {
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
 	reinit_completion(&ar->thermal.wmi_sync);
 	ret = ath10k_wmi_pdev_get_temperature(ar);
 	if (ret) {
@@ -90,7 +96,8 @@ static ssize_t ath10k_thermal_show_temp(struct device *dev,
 	time_left = wait_for_completion_timeout(&ar->thermal.wmi_sync,
 						ATH10K_THERMAL_SYNC_TIMEOUT_HZ);
 	if (!time_left) {
-		ath10k_warn(ar, "failed to synchronize thermal read\n");
+		ath10k_warn(ar, "failed to synchronize thermal read, not asking again until the firmware restarts\n");
+		ar->thermal.broken = true;
 		ret = -ETIMEDOUT;
 		goto out;
 	}
diff --git a/drivers/net/wireless/ath/ath10k/thermal.h b/drivers/net/wireless/ath/ath10k/thermal.h
index 1f4de9fbf2b3..d1fb5b958c37 100644
--- a/drivers/net/wireless/ath/ath10k/thermal.h
+++ b/drivers/net/wireless/ath/ath10k/thermal.h
@@ -19,6 +19,8 @@ struct ath10k_thermal {
 	/* protected by conf_mutex */
 	u32 throttle_state;
 	u32 quiet_period;
+	/* the running firmware did not answer a temperature request */
+	bool broken;
 	/* temperature value in Celsius degree
 	 * protected by data_lock
 	 */

---
base-commit: cd026e68fdbf88b9cc522b76c7a9d92c9a41f709
change-id: 20261022-ath10k-temperature-22b119fd615c

Best regards,
--  
Filippo Falezza <effeffe99@gmail.com>


