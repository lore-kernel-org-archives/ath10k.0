Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F89C982FA
	for <ath10k@archiver.kernel.org>; Tue, 22 Sep 2026 20:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8LKk+1yCqqSBPwtpjm5MjX+FdXoGXWtVvIQvMys3AHQ=; b=HqcaUKRogebKPTQoVlGa0Y9F6L
	ZXK58oP1Pv+mL/tx+8iNY3oX2dRN6jkuZmxDoYfDVQaABqTLjhg1ex9w4Y75iLwnpl2pHVxMvw3Qw
	ILOnXlCvsSHaZPR3M/s84S8XskGhhrv/0mMtu75vl/xGAYVmZGEtXBrgKOq2GV8ZYQ4RrFmf15rX+
	61Jc8DsMaqx4G+FT78tB7OgBXiJz+pHtRv4UzpvnBEfJ/fWCCQnP3aboqh7pg+FmCK8SfMWl2wQro
	UtSacjvkpgdxGK6Y7JL9XyO3H8vDvOFR1KThslEnAXKc+oJMfERS2HjB950lJuPmwzCZHm9WENwT8
	Y0zBqiDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x97Hi-00000006YLg-3ag0;
	Tue, 22 Sep 2026 20:40:14 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x97Hg-00000006YL3-3Tf4
	for ath10k@lists.infradead.org;
	Tue, 22 Sep 2026 20:40:13 +0000
Received: by mail-yx2-x10.google.com with SMTP id 956f58d0204a3-66e4ab20a33so340052d50.1
        for <ath10k@lists.infradead.org>; Tue, 22 Sep 2026 13:40:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790109611; cv=none;
        d=google.com; s=arc-20260327;
        b=ldWyKluYv6is3OHxlLJv7mQl6+CYU9jOP9VEceJTgqwhfTOiyk6RKLcMaxmGUCgLGX
         u9X5tY0HE6pH5PP8yXyfgfz+DauQ1of8LBJZAmCpqHFhZ5Dz8TkwQS/G5DPJ1KwTf+lz
         yAPIRKVeSHBItXD2iDSkSEMzeXIU8bGPHfV2xVf+Y24tc0fqW4hT8exbHEL0xSTCCT9E
         R0nghEttJtYs9S+6mfbXtiynkLP2NBsOhUsdIOPaJs3tnr6jhi5uF0g0n1U7jAhs0bao
         caqpg9bs+sFwQ1KeasQA27KHQxZjHYxrKX/5MtgmY7qz+6CdAMWjrPbycPY/sEfQOLZd
         zULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=8LKk+1yCqqSBPwtpjm5MjX+FdXoGXWtVvIQvMys3AHQ=;
        fh=257NU1k7yWpMtvADl0QXIxasDlKNfhRrsESSisMuHik=;
        b=bF4XgP+OeFCPbZorSMoKpwJyu4KncAA/9Z9XMKj7fC2VnBVv/CHu6yAyACfFwrgvqw
         18teZN6yklXHLTFAMSqk587iCD7oDiGA1GuchHtTGIOLUUzZBW2h+hzrvP816159MuBC
         pOHmEVCXBoPGwZir1s6EUeKnVDH4/kEsLi1waqVxU6QARalaMWoqeyxc2jXQmzennt0H
         FawoV4qiXTkNY7WjdtuKI5tlnYC/C+7J+9Jlq+iq2rbUtBgAaLCa4bmUhVYS+bpAYyma
         ElGji6x+7TvRXxB/NMOmssChlWML+gLFrXjx38XS28GuuVTrx6v3qks2p61aCnZ/VRaE
         hvSw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790109611; x=1790714411; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8LKk+1yCqqSBPwtpjm5MjX+FdXoGXWtVvIQvMys3AHQ=;
        b=sJcdXR6LehaLG5LBxvRsWSqQtjJlLD3mZglAXWWnLgnxbR9bMg2RlfDAk3vfrmpHk3
         vytRdoHEVuuvmdIarDfqXNyRFd8Jn86QhHrkBRR7tZNuPWU3nxYqlEU+eptDOpgqdUi9
         cc2nzLS2hwC2V7KLY7cu2A/pi9qORkt9lUGDa8ddRQEG+6uI7x01JlDCrqudz+FO+LKI
         fO56CryXLEZil/+vsrFDrr0TCuv574zzQ38nsshFML/8fDbAs4oKizgwUY692xVxAtlE
         7lsh5EYBravbAMRANGJoByKrHN+b+LFc5cEmdFyscTJOr87TdjFi3bVsWHBkgZC6DN9j
         nfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109611; x=1790714411;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8LKk+1yCqqSBPwtpjm5MjX+FdXoGXWtVvIQvMys3AHQ=;
        b=h5grU4vv+WfxT1dhSmUKtttz7bFmMoSOL3/7S+qJvGF704lRBddDfXsdcws3HAtRAA
         tScxG4EvNfv3S5xdBFd8MdGc+cXsjYxgv24HwNFZnB2ApPdR4OXBn2DOnlMfrroschwS
         MyuxfTfCozZ+YVPtF/bdk+KBWaKaj82UPhILi3UKS8ZgnMQLteVY94dHA7fFd9toDIlq
         Zeoc6cAfaQqkY7ZUbsSz8CQcT8yQUS4MTLqcuIYXz4GcRCmXBh7GCoS5B/txceAqDcfS
         y9+bXAntFHiizwqR/JwWEGRDCAju03lU6Cgsca3HJLGis+lCYMOcpAhLQe1RDQ75I9sz
         CD5w==
X-Gm-Message-State: AFuF++lVkqIY1liawFLtfBv/hQaU06rDME+vdUfQS/U/Qfaf/G3vCtlv
	sLNuF+n74C/iPqfqzR4adSAKCgqmZvyohf2YA1Fm2H6dcdkExnyI4S04A9/AiKYsMnxfj0ySn7/
	3lpRHffU3mus4X5CbeEMiQto77QCJm4VdJWtK
X-Gm-Gg: AYBFou2VcOmIAAX7Vi2+1Zb4dVIBbrPkCvmrvaSdzkmuFyRmQ6fIRIXZWTs6XtFIlBA
	0GJ4nKyADNDzTDJtJwCj+loq8sCyhjrmyf2c456FiWH9JL73TnO/aDV1lLgvaQ81h2stMkEefEm
	VWYVDtiiGvSQ6xTJIQXxmXcJSxeUrYTd+mIQvQlrPjXo7jfFfVZPQA3uT5kzXa+q4QMueKN+yEd
	3Fb0BNIkfG16HpdiolJuUhjz7/NxGR/CyJiDFDel/+n85FvUu7WOD22mPcwkQvRSHdEL/bQxerH
	jWlntnpCqd3OcJ698oulL4OQjtfSLX44QVkyyPNQkBWKT0aZBRgLY3vF687HEaJQkZMGHsPkzOe
	a2hb9tl+D+csKj6U=
X-Received: by 2002:a05:690e:1343:b0:66c:c7f5:df48 with SMTP id
 956f58d0204a3-672d5737312mr369236d50.1.1790109610569; Tue, 22 Sep 2026
 13:40:10 -0700 (PDT)
MIME-Version: 1.0
From: Tom Janssens <herrwaldo@gmail.com>
Date: Tue, 22 Sep 2026 22:39:58 +0200
X-Gm-Features: AclHuK88cmyEFXyd_rMshdRCilgjP8259GdegHuH_NG85VY0dAA4AfLbB3s-qcc
Message-ID: <CAAsBusP02gPx6=i6rYqGr71xkUuCzpkG9ujE=DfuG2Y9qmPfXQ@mail.gmail.com>
Subject: ath10k: QCA6174 hw3.2 DMAR write fault on RX of 802.11k Beacon
 Request (fw WLAN.RM.4.4.1-00309)
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_134012_886681_FF532BC6 
X-CRM114-Status: UNSURE (   9.61  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi,

I'm seeing a reproducible IOMMU (VT-d) DMA write fault from a QCA6174
that is triggered by received 802.11k Beacon Request frames.

Client (laptop)
- Dell XPS 13 9380
- 02:00.0 Qualcomm Atheros QCA6174 [168c:003e] rev 32, subsystem Rivet
Networks Killer 1435 [1a56:143a]
- ath10k_pci: qca6174 hw3.2 target 0x05030000 chip_id 0x00340aff sub 1a56:143a
- firmware ver WLAN.RM.4.4.1-00309- api 6 features
wowlan,ignore-otp,mfp crc32 0793bcf2
- board_file api 2 crc32 d2863f91
- htt-ver 3.87 wmi-op 4 htt-op 3
- Kernel 7.0.0-31-generic (Ubuntu), intel_iommu enabled (default
DMA/DMA-FQ domain)

Access point
- Xiaomi Mi Router AX3000T (mediatek/filogic), OpenWrt 25.12.4 r32933-4ccb782af7
- wpad-openssl 2025.08.26~ca266cc2-r1, dawn 2025.11.07~7414c34a-r1
- DAWN: update_beacon_reports=20, rrm_mode=pat (source of the 20 s
beacon requests)
- 5 GHz, ch 36, 802.11k enabled, PMF active (requests have the
Protected bit set)

Symptom
While associated, the following appears every ~20 s:

  DMAR: DRHD: handling fault status reg 2
  DMAR: [DMA Write NO_PASID] Request device [02:00.0] fault addr
0xfc2d1000 [fault reason 0x05] PTE Write access is not set

The fault address is different every time. There are no ath10k
warnings, firmware crashes or restarts, and connectivity is not
visibly affected.

Trigger
An AP-side monitor capture shows that DAWN makes hostapd send the
client two Radio Measurement Requests every 20 s, 5 s apart:

- Beacon Request, op class 129, ch 36, BSSID = the associated AP,
passive, duration 0.
  The client answers within 1-2 ms with a Radio Measurement Report,
mode 0x04 (refused).
  Body starts: 05 00 67 00 00 26 1d 01 00 05 81 24 00 00 00 00 00 a4
a9 30 c8 5e 5f 00 ...
  Reply body:  05 01 67 27 03 01 04 05
- Beacon Request, op class 129, ch 116, BSSID = a second AP. The
client sends no reply.

Using the ath10k tracepoints, each fault precedes the ath10k_wmi_event
for the ch 36 request (id 0x7001 / mgmt rx, len 152) by a constant 76
ms (+/- <1 ms) over several cycles. The 5 s / 15 s interleaving of the
two requests matches the fault/no-fault pattern.

What changes it
- Stopping DAWN on the AP (no more beacon requests): periodic faults stop.
- Client disconnected but interface up: faults stop.

No effect
- AP width 160 -> 80 MHz : faults continue.
- Disabling ASPM L1 (incl. L1.1/L1.2) on 02:00.0 via sysfs: faults continue.
- Wi-Fi power save off: faults continue.
- Continuous traffic: faults continue.
- Runtime PM: not active (power/control = on), so not a factor.

Additionally, even with DAWN stopped, a single fault appears once
after each (re)association. I haven't confirmed whether that is also
RRM-related.

It looks like the firmware writes to a stale or unmapped host buffer
when it handles an incoming (protected) RRM Beacon Request. I can
provide the full dmesg, the ath10k trace and the AP-side pcap, and I'm
happy to test patches or collect more debug data.

Thanks,
Waldo Janssens

