Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDEA606A336
	for <ath10k@archiver.kernel.org>; Sat, 14 Nov 2026 21:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u2Tk1h4V;
	dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.a=rsa-sha256 header.s=201907 header.b=JsY6Bp7o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zwgXA5+Odaroih+5cJP2flyJbkb2qJWJMVZacUW8A/g=; b=u2Tk1h4Vk0r5yL
	597sVqRSnbaq4coCv08XiSs9NKO8Um+s3gL6G5VL64z2tWIS4FKWRKbBFL2Ectue5Mgvw5htkiU6P
	FGWGlNXG9w0JH8KOPtpZnqbLOFRYZYQLb4oKfg2Wv66NS3HDhNvJto1XbylU/YdDglw2Wy1Y3Yz8k
	Pa8cF5lKAnKgb4JmCMlyUDeQG7rj2tzoTgB/oMmYdhQHbCtvGfHCJ1j7opfktYSQHD5K+pxuse1TD
	PKZJx2peQ/vM6TsUbhJgnRc96yGDRQrI05pfgC7bh7bmAI+7GZ9ZqSYzohJwBXKT6Nck8JWN0jhyw
	4VrfHsvBmBTnUWyea+Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSLdO-0000000GnyX-2qes;
	Sat, 14 Nov 2026 21:50:06 +0000
Received: from mail.kaechele.ca ([2607:5300:60:987e::25:1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSLdL-0000000Gnxr-1rt4
	for ath10k@lists.infradead.org;
	Sat, 14 Nov 2026 21:50:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29AA7358BD1;
	Sat, 14 Nov 2026 16:49:54 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1794692997; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=zwgXA5+Odaroih+5cJP2flyJbkb2qJWJMVZacUW8A/g=;
	b=JsY6Bp7oYkBIAUjF6FRPGqhMc57BQBkz1cszaWMIUuyRacdBuW524t7Hffov1kKRucfhS6
	br1PG8VvunnbrFykCEorMvBy7QB4Y8y0dl+LrxddlHyOu7j07a0XsZLWkXiHNKjxYP0nko
	fgAipkwbUpyUwN/nveSnKyPsx1Rw/Zw=
Message-ID: <7e36cb20-7752-4778-b068-56d41819f670@kaechele.ca>
Date: Sat, 14 Nov 2026 16:49:52 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/6] wifi: ath10k: usb: fix group key
 installation
To: Tomas Paukrt <tomaspaukrt@email.cz>, jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 David Heidelberg <david@ixit.cz>
References: <20261114090737.64348-1-tomaspaukrt@email.cz>
 <20261114090737.64348-2-tomaspaukrt@email.cz>
Content-Language: en-US
From: Felix Kaechele <felix@kaechele.ca>
In-Reply-To: <20261114090737.64348-2-tomaspaukrt@email.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_135003_689799_5041D9F2 
X-CRM114-Status: GOOD (  15.28  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi there,

looks like another take on David's patch here: 
https://lore.kernel.org/ath10k/20260918-ath10k-del-v1-1-53cd7a7d682b@ixit.cz/

Given that this affects a few devices (not just the USB one mentioned 
here) a more generic fix would probably be in order. I'm also seeing 
this on QCA9379 SDIO.

Regards,
Felix

On 2026-11-14 04:07, Tomas Paukrt wrote:
> ath10k_install_key() waits for install_key_done, which is completed by
> the HTT security indication. The firmware of QCA9377 USB devices sends
> this indication for pairwise keys only, so the installation of a group
> key times out after 3 seconds and a station cannot connect to a
> protected network:
> 
>    usb 1-1.1: failed to install key for vdev 0 peer c4:93:00:3b:6c:f9: -110
>    wlan0: failed to set key (2, ff:ff:ff:ff:ff:ff) to hardware (-110)
> 
> The firmware does send WMI_VDEV_INSTALL_KEY_COMPLETE_EVENTID for every
> key, so complete the key installation on this event for USB devices.
> The other buses are not changed.
> 
> Tested-on: QCA9377 hw1.1 USB 0.0.0.111
> Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
> ---
>   drivers/net/wireless/ath/ath10k/wmi.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index e57588c19c80..7d43a23017aa 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -5339,6 +5339,10 @@ void ath10k_wmi_event_vdev_install_key_complete(struct ath10k *ar,
>   						struct sk_buff *skb)
>   {
>   	ath10k_dbg(ar, ATH10K_DBG_WMI, "WMI_VDEV_INSTALL_KEY_COMPLETE_EVENTID\n");
> +
> +	/* the USB firmware sends no HTT security indication for group keys */
> +	if (ar->hif.bus == ATH10K_BUS_USB)
> +		complete(&ar->install_key_done);
>   }
>   
>   void ath10k_wmi_event_inst_rssi_stats(struct ath10k *ar, struct sk_buff *skb)


