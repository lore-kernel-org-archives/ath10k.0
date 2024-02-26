Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4CAC54E49
	for <ath10k@archiver.kernel.org>; Mon, 26 Feb 2024 12:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=js8CEG4qRs+xipr8fOPk2Qz6bOEGnrQE3fDthEZMgeM=; b=XmOx6uqjTujWIuDaWSqQEU/dVx
	C7U5wdSpogcwk1N19DAQPFh7XZZbMBK1Q7WElVK9R1BelWPZV8VtjIBRkdMoEoFMa4H8byMt0SsbT
	uVmZV2aKQJN4+weZ8UbCO49O+h4C7I7720cAVwFZ6FP2bOCdbWuSpYNqraF7XruMTljg9ZpKyQrNN
	H7MyxUz8p591UU9+lqsQOpz7jpVaOhllaCi57jzZpd72AKDLPLRgaviKYioOsRYOPQuBpxBirS7FK
	g1icuui57Vpbs4Dejq2jg6Ql2IdvuNheIxQo5sSn9oPyyVjBy0DQL1Q69M4L96sl5dYlJjY/NxTnR
	AWlF5DSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZfb-00000000Sg4-1X33;
	Mon, 26 Feb 2024 12:01:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYUc-00000000A1B-0fBu
	for ath10k@bombadil.infradead.org;
	Mon, 26 Feb 2024 10:45:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=js8CEG4qRs+xipr8fOPk2Qz6bOEGnrQE3fDthEZMgeM=; b=A2fNeUwilaDpe0pxao75v8aVsA
	/d+uwwC8w4OgrEf9TOzlNjLLbUj2azb+9jw4vHJdDBW4cozaF8yLUnMi8LhLmQ7aEPZOaMY2phNpx
	5TFH80npKLXeTAbh36j/iM1Pgpxj+eEPS3UPIF8cUgX7J5FnFNLjPb8T/9DhvOwTJQo9HBt2jlDaX
	WT1GJy9fU/frQYlWfBY8mCfd4ESlzU+3cycvu0MZXs57Rnmt/3cCvWAem2uFZdYQG831OE+KMpPTB
	ZitdIYCFTW+x9rYSIKLxrV+Km2tPYobWvRNkFLw+tNifm2rdRG4ZZtvjWaatDhnpPB4gGGMA8HF2o
	YKGtsjPw==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYUV-000000018BW-1XJf
	for ath10k@lists.infradead.org;
	Mon, 26 Feb 2024 10:45:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 89560CE0A1E;
	Mon, 26 Feb 2024 10:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B29C433C7;
	Mon, 26 Feb 2024 10:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708944340;
	bh=ypJbOTquQXZ2hbU4PVAHyt/Olgkjp1gpiGx1r5vbjQY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=SH9ZnHw9CyL3pjRvThozbJOjG2Yn27xzP+zRcI80M+gurpSsL+MQ7NRQG8aGTXmB9
	 uEpAlB6rW34FOW4KFiiYNjBqbT0Sg/sKQWR4kvqVdNQ5tIEk3FRj0U+EapwUkoat55
	 QdDWtmAWSL2r8dmjEKbPOAXgyKAR5TNXPTS5irMazbg+8ouEFnzQ+NHCbpnbpR4Iff
	 zWn483aSpYLu4lEtO62o6O1kxjJ2KWbLnETdON7K4NY5WTwNgxM4TlpsLed1q9o0lk
	 8KydPqDSdnGamdl5eaMnZC1kmVa5TfOtk46ju4GcipUPnctVijWLHUV8QWcudSOJH4
	 swu6H7yOiI4Lw==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath10k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath10k: poll service ready message before failing
References: <20240221031729.2707-1-quic_bqiang@quicinc.com>
Date: Mon, 26 Feb 2024 12:45:37 +0200
In-Reply-To: <20240221031729.2707-1-quic_bqiang@quicinc.com> (Baochen Qiang's
	message of "Wed, 21 Feb 2024 11:17:29 +0800")
Message-ID: <874jdvld0u.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_104549_103670_1A5D2C48 
X-CRM114-Status: GOOD (  16.28  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> Currently host relies on CE interrupts to get notified that
> the service ready message is ready. This results in timeout
> issue if the interrupt is not fired, due to some unknown
> reasons. See below logs:
>
> [76321.937866] ath10k_pci 0000:02:00.0: wmi service ready event not received
> ...
> [76322.016738] ath10k_pci 0000:02:00.0: Could not init core: -110
>
> And finally it causes WLAN interface bring up failure.
>
> Change to give it one more chance here by polling CE rings,
> before failing directly.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00157-QCARMSWPZ-1
>
> Fixes: 5e3dd157d7e7 ("ath10k: mac80211 driver for Qualcomm Atheros
> 802.11ac CQA98xx devices")
> Reported-by: James Prestwood <prestwoj@gmail.com>
> Link:
> https://lore.kernel.org/linux-wireless/304ce305-fbe6-420e-ac2a-d61ae5e6ca1a@gmail.com/
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

[...]

> +		/* Sometimes the PCI HIF doesn't receive interrupt
> +		 * for the service ready message even if the buffer
> +		 * was completed. PCIe sniffer shows that it's
> +		 * because the corresponding CE ring doesn't fires
> +		 * it. Workaround here by polling CE rings once.
> +		 */
> +		ath10k_warn(ar, "failed to receive service ready completion, polling..\n");
> +
> +		for (i = 0; i < CE_COUNT; i++)
> +			ath10k_hif_send_complete_check(ar, i, 1);
> +
> +		time_left = wait_for_completion_timeout(&ar->wmi.service_ready,
> +							WMI_SERVICE_READY_TIMEOUT_HZ);
> +		if (!time_left)
> +			return -ETIMEDOUT;

I think it would be user friendly to also print the end result for the
polling, for example something like this:

if (!time_left) {
        ath10k_warn(ar, "polling timed out");
	return -ETIMEDOUT;
}

ath10k_warn(ar, "service ready completion received, continuing normally");

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

