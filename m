Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7BDC35274
	for <ath10k@archiver.kernel.org>; Mon, 18 Dec 2023 18:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBLQnyWNkmhgONfOzF5Q098xplJ1GMfScLmFhfEmeec=; b=UXVQ5Wtg1CeSIRETdgKzQg8tD9
	rUHcYuU3pZxxQzTQL9Tx5Pwbr4vLMRT6LYDbbTehFt/zq0MWqnIcqLc2HPgasRIbJgd+GkllK3BWf
	bz7uo+VvlEEQaCucEXMiM3fz5fDS7G3usIcMaUXFFjzYeIi/LpEHFlgT9/rupQnAbzsvJ7R5D6W3l
	rtiMVWhNIdUVqW5dBxJcwW0km/nIZ9QbeBtUA6kd1APUSX3ETWTCK6+5q3uFAsUwMnbMg8Osbc6pa
	m7XjcM0ewHHo1+yx089LMU9YJ/zp4J2wZoecR2W2fqfj+gwKvi9NsajZMWTsTEa5gVwPqqiATJ3P3
	Q7Z/OElw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFIYT-00BmaT-25;
	Mon, 18 Dec 2023 18:41:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFIYQ-00BmZK-1n
	for ath10k@lists.infradead.org;
	Mon, 18 Dec 2023 18:41:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 11AEACE015B;
	Mon, 18 Dec 2023 18:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 307CAC433C8;
	Mon, 18 Dec 2023 18:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702924883;
	bh=Q0rKyM6bQtFZ/G0js32MCf68XYvA8jE5KFmtUJe/xas=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Jnydp11dtOs2iKoLVn8aoV0VNlCiaZNrW11WVLnQ/Kcuvr8jSWU3zrWqxtaCToW5h
	 lViSeK31qjxc7UjEwrRAl/hFPJqJpocLMPhwOvKuUCPwdf9EaDhSpYRkweeDudC2Hv
	 pJAo4n0FkiRWC42427Kgup+aQ16xPOV0sbsk8mcffeijqMy2BN628/e+ajwL+NmGMG
	 PyPQISQqFTORLc+grfr/6KGbMW5fMcDXVnoxHmi+rkwv/36TR7TKo9A/+rncQ8wUpQ
	 4gRsRuH/hbhg+E/R59VoiM37HOuLny5siJAcB8ks7iPypmkikcfQzfcEQY6OZ5NbAy
	 1auckMDRTgKNA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] wifi: ath10k: fix NULL pointer dereference in
 ath10k_wmi_tlv_op_pull_mgmt_tx_compl_ev()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231208043433.271449-1-hdthky0@gmail.com>
References: <20231208043433.271449-1-hdthky0@gmail.com>
To: Xingyuan Mo <hdthky0@gmail.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH10K WIRELESS
 DRIVER),
 linux-wireless@vger.kernel.org (open list:NETWORKING DRIVERS (WIRELESS)),
 Xingyuan Mo <hdthky0@gmail.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170292488043.424292.16691603667971169981.kvalo@kernel.org>
Date: Mon, 18 Dec 2023 18:41:22 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_104126_828953_3668104E 
X-CRM114-Status: UNSURE (   5.45  )
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

Xingyuan Mo <hdthky0@gmail.com> wrote:

> We should check whether the WMI_TLV_TAG_STRUCT_MGMT_TX_COMPL_EVENT tlv is
> present before accessing it, otherwise a null pointer deference error will
> occur.
> 
> Fixes: dc405152bb64 ("ath10k: handle mgmt tx completion event")
> Signed-off-by: Xingyuan Mo <hdthky0@gmail.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

ad25ee36f001 wifi: ath10k: fix NULL pointer dereference in ath10k_wmi_tlv_op_pull_mgmt_tx_compl_ev()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231208043433.271449-1-hdthky0@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


