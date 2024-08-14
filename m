Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F15DC531DD
	for <ath10k@archiver.kernel.org>; Wed, 14 Aug 2024 16:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D+tPDiTXkWJj5I1HhSQqqfRMrtmrsXTQDIjEBJRLwdU=; b=zZXiOfxl1va+q7gA53Ee+Jn/VK
	t8phyRAHnrk5HBqMKNwXUxJEKNNwOSXmS5Dk5zpYvxJxId+n4zVwDPrZ3V2AKWXryGgEmk57jgxPX
	CokyE8GaLcEpz1/GrELEtfJzgDcwcnkLWqDpm8cgxg3nePBiWjhS+iiSx/Kna9TO89XEb586Trr9w
	2pWZz3ki9sH14KYkwoeqHzVrzyzZzxaN8Vmn0IrDVO/eAtGDmFNOzVULinnBfF1pwJ5fnx426sT8o
	kGbxbPqIcNCf+9bAwPtbQ1EhCGLrRaQx7WNiSYqF+sMJYIGzBLYHGlA82+OZGbYc3EGGEj6O6jBnE
	nMdjs/sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seH8D-00000007iYn-1NCn;
	Wed, 14 Aug 2024 16:45:53 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seH7y-00000007iSd-2z2d
	for ath10k@lists.infradead.org;
	Wed, 14 Aug 2024 16:45:40 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a7d2a9a23d9so10898566b.3
        for <ath10k@lists.infradead.org>; Wed, 14 Aug 2024 09:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723653936; x=1724258736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D+tPDiTXkWJj5I1HhSQqqfRMrtmrsXTQDIjEBJRLwdU=;
        b=ni7Dn3rmhYHiTjWSHZ5uAxH9Wvpyjb+pXffaQbz/Wh8HDyBccxFltsOVEI4G36XR1o
         yKdh+MXoMaZQuxMfQQDFugiYqUSBM/lNiMfBuLoAi4VLNjJMSCZvNzHj9Ah4mpAm/mLz
         GJw0mjTYHNSBbJOnZ9jC8JAVZLMjHfkW/p4SzCiwervOW6DqBXjM4CMg6seSi+XKttLQ
         tk7gqQcqh0kA2qqgGqObV4JRUN81ToHRB/ar9L7xtF9W2/T7V2VIMzFI/OYdvLz26/Eo
         L8xdNb0xwABELIzfuNG7fJbNj4N112VcywphMr8NJc0nRvGgzXhot25kl8mn9OmkMXSO
         OeOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723653936; x=1724258736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D+tPDiTXkWJj5I1HhSQqqfRMrtmrsXTQDIjEBJRLwdU=;
        b=AeDSGrIgp1cKoh1I7RRlvgWMZkz6EyehIBjASLQQ2FgGml42kpSTjBqrxoEGj8XOaH
         T9b0EUy6zvhNDXKZ11O3asG5BLV87DnRVpCtqYgFjvpBNMZM+sza7bWLvwmL3jpxRV/P
         QaeKt8rB+v9wmxYr+ZYRQzJsPRy00TJHBiqUfk213ncmgi5aBtV8PC2tzF/ANndidJ61
         aR1jdCHJWF0pcVxOs3PZYX0hIgqKPm9ZrY4bwS9tg2V4E/brey+k0ZCqX1GPtlXEkuaW
         HAC4FRSrUEZJpMdW8+BknSPJVbZSOTVC5Wv9vad9aNKVp7ZynqfcfCUFOHSZnyzabSvF
         GLwQ==
X-Gm-Message-State: AOJu0YxhWPrzYoHTDL1g2pokRu3oUxOjQ0sTN/3Qwip7FUTXS0jG5aG7
	LPl0rT+isZSnJ9XvKYZ1deYCL9Td/8qJdHCAnGrXll69/7T3L8uf
X-Google-Smtp-Source: AGHT+IH4p+rKi+kxav0+gPINVDeE1ZlmfHcxiA+Uzx43uXFE9ExUtCRNWMsQM0fPxJHCrjbtk4ik9g==
X-Received: by 2002:a17:907:3f86:b0:a80:f6a9:c311 with SMTP id a640c23a62f3a-a8366460685mr226358266b.0.1723653936195;
        Wed, 14 Aug 2024 09:45:36 -0700 (PDT)
Received: from LOCLAP699.vf-sint-niklaas.locus ([152.193.78.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f3f475ccsm196326166b.14.2024.08.14.09.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 09:45:35 -0700 (PDT)
From: James Prestwood <prestwoj@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org,
	James Prestwood <prestwoj@gmail.com>
Subject: [RFC 0/1] wifi: ath10k: improvement on key removal failure
Date: Wed, 14 Aug 2024 09:45:06 -0700
Message-Id: <20240814164507.996303-1-prestwoj@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_094538_773371_7ED5C3F5 
X-CRM114-Status: GOOD (  10.43  )
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

This is in regard to my earlier question [1]. After some testing with
adding an artificial 3 second delay between auth and assoc frames I
saw that the device would fail to roam 100% of the time. This further
backed up my theory that this firmware failure is causing some
timeout on the AP, and resulting it either ignoring the reassociation
or rejecting it.

Changing kernel behavior to fix a vendor quirk isn't great, but
in this situation since the key removal is non-fatal and it
improves general performance when the firmware does time out I
thought it was an acceptable compromise. I am also pursuing the
vendor to fix this, and allow a greater delay between auth and
assoc.

The reason I'm sending this as an RFC is that I have no idea about
other hardware, firmwares, etc, that use ath10k. I have only tested
on the QCA6174. Maybe different configurations _do_ need 3 seconds
to remove a key? Maybe this timeout needs to be a hw_param?

[1] https://lore.kernel.org/linux-wireless/9eafac85-2262-4f92-a70b-32109f65c05a@gmail.com/T/#t



James Prestwood (1):
  wifi: ath10k: reduce timeout for disabling a key

 drivers/net/wireless/ath/ath10k/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.34.1


