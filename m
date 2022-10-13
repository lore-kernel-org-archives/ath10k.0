Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AADB2C433FE
	for <ath10k@archiver.kernel.org>; Thu, 13 Oct 2022 19:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nQknuvYQbwI3pmSVhfipets3El0pG5C9h4dhWYmIUuQ=; b=5B3H+Fqe0/KYLf
	1LODlB1CUer4YniyLvtAY9EulcMLSHKhgHJsWiCcyVAazkQBVmkeDzMpXmc66ylhCNwgQfy7BsvXt
	4rlwT+wMDjZZoQNp0dygWgI/iSmS5LUuwZ0c2jrdBe9raIHl9buMm9HgIIYYS4Bj7SeMdNAfgVzmH
	mu8nN1aKsgL6ZmJ0H21ekfXHbwAvtU9Ug+CDVkqCjqIrlLhjgObKfEecbdZs1/AQqvnhmPwSpWzoc
	PaAIanIuh7ADLntjGIEGD6F/8lCkFTSO5ewzDmZ0UxisTKpmlp4TbB+ZTeXFfvd7VVPkkaylQdI8e
	hWRIKHthhPw/wfTDNxpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj4Do-00CsOx-Lg; Thu, 13 Oct 2022 19:50:24 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj4Dm-00CsNg-40
	for ath10k@lists.infradead.org; Thu, 13 Oct 2022 19:50:23 +0000
Received: by mail-il1-x12e.google.com with SMTP id r20so1504116ilt.11
        for <ath10k@lists.infradead.org>; Thu, 13 Oct 2022 12:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WJtUgMyknP4m6ys7U3PstctWgnf/qk6Z7L91/ntX78Y=;
        b=WwkyeeUjwcHXf2Vy1OXp7GfUN1jTId+7Svgh+SNa0GwV2l4+49ATkI9Y+pXz3w4dZZ
         bKI1zGvMjRq0Hu9tRXndWR2X84VisTSzl32ySRyuVa5936+YEcBi7pcTvYyVOMa0PAo3
         PGBGwYeWRwafPuJGf8JxofTX1gUQENo4G/MYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJtUgMyknP4m6ys7U3PstctWgnf/qk6Z7L91/ntX78Y=;
        b=SIO6lz1H1eo10KMWkj2eN1cKDnlNsOl9SiMfYRXPduyBLj4ar6FUanIfdPit7130ev
         jjT9SbjX7NbaodmKUF35q3c35HklLMjMnkAKC1k0cyAPLyUsKVPW4eojjt5VX+DOXslQ
         sz+wGn+HP0b6L4cF+VKGcdSYL6kh0MWciyXTNSObq5rbKlk7ABB+aXAqQ4BETSPd/+Tr
         8XGJppjIqWsi4z01Y7pTEdcQUroieneIZ6Ucz2etHBBtq9NRpKxXsAROGzZDLPo2QNev
         4fY/vA3j0koUZccgWzCwEZJE0DkaU2pS89/hI9xZQpHNUL/RXOVpIl8bMVYEcHFN8DM7
         Kb3A==
X-Gm-Message-State: ACrzQf3r9rS5SQc7pykPfZErwDDSw2viil4R9EcEtTBj03AWGWE8UGiq
	wQJusFSK7jZkaMfN1Z91yXbptQ==
X-Google-Smtp-Source: AMsMyM7lvMIch7u+CSSvr4aiO2Kb9grrpoWlHGADoAvjJtjDhqNPId/axnO4uvfzhHRdAFDnCZvtVw==
X-Received: by 2002:a05:6e02:1bc4:b0:2fc:2d47:9abf with SMTP id x4-20020a056e021bc400b002fc2d479abfmr809263ilv.246.1665690617052;
        Thu, 13 Oct 2022 12:50:17 -0700 (PDT)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
        by smtp.gmail.com with UTF8SMTPSA id q27-20020a02b05b000000b00363c852c779sm308754jah.61.2022.10.13.12.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 12:50:16 -0700 (PDT)
Date: Thu, 13 Oct 2022 19:50:13 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Kalle Valo <kvalo@codeaurora.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Stanimir Varbanov <svarbanov@mm-sol.com>,
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v1 00/15] create power sequencing subsystem
Message-ID: <Y0hr9XTGAg8Q6K6y@google.com>
References: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211006035407.1147909-1-dmitry.baryshkov@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_125022_210869_6FB1741E 
X-CRM114-Status: GOOD (  22.68  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi Dmitry,

Do you still plan to refresh this series?

I know there have been multiple attempts to get something similar
landed in the past 10 year or so. Your series didn't seem to get
much pushback from maintainers, might be worth sending a refresh :)

Thanks

Matthias

On Wed, Oct 06, 2021 at 06:53:52AM +0300, Dmitry Baryshkov wrote:
> This is a proposed power sequencer subsystem. This is a
> generification of the MMC pwrseq code. The subsystem tries to abstract
> the idea of complex power-up/power-down/reset of the devices.
> 
> The primary set of devices that promted me to create this patchset is
> the Qualcomm BT+WiFi family of chips. They reside on serial+platform
> or serial + SDIO interfaces (older generations) or on serial+PCIe (newer
> generations).  They require a set of external voltage regulators to be
> powered on and (some of them) have separate WiFi and Bluetooth enable
> GPIOs.
> 
> The major drawback for now is the lack of proper PCIe integration
> At this moment support for PCIe is hacked up to be able to test the
> PCIe part of qca6390. Proper PCIe support would require automatically
> powering up the devices before the scan basing on the proper device
> structure in the device tree. This two last patches are noted as WIP and
> are included into the patchset for the purpose of testing WiFi on newer
> chips (like qca6390/qca6391).
> 
> Changes since RFC v2:
>  - Add documentation for the pwrseq code. Document data structures,
>    macros and exported functions.
>  - Export of_pwrseq_xlate_onecell()
>  - Add separate pwrseq_set_drvdata() function to follow the typical API
>    design
>  - Remove pwrseq_get_optional()/devm_pwrseq_get_optional()
>  - Moved code to handle old mmc-pwrseq binding to the MMC patch
>  - Split of_pwrseq_xlate_onecell() support to a separate patch
> 
> Changes since RFC v1:
>  - Provider pwrseq fallback support
>  - Implement fallback support in pwrseq_qca.
>  - Mmove susclk handling to pwrseq_qca.
>  - Significantly simplify hci_qca.c changes, by dropping all legacy
>    code. Now hci_qca uses only pwrseq calls to power up/down bluetooth
>    parts of the chip.
> 
> 
> 
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
