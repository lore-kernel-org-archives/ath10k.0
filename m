Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35BCCCD195
	for <ath10k@archiver.kernel.org>; Fri, 17 Oct 2025 15:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BoJuRNJXSzQvDBOd11eTytEqGRXiQbkzU89SqMVXiI=; b=DjHqfzPaZUJ3VWA4XS/owwXES4
	71aDXyDMpxC3+J3grBizIXAbzeOYnBO7kUQYgG3DclOjWqxKxFY6Yl/6wSJBcTS0U2DPgmN7FD6RC
	T4CId/e9dhZFgeboaJ2iM5EQDne0vwOvDDEcK4Q09crctYDLKGEON243VyFKDjeF5/lYBgmodnbSP
	sXK1pDMUZyNFxErgVaVcTxWq+PBDPvjBxjJQ2xxAzCl2asRbePGUXPUTK753dL21G5v6T2ZyEDOdR
	VN01drwQhz1HDMK5MVtWlvegJ59wrZVyOhLREUhglVnmnik7PIRgRLhHmuJIeB4gJ6Cc08OJ4TyiM
	uQGhxkBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mWS-00000008IV6-0mdb;
	Fri, 17 Oct 2025 15:37:40 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mWQ-00000008ITr-1Ho1
	for ath10k@lists.infradead.org;
	Fri, 17 Oct 2025 15:37:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-46fcf9f63b6so10584615e9.2
        for <ath10k@lists.infradead.org>; Fri, 17 Oct 2025 08:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760715456; x=1761320256; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1BoJuRNJXSzQvDBOd11eTytEqGRXiQbkzU89SqMVXiI=;
        b=ZJuMkRiQcwl1wUF2kdW10DxSz4B+P5WjiCSsyUf1d5jAvo/4ijjxu5d1oCSCHlkIDB
         fzEY2P1c6NgTxJSgV0i73VJa/upfXPrGOpAWq1c9VEeIdeVhplRXH+XQr3+jvlaM563G
         b9VSHMUIOfMdXFuV/gmXf66fRJLcYmGOhyJO4oBGD/r/WK7KR0/AWhHZ95/CsDD837ba
         YZ5D70I8oUu/WrNoKlF4WKbwVHHN8PHNykufzJHnBZLJbipxHo56y/aMWXC1vdSLYAGu
         bz5SXwwRlr5/2qu2gelmwGwfmq8aL9hk9KKpb3ivFRjk82mufx7sGurV6pcLoENHOLYS
         DfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760715456; x=1761320256;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1BoJuRNJXSzQvDBOd11eTytEqGRXiQbkzU89SqMVXiI=;
        b=aedzY3xrW4O6nmBZhfc1P/x4arA5RdICwVZnA26WHTzfKHMNw57Nre0LWkoJX+PNCu
         TagDOMzw8Ps/M/WFHWYP9mbHbA9nVoDX9rupGdiP3jH9ANHXHf+oHy5dZnPfzIBLjIPC
         4MKUvmT0+rLtSsiHwfOSVxZftSrHfkruvDJ/WPvLWlbuR6dEtltJ1VdWGpbtg+dL1vzK
         EjLEketswysJk9vnsYaZnfZ0f6IR6I1uktpUy50W5c8x2fRyEWkTcod/rgqUnPcUrmev
         Ew8znRWov1zbuJCw7+nygbh5enY61pUSv46/WRYrS81lxOMG2V7Qj9dQPslkz6FfbiB7
         j+uw==
X-Forwarded-Encrypted: i=1; AJvYcCXDxuwANrYU88A12aj1S8SsgmBYnxxHLITVCJTpO7+qxNfnvxGqiHNyev6ZGw9Ei7SizvNSzWQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwPKOAhvxwwUMEUxWSny7wBVLB9MPWRbhqHRpQDf+vG7YvNUAvm
	XFfPtJ9BUpZy+ju7ZjNTNhGM1ODlt3PGsxONl4XtMCeJaSyY7D3+KRCh
X-Gm-Gg: ASbGncuk0sijIahtwddpOBATm96AB8aWr3d+YRKNQaqalqCxCyFhq1RY9d+isJJMW8+
	lJFhSCD/G4ef4LlfqksB7zGl8QEHSrBYKjgnUyn/bKVP+HZ6nSpmqu3JTeAqec4K5mOrh6OSPl9
	G69D6Wwdy5CSKB7V1o2ORFvDG7lsxoBRWuvjlGiBJ5swXyjsR6tkwyZx9JiPoEXsM2tTjsc/t12
	KYGjiehXiw8ElRjZf6XvPGSJyM5cBaXLsNE2Amu9B2n6e7ngNkgXnrl80YRyIZJ0SiV7rOatTlO
	e/CANjF3Zuop4msTKtfCccxndmFr3ACHwFckrSEofPUfljc553UOu9EWvs6YPP/rzCgbCAkJo7U
	tHtG9z+qIjvw/2uB9te9M0S7R1UJwcDQal9J61s50oGPxAtEdtrHVfXjf7ZOuc7X+Ztv0Snr2Ve
	afjVgV9VkcLcBYgJ8H1eT9wMnluhnTHMzLFC1ysZJS7WkJskA=
X-Google-Smtp-Source: AGHT+IGxdizsadmNUP4DyqdtkY9tA3P/0PbidzrbWBSZDjJL6m6HC8+kcqTeIt0odZZji+zDr6Brkw==
X-Received: by 2002:a05:600c:8b78:b0:471:d2f:7987 with SMTP id 5b1f17b1804b1-47117902dbcmr27810585e9.26.1760715455782;
        Fri, 17 Oct 2025 08:37:35 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:eb4a:643c:a4f2:32ae? ([2a02:168:6806:0:eb4a:643c:a4f2:32ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4714fb1b668sm1687645e9.0.2025.10.17.08.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 08:37:35 -0700 (PDT)
Message-ID: <6d41bc00602c33ffbf68781f563ff2e6c6915a3e.camel@gmail.com>
Subject: [REGRESSION] ath10k fails initialization, bisected to "wifi:
 ath10k: avoid unnecessary wait for service ready message"
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Jeff Johnson
	 <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>, Baochen Qiang
	 <quic_bqiang@quicinc.com>, Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Menzel <pmenzel@molgen.mpg.de>, 
	regressions@lists.linux.dev
Date: Fri, 17 Oct 2025 17:37:34 +0200
In-Reply-To: <175823924851.3217488.17742065327824732992.b4-ty@oss.qualcomm.com>
References: <20250811-ath10k-avoid-unnecessary-wait-v1-1-db2deb87c39b@oss.qualcomm.com>
	 <175823924851.3217488.17742065327824732992.b4-ty@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-5 
MIME-Version: 1.0
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_083738_360262_BBCE3484 
X-CRM114-Status: GOOD (  12.94  )
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

On Thu, 2025-09-18 at 16:47 -0700, Jeff Johnson wrote:
>=20
> On Mon, 11 Aug 2025 17:26:45 +0800, Baochen Qiang wrote:
> > Commit e57b7d62a1b2 ("wifi: ath10k: poll service ready message before
> > failing") works around the failure in waiting for the service ready
> > message by active polling. Note the polling is triggered after initial
> > wait timeout, which means that the wait-till-timeout can not be avoided
> > even the message is ready.
> >=20
> > A possible fix is to do polling once before wait as well, however this
> > can not handle the race that the message arrives right after polling.
> > So the solution is to do periodic polling until timeout.
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [1/1] wifi: ath10k: avoid unnecessary wait for service ready message
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 commit: 51a73f1b2e56b0324b4a3bb8cebc4221b5=
be4c7a
>=20
> Best regards,


Unfortunately, this particular commit completely breaks the ath10k driver i=
n my setup.


Hardware:
- Turris Omnia (arch/arm/boot/dts/marvell/armada-385-turris-omnia.dts)
- Wifi card (output from lspci): Network controller: Qualcomm Atheros QCA98=
6x/988x 802.11ac Wireless Network Adapter


dmesg output after loading ath10k_pci

[    5.895939] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mod=
e 0 reset_mode 0
[    6.152971] ath10k_pci 0000:02:00.0: qca988x hw2.0 target 0x4100016c chi=
p_id 0x043202ff sub 0000:0000
[    6.152994] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 0 tracing 0=
 dfs 1 testmode 0
[    6.154343] ath10k_pci 0000:02:00.0: firmware ver 10.2.4-1.0-00047 api 5=
 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 35bd9258
[    6.214165] ath10k_pci 0000:02:00.0: board_file api 1 bmi_id N/A crc32 b=
ebc7c08

So far so good, but then come the problematic error messages:

[   12.509390] ath10k_pci 0000:02:00.0: wmi unified ready event not receive=
d
[   12.580885] ath10k_pci 0000:02:00.0: could not init core (-110)
[   12.586891] ath10k_pci 0000:02:00.0: could not probe fw (-110)

And the corresponding netdevice does not appear at all.


---


If I revert said commit (on top of current mainline), all is good again:

[    6.112174] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mod=
e 0 reset_mode 0
[    6.264184] ath10k_pci 0000:02:00.0: qca988x hw2.0 target 0x4100016c chi=
p_id 0x043202ff sub 0000:0000
[    6.264199] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 0 tracing 0=
 dfs 1 testmode 0
[    6.265591] ath10k_pci 0000:02:00.0: firmware ver 10.2.4-1.0-00047 api 5=
 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 35bd9258
[    6.298955] ath10k_pci 0000:02:00.0: board_file api 1 bmi_id N/A crc32 b=
ebc7c08
[    7.458285] ath10k_pci 0000:02:00.0: htt-ver 2.1 wmi-op 5 htt-op 2 cal o=
tp max-sta 128 raw 0 hwcrypto 1
[    8.910074] ath10k_pci 0000:02:00.0: pdev param 0 not supported by firmw=
are
[    8.934074] ath10k_pci 0000:02:00.0 wlan1: entered allmulticast mode
[    8.934187] ath10k_pci 0000:02:00.0 wlan1: entered promiscuous mode


Best regards, Klaus


#regzbot introduced: 51a73f1b2e56b0324b4a3bb8cebc4221b5be4c7a ("wifi: ath10=
k: avoid unnecessary wait for service ready message")

