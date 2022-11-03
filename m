Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98899C4332F
	for <ath10k@archiver.kernel.org>; Thu,  3 Nov 2022 06:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D4lD0GsOUlQB+/waPIQ6aUw13nVBNeE/kIy62F4VnBo=; b=lYyAholbGbfKhy
	IA2BCFlB6vQyOHa5eqImcLll0wKoPeEf/ZgMtaAW8szYmKc55yFpcLvoMV8qG8cI5JdeCQUTm7m03
	yepg0Y3I1eKd2Y8rutembPqxWEASTQRLMSmI+gaWedIueO6xzqHGuA1QDyD5JoM9t8mKNer19zKEr
	3lSv2ExOqWbyoWUK1DaUz5P6jCETbiv5DUI/SNLLHSN4q+Sdeva4uE8Y+BXXqRkQAqGNCBq4M7PJw
	wksAc1dpwk0EfoypjSji4BtNbKVm4732LZmRoRKsW2sDBlXRHok1Am6GUN6USm/Iogxv7QDn/vl/8
	QvyOUgfP+S0L8RAHB9fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqTNZ-00GGGk-QP; Thu, 03 Nov 2022 06:07:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqTNW-00GGGE-DU
	for ath10k@lists.infradead.org; Thu, 03 Nov 2022 06:07:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AC25561D43;
	Thu,  3 Nov 2022 06:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33235C433D6;
	Thu,  3 Nov 2022 06:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667455621;
	bh=LPrafYX9hEsEzaF5fMXuFCwDsoy3H56OcRw/rH9JSXM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=SFHvRsWL6B4CnT0K6atnhiGEFmoh72vRzlJkk0ycPcCDJUWg8XaCq0gyic1c37aST
	 53sfpIR/srKbe851c5z2J/rGT0AttdFSo2eSLVFQjaB+kEdab9BN/SqDBdjjmi5WXG
	 eH/Ysi5IJbAJssr1GQoxFSPmIECgKvCKQzhqEnswoWaclVGpAdh7fsmwBThpdJ1t1x
	 pkVCeiEqlBsCZ5PcJmKzHcdTe5RSpCk4jcYPhCTS9P+cq/Bt3oyb526N8pZD4lduqU
	 axBDLByaWX2JZgK2XvDdrxaFNDWfN7D5vl9sDU59c0nZWeRY0/Dpfml5GGhceFNrGj
	 XaDjDuOuT+LCA==
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: ath10k: Make QMI message rules const
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220915002612.13394-1-quic_jjohnson@quicinc.com>
References: <20220915002612.13394-1-quic_jjohnson@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, <ath10k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166745561698.21329.18124838626287583830.kvalo@kernel.org>
Date: Thu,  3 Nov 2022 06:06:59 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_230702_518130_D568D963 
X-CRM114-Status: UNSURE (   6.99  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Commit ff6d365898d4 ("soc: qcom: qmi: use const for struct
> qmi_elem_info") allows QMI message encoding/decoding rules
> to be const, so do that for ath10k.
> 
> Compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

11e1fcf2b494 wifi: ath10k: Make QMI message rules const

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220915002612.13394-1-quic_jjohnson@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
