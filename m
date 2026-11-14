Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F430606A330
	for <ath10k@archiver.kernel.org>; Sat, 14 Nov 2026 00:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NNnCRjyq;
	dkim=pass (2048-bit key, unprotected) header.d=nagashi.ma header.i=@nagashi.ma header.a=rsa-sha256 header.s=ggle-ngsma header.b=Dx8V/QcF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qh4X1DNEOcam/fRA9uNuBWagMUGqH6MIwoIZpHm8boI=; b=NNnCRjyqKaxnwtu68u3sV2eKxZ
	dAdq6Q3VozeB/aptYJ0YbZAwP3Qetl+4RlL41wqGZOTIsjPHDRY9NNsLYuUwHuXqKlJ++lmNo763Q
	yhlNQQ51r+xCT1cnUCGPrGer9ywa4tu0b6Fn9TelzI8pH8/Ce+uAQRzgLbS7up8tjCL3zwv5xyF8T
	hyL+PhVhjb1s878BfBgtnNSGmFtICuQEAi2iS/X2ObEp0dGC7O4s+ZzEbBRjXoimYJA1FXIQ2EUnY
	YxJjpvheKY1S7lp32UTpM7ffgPDTT9kYOrSjdlvy4gZmP4beMzlifVydmb7eVJsBmkvZsnj6A6LPH
	3fR4BWIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1Nk-0000000Ernn-2rFY;
	Sat, 14 Nov 2026 00:12:36 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS1Nh-0000000Ern0-3zVP
	for ath10k@lists.infradead.org;
	Sat, 14 Nov 2026 00:12:35 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c50715c2757so234955166b.3
        for <ath10k@lists.infradead.org>; Fri, 13 Nov 2026 16:12:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794615151; cv=none;
        d=google.com; s=arc-20260327;
        b=l99sqXDC5ucP94kI0pFnoO0vdtghvaNTPB/l9fofhiYMwXYO2vaqijaiLx9vqQl6ip
         TDWx2UFwlg7WtijBPxHbNur4rB8P6zK0maui+wBLOFYik254I6Yz1bc5J2gRgZ5NBl0E
         hG18nsK6PVKZDCuZgCU4HIQUnqVlmLGzZpUTlThT10wJLz79Ka7iT7M15AvTNTA/oNw5
         0zjrcNwCPXQuNxQEurxfk/sHaeIowBynF+39Gg7DDD1WvEViX3eX6fcxrMMR4JWBFFbq
         EG8XKty7bv3POApE9tkJQyYLY+XXJ9PjCqhDlhZXiZh4xV7AAXq03BoBVw9CS1a2vNnQ
         HKhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=qh4X1DNEOcam/fRA9uNuBWagMUGqH6MIwoIZpHm8boI=;
        fh=SZYPii95UbbNoWro/qd8DLy6nHOfyJ1UCSod+uYcNaQ=;
        b=pJ8i9Ob7FTBvlTaBC8uuGoAaArNtILTvBGTFEUC/ZfjcdAcfLHMBqGplLmT/+KTLTX
         7HdhtUDdZne1lc78XEVkS2V4+ra7jHdodlVJ1lIlmpUSo9U8cRO0WLcH2Dcb9SLkmS4E
         bAXYfF5FQEsUH7+hz4QxbCToAalnrm0BWX3sL+K1OLOnJSjP7sFGap5pTxi8R+UqoLI0
         5n4VzXGrjJKvJiCKh1PC6zSd/cHkI945oY9PDCu7UOZzSH9GDd0iVVyxC5dmxZUyd3ZP
         zfVRLeUa9tWNuIxwTv5ZUVQ/otO5f9vBzVMTihRWm89WZYEVfDT/527WjQ15RoLbc4Zf
         kl+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nagashi.ma; s=ggle-ngsma; t=1794615151; x=1795219951; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qh4X1DNEOcam/fRA9uNuBWagMUGqH6MIwoIZpHm8boI=;
        b=Dx8V/QcFAEBAMEP1/E8Er4KUEjoOKtff8boyzzdJ/i7ViAztjscYr2uZtq3f32ivO+
         4vuX+kKL/rk9esS/aAj5Qne9ZzCZidlyciMjqNybRbfOtO1qmh2ZK6NN3D6hFFK3RYoc
         OZHrUIbrDXE1tSKeRRUBAblVtctnjwHe9JLfNhXdRAXjFEeGf9rIv6Fe2mV40+QopNii
         Js6EzbDO50IAQFpjEo9DbKB1BsmmkqM5B1P1Kk9AQDME7T6IiqROo4FjqBy1AdDBRwDd
         wWp4h5PKz+8iHKsdCA+X4unV9hVNb6b7s+SuxaGSRxK9FTDFdJlgzLhNEoXSIn0H1Mwv
         u/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794615151; x=1795219951;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qh4X1DNEOcam/fRA9uNuBWagMUGqH6MIwoIZpHm8boI=;
        b=Fu+rzMwSnUaEJPn++p5T56s5wP86nl2zQZTlgMA9ykSi+pnAbgQ3q+v4e1PCOmoYGp
         FfH+/kH4mfAnumrqHGu1fVaEJ+Kp8zvM+IWlJJY9JoBaUz605YkcF1U7VV3LjUgVaGZW
         eFG9XeWkLOXkuqqQgf5/lV9ktRT6oJZIjstrYSspeQwL9U98+UKu2ViR44LH2qpx9Jbd
         7XbMVBAAIJt1/AJpNYk461UGtTGUvFaPAQH9h/+duNWaR1D1zxQzq5L1nWJh968mTiCT
         o7Hs+vjBT50lsMZjxjxcidDK7o5+BBC9bMTEbx3+lrBP6vpvsQcuVcj5SgRSqqr8v/sh
         VZ8Q==
X-Forwarded-Encrypted: i=1; AL+hErGZpg9Ke4+EdR2Gl+00fCfmi9y5bE/ov1tzvduFu6ZznIg6ejSxpqQWl8zfUH8kIajTh2LQFw0=@lists.infradead.org
X-Gm-Message-State: APuU4Z/wEuN+VZGiO108qGJjx27J1dF1bEM0tapR7vw5CzZY1eG6EZu1
	qwUvYXmr0F8Bmmgsv+jmQyJJgiALauyDkk9AEClf3AncJOXRT2KKGAnZBNzk/mcEB8fV26Jz6c+
	5kk+LANym4F/hz+xT+YJrB100N9lnkNpyDc9yk/KjR7Kc93mEQYnv4NYu
X-Gm-Gg: AYBFou0u/WIlKuSVUD108bX2SSzO3HIFmg5edRgWY30Gc9sASZM86nSWyX3zdCt8Knf
	b0D3+i6SMPegAZUK1NxP5KVvr6IraSs5Rn18xVsk5u32PGDZgD2sl6gv2B3EZoBBn40W5n6i6bd
	1ZTqenuuU/CurVAel23imsUSkOjQCzPBhsL1RKdFwvG2JosYFuuuu68T9MjYDh1NHEwqshu3iEE
	efvk5U5lu7FiqdXyG9DpDqZujv7OIcyEp0H8cGYUS6801U0n3bVpbABH9HITEWGTE8wOx/c00rv
	Od+iM8vT+cvSVpFib0j0oH5qGUKwJa5qaAp48NVdZWX+l60OdoUTJXrb5ha7r+7fjvW19uF8L2X
	lzXxnBYDjo5QqUmaN1/S6kD1eqF8/CckB6JvP4CCC81CDrtTEva03y+Mc2w36unheS5KvjJKtbV
	W0ELBoVJJN9ZsN2TiLEb+W07xhxZxfVdxEhg125wgvUPjqPplde/knzw==
X-Received: by 2002:a17:907:1b16:b0:c49:8fa2:4a22 with SMTP id
 a640c23a62f3a-c50963d4060mr357686966b.41.1794615150696; Fri, 13 Nov 2026
 16:12:30 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: "Nagashima, Shunsuke" <shunsuke@nagashi.ma>
Date: Sat, 14 Nov 2026 09:12:04 +0900
X-Gm-Features: AclHuK_uFybUk0AYRvF7ewEKhAh--disnBNA8-vTrVXowfrCB3eyDWmy0BTqkaQ
Message-ID: <CACB3TCKMKQ9-=0T+--dxtZdDcNCSFpp5UsjBi50H2X5P7sDtfg@mail.gmail.com>
Subject: ath10k-firmware: WCN3990 hw1.0: Add mfp-support to qcm2290 firmware-5.bin
To: Jeff Johnson <jjohnson@kernel.org>, ath10k@lists.infradead.org
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>
Content-Type: multipart/mixed; boundary="000000000000912b7f06603166c8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_161234_038563_E0915B00 
X-CRM114-Status: UNSURE (   4.53  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--000000000000912b7f06603166c8
Content-Type: text/plain; charset="UTF-8"

Hi Jeff,

As Loic suggested [1], this sets the mfp-support feature bit in the
qcm2290 firmware-5.bin. Without it, ath10k never sets the WMI PMF
peer flag (ath10k_peer_assoc_h_crypto() in mac.c), even when PMF is
negotiated.

* Hardware: WCN3990 hw1.0, boards with firmware-name "qcm2290" (and
  "qrb4210", whose firmware-5.bin links to this file). linux-firmware
  pairs it with wlanmdsp WLAN.HL.3.3.7.c2-00931.

* Origin: linux-firmware ath10k/WCN3990/hw1.0/qcm2290/firmware-5.bin
  (880b19be55eb, md5sum da9fbaf8ebccaeac3bbcc9ba828d756f), changed
  only with ath10k-fwencoder:

  F=wowlan,mgmt-tx-by-ref,non-bmi,single-chan-info-per-channel,mfp-support
  ath10k-fwencoder --modify --timestamp=1706616060 \
      --features=$F firmware-5.bin

* md5sum of the attached firmware-5.bin:
  58982403c9c56a4b888fe0ab3104d7de

Loic tested it [2]: "It works for me on qcm2290 (Arduino Unoq), and
greatly improves throughput on my WPA3 AP."

[1] https://lists.infradead.org/pipermail/ath10k/2026-November/017442.html
[2] https://lists.infradead.org/pipermail/ath10k/2026-November/017487.html

I worked this out with Claude (AI), and AI helped me write the English.

Thanks,
Shunsuke Nagashima

--000000000000912b7f06603166c8
Content-Type: application/macbinary; name="firmware-5.bin"
Content-Disposition: attachment; filename="firmware-5.bin"
Content-Transfer-Encoding: base64
Content-ID: <f_mwfne3ee0>
X-Attachment-Id: f_mwfne3ee0

UUNBLUFUSDEwSwB3AQAAAAQAAAD85LhlAgAAAAMAAABAEBx3BQAAAAQAAAAEAAAABgAAAAQAAAAD
AAAA
--000000000000912b7f06603166c8--

