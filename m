Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56975C4332F
	for <ath10k@archiver.kernel.org>; Wed, 12 Oct 2022 14:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d6hur1ie5/8Z3oKlapRInJ6v2MXbwWsfpvSRgTQhK8o=; b=szELXmmt3yL2sP
	53VS0jgvx97T8n2yInpIvedMSjqeJyR0XfQMnpNd6uKJL0ER8jLuiB9u/rvwR0d2WZ8LqQoKqLq09
	5hiX/x+9eV5XVyvCDTIQqsDo5hISgIfS+/heW5lN313BAM7X0kbHBy1BM2Uj6UnJ+x/WEnYIEGRYJ
	kPD3UdtmMUxa7qBSfeteYzYnF4yJ8CXzcsfRUd5iqIIgwYTSA+78unyJceZYDYTGLcpTrT0EeFNG/
	IoSlkfWPW+LpkqC9ZOZ/48QRQulljinOu+4RrT+60Vx441klvm6mMPx/AXSpevmmm9cVHj23BKhU4
	QySEUJjb0RB6Fedf7dcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oid2n-008RhX-VJ; Wed, 12 Oct 2022 14:49:13 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oid2k-008Rfi-8W
	for ath10k@lists.infradead.org; Wed, 12 Oct 2022 14:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=ZAEoS8mUjnL5VE8t55zy1MwHS8C4pzjpQXMKrzCouUs=;
	t=1665586146; x=1666795746; b=bhBv7YD2sLOhLBoi+7jynj/IaO1fenfYS62K8kY9fMNdBCE
	7tr9mmWNjRN7v3bO+F/XFSVO9eVx+DNactWt8YMtNsyLcge8WhwTrzqJmLTjP+54A0grkgleBSJT7
	Gv4h9kP1UI5IC8eXzL3m1R2uHuklPxsW10/yi/Az7/trZ/RDuRcflkn4KaZ5hgHWUS7aYI985YsCi
	0kn5g9+bvwZQq8nV170cAuB4Nc8xirwqSh3vU8WCFiXcXjEq606TaJkl+QoKtwMqEXyBi74E8pEMA
	ClYtM5mcXA9tBoKN+rnxADZiBqOcZAO5hW+DshYH3GqMWhRn1VAy+6B/uXmn+1jg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1oid2e-004pgo-0k;
	Wed, 12 Oct 2022 16:49:04 +0200
Message-ID: <1c64fe906b36438d63a7fc3fc9d0ab010b6db42f.camel@sipsolutions.net>
Subject: Re: [PATCH v2] wifi: ath10k: Delay the unmapping of the buffer
From: Johannes Berg <johannes@sipsolutions.net>
To: Youghandhar Chintala <quic_youghand@quicinc.com>, 
	ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Douglas
	Anderson <dianders@chromium.org>
Date: Wed, 12 Oct 2022 16:49:03 +0200
In-Reply-To: <20221012142733.32420-1-quic_youghand@quicinc.com>
References: <20221012142733.32420-1-quic_youghand@quicinc.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_074910_319131_05EEAD4D 
X-CRM114-Status: UNSURE (   5.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On Wed, 2022-10-12 at 19:57 +0530, Youghandhar Chintala wrote:
> 
> @@ -418,6 +426,7 @@ static const struct ath10k_hw_params ath10k_hw_params_list[] = {
>  		.dynamic_sar_support = false,
>  		.hw_restart_disconnect = false,
>  		.use_fw_tx_credits = true,
> +		.delay_unmap_buffer = false,
> 

All the false are unnecessary and just distract from the content, imho.

johannes

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
