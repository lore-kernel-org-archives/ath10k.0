Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B16606A320
	for <ath10k@archiver.kernel.org>; Sun,  8 Nov 2026 22:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zCqKPUf9;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=mayn5dr5obcypefcvt5afqfrri.protonmail2 header.b=Rm9Gohr2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xSPXxSyd2E8x1X/YeNrtU2m1jId4G0QIOdjQ9fsQ2E0=; b=zCqKPUf9iHVbCs
	3HhKdvxvXi2RacR4gX8h/HKPM0P4lXaU0H7/BNFCR/orvSJXlD0WyDMbQnWfhNpfi48y08O4+qexi
	QoT7+e7Tyw6jq9vlJMBzvpwdhOkPdBNK08+6DPj3GfD712cCLp/MoSK+AgY+Zux2YWVNg7LB0E083
	O6XIPcLjPBWruRc4C7N9ay0OFICtpQFQ1xiCIdu2udAjog42+u3lMMcMwm3h29yrDKkgHBnf3u5Aj
	xO8Gztt8IgzCnOnsopdLI0RByrTwWAItyk8dLNPl/Iw4bwEGyu+y1wzIc/vT6SBklIbIPMRo1qmPI
	dN3KujF9fIoFqgfIkFOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBTf-0000000GpRs-03iN;
	Sun, 08 Nov 2026 22:35:07 +0000
Received: from mail-43166.protonmail.ch ([185.70.43.166])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBTb-0000000GpRM-34Uk
	for ath10k@lists.infradead.org;
	Sun, 08 Nov 2026 22:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=mayn5dr5obcypefcvt5afqfrri.protonmail2; t=1794177299;
	x=1794436499; bh=xSPXxSyd2E8x1X/YeNrtU2m1jId4G0QIOdjQ9fsQ2E0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Rm9Gohr2fOADzNMR/La/WCaSQYK9YsloggwEr7MSK9JQW1gwsYN5PLHQABzYXXj5T
	 4qf3udNGuBbg7GudZNf7Rhqm3GGqz/nsDs8x4YJMySp7GQUIQCSVc1BK2YX5Oijlae
	 +V33r2qaTCnqMPLeUUhj7ZXnS6RTDfdR7jLSSPYfeE5TXVYpk0tkd/oox3ueod3y1i
	 okdTTpg/vq20gubZRrSdqUXhRblxNW1FB1V8zNF8D90v+7M6xojSevsfyiY5tsKgZw
	 F0u/lgUABjhyNvmzFQTciF2Eax2+KrO4Y6U7w7Rn+iZukDyAm/DK+xGwkLitAJptnZ
	 A/ru2iLl3cTIg==
Date: Sun, 08 Nov 2026 22:34:55 +0000
To: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
From: yphtno <yphtno@proton.me>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Fw: Re: [BUG] ath10k_pci: QCA9377 reports recurring PCIe AER RxErr/BadDLLP errors
Message-ID: <SwgcbPjihOw1Rg6sRhFygWxCgxFEKswuvbvFpC22y64m_2UH4QBXwEDYRlR0rrik4aZ0-EUGnFc3etEWDjF81iDFqICvEegMLLn7T_fHq8g=@proton.me>
In-Reply-To: <EX3FulMuuu9uyQAv-TAn5MCVKf4Y9Hdw3DSQVKzb86lJo5uETxcrMlXxMUdaRsPvODlBfAVBj5V1XfNx1cPkVh317NOzXF5RWB6_Q3I5IcE=@proton.me>
References: <EX3FulMuuu9uyQAv-TAn5MCVKf4Y9Hdw3DSQVKzb86lJo5uETxcrMlXxMUdaRsPvODlBfAVBj5V1XfNx1cPkVh317NOzXF5RWB6_Q3I5IcE=@proton.me>
Feedback-ID: 175109102:user:proton
X-Pm-Message-ID: 9f5fa3358e5dbee5a0e9a32a38c4ff8a75f963b4
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_143503_929645_F5545A8C 
X-CRM114-Status: GOOD (  10.20  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1




Sent with Proton Mail secure email.

------- Forwarded Message -------
From: yphtno <yphtno@proton.me>
Date: On Sunday, 8 November 2026 at 2:14 PM
Subject: Re: [BUG] ath10k_pci: QCA9377 reports recurring PCIe AER RxErr/Bad=
DLLP errors
To: ath10k@lists.infradead.org <ath10k@lists.infradead.org>
CC: linux-wireless@vger.kernel.org <linux-wireless@vger.kernel.org>, linux-=
kernel@vger.kernel.org <linux-kernel@vger.kernel.org>


> Hello,
>=20
> I am experiencing a similar issue with a Qualcomm Atheros QCA9377 wireles=
s adapter using the ath10k_pci driver on an Acer Aspire F5-573G.
>=20
> I found the existing discussion about recurring PCIe AER errors on the QC=
A9377 and wanted to share my hardware's behavior in case it is related.
>=20
> Hardware:
>=20
> -   Laptop: Acer Aspire F5-573G
>    =20
> -   Wi-Fi adapter: Qualcomm Atheros QCA9377
>    =20
> -   PCI ID: 168c:0042
>    =20
> -   Hardware revision: hw1.1
>    =20
> -   Driver: ath10k_pci
>    =20
> -   Firmware: WLAN.TF.2.1-00021-QCARMSWP-1
>    =20
> -   Kernel version: [INSERT `uname -r`]
>    =20
> -   BIOS version: [INSERT BIOS VERSION]
>    =20
>=20
> Observed behavior:
>=20
> The Wi-Fi connection intermittently fails during normal use. My kernel lo=
gs show recurring PCIe AER correctable physical-layer errors involving the =
QCA9377, including:
>=20
> -   RxErr
>    =20
> -   BadDLLP
>    =20
> -   Rollover
>    =20
> -   Timeout
>    =20
>=20
> I have also observed the following ath10k message:
>=20
> `ath10k_pci 0000:03:00.0: failed to flush transmit queue (skip 0 ar-state=
 1): 0`
>=20
> The firmware appears to load successfully.
>=20
> ASPM testing:
>=20
> I have tried booting with `pcie_aspm=3Doff`. It sometimes appears to impr=
ove Wi-Fi reliability, but the connection still fails most of the time. I h=
ave not yet completed a controlled comparison, so I cannot confirm whether =
ASPM is responsible.
>=20
> The issue has persisted after reinstalling Arch Linux.
>=20
> Additional information:
>=20
> I can provide full kernel logs, `lspci -vv` output, BIOS information, and=
 perform additional testing if needed.
>=20
> I would appreciate any guidance on whether this could be related to the e=
xisting QCA9377 PCIe AER issue, or whether further investigation is needed.
>=20
> Thank you for your time.
>=20
>=20
>=20
> Sent with Proton Mail secure email.

