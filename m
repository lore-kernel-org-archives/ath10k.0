Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1218A606A31C
	for <ath10k@archiver.kernel.org>; Tue, 10 Nov 2026 17:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=auHFMmAU;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gnkXenZA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uBV58YhPDOaC3nU5moWQwXL3FPvHNqE225/vb5rTGtE=; b=auHFMmAUdRLOsc
	+fElCl/ndOnHrQ89i8YikHcB+u0aBDQIcBTebh1PzFjRQagSEiBkv5uFx/N9a2FUFckJl/BJvnqiN
	IZCifzeYpuUoYyntbZ4UmIDTElHcDRcVDdbZ7dBoVvc68wK0f5khsZRAno6IVxE8mxbUxSzO6QaJu
	dYzMos67eEdK5TNJXuWawbaQktGEYs5u5Bhn64ysiTtjwD3qNiEcKfXF9GXTVc5fg0aH1E4tLK+AD
	wXkW8u+sOjAGQ67RJ+CPQicSFqg6ccIq7XEfeMnCbNl+036bdy6EymrwDm972uHzUDXCMDsR9UOTh
	BBLZnqW+OgP1SEmcGPCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpWM-00000004f9W-41lr;
	Tue, 10 Nov 2026 17:20:34 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpWJ-00000004f6A-25hD
	for ath10k@lists.infradead.org;
	Tue, 10 Nov 2026 17:20:33 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-492f6b7f70dso1527011f8f.0
        for <ath10k@lists.infradead.org>; Tue, 10 Nov 2026 09:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794331229; x=1794936029; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uBV58YhPDOaC3nU5moWQwXL3FPvHNqE225/vb5rTGtE=;
        b=gnkXenZAyBX0SuEMtwHCxvoZhgLVQXKxA++AwDq4U+4VnS2uxPb7CMjdR/xofsFU2H
         WAmRWGXjkqP34xZ/ARcFoHaK86SFE0IfhEDxc0yLl+bNVgyg6DPmTXJqYW+7wIXlzAd8
         fzAHbWEsmHBMajJCr4YOvnjtN3i2OHOWjay4Kl8+96PMkV8+Dm9RHXf0TXXyTPAV6L+i
         vMi1KTfcezQixP2gRrttd/Lz0jwO7utr/bUK0Brxiwm2tx0z9YSS9m99ZflJvG49Kkh3
         HUsjUn9+sm2hykhkC6sQjVYTi66lJ63B2n9sRLfpcXZXgg6MKAPJFqarGwyyewCHiKBG
         qdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794331229; x=1794936029;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uBV58YhPDOaC3nU5moWQwXL3FPvHNqE225/vb5rTGtE=;
        b=Qm4aEDlHlOutk5yOroKJbUpIouCUlezzR1uqpPwZuD30smnZcz/aBQMbzIyMvGY9Ab
         Xu76r0GkQWKlbVv3S+HDoGKAls00in6R9ZCMxkvrgmflPWhcyxcpVynlYtK3D5nUyM3n
         V8eTtWhe6rrmW85ubIQMHlpJLSku9hy0/B0lyYp53z/XvBI+M4yZB+98SLEt2zWMehiL
         F1fvY2ErNapG6XM58dOX/0Fo+CIaWsChF5/VKkSUWyY70FutNZXDrTUep1zT+p8T0Ilh
         8J53kOLi7E4HF9pn0oKoTfmfPjUooQr0bV/RXjPtf5wchb15NJog6a2/g8+BhP5xan7Q
         KV/w==
X-Forwarded-Encrypted: i=1; AL+hErHjhIg0z48kG3Fw/vu7XDNSFx1bRy8fV5Uxfej+tGcZOeE45tHry9ArJNLAkBxpyMWdckzLMTI=@lists.infradead.org
X-Gm-Message-State: APuU4Z+x5KNN6S1YJ+G+crUNDdp8Ssa7ouW+IBZFpTsGkgI2hK3eWxQz
	Dmz5XsqageOcizokOPR9mGIVqazg9+buOqPZOhtZ5qSBmHmpm2DLRhoR
X-Gm-Gg: AYBFou2rffenvstTywY6++L18vTkA/eLRwq1xwjtYuwRt+qRbyJCJx9AmR50DzDCJJn
	lmsrrrxhy44gHIMEVkhm/dCgkICS87VGnStHblENVyelqrEVZbeP8wRGp/zLBuojD/x8Vs7f7UM
	8If/osGJQTIF8x25sm115vdoWPZLWT62rQOzn52hExcmwjkU5Ymut63DRuVUN3u55sy7H0KmoU1
	aLrEMOzMsDiOczonq1DmOaYssh23B5Zyzs9lE1pBtsQOyHCQ4CDRErPtWfgblzVKG1kCqQRa/w8
	O2Sc9GXZiI5CV2xVr750HySdcfOAiUWJeHfC38UBg5JzfTM/mt61I0gqoBI6bPzpCKcEYU0d6rC
	VdJOP4eKP7vU0hFetzymXbMOR3KyPptUfHMMy+iJNknVMgRDrwQ98aOxPJzmSeYjbV+JFzeYZTv
	UHBYY9XKIuPMjvuys6MY/aWQgwOpyqJs5VPM5EAVhPvfU+mbgjA4u+myA7zMZAo9bAX9Re7xBg0
	F127oqWdUmrCAw35vXMVqLrA0fVxdJ3V9qy7CYW7jwtlzHF9DeIk0fQWdXdmH1K2jtWkWWgj0Fi
	RfNeVQC0qwt3f7QyruMPxLRTPAShD/dS3EVO6euap2oLwxxKrisf5/f4LL4LYeSr++q1B/hwb41
	/HAO21Jx8pMWKWb6wh8u2v7luRv/8+j0GHfRIv1sV06PpROk=
X-Received: by 2002:a05:600c:c0c2:b0:4b0:9803:dc8a with SMTP id 5b1f17b1804b1-4ba02bd1ae9mr41720335e9.26.1794331228675;
        Tue, 10 Nov 2026 09:20:28 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02005762sm77853145e9.2.2026.11.10.09.20.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:20:28 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 18:20:27 +0100
Message-Id: <DMRPC2GCD51O.S4DMHZFDKRFG@gmail.com>
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Filippo Falezza" <effeffe99@gmail.com>
Cc: "Loic Poulain" <loic.poulain@oss.qualcomm.com>, "Jeff Johnson"
 <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
 <ath10k@lists.infradead.org>
Subject: Re: [PATCH v2] wifi: ath10k: Stop unanswered temperature reads
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
In-Reply-To: <20261027-ath10k-temperature-v2-1-0793e80d73bc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_092031_578749_D9CCFAA2 
X-CRM114-Status: GOOD (  17.48  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue Oct 27, 2026 at 2:56 AM CET, Filippo Falezza wrote:
> Reading the ath10k hwmon temperature sends WMI_PDEV_GET_TEMPERATURE and
> waits up to 5 s (ATH10K_THERMAL_SYNC_TIMEOUT_HZ) for the reply event,
> holding conf_mutex. Not all firmware answers: the WCN3990 firmware
> WLAN.HL.3.3.1-00694-QCAHLSWMTPLZ-1 on a Motorola Moto G 5G Plus
> codename nairo (SM7250) never sends the event, so every read of
> temp1_input stalls for 5 s, logs
>
>   ath10k_snoc 18800000.wifi: failed to synchronize thermal read
>
> and returns -ETIMEDOUT. Tools that read all hwmon sensors, such as
> lm-sensors, hang for 5 s on every run, and configuration changes of the
> interface wait for conf_mutex in the meantime.
>
> Whether the firmware answers cannot be told from the chip: firmware that
> answers and firmware that does not both advertise
> WMI_SERVICE_THERM_THROT, and WCN3990 firmware differs between devices.
> Instead, remember that the running firmware did not answer, and return
> -EOPNOTSUPP right away on later reads. Forget it when the firmware
> starts, so that a restarted or updated firmware is asked again.
>
> The first read after each firmware start still takes 5 s when the
> firmware does not answer. Reads on firmware that answers are unchanged.
>
[...]

Hello,

I've just now seen this and it will break some setups. It seems that some a=
th10k
devices that usually respond to the thermal WMI messages sometimes do not.
This is from a QCA9888 that does not have your patch yet:

[431710.509443] ath10k_pci 0000:01:00.0: failed to synchronize thermal read
[433385.529449] ath10k_pci 0000:01:00.0: failed to synchronize thermal read
[434755.541438] ath10k_pci 0000:01:00.0: failed to synchronize thermal read
[435385.549438] ath10k_pci 0000:01:00.0: failed to synchronize thermal read

Like you I have a daemon that reads the sensor periodically and it seldom
fails to read the sensor value for whatever reason. Most of the time it wor=
ks.
With your patch once I've hit this, I will never have a valid reading anymo=
re.

So how about I post a new patch that only fully disable sending when we hav=
e
like 3 consecutive read fails, and in the mean time I can also lower
ATH10K_THERMAL_SYNC_TIMEOUT_HZ to 1s or so so it doesn't lock up for too lo=
ng ?

Jeff / Loic is that ok or do you have any other suggestion ?

Thanks

