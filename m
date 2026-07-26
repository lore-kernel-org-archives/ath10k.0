Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83605C531CC
	for <ath10k@archiver.kernel.org>; Sun, 26 Jul 2026 06:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vDSJsguHP3GZC2s9QaNxRVXRfaZ1bkde77LcEfAefD8=; b=utqszTpyFtqawbSVrWMKp3qAYU
	j4x2cfITo/zOMLVD2U0FauJqxUza5z4q9k32yA7wCR45w+qIBa0B1+egxEXJUe5uX7T1MRiFGmvG7
	PXuZCJNqOlyYSYh/QNLnI7M+Xm4dQZn9UymDHmWKE/GRTaqup1ZHNrInLGcduGqFw2mvifBYovSSi
	LC5jLgFbTi2kmkD7IrlczluZRYSu5E4iU2rGiOHRI7KelRInbVc41cljOaIhe6A6KHuRScouGLmrv
	T4deG+AD3gH7jHFC1A/GfNtridlgKDXhxvkfqQwwZqRcVDEuFB2MK9BvDbJT0++puep9cgkydR/UM
	dXJyH2+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnsKb-00000000xAJ-3glj;
	Sun, 26 Jul 2026 06:27:25 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnsKZ-00000000xA0-2Awd
	for ath10k@lists.infradead.org;
	Sun, 26 Jul 2026 06:27:24 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7ec58fa3e01so787099a34.1
        for <ath10k@lists.infradead.org>; Sat, 25 Jul 2026 23:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785047242; cv=none;
        d=google.com; s=arc-20260327;
        b=G0qWkbWkIgoqfP+DPOyhifAFWckiFg/7xOa+vlw5b9CcSV4qri6p/7o9GxUZFUOULT
         SWALXvD6Hkir7XGliIk5N2jDx3roAzmD6OTH3M6fZYErEshjaIESxMcko1cI4uCUqnCj
         NiQs3q+9EonIYX+5CesdnruYuw50vAubj8am1DzJQEFhQQqZVnwx1/EbUIqQQ1DD7mDu
         o2pQ+kaAvG/Q08XgPueeCIXRiX4KjzehE0+xSCNyBCClJ/mHRpookJYPQjH77zip/w0O
         4qd9I13qw0zecYvsE3MIyuL5gJCBHl/q3eyTKtD8UjeAhvAT6nLLTq2iFDksC6B6pPcQ
         Vw5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=vDSJsguHP3GZC2s9QaNxRVXRfaZ1bkde77LcEfAefD8=;
        fh=KbH3UBjZ8QomLCl0k9G6sVubiiph/RoE0MOW28u+q3s=;
        b=EC6qHQu+OC+/JuZjvc7STh6DMlKtQfPZPNZdXzrucKMrw0pDFgH8ZTz3K6SxT5dDdQ
         hEoj5cw5KUZPHRhW6mI64r4WYWviggwn9myrgTb8Gze68CvMJdZHtumwOwhSvtPStGEj
         azyXvbfFAkLkyWVvuKcV//KomWfXVML5u+d8WqVkSQ8XeIraTTO5TxiXyLMHLaAt584/
         65Mf+EepPy3hrutYd7C+WpT25eqL/GTmezgbdUOnCt8gC0CZlVdDWFk4HNYeFgSdLNM+
         M2ijb/h73+mbTZlistiEW7CiVY4zE+/JfjRSGkj494Q3j6104dkWD32OvlAoEu12tW1J
         /xtA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785047242; x=1785652042; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDSJsguHP3GZC2s9QaNxRVXRfaZ1bkde77LcEfAefD8=;
        b=D+QQ8kEbOC+hZA3iKXKT4tZ+YkO7EtOEtwclaOwRzJE3+5eAXZX10P6XZ7vi251s/Y
         r+CgT9iWGo5gIZjQjNMNuDN4UF99/qkuk/t2dwORrcO8+NdKVMM2kk+qtaGP/Zh/Eydg
         ETvVjiMVmTA3TWE+ZUEa8/1PpdlrzN/HxH5/EmiItywUL7WJ/PEVPV0By2v9zjvKtPc5
         9/ZYJszWWgxvVbNSTJSC2eB/+PPBKmYx8Y3dbsW8iSOn8gKaSWCveZbpN+FWJBG9wYM7
         Q4pv9Mm2pXEEpitHI9elzytp5mmQyqrKedwVJ8GwZd+De8tME/eVJ/chJgeJWYPLhtWC
         fDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785047242; x=1785652042;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vDSJsguHP3GZC2s9QaNxRVXRfaZ1bkde77LcEfAefD8=;
        b=Omadz/lr2EV+VupyCctYJqvWPjowckbxnYwCjXOeZC4IhuWpUJiU4VFqeyJG1d8gYF
         W24pM6U0RYel2hurKb1ELlACeBg1udxd38fLdTHYjw5AOPUGlWCoff5+qgYka3veg5VC
         XmIp+KJS2dGrO1KIBnicGnlolGhdyXttbBaknD/kNG87UYeIuhOfn8l5QE28Vufui203
         DzXeQe0x0pGeGqd2ZfiZEuw0NwnkxJicbX3Hzxl+SlFauxGZ+MIJkb7UOAa62gsTwaZA
         6PlFC7VtoCpq5YEqLOoyWtyRXx48KFjeQEPDdhVWkmXjUMFRgM4dI20lcnxGca+oXs3v
         Ekbg==
X-Gm-Message-State: AOJu0YztbdH8XO5YnPkDAo05K47EUzcgir3hUxqJQfFMvhrVTbekojgo
	iSK7VjaaH235MY0rk2iJR1NTAieFNPIiG0ktOg/KCEF8FWEziUlRYrMn3VUJxlzn05YRRZfQMQN
	StN9pS5g2L+jooa8jBgHI7Lt0xnAC6v0=
X-Gm-Gg: AR+sD12mqCp6Bpdso7MqUpkkxO4H5jXwoSiBenbaP8O0ywe8Gkr/s4C0KVHRW2kzEhi
	4vcc/ePm6cr9X5XufLnmmElhLwXEhqXc+XFgcBLi2H/VzCY4wdJOin13Ziw3Lirh4oww2xfoxQY
	6hxjGObUiq70kncvFGqzvFfMm6frftoh3+K2B6RdWYlBXKeNvCz1+TyZxZIn3WZUZLDrYGMFRJN
	HHaGmuEQdNlQNNuzKQFqwuv/PjKMxFM8BsSvU188SqyNZmLTMX7LD2iC3k36A==
X-Received: by 2002:a05:6820:168d:b0:6aa:e854:d03b with SMTP id
 006d021491bc7-6aaff861424mr3019938eaf.2.1785047241836; Sat, 25 Jul 2026
 23:27:21 -0700 (PDT)
MIME-Version: 1.0
From: Rakesh <alasyamrakesh77@gmail.com>
Date: Sun, 26 Jul 2026 11:57:09 +0530
X-Gm-Features: AUfX_mwVESciFjrQOYAwjGdza-1UBWJjl4OKsNkk0jI3qgxj35yF7YD3Wx5CaIY
Message-ID: <CAMizObmsJkvUJ07YpY7r7FNXSfvEiKjDNkPEq7mxVhrytejkBg@mail.gmail.com>
Subject: [BUG] ath10k_pci: QCA9377 reports recurring PCIe AER RxErr/BadDLLP
 errors with ASPM enabled
To: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, jjohnson@kernel.org, johannes@sipsolutions.net, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_232723_570270_C3F612E7 
X-CRM114-Status: UNSURE (   5.85  )
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

Hello,

I am reporting what appears to be a reproducible ASPM-related issue
affecting the Qualcomm Atheros QCA9377 (ath10k_pci) wireless adapter.

I initially reported this to the PCI subsystem in Kernel Bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=221784

The report was reviewed, and I was advised to report it to the
ath10k/linux-wireless maintainers since the PCI subsystem itself
appears to be functioning correctly.

Hardware:

Dell Latitude 3500
BIOS 1.37.0
Intel PCIe Root Port: 8086:9db1
Qualcomm Atheros QCA9377 (168c:0042), subsystem 1028:1810
Driver: ath10k_pci

Kernels tested:

Ubuntu 20.04 (Linux 5.15.x)
Ubuntu development release (Linux 7.0.0-14)

Observed behavior:
With ASPM enabled, the system continuously reports PCIe AER
Correctable Errors, primarily RxErr and BadDLLP, while the wireless
device is active. The issue is consistently reproducible.

Workaround:
Booting with:

pcie_aspm=off

completely eliminates the AER errors.

Additional observations:

ASPM L1 is enabled on the PCIe link.
L1.1/L1.2 substates are enabled on both the Root Port and the endpoint.
During initialization, ath10k_pci temporarily disables ASPM and later
restores it.
I was unable to find an existing device-specific ASPM/AER quirk for the QCA9377.

The Bugzilla report contains the complete investigation, hardware
information, lspci output, dmesg logs, and supporting diagnostics:

https://bugzilla.kernel.org/show_bug.cgi?id=221784

If additional diagnostics, testing, or patches would be helpful, I
would be happy to assist.

Thank you for your time.

Best regards,

Alasyam Rakesh

