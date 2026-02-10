Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E67E94629
	for <ath10k@archiver.kernel.org>; Tue, 10 Feb 2026 02:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TmkS/sB9P0u36IZlhTWRyNkfWxpJICu9oh/U8A60Y0=; b=JSKtUSxxYW8dpg9DbPNlbou4gm
	tdGUODjwGkgCJAChzs5sZUbDXPQAwgFtWzVqkVIoSz/0pFR1OEXoDKasfNFFF9yzfYCzoQ1atRB/2
	p8Kl1mwVdg61F66fZzEULOmG+cc+nIDIRoB+bBYDzYTSA4XOsz9DmLcJ9lQSHp2qPDWP/Nca7k4ZA
	2Gy+3ruhqzzjOWUBJlTmNiKQt9IoF8lKH3bKMNWFh+V4hwxJQw3z9FfcTumltxxFtM1kJsiCTfCho
	rw03pvUxV1cyXS0urt2bGA3bWuMqYTKrB6Ea7gHJy7hdVgzFdJmeZzX6WEw2OAa4c7g9hSsBYZ9P3
	/jRJEFLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpdEi-0000000GJS3-3mb5;
	Tue, 10 Feb 2026 02:12:20 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpdEg-0000000GJRE-1v6g
	for ath10k@lists.infradead.org;
	Tue, 10 Feb 2026 02:12:19 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-896f6d4b6c1so27001646d6.2
        for <ath10k@lists.infradead.org>; Mon, 09 Feb 2026 18:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770689537; x=1771294337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TmkS/sB9P0u36IZlhTWRyNkfWxpJICu9oh/U8A60Y0=;
        b=AnCqmenDTMbDZdpRul/st9jgXf/iRCwWVbG4iwjef4l/7qsXcoKJ7GabhsOTSwfHYF
         iOU8C8KZJEvZmZlN2q+GxMK8h3qs3blJsGhhk2GqA07X/BSPXKuOAEbr9x03xkqwqiTs
         EIcF1Pkuzd/TKjay2Gj11aj9UeNcMzmr8dm2cqGkEv8gmJcTKNHbwdzfBZ9iInS4y8sF
         U926blrJ4usa+jFOqn8lXGbEyOxqVrf8tl9z5X4mdi0Us4/u99Ynf/5WoMHno6HXqwpS
         QeZHE2xpMd7da3VlJl6GIc9Eol30Y7ir2tb5Ml8aTymCyWkhm+GFyUl9bwFYrp6ougpA
         I6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770689537; x=1771294337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3TmkS/sB9P0u36IZlhTWRyNkfWxpJICu9oh/U8A60Y0=;
        b=Za2LWkKxn6VHyeB2me3O2B+pmMqWSizXdzrtMYKd4/Fc4jqfyxigzT83ZnrsTYtVja
         MUkGfzsvsLQIJ/WM8h4LeWuk+DVDdePN7LKaBf2kJ6RO4ipqzaS0CIUHF8EZ4+6cpjAN
         h0O3JJwCd/KlAQ8sIeRkpCReXZI7qGzUR09/L4ESrFjCOciXGZkWN+mzSQWuvfUDTVAb
         mXKJjiesB0wX/IpaaVGw9agso2Q54Ag4d54Vm1REzsCZQTx/1EPCpYAi8x5hvFDm6fF5
         Eei6XSX1+eKkBNnR2ovseVPcsLA/scKjAOFWAbwfcP4oBf1Dh6UvtPlC7DzAenFBncCT
         /ErA==
X-Forwarded-Encrypted: i=1; AJvYcCWOmVkrHTIz3+4AaCxP5IbVeR0jhjWk9YdWSpnLJoKkIl35RNcQCLtIce8RPWhC/Iwl9B3u8Nc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHVJUmvXl4vuZvPoygETTLcJpKTzd9Oe09REmfmKMPi/dT3nHS
	FQQqXENQiww7dMCvtwlLPOeJzhdeDEv4H3k2aQMSPiDhZgQXrQ9IPzQTnYAJvA==
X-Gm-Gg: AZuq6aISAtRzUTvoaKOzq0z51P3iDmXQ+ZF/LXp/TM7YlDJRB9n0uTcYPpQtOq+5fUK
	V5rSawuMZy0U+txkOGAcUTXML2wZyZlpE2AYojlMcwsK3shnUMiTYtbyrKukxZtNc3Sm2MoTThj
	e1VsdYrd4kAmISkCWshnd6p0VmP1n0cr++cmzeTwqdDsNpD+st9smObwaUmVKVT313j3OVj7uxI
	tgAwPvDpv1c3sjyvgiNSiev8HLO50zR2AWdrVL2jP/IvstZXuqRYIiQrQIuoQnd9XYEWWc1SIGQ
	otUTLpn82A5daCwiPHE0K8fkn8VbYBVgHvPLBRzChUmo/L1BkVxlbjztmpQMGlNMKKGsjARMX/j
	/I/ZKnNoMZTr5jLard8C9LJzZy758xEzICWH2/9oHgOloVLYDnE1F/yzz7qL1E8zu5RSQfMWgO6
	jnPzX9aFL/GKMVW5+yh/6Ax2rQWzN3DAafK6xOLy7/pCr3FSaBT2u5JbzWtk491eIFzlSfxOBLf
	KcE4VLWPUe3q+E=
X-Received: by 2002:a05:6214:2604:b0:896:ff71:fc74 with SMTP id 6a1803df08f44-8970e515dfemr9778796d6.36.1770689536988;
        Mon, 09 Feb 2026 18:12:16 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8953c077a8asm91300896d6.52.2026.02.09.18.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:12:16 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>,
	Michal Kazior <michal.kazior@tieto.com>,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [RFC PATCH 2/2] wifi: ath10k: only wait for response to SET_KEY
Date: Mon,  9 Feb 2026 21:12:49 -0500
Message-ID: <20260210021249.12132-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210021249.12132-1-mailingradian@gmail.com>
References: <20260210021249.12132-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_181218_498909_AE898D51 
X-CRM114-Status: GOOD (  11.27  )
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

When sending DELETE_KEY, the driver times out waiting for a response
that doesn't come. Only wait for a response when sending SET_KEY.

Sample dmesg:

	[  117.285854] wlan0: deauthenticating from XX:XX:XX:XX:XX:XX by local choice (Reason: 3=DEAUTH_LEAVING)
	[  120.302934] ath10k_snoc 18800000.wifi: failed to install key for vdev 0 peer XX:XX:XX:XX:XX:XX: -110
	[  120.302996] wlan0: failed to remove key (0, XX:XX:XX:XX:XX:XX) from hardware (-110)

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/net/wireless/ath/ath10k/mac.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index da6f7957a0ae..73aa93043f8a 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -324,9 +324,11 @@ static int ath10k_install_key(struct ath10k_vif *arvif,
 	if (ret)
 		return ret;
 
-	time_left = wait_for_completion_timeout(&ar->install_key_done, 3 * HZ);
-	if (time_left == 0)
-		return -ETIMEDOUT;
+	if (cmd != DISABLE_KEY) {
+		time_left = wait_for_completion_timeout(&ar->install_key_done, 3 * HZ);
+		if (time_left == 0)
+			return -ETIMEDOUT;
+	}
 
 	return 0;
 }
-- 
2.53.0


